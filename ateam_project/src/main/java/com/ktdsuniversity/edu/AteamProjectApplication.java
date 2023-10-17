package com.ktdsuniversity.edu;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.web.context.WebApplicationContext;

import jakarta.servlet.ServletContext;

@SpringBootApplication
public class AteamProjectApplication extends SpringBootServletInitializer {


	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
		return builder.sources(AteamProjectApplication.class);
	}
	    
	public static void main(String[] args) {
		SpringApplication.run(AteamProjectApplication.class, args);
	}

}
