/*
 * 수정자: 장보늬(2023-10-17) 
 */

package com.ktdsuniversity.edu.beans;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

import com.ktdsuniversity.edu.beans.filter.xss.XssEscapeServletFilter;
import com.ktdsuniversity.edu.beans.websocket.WebSocketHandler;

@Configuration
@Configurable 
@EnableWebMvc
@EnableWebSocket
public class WebConfig implements WebMvcConfigurer, WebSocketConfigurer  {
	
	/**
	 * 채팅 핸들러
	 */
	@Autowired
	private WebSocketHandler handler;

	
	@Override
	public void configureViewResolvers(ViewResolverRegistry registry) {
		registry.jsp("/WEB-INF/views/", ".jsp");
	}
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/js/**")
		        .addResourceLocations("classpath:/static/js/");
		registry.addResourceHandler("/css/**")
        		.addResourceLocations("classpath:/static/css/");
		registry.addResourceHandler("/images/**")
        		.addResourceLocations("classpath:/static/images/");
		registry.addResourceHandler("/html/**")
				.addResourceLocations("classpath:/static/html/");
	}
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		//세션 체크를 하지 않을URL을 적어주세요.
		

	      List<String> checkSessionExcludePatterns = new ArrayList<>();
	      checkSessionExcludePatterns.add("/member/signup/**");
	      checkSessionExcludePatterns.add("/member/companysignup/**");
	      checkSessionExcludePatterns.add("/member/auth");
	      checkSessionExcludePatterns.add("/company/auth");
	      checkSessionExcludePatterns.add("/freeboard/list/**");
	      checkSessionExcludePatterns.add("/freeboard/view/**");
	      checkSessionExcludePatterns.add("/qnaboard/list/**");
	      checkSessionExcludePatterns.add("/qnaboard/view/**");
	      checkSessionExcludePatterns.add("/home/main");
	      checkSessionExcludePatterns.add("/devground/home");
	      checkSessionExcludePatterns.add("/keyword/**");
	      checkSessionExcludePatterns.add("/home/**");
	      checkSessionExcludePatterns.add("/js/**");
	      checkSessionExcludePatterns.add("/css/**");
	      checkSessionExcludePatterns.add("/img/**");
	      checkSessionExcludePatterns.add("/images/**");
	      checkSessionExcludePatterns.add("/news/**");
	      checkSessionExcludePatterns.add("/error");
	      checkSessionExcludePatterns.add("/algorithm/question/list");
	      checkSessionExcludePatterns.add("/algorithm/question/view/**");
	      checkSessionExcludePatterns.add("/algorithm/explanation/list");
	      checkSessionExcludePatterns.add("/algorithm/explanation/detail/**");
	      checkSessionExcludePatterns.add("/algorithm/explanation/view/**");
	      checkSessionExcludePatterns.add("/member/**");
	      checkSessionExcludePatterns.add("/code/**");
	      checkSessionExcludePatterns.add("/recruit/list");
	      checkSessionExcludePatterns.add("/memberinfo/view/**");
	      checkSessionExcludePatterns.add("/html/**");
	      checkSessionExcludePatterns.add("/notice/random");
	      checkSessionExcludePatterns.add("/companyinfo/mypost");
	      checkSessionExcludePatterns.add("/qna/ranking/**");

		
		registry.addInterceptor(new CheckSessionInterceptor())
				.addPathPatterns("/**")
				.excludePathPatterns(checkSessionExcludePatterns);
		
		registry.addInterceptor(new NextUrlInterceptor())
		        .addPathPatterns("/member/auth");
		
	}
	
	@Bean
	public FilterRegistrationBean<XssEscapeServletFilter> filterRegistrationBean() {
		FilterRegistrationBean<XssEscapeServletFilter> filterRegistration = new FilterRegistrationBean<>();
		filterRegistration.setFilter(new XssEscapeServletFilter());
		filterRegistration.setOrder(1);
		filterRegistration.addUrlPatterns("/*");
		return filterRegistration;
	}
	
	/**
	 * 웹소켓 엔드포인트 생성.
	 */
	@Override
	public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
		registry.addHandler(handler, "/chat").setAllowedOriginPatterns("*").withSockJS();
	}

	
}
