package org.khmerslide.configuration;

import javax.sql.DataSource;

import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.converter.StringHttpMessageConverter;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.web.client.RestTemplate;

@Configuration
@PropertySource(
		value={"classpath:configuration.properties"}
)

@MapperScan("org.khmerslide.repositories")
public class WebConfiguration {
	
	@Bean 
	public DataSource getDataSource(){
		DriverManagerDataSource dataSource = new DriverManagerDataSource();
		dataSource.setDriverClassName("org.postgresql.Driver");
		dataSource.setUrl("jdbc:postgresql://120.136.24.174:5432/SLIDESHARED_SR_DB");
		dataSource.setUsername("SLIDESHARED_SR");
		dataSource.setPassword("SLIDESHARED_SR");
		return dataSource;
	}
//	public DataSource getDataSource(){
//		DriverManagerDataSource dataSource = new DriverManagerDataSource();
//		dataSource.setDriverClassName("org.postgresql.Driver");
//		dataSource.setUrl("jdbc:postgresql://localhost:5432/khmerslide.org");
//		dataSource.setUsername("postgres");
//		dataSource.setPassword("123");
//		return dataSource;
//	}
//	public DataSource getDataSource(){
//		DriverManagerDataSource dataSource = new DriverManagerDataSource();
//		dataSource.setDriverClassName("org.postgresql.Driver");
//		dataSource.setUrl("jdbc:postgresql://localhost:5432/postgres");
//		dataSource.setUsername("postgres");
//		dataSource.setPassword("123");
//		return dataSource;
//	}
	
	@Bean
    public DataSourceTransactionManager transactionManager() {
        return new DataSourceTransactionManager(getDataSource());
    }

 
    @Bean
    public SqlSessionFactoryBean sqlSessionFactory() throws Exception {
        SqlSessionFactoryBean sessionFactory = new SqlSessionFactoryBean();
        sessionFactory.setDataSource(getDataSource());
        return sessionFactory;
    }
	
	@Autowired
	private Environment environment;
	
	@Bean
	public HttpHeaders header(){
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);
		String credentials = environment.getProperty("KHMERSLIDE.API.SECRET_HEADER");
		headers.set("Authorization", "Basic " + credentials);
		return headers;
	}
	@Bean
	public RestTemplate restTemplate(){
		RestTemplate restTemplate = new RestTemplate();
		// Add the Jackson and String message converters
		restTemplate.getMessageConverters().add(new MappingJackson2HttpMessageConverter());
		restTemplate.getMessageConverters().add(new StringHttpMessageConverter());
		return restTemplate;
	}
	@Bean
	public String WS_URL(){
		return environment.getProperty("KHMERSLIDE.API.URL");
	}
	@Bean
	public String WEB_UI_URL(){
		return environment.getProperty("KHMERSLIDE.URL");
	}
	@Bean
	public String KEY(){
		return environment.getProperty("KHMERSLIDE.API.SECRET_HEADER");
	}

}
