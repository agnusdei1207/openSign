package com.open.cmmn.interceptor;

import java.net.URLEncoder;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.open.cmmn.service.CmmnService;
import com.open.cmmn.util.SessionUtil;
import com.open.cmmn.util.StringUtil;
import com.open.mgr.login.service.LoginVO;
import com.open.mgr.mgr0016.service.Mgr0016VO;

/**
 * <pre>
 * Class Name : ManageInterceptor.java
 * Description: ManageInterceptor.
 * Modification Information
 *
 *    수정일         수정자         수정내용
 *    -------        -------     -------------------
 *    2017. 1. 19.	 박현우		최초생성
 *
 * </pre>
 *
 * @author 박현우
 * @since 2017. 1. 19.
 * @version 1.0
 * @see
 * 
 *      <pre>
 *
 *      </pre>
 */
public class ManageInterceptor extends HandlerInterceptorAdapter implements HandlerInterceptor {

	/**
	 * Log4j Logger.
	 */
	private static final Logger LOGGER = LogManager.getLogger(ManageInterceptor.class.getName());

	/**
	 * Session Loading Time.
	 */
	private static long loadingTime = 0;

	/**
	 * CmmnService.
	 */
	@Autowired
	private CmmnService cmmnService;

	@Override
	public boolean preHandle(final HttpServletRequest request, final HttpServletResponse response, final Object handler) throws Exception {
		
		
		// 클라이언트 IP 가져오기
		String clientIp = StringUtil.getClientIp(request);
		String menuCd = "";
		HttpSession session = request.getSession();

		menuCd = StringUtil.getMenuCd(request.getRequestURI()).get("menuCd");
		
		LOGGER.debug("pre request URI ====================================>" + request.getRequestURI());
		LOGGER.debug("Manage Access Ip ====================================>" + clientIp);

		loadingTime = System.currentTimeMillis();
		LOGGER.info("=================================== manageInterceptor Start");

		String currentUrl = request.getRequestURI();

		LOGGER.info("=================================== frontInterceptor currentUrl ::: " + currentUrl);

		@SuppressWarnings("rawtypes")
		Enumeration paramNames = request.getParameterNames();
		StringBuffer refererParam = new StringBuffer();
		int intCount = 0;
		while (paramNames.hasMoreElements()) {
			intCount = intCount + 1;
			String paramName = (String) paramNames.nextElement();
			String value = request.getParameter(paramName);
			if (value != null) {
				value = value.replaceAll(">", "&gt;");
				value = value.replaceAll("<", "&lt;");
				value = value.replaceAll("\'", "&#39;");
				value = value.replaceAll("\"", "&#34;");
				value = value.replaceAll("/", "&#47;");
				value = value.replaceAll(" ", "&#10;");
				value = value.replaceAll("\\(", "&#40;");
				value = value.replaceAll("\\)", "&#41;");
				value = value.replaceAll("#", "&#35;");
			}
			
			
			if (intCount == 1) { // parameta 가 1개일 경우
				refererParam.append("?").append(paramName).append("=").append(value);
			} else {
				refererParam.append("&").append(paramName).append("=").append(value);
			}

			// LOGGER.debug("=================================== manageInterceptor Parameter");

			LOGGER.debug(paramName + " :: " + value);
		}
		String requestFullUrl = URLEncoder.encode(request.getRequestURL() + refererParam.toString(), "UTF-8");
		request.setAttribute("requestFullUrl", requestFullUrl);
		request.setAttribute("refererUrl", request.getHeader("referer"));
		LOGGER.info("=================================== manageInterceptor requestUrl ::: " + requestFullUrl);
		
			/** 로그인 검사 */
			if (SessionUtil.isLogined(request)) {
				LoginVO loginVO = SessionUtil.getUserDetails();
				LOGGER.info("=================================== requestFullUrl  ::: " + requestFullUrl);
				LOGGER.info("=================================== request.getRequestURL()  ::: " + request.getRequestURL());
				LOGGER.info("=================================== request.getRequestURI()  ::: " + request.getRequestURI());
				LOGGER.info("=================================== refererUrl ::: " + request.getHeader("referer"));
				
				/* 메뉴 권한 확인*/
				List<String> manuList = (List<String>) SessionUtil.getAuthList();
				if(manuList == null){
					response.sendRedirect("/cmmn/fail.do");
				}        
				                
				/*권한 없는 경우 */           
				if(!manuList.contains(menuCd) && !request.getRequestURI().equals("/mgr/main.do") && !request.getRequestURI().contains("statistics")){
					response.sendRedirect("/cmmn/fail.do");
				} 
				session.setAttribute("menuCd", menuCd); 
				 
				Mgr0016VO mgr0016VO = new Mgr0016VO();
				mgr0016VO.setMenuUrl(currentUrl);
				int menuUrlChk = cmmnService.selectCount(mgr0016VO, "Mgr0016.menuUrlChkCount");
				if(menuUrlChk > 0 || StringUtil.nullString(currentUrl).equals("/mgr/main.do")){
					mgr0016VO.setRgstId(loginVO.getSeq());
					mgr0016VO.setClientIp(clientIp);
					mgr0016VO.setMenuUrl(currentUrl);
					if(StringUtil.nullString(currentUrl).equals("/mgr/main.do")){
						mgr0016VO.setMenuCd("mgrMain");
					}else{
						mgr0016VO.setMenuCd(menuCd);
					}
					mgr0016VO.setMenuDivn("mgr");
					
					cmmnService.insertContents(mgr0016VO, "Mgr0016.menuLogInsertContents");
				}
				   
				} else {
					response.sendRedirect("/cmmn/fail.do");
					return false;
				}
			long endTime = System.currentTimeMillis();
		LOGGER.debug("=================================== Loading Report preHandle ::: " + (endTime - loadingTime));
		
		return true;
	}

	@Override
	public void afterCompletion(final HttpServletRequest request, final HttpServletResponse response, final Object handler, final Exception ex) throws Exception {
		long endTime = System.currentTimeMillis();
		LOGGER.debug("=================================== Loading Report afterHandle ::: " + (endTime - loadingTime));
		LOGGER.debug("=================================== request URI ::: " + request.getRequestURI());
	}
}