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

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;

import com.open.mgr.login.service.LoginVO;

public class SessionUtil {

	@SuppressWarnings("unused")
	private static final Logger logger = LoggerFactory
			.getLogger(SessionUtil.class);

	public static final String SESSION_MANAGE_KEY = "SECURITY_CONTEXT";
	public static final String SESSION_FRONT_KEY = "SECURITY_CONTEXT_FRONT";
	public static final String SESSION_MANAGE_MENU_KEY = "SECURITY_MN_MENU";
	public static final String SESSION_MENU_CD = "ami_MENU_CD";
	public static final String SESSION_MICRO_MENU_KEY = "SECURITY_MICRO_MENU";
	public static final String SESSION_MANAGE_MENU_AUTH_KEY = "SECURITY_MN_MENU_AUTH";
	public static final String SESSION_MANAGE_MENU_AUTH_KEY2 = "SECURITY_MN_MENU_AUTH2";
	public static final String SESSION_FRONT_MENU_KEY = "SECURITY_MN_FRONT_MENU";

	public static HttpSession getSession(final HttpServletRequest request) {
		return request.getSession(true);
	}

	public static boolean isLogined(final HttpServletRequest request) {
		HttpSession session = getSession(request);
		if (session.getAttribute(SESSION_MANAGE_KEY) != null) {
			return true;
		} else {
			return false;
		}
	}
	
	public static LoginVO getUserDetails() {
		RequestAttributes requestAttributes = RequestContextHolder.getRequestAttributes();
		LoginVO vo = (LoginVO)requestAttributes.getAttribute(SESSION_MANAGE_KEY, 1);
		return vo;
	}
	
	public static boolean isFrtLogined(final HttpServletRequest request) {
		HttpSession session = getSession(request);
		if (session.getAttribute(SESSION_FRONT_KEY) != null) {
			return true;
		} else {
			return false;
		}
	}
	
	public static String getMenuCd() {
		RequestAttributes requestAttributes = RequestContextHolder.getRequestAttributes();
		String menuCd = (String) requestAttributes.getAttribute(SESSION_MENU_CD, 1);
		return menuCd;
	}
	
	@SuppressWarnings("unchecked")
	public static List<String> getAuthList() {
		RequestAttributes requestAttributes = RequestContextHolder.getRequestAttributes();
		List<String> manuList = (List<String>) requestAttributes.getAttribute(SESSION_MANAGE_MENU_AUTH_KEY, 1);
		return manuList;
	}
	
	@SuppressWarnings("unchecked")
	public static List<String> getAuthList2() {
		RequestAttributes requestAttributes = RequestContextHolder.getRequestAttributes();
		List<String> manuList = (List<String>) requestAttributes.getAttribute(SESSION_MANAGE_MENU_AUTH_KEY2, 1);
		return manuList;
	}
	
	/*public static List<MenuVO> getUserMenuList() {
		RequestAttributes requestAttributes =
				RequestContextHolder.getRequestAttributes();
		@SuppressWarnings("unchecked")
		List<MenuVO> menuList =
				(List<MenuVO>) requestAttributes.getAttribute(
						SESSION_MANAGE_MENU_KEY, 1);
		return menuList;
	}*/
	
	public static void invalidate() {
		RequestAttributes requestAttributes = RequestContextHolder.getRequestAttributes();
		requestAttributes.removeAttribute(SESSION_MANAGE_MENU_KEY, 1);
		requestAttributes.removeAttribute(SESSION_MANAGE_KEY, 1);
		requestAttributes.removeAttribute("loginMgrId", 1);
	}
	
	public static void frontInvalidate() {
		RequestAttributes requestAttributes = RequestContextHolder.getRequestAttributes();
		requestAttributes.removeAttribute(SESSION_FRONT_KEY, 1);
		requestAttributes.removeAttribute("loginFrt", 1);
	}
}