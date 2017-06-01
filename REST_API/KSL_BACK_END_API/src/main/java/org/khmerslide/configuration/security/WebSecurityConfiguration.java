package org.khmerslide.configuration.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@Configuration
@EnableWebSecurity
public class WebSecurityConfiguration extends WebSecurityConfigurerAdapter {
	@Autowired
	@Qualifier(value="ajaxAuthenticationSuccessHandler")
	private AjaxAuthenticationSuccessHandler ajaxAuthenticationSuccessHandler;
	
	@Autowired
	@Qualifier(value="ajaxAuthenticationFailureHandler")
	private AjaxAuthenticationFailureHandler ajaxAuthenticationFailureHandler;
	
	@Autowired
	protected void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
		/*api developer only*/ 
		auth.inMemoryAuthentication().withUser("ksl").password("ksl").roles("DEVELOPER");
	}
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		/*mapping all input */
		http
			.authorizeRequests()
			//.antMatchers("/","/home","/index","/developer","/admin","/user").permitAll()
			.antMatchers("/developer/**").hasAnyRole("DEVELOPER");
		
		http
			.formLogin()
			.loginPage("/login")
			.usernameParameter("username")
			.passwordParameter("password")
			.permitAll()
			.failureHandler(ajaxAuthenticationFailureHandler)
			.successHandler(ajaxAuthenticationSuccessHandler);
		/*logout*/
		http.logout().logoutUrl("/developer/logout");
		/*not close connection*/
		http.csrf().disable();
		/*go to access deny*/
		http.exceptionHandling().accessDeniedPage("/access-denied");
	}
}
