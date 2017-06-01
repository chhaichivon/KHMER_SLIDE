package org.khmerslide.configuration;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

@Configuration
@EnableWebMvc
public class MvcConfiguration extends WebMvcConfigurerAdapter {
	@Override
	public void addViewControllers(ViewControllerRegistry registry) {
		registry.addViewController("/login").setViewName("/admin/login");
		registry.addViewController("/API.KSL").setViewName("/admin/login");
/*		registry.addViewController("/LOGIN").setViewName("/admin/login");
		registry.addViewController("/API.KSL/LOGIN").setViewName("/admin/login");*/
		registry.addViewController("/developer").setViewName("/swagger");
		// Errors
		registry.addViewController("/404").setViewName("/error/404");
		registry.addViewController("/access-denied").setViewName("/error/404");
		
	}

	

	@Override
	public void addCorsMappings(CorsRegistry registry) {
		registry.addMapping("/**")
		.allowedMethods("GET","POST","DELETE","PUT","OPTIONS","PATCH")
		.allowedOrigins("*");
	}
	
	 @Bean(name = "multipartResolver")
	    public CommonsMultipartResolver multipartResolver() {
	        CommonsMultipartResolver resolver = new CommonsMultipartResolver();        
	        resolver.setMaxUploadSizePerFile(104857600); 
	        return resolver;
	    }
	 
//	 @Bean
//	    public MultipartFilter multipartFilter() {
//	            MultipartFilter multipartFilter = new MultipartFilter();
//	        multipartFilter.setMultipartResolverBeanName("multipartResolver");
//	        return multipartFilter;
//	    }
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/resources/**").addResourceLocations("/resources/");
		registry.addResourceHandler("/files/images/**").addResourceLocations("file:/opt/images/");
	}
	
	@Bean
	public ViewResolver viewResolver(){
		InternalResourceViewResolver resolver = new InternalResourceViewResolver();
		resolver.setPrefix("/WEB-INF/pages/");
		resolver.setSuffix(".jsp");
		return resolver;
	}

	
//	@Bean
//	public ViewResolver viewResolver(){
//		InternalResourceViewResolver resolver = new InternalResourceViewResolver();
//		resolver.setPrefix("/WEB-INF/pages/");
//		resolver.setSuffix(".jsp");
//		return resolver;
//	}
	
//	@Bean
//	public MultipartResolver multipartResolver() {
//	    return new CommonsMultipartResolver();
//	}



}
