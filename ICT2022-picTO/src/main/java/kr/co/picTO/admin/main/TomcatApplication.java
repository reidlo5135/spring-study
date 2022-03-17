package kr.co.picTO.admin.main;

import kr.co.picTO.admin.config.JPAConfig;
import kr.co.picTO.admin.config.SecurityConfig;

import kr.co.picTO.admin.config.SpringConfig;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.annotation.ComponentScan;

@ComponentScan(basePackageClasses = {SpringConfig.class, SecurityConfig.class, JPAConfig.class})
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
