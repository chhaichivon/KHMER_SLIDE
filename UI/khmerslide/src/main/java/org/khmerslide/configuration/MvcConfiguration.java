package org.khmerslide.configuration;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

@Configuration
public class MvcConfiguration extends WebMvcConfigurerAdapter {

	@Override
	public void addViewControllers(ViewControllerRegistry registry) {
//	===================================Front End====================================
		registry.addViewController("/").setViewName("/home");
		registry.addViewController("/home").setViewName("/home");
		registry.addViewController("/index").setViewName("/index");
		registry.addViewController("/view/**").setViewName("/front-end/view");
		registry.addViewController("/category/**").setViewName("/front-end/search-category");
		registry.addViewController("/login").setViewName("front-end/login");
		registry.addViewController("/signup").setViewName("front-end/signup");
		registry.addViewController("/aboutus").setViewName("front-end/about-us");
		registry.addViewController("/contactus").setViewName("front-end/contact-us");
//		registry.addViewController("/about").setViewName("/about");
		
//	============================Back End(Administrative)============================		
		registry.addViewController("/admin").setViewName("/admin/index");
		registry.addViewController("/admin/index").setViewName("/admin/index");
		registry.addViewController("/admin/home").setViewName("/admin/index");
		registry.addViewController("/admin/user-list").setViewName("/admin/user-list");
		registry.addViewController("/admin/add-user").setViewName("/admin/add-user");
		registry.addViewController("/admin/edit-user/**").setViewName("/admin/edit-user");
		registry.addViewController("/admin/add-doc").setViewName("/admin/add-doc");
		registry.addViewController("/admin/doc-list").setViewName("/admin/doc-list");
		registry.addViewController("/admin/edit-doc/**").setViewName("/admin/edit-doc");
		registry.addViewController("/admin/category").setViewName("/admin/category");
		registry.addViewController("/admin/save-list").setViewName("/admin/save-list");
		registry.addViewController("/admin/comment").setViewName("/admin/comment");
		//registry.addViewController("/user").setViewName("/user/index");
		
//	==============================Back End(User)=====================================
		registry.addViewController("/user/index").setViewName("/user/index");
		registry.addViewController("/user/home").setViewName("/user/index");
		registry.addViewController("/user/my-document").setViewName("/user/my-document");
		registry.addViewController("/user/save-list/**").setViewName("/user/save-list");
		registry.addViewController("/user/history").setViewName("/user/view-history");
		registry.addViewController("/user/upload-file").setViewName("/user/upload-file");
//		registry.addViewController("/user").setViewName("/user/user");
//		registry.addViewController("/dba").setViewName("/dba");
		
//	==============================Back End(API)=======================================
		registry.addViewController("/login").setViewName("/login");
		
		//
		
		
		
// ================================Errors=============================================
		registry.addViewController("/401").setViewName("/error/401");
		registry.addViewController("/access-denied").setViewName("/error/403");
		registry.addViewController("/error").setViewName("/error/404");
		

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
	        resolver.setMaxUploadSizePerFile(52428800); 
	        return resolver;
	    }
	 
	
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
	
}
