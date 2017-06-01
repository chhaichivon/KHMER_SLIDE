package org.khmerslide;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan("org.khmerslide.configuration")
public class KslBackEndApiApplication {

	public static void main(String[] args) {
		SpringApplication.run(KslBackEndApiApplication.class, args);
	}
}
