//package com.webproject.codecanvas;
//
//import org.springframework.boot.SpringApplication;
//import org.springframework.boot.autoconfigure.SpringBootApplication;
//
//@SpringBootApplication
//public class CodecanvasApplication {
//	public static void main(String[] args) {
//		SpringApplication.run(CodecanvasApplication.class, args);
//	}
//
//}
package com.webproject.codecanvas;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@SpringBootApplication
public class CodecanvasApplication extends SpringBootServletInitializer {

	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		return application.sources(CodecanvasApplication.class);
	}

	public static void main(String[] args) {
		SpringApplication.run(CodecanvasApplication.class, args);
	}
}