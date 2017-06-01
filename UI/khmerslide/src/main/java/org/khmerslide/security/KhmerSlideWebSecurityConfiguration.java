package org.khmerslide.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
@Configuration
@EnableWebSecurity
public class KhmerSlideWebSecurityConfiguration  extends WebSecurityConfigurerAdapter 
{
	
	@Autowired
	@Qualifier("customUserDetailService")
	private UserDetailsService userDetailsService;
	
	@Autowired
	@Qualifier("ajaxAuthenticationSuccessHandler")
	private AjaxAuthenticationSuccessHandler successHandler;
	
	@Autowired
	@Qualifier("ajaxAuthenticationFailureHandler")
	private AjaxAuthenticationFailureHandler failureHandler;
	
	
	
	
	@Autowired
	protected void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
		//TODO: 1. inMEMORY
		/*auth.inMemoryAuthentication()
			.withUser("user")
			.password("123")
			.roles("USER");
		auth.inMemoryAuthentication()
			.withUser("admin")
			.password("123")
			.roles("ADMIN");
		*/
		
		//TODO: 2. Jdbc Authetication		
		//auth.jdbcAuthentication()
		//	.groupAuthoritiesByUsername("")
		//	.authoritiesByUsernameQuery("");
		
		//TODO: 3. UserDetailsService
		auth.userDetailsService(userDetailsService)
			//TODO: TO ADD ENCRYPTION FOR THE USER INFORMATION USING BCryptPasswordEncoder
			.passwordEncoder(new BCryptPasswordEncoder());
		
	}
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http
			.authorizeRequests()
			.antMatchers("/" , "/home").permitAll()
			.antMatchers("/admin/**").hasRole("ADMIN")
			.antMatchers("/user/**").hasRole("USER");
		http
			.formLogin()
			.loginPage("/login")
			.successHandler(successHandler)
			.failureHandler(failureHandler)
			//.usernameParameter("username")
			//.passwordParameter("password")
			//.defaultSuccessUrl("/homepage.html")
            //.failureUrl("/login.html?error=true")
//          	.and()
//          	.logout().logoutSuccessUrl("/logout")
			.permitAll();
		http
			.csrf()
			.disable();
		http
			.exceptionHandling()
			.accessDeniedPage("/access-denied");
	}
	
	
	
}