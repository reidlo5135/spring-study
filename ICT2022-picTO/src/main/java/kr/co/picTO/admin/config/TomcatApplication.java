package kr.co.picTO.admin.config;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.annotation.ComponentScan;

@ComponentScan(basePackages = {"kr.co.picTO.controller"})
@SpringBootApplication
public class TomcatApplication extends SpringBootServletInitializer{
	
	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
		return builder.sources(TomcatApplication.class);
	}

	public static void main(String[] args) {
		SpringApplication.run(TomcatApplication.class, args);
	}

}
