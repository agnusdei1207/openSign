package com.open.cmmn.util;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.Enumeration;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.util.CookieGenerator;

/**
 * <pre>
 * Class Name : SessionCookieUtil.java
 * Description: 세션, 쿠키 클래스.
 * Modification Information
 *
 *    수정일         수정자         수정내용
 *    -------        -------     -------------------
 *    2016. 3. 8.	 User		최초생성
 *
 * </pre>
 *
 * @author User
 * @since 2016. 3. 8.
 * @version 1.0
 * @see <pre>
 *
 * </pre>
 */
public final class SessionCookieUtil {

	/**
	 * 1 minute(60 sec).
	 */
	private static final int A_MINUTE = 60;

	/**
	 * <pre>
	 * Description : This prevents the default parameterless constructor
	 *  from being used elsewhere in code.
	 * </pre>
	 *
	 * Constructor of SessionCookieUtil.java class
	 *
	 * @auther : User
	 * @since : 2016. 2. 24.
	 */
	private SessionCookieUtil() {
		// Throw an exception if this ever *is* called
		throw new AssertionError("Instantiating utility class");
	}

	/**
	 * Session Prefix.
	 */
	private static final String PREFIX_LABEL = "SessionServlet.";

	/**
	 * <pre>
	 * Description :  HttpSession에 주어진 키 값으로 세션 정보를 생성하는 기능.
	 * </pre>
	 *
	 * @param request
	 *        HttpServletRequest
	 * @param keyStr
	 *        - 세션 키
	 * @param valStr
	 *        - 세션 값
	 * @throws Exception
	 *         Exception
	 */
	public static void setSessionAttribute(final HttpServletRequest request, final String keyStr, final String valStr) throws Exception {

		HttpSession session = request.getSession();
		session.setAttribute(keyStr, valStr);
	}

	/**
	 * <pre>
	 * Description :  HttpSession에 주어진 키 값으로 세션 객체를 생성하는 기능.
	 * </pre>
	 *
	 * @param request
	 *        HttpServletRequest
	 * @param keyStr
	 *        - 세션 키
	 * @param obj
	 *        - 세션 값
	 * @throws Exception
	 *         Exception
	 */
	public static void setSessionAttribute(final HttpServletRequest request, final String keyStr, final Object obj) throws Exception {

		HttpSession session = request.getSession();
		session.setAttribute(keyStr, obj);
	}

	/**
	 * <pre>
	 * Description :  HttpSession에 존재하는 주어진 키 값에 해당하는 세션 값을 얻어오는 기능.
	 * </pre>
	 *
	 * @param request
	 *        HttpServletRequest
	 * @param keyStr
	 *        - 세션 키
	 * @return Object 세션값 Object
	 * @throws Exception
	 *         Exception
	 */
	public static Object getSessionAttribute(final HttpServletRequest request, final String keyStr) throws Exception {

		HttpSession session = request.getSession();
		return session.getAttribute(keyStr);
	}

	/**
	 * <pre>
	 * Description :  HttpSession 객체내의 모든 값을 호출하는 기능.
	 * </pre>
	 *
	 * @param request
	 *        HttpServletRequest
	 * @return 세션에 저장된 값
	 * @throws Exception
	 *         Exception
	 */
	public static String getSessionValuesString(final HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		String returnVal = "";

		Enumeration<?> e = session.getAttributeNames();
		while (e.hasMoreElements()) {
			String sessionKey = (String) e.nextElement();
			returnVal = returnVal + "[" + sessionKey + " : " + session.getAttribute(sessionKey) + "]";
		}

		return returnVal;
	}

	/**
	 * <pre>
	 * Description :  HttpSession에 존재하는 세션을 주어진 키 값으로 삭제하는 기능.
	 * </pre>
	 *
	 * @param request
	 *        HttpServletRequest
	 * @param keyStr
	 *        - 세션 키
	 * @throws Exception
	 *         Exception
	 */
	public static void removeSessionAttribute(final HttpServletRequest request, final String keyStr) throws Exception {

		HttpSession session = request.getSession();
		session.removeAttribute(keyStr);
	}

	/**
	 * 쿠키생성 - 입력받은 분만큼 쿠키를 유지되도록 세팅한다. 쿠키의 유효시간을 5분으로 설정 =>(cookie.setMaxAge(60
	 * * 5) 쿠키의 유효시간을 10일로 설정 =>(cookie.setMaxAge(60 * 60 * 24 * 10)
	 *
	 * @param response
	 *        - Response
	 * @param cookieNm
	 *        - 쿠키명
	 * @param cookieVal
	 *        - 쿠키값
	 * @param minute
	 *        - 지속시킬 시간(분)
	 * @return
	 * @throws UnsupportedEncodingException
	 *         UnsupportedEncodingException
	 * @see
	 */
	public static void setCookie(final HttpServletResponse response, final String cookieNm, final String cookieVal, final int minute)
			throws UnsupportedEncodingException {

		// 특정의 encode 방식을 사용해 캐릭터 라인을 application/x-www-form-urlencoded 형식으로 변환
		// 일반 문자열을 웹에서 통용되는 'x-www-form-urlencoded' 형식으로 변환하는 역할
		String cookieValue = URLEncoder.encode(cookieVal, "utf-8");

		// 쿠키생성 - 쿠키의 이름, 쿠키의 값
		CookieGenerator cookieGenerator = new CookieGenerator();
		cookieGenerator.setCookieName(WebUtil.removeCRLF(cookieNm));

		//cookieGenerator.setCookieSecure(true);

		//Cookie cookie = new Cookie(cookieNm, cookieValue);
		//cookie.setSecure(true);

		// 쿠키의 유효시간 설정
		int maxAge = A_MINUTE * minute;
		cookieGenerator.setCookieMaxAge(maxAge);
		//cookie.setMaxAge(maxAge);

		// response 내장 객체를 이용해 쿠키를 전송
		cookieGenerator.addCookie(response, WebUtil.removeCRLF(cookieValue));
		//response.addCookie(cookie);
	}

	/**
	 * <pre>
	 * Description :  쿠키생성 - 쿠키의 유효시간을 설정하지 않을 경우 쿠키의 생명주기는 브라우저가 종료될 때까지.
	 * </pre>
	 *
	 * @param response
	 *        - Response
	 * @param cookieNm
	 *        - 쿠키명
	 * @param cookieVal
	 *        - 쿠키값
	 * @throws UnsupportedEncodingException
	 *         UnsupportedEncodingException
	 * @see 스프링은 컨트롤러에서 쿠키에 값을 설정 할 수 없음.
	 */

	public static void setCookie(final HttpServletResponse response, final String cookieNm, final String cookieVal)
			throws UnsupportedEncodingException {

		// 특정의 encode 방식을 사용해 캐릭터 라인을 application/x-www-form-urlencoded 형식으로 변환
		// 일반 문자열을 웹에서 통용되는 'x-www-form-urlencoded' 형식으로 변환하는 역할
		String cookieValue = URLEncoder.encode(cookieVal, "utf-8");

		// 쿠키생성
		CookieGenerator cookieGenerator = new CookieGenerator();
		cookieGenerator.setCookieName(WebUtil.removeCRLF(cookieNm));
		//Cookie cookie = new Cookie(WebUtil.removeCRLF(cookieNm), WebUtil.removeCRLF(cookieValue));

		// 2011.10.10 보안점검 후속조치
		// HTTPS 프로토콜에서만 접근 가능
		//cookieGenerator.setCookieSecure(true);
		//cookie.setSecure(true);

		// response 내장 객체를 이용해 쿠키를 전송
		cookieGenerator.addCookie(response, WebUtil.removeCRLF(cookieValue));
		//response.addCookie(cookie);
	}

	/**
	 * <pre>
	 * Description :  쿠키값 사용 - 쿠키값을 읽어들인다.
	 * </pre>
	 *
	 * @param request
	 *        - Request
	 * @param cookieNm
	 *        - 쿠키명
	 * @return 쿠키값
	 * @throws Exception
	 *         Exception
	 * @see
	 */
	public static String getCookie(final HttpServletRequest request, final String cookieNm) throws Exception {

		// 한 도메인에서 여러 개의 쿠키를 사용할 수 있기 때문에 Cookie[] 배열이 반환
		// Cookie를 읽어서 Cookie 배열로 반환
		Cookie[] cookies = request.getCookies();

		if (cookies == null) {
			return "";
		}
		String cookieValue = null;

		// 입력받은 쿠키명으로 비교해서 쿠키값을 얻어낸다.
		for (Cookie cookie : cookies) {

			if (cookieNm.equals(cookie.getName())) {

				// 특별한 encode 방식을 사용해
				// application/x-www-form-urlencoded 캐릭터 라인을 디코드
				// URLEncoder로 인코딩된 결과를 디코딩하는 클래스
				cookieValue = URLDecoder.decode(cookie.getValue(), "utf-8");

				// 한전 홈페이지에서 사용하던 소스 (차이점)
				// cookieValue = cookies[i].getValue();
				break;
			}
		}
		return cookieValue;
	}

	/**
	 * 쿠키값 삭제 - cookie.setMaxAge(0) - 쿠키의 유효시간을 0으로 설정해 줌으로써 쿠키를 삭제하는 것과 동일한 효과.
	 *
	 * @param response
	 *        HttpServletResponse
	 * @param cookieNm
	 *        쿠키명
	 * @throws UnsupportedEncodingException
	 *         UnsupportedEncodingException
	 * @see
	 */
	public static void setCookie(final HttpServletResponse response, final String cookieNm) throws UnsupportedEncodingException {

		// 쿠키생성 - 쿠키의 이름, 쿠키의 값
		CookieGenerator cookieGenerator = new CookieGenerator();

		//Cookie cookie = new Cookie(WebUtil.removeCRLF(cookieNm), null);
		cookieGenerator.setCookieName(WebUtil.removeCRLF(cookieNm));

		// 2011.10.10 보안점검 후속조치
		// HTTPS 프로토콜에서만 접근 가능
		//cookieGenerator.setCookieSecure(true);
		//cookie.setSecure(true);
		//cookie.setSecure(true);

		// 쿠키를 삭제하는 메소드가 따로 존재하지 않음
		// 쿠키의 유효시간을 0으로 설정해 줌으로써 쿠키를 삭제하는 것과 동일한 효과
		cookieGenerator.setCookieMaxAge(0);

		// response 내장 객체를 이용해 쿠키를 전송
		cookieGenerator.removeCookie(response);
		//addCookie(response, WebUtil.removeCRLF(""));
		//response.addCookie(cookie);
	}

	/**
	 * <pre>
	 * Description : 세션 Prefix 제거.
	 * </pre>
	 *
	 * @auther : User
	 * @since : 2016. 3. 8.
	 * @param name
	 *        Prefix + 세션 키
	 * @return 세션 키
	 */
	public static String removePrefix(final String name) {
		if (name.startsWith(PREFIX_LABEL)) {
			return name.substring(PREFIX_LABEL.length());
		} else {
			return name;
		}
	}

	/**
	 * <pre>
	 * Description : 세션 Prefix 추가.
	 * </pre>
	 *
	 * @auther : User
	 * @since : 2016. 3. 8.
	 * @param name
	 *        세션 키
	 * @return Prefix + 세션 키
	 */
	public static String addPrefix(final String name) {
		if (!name.startsWith(PREFIX_LABEL)) {
			return PREFIX_LABEL + name;
		} else {
			return name;
		}

	}
}