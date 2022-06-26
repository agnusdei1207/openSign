/*************************************************************
프로그램명 : SessionUtil.java
설명 : 세션관리 유틸
작성자 : 박현우
소속 : (주)애드캡슐소프트
일자 : 2015.11.30.
프로그램설명
세션관리 유틸
 **프로그램이력**
수정일             작업근거                 유지보수담당
2015.11.30.     (00000)신규생성		  박현우
 *************************************************************/
package com.open.cmmn.util;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletResponse;


public class CorsFilter implements Filter {

	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) 
			throws IOException, ServletException 
	{ 
		HttpServletResponse response = (HttpServletResponse) res; 
		response.setHeader("Access-Control-Allow-Origin", "*"); //허용대상 도메인
		response.setHeader("Access-Control-Allow-Methods", "POST, GET, DELETE, PUT"); 
		response.setHeader("Access-Control-Max-Age", "3600"); 
		response.setHeader("Access-Control-Allow-Headers", "x-requested-with, origin, content-type, accept"); 
		chain.doFilter(req, res); 
		
	}
	public void init(FilterConfig filterConfig) {} 
	public void destroy() {}
	

}