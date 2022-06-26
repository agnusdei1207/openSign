package com.open.cmmn.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import org.apache.commons.lang3.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.open.cmmn.service.CmmnErrorDbLogService;
import com.open.cmmn.util.SessionUtil;
import com.open.cmmn.util.StringUtil;

/**
 * <pre>
 * Class Name : CmmnErrorDbLogServiceImpl.java
 * Description: 에러 DB Insert.
 * Modification Information
 *
 *    수정일         수정자         수정내용
 *    -------        -------     -------------------
 *    2016. 11. 30.	 User		최초생성
 *
 * </pre>
 *
 * @author User
 * @since 2016. 11. 30.
 * @version 1.0
 * @see <pre>
 *
 * </pre>
 */
@Service("cmmnErrorDbLogService")
public class CmmnErrorDbLogServiceImpl implements CmmnErrorDbLogService {

	/**
	 * Log4j Logger.
	 */
	private static final Logger LOGGER = LogManager.getLogger(CmmnErrorDbLogServiceImpl.class.getName());

	/**
	 * Bean in context-datasource.xml.
	 */
	@Autowired
	private DataSource dataSource;

	/**
	 * @see com.open.cmmn.service.CmmnErrorDbLogService#uploadError(java.io.InputStream, java.lang.String,
	 *      java.lang.String[], int)
	 */
	@Override
	public void uploadError() throws Exception {
		// 성능 향상을 위해 Oracle Update Batching 사용
		Connection con = null;
		PreparedStatement pstmt = null;
		long startTime = System.currentTimeMillis();
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		HttpSession session = request.getSession();
		String clientIp = StringUtil.getClientIp(request);
		String loginSeq = "";
		if(SessionUtil.getUserDetails() != null){
			loginSeq = StringUtil.nullString(SessionUtil.getUserDetails().getSeq());
		}
		
		String menuCd = StringUtil.getMenuCd(StringUtils.defaultString(String.valueOf(request.getAttribute("javax.servlet.error.request_uri")))).get("depth3");
		if (StringUtil.nullString(menuCd).equals("")) {
			menuCd = (String) session.getAttribute("menuCd");
			if (menuCd == null || menuCd.equals("")) {
				menuCd = "NOMENUCD";
			}
		}

		Enumeration<?> paramNames = request.getParameterNames();
		ArrayList<HashMap<String, String>> list = new ArrayList<HashMap<String, String>>();
		while (paramNames.hasMoreElements()) {
			HashMap<String, String> hashMap = new HashMap<String, String>();
			String paramName = (String) paramNames.nextElement();
			String value = request.getParameter(paramName);
			hashMap.put("paramName", paramName);
			hashMap.put("value", value);
			list.add(hashMap);
		}
		//에러 상태 코드
		String statusCode = StringUtils.defaultString(String.valueOf(request.getAttribute("javax.servlet.error.status_code")));
		//예외처리 클래스
		String errorType = StringUtils.defaultString(String.valueOf(request.getAttribute("javax.servlet.error.exception_type")));
		//오류 메세지
		String message = StringUtils.defaultString(String.valueOf(request.getAttribute("javax.servlet.error.message")));
		//문제가 되는 request uri
		String errorPage = StringUtils.defaultString(String.valueOf(request.getAttribute("javax.servlet.error.request_uri")));
		//발생한 예외처리 내용
		String exception = StringUtils.defaultString(String.valueOf(request.getAttribute("javax.servlet.error.exception")));
		//에러가난 서블릿 명
		String servletName = StringUtils.defaultString(String.valueOf(request.getAttribute("javax.servlet.error.servlet_name")));
		String errorPageUrl = StringUtils.defaultString(String.valueOf(request.getAttribute("javax.servlet.include.request_uri")));

		if (errorPageUrl != null && errorPageUrl.length() > 10 && errorPageUrl.indexOf("//") > -1) {
			errorPageUrl = errorPageUrl.substring(0, errorPageUrl.indexOf("/", errorPageUrl.indexOf("//") + 2)) + errorPage;
		}

		String paramVal = null;
		if (list != null && list.size() > 0) {
			paramVal = StringUtils.defaultString(list.toString());
		}

		if (StringUtils.isNotEmpty(statusCode) && StringUtils.isEmpty(errorType)) {
			errorType = statusCode;
		}
		if (StringUtils.isNotEmpty(exception) && StringUtils.isEmpty(message)) {
			message = exception;
		}
		String fullMessage = "";
		String arrFullMessage = "";

		try {
			con = dataSource.getConnection();
			StringBuffer queryStr = new StringBuffer();
			queryStr.append(" INSERT INTO t_exception(SEQ, ERR_TYPE, ERR_MSG, FULL_ERR_MSG, PARAM_VAL, ERR_MENU_CD, ERR_PAGE, ERR_PAGE_URL,IP,REG_ID) VALUES ((SELECT IFNULL(MAX(SEQ)+1,0) FROM t_exception a), ?, ?, ?, ?, ?, ?, ?,?,?)");
			pstmt = con.prepareStatement(queryStr.toString());
			pstmt.setString(1, errorType);
			pstmt.setString(2, message);
			pstmt.setString(3, fullMessage);
			pstmt.setString(4, paramVal);
			pstmt.setString(5, menuCd);
			pstmt.setString(6, errorPage);
			pstmt.setString(7, errorPageUrl);
			pstmt.setString(8, clientIp);
			pstmt.setString(9, loginSeq);
			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
					pstmt = null;
				} catch (SQLException ex) {
				}
			}
			if (con != null) {
				try {
					con.close();
					con = null;
				} catch (SQLException ex) {
				}
			}
		}
		LOGGER.info("DB Logging elapsed time ::: " + (System.currentTimeMillis() - startTime) + "ms");
	}

}
