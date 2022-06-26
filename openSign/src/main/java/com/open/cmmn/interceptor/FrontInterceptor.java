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
import com.open.cmmn.util.StringUtil;
import com.open.mgr.mgr0001.service.Mgr0001VO;
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
public class FrontInterceptor extends HandlerInterceptorAdapter implements HandlerInterceptor {

	/**
	 * Log4j Logger.
	 */
	private static final Logger LOGGER = LogManager.getLogger(FrontInterceptor.class.getName());

	/**
	 * Session Loading Time.
	 */
	private static long loadingTime = 0;

	/**
	 * CmmnService.
	 */
	@Autowired
	private CmmnService cmmnService;

	@SuppressWarnings("unchecked")
	@Override
	public boolean preHandle(final HttpServletRequest request, final HttpServletResponse response, final Object handler)
			throws Exception {

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
		Map requestMap = new HashMap(request.getParameterMap());
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

			// LOGGER.debug("===================================
			// manageInterceptor Parameter");

			LOGGER.debug(paramName + " :: " + value);
		}
		String requestFullUrl = URLEncoder.encode(request.getRequestURL() + refererParam.toString(), "UTF-8");
		request.setAttribute("requestFullUrl", requestFullUrl);
		request.setAttribute("refererUrl", request.getHeader("referer"));
		LOGGER.info("=================================== manageInterceptor requestUrl ::: " + requestFullUrl);

		String menuGrp = StringUtil.getMenuCd(request.getRequestURI()).get("menuGrp");
		String mbrList = "[mbr0051][mbr0052][mbr0053]";
		
		
		Mgr0016VO mgr0016VO = new Mgr0016VO();
		mgr0016VO.setMenuUrl(currentUrl);
		int menuUrlChk = cmmnService.selectCount(mgr0016VO, "Mgr0016.menuUrlChkCount");
		if(menuUrlChk > 0 || StringUtil.nullString(currentUrl).equals("/frt/main.do")){
			mgr0016VO.setClientIp(clientIp);
			mgr0016VO.setMenuUrl(currentUrl);
			if(StringUtil.nullString(currentUrl).equals("/frt/main.do")){
				mgr0016VO.setMenuCd("frtMain");
			}else{
				mgr0016VO.setMenuCd(menuCd);
			}
			mgr0016VO.setMenuDivn("frt");
			
			cmmnService.insertContents(mgr0016VO, "Mgr0016.menuLogInsertContents");
		}
		
		/* 메뉴갱신 */
		Mgr0001VO mgr0001VO = new Mgr0001VO();
		mgr0001VO.setMenuCd("mgr0001");
		boolean mgr0001Chk = false;
		String mgr0001LastDt = (String) cmmnService.selectContents(mgr0001VO, "Mgr0001.menuChkLogLastDt");
		if(session.getAttribute("mgr0001LastDt") != null){
			if(!mgr0001LastDt.equals((String)session.getAttribute("mgr0001LastDt"))){
				mgr0001Chk = true;
			}
		}
		session.setAttribute("mgr0001LastDt", mgr0001LastDt);
		
		mgr0001VO.setMenuCd("mgr0029");
		boolean mgr0029Chk = false;
		String mgr0029LastDt = (String) cmmnService.selectContents(mgr0001VO, "Mgr0001.menuChkLogLastDt");
		if(session.getAttribute("mgr0029LastDt") != null){
			if(!mgr0029LastDt.equals((String)session.getAttribute("mgr0029LastDt"))){
				mgr0029Chk = true;
			}
		}
		session.setAttribute("mgr0029LastDt", mgr0029LastDt);

		
		
		if (session.getAttribute("frtMenu") == null
				|| StringUtil.nullString(session.getAttribute("frtMenu") + "").equals("[]") || mgr0001Chk || mgr0029Chk) {

			Mgr0001VO menuVO = new Mgr0001VO();
			menuVO.setLvl("1");
			menuVO.setpMenuCd("frt");
			List<Mgr0001VO> menuList = (List<Mgr0001VO>) cmmnService.selectList(menuVO, "Mgr0001.frontMenuSelectList");
			for (Mgr0001VO menuVO2 : menuList) {
				menuVO2.setLvl("2");
				menuVO2.setpMenuCd(menuVO2.getMenuCd());
				List<Mgr0001VO> manu2List = (List<Mgr0001VO>) cmmnService.selectList(menuVO2,"Mgr0001.frontMenuSelectList");
				menuVO2.setMenuList(manu2List);
				for (Mgr0001VO menuVO3 : menuVO2.getMenuList()) {
					menuVO3.setLvl("3");
					menuVO3.setpMenuCd(menuVO3.getMenuCd());
					List<Mgr0001VO> manu3List = (List<Mgr0001VO>) cmmnService.selectList(menuVO3,"Mgr0001.frontMenuSelectList");
					menuVO3.setMenuList(manu3List);
				}
			}

			session.setAttribute("frtMenu", menuList);
		}
		
		if (session.getAttribute("mbrMenu") == null
				|| StringUtil.nullString(session.getAttribute("mbrMenu") + "").equals("[]") || mgr0001Chk) {

			/* 1차메뉴 목록 */
			Mgr0001VO menuVO = new Mgr0001VO();
			menuVO.setLvl("1");
			menuVO.setpMenuCd("mbr");
			List<Mgr0001VO> menuList = (List<Mgr0001VO>) cmmnService.selectList(menuVO, "Mgr0001.frontMenuSelectList");
			for (Mgr0001VO menuVO2 : menuList) {
				menuVO2.setLvl("2");
				menuVO2.setpMenuCd(menuVO2.getMenuCd());
				List<Mgr0001VO> manu2List = (List<Mgr0001VO>) cmmnService.selectList(menuVO2,
						"Mgr0001.frontMenuSelectList");
				menuVO2.setMenuList(manu2List);
				for (Mgr0001VO menuVO3 : menuVO2.getMenuList()) {
					menuVO3.setLvl("3");
					menuVO3.setpMenuCd(menuVO3.getMenuCd());
					List<Mgr0001VO> manu3List = (List<Mgr0001VO>) cmmnService.selectList(menuVO3,
							"Mgr0001.frontMenuSelectList");
					menuVO3.setMenuList(manu3List);
				}
			}

			/** 세션 정보 입력 */
			session.setAttribute("mbrMenu", menuList); // 메뉴목록
		}
		
		if (session.getAttribute("mifMenu") == null
				|| StringUtil.nullString(session.getAttribute("mifMenu") + "").equals("[]") || mgr0001Chk) {

			/* 1차메뉴 목록 */
			Mgr0001VO menuVO = new Mgr0001VO();
			menuVO.setLvl("1");
			menuVO.setpMenuCd("mif");
			List<Mgr0001VO> menuList = (List<Mgr0001VO>) cmmnService.selectList(menuVO, "Mgr0001.frontMenuSelectList");
			for (Mgr0001VO menuVO2 : menuList) {
				menuVO2.setLvl("2");
				menuVO2.setpMenuCd(menuVO2.getMenuCd());
				List<Mgr0001VO> manu2List = (List<Mgr0001VO>) cmmnService.selectList(menuVO2,
						"Mgr0001.frontMenuSelectList");
				menuVO2.setMenuList(manu2List);
				for (Mgr0001VO menuVO3 : menuVO2.getMenuList()) {
					menuVO3.setLvl("3");
					menuVO3.setpMenuCd(menuVO3.getMenuCd());
					List<Mgr0001VO> manu3List = (List<Mgr0001VO>) cmmnService.selectList(menuVO3,
							"Mgr0001.frontMenuSelectList");
					menuVO3.setMenuList(manu3List);
				}
			}
			
			/** 세션 정보 입력 */
			session.setAttribute("mifMenu", menuList); // 메뉴목록
		}


		
		
		long endTime = System.currentTimeMillis();
		LOGGER.debug("=================================== Loading Report preHandle ::: " + (endTime - loadingTime));

		return true;
	}

	@Override
	public void afterCompletion(final HttpServletRequest request, final HttpServletResponse response,
			final Object handler, final Exception ex) throws Exception {
		long endTime = System.currentTimeMillis();
		LOGGER.debug("=================================== Loading Report afterHandle ::: " + (endTime - loadingTime));
		LOGGER.debug("=================================== request URI ::: " + request.getRequestURI());
	}
}