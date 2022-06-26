package com.open.cmmn.util;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.Charset;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.net.ssl.HttpsURLConnection;
import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;
import javax.script.ScriptException;

/**
 * 교차접속 스크립트 공격 취약성 방지(파라미터 문자열 교체).
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 * 
 *   수정일      수정자           수정내용
 *  -------    	--------    ---------------------------
 *   2011.10.10  한성곤          최초 생성
 *
 * </pre>
 */

public final class WebUtil {
	/**
	 * <pre>
	 * Description : This prevents the default parameterless constructor
	 *               from being used elsewhere in code.
	 * </pre>
	 *
	 * Constructor of WebUtil.java class
	 *
	 * @auther : User
	 * @since : 2016. 2. 24.
	 */
	private WebUtil() {
		// Throw an exception if this ever *is* called
		// throw new AssertionError("Instantiating utility class");
	}

	/**
	 * <pre>
	 * Description : XSS 공격 방지를 위해 텍스트 치환.
	 * </pre>
	 *
	 * @auther : User
	 * @since : 2016. 3. 4.
	 * @param value
	 *        XSS 취약가능 텍스트
	 * @return String
	 */
	public static String clearXSSMinimum(final String value) {
		if (value == null || value.trim().equals("")) {
			return "";
		}

		String returnValue = value;

		returnValue = returnValue.replaceAll("&", "&amp;");
		returnValue = returnValue.replaceAll("<", "&lt;");
		returnValue = returnValue.replaceAll(">", "&gt;");
		returnValue = returnValue.replaceAll("\"", "&#34;");
		returnValue = returnValue.replaceAll("\'", "&#39;");
		returnValue = returnValue.replaceAll(".", "&#46;");
		returnValue = returnValue.replaceAll("%2E", "&#46;");
		returnValue = returnValue.replaceAll("%2F", "&#47;");
		returnValue = returnValue.replaceAll(" ", "&#10;");
		returnValue = returnValue.replaceAll("\\(", "&#40;");
		returnValue = returnValue.replaceAll("\\)", "&#41;");
		returnValue = returnValue.replaceAll("#", "&#35;");
		return returnValue;

	}

	/**
	 * <pre>
	 * Description : XSS 공격 방지를 위해 텍스트 치환.
	 * </pre>
	 *
	 * @auther : User
	 * @since : 2016. 3. 4.
	 * @param value
	 *        XSS 취약가능 텍스트
	 * @return String
	 */
	public static String clearXSSMaximum(final String value) {
		String returnValue = value;
		returnValue = clearXSSMinimum(returnValue);

		returnValue = returnValue.replaceAll("%00", null);

		returnValue = returnValue.replaceAll("%", "&#37;");

		// \\. => .

		returnValue = returnValue.replaceAll("\\.\\./", ""); // ../
		returnValue = returnValue.replaceAll("\\.\\.\\\\", ""); // ..\
		returnValue = returnValue.replaceAll("\\./", ""); // ./
		returnValue = returnValue.replaceAll("%2F", "");

		return returnValue;
	}

	/**
	 * <pre>
	 * Description : 블랙리스트 방식 파일 경로 제거.
	 * </pre>
	 *
	 * @auther : User
	 * @since : 2016. 3. 4.
	 * @param value
	 *        취약 가능 파일 경로
	 * @return 취약점 제거된 파일 경로
	 */
	public static String filePathBlackList(final String value) {
		String returnValue = value;
		if (returnValue == null || returnValue.trim().equals("")) {
			return "";
		}

		returnValue = returnValue.replaceAll("\\.\\./", ""); // ../
		returnValue = returnValue.replaceAll("\\.\\.\\\\", ""); // ..\

		return returnValue;
	}

	/**
	 * <pre>
	 * Description : 행안부 보안취약점 점검 조치 방안.
	 * </pre>
	 *
	 * @auther : User
	 * @since : 2016. 3. 4.
	 * @param value
	 *        취약 가능 파일 경로
	 * @return 취약점 제거된 파일 경로
	 */
	public static String filePathReplaceAll(final String value) {
		String returnValue = value;
		if (returnValue == null || returnValue.trim().equals("")) {
			return "";
		}

		returnValue = returnValue.replaceAll("/", "");
		returnValue = returnValue.replaceAll("\\", "");
		returnValue = returnValue.replaceAll("\\.\\.", ""); // ..
		returnValue = returnValue.replaceAll("&", "");

		return returnValue;
	}

	/**
	 * <pre>
	 * Description : 화이트리스트 방식 파일 경로 제거..
	 * </pre>
	 *
	 * @auther : User
	 * @since : 2016. 3. 4.
	 * @param value
	 *        취약 가능 파일 경로
	 * @return 취약점 제거된 파일 경로
	 */
	public static String filePathWhiteList(final String value) {
		return value;
	}

	/**
	 * <pre>
	 * Description : IP주소 체크.
	 * </pre>
	 *
	 * @auther : User
	 * @since : 2016. 3. 4.
	 * @param str
	 *        검증 텍스트
	 * @return IP주소일 경우 true
	 */
	public static boolean isIPAddress(final String str) {
		Pattern ipPattern = Pattern.compile("\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}");

		return ipPattern.matcher(str).matches();
	}

	/**
	 * <pre>
	 * Description : CRLF 방지 메소드.
	 * </pre>
	 *
	 * @auther : User
	 * @since : 2016. 3. 4.
	 * @param parameter
	 *        CRLF 취약 가능 텍스트
	 * @return 취약점 제거된 텍스트
	 */
	public static String removeCRLF(final String parameter) {
		return parameter.replaceAll("\r", "").replaceAll("\n", "");
	}

	/**
	 * <pre>
	 * Description : SQL Injection 방지 메소드.
	 * </pre>
	 *
	 * @auther : User
	 * @since : 2016. 3. 4.
	 * @param parameter
	 *        SQL Injection 취약 가능 텍스트
	 * @return 취약점 제거된 텍스트
	 */
	public static String removeSQLInjectionRisk(final String parameter) {
		return parameter.replaceAll("\\p{Space}", "").replaceAll("\\*", "").replaceAll("%", "").replaceAll(";", "").replaceAll("-", "")
				.replaceAll("\\+", "").replaceAll(",", "");
	}

	/**
	 * <pre>
	 * Description : OS Command 공격 방지 메소드.
	 * </pre>
	 *
	 * @auther : User
	 * @since : 2016. 3. 4.
	 * @param parameter
	 *        OS Command 공격 취약 텍스트
	 * @return 취약점 제거된 텍스트
	 */
	public static String removeOSCmdRisk(final String parameter) {
		return parameter.replaceAll("\\p{Space}", "").replaceAll("\\*", "").replaceAll("|", "").replaceAll(";", "");
	}

	/**
	 * <pre>
	 * Description : 스크립트 제거.
	 * </pre>
	 *
	 * @param data 입력 데이터
	 * @return 스트립트 제거된 데이터
	 */
	public static String unscript(final String data) {
		if (data == null || data.trim().equals("")) {
			return "";
		}
		String ret = data;

		ret = ret.replaceAll("<(S|s)(C|c)(R|r)(I|i)(P|p)(T|t)", "&lt;script");
		ret = ret.replaceAll("</(S|s)(C|c)(R|r)(I|i)(P|p)(T|t)", "&lt;/script");

		ret = ret.replaceAll("<(O|o)(B|b)(J|j)(E|e)(C|c)(T|t)", "&lt;object");
		ret = ret.replaceAll("</(O|o)(B|b)(J|j)(E|e)(C|c)(T|t)", "&lt;/object");

		ret = ret.replaceAll("<(A|a)(P|p)(P|p)(L|l)(E|e)(T|t)", "&lt;xapplet");
		ret = ret.replaceAll("</(A|a)(P|p)(P|p)(L|l)(E|e)(T|t)", "&lt;/xapplet");

		ret = ret.replaceAll("<(E|e)(M|m)(B|b)(E|e)(D|d)", "&lt;embed");
		ret = ret.replaceAll("</(E|e)(M|m)(B|b)(E|e)(D|d)", "&lt;embed");

		ret = ret.replaceAll("<(F|f)(O|o)(R|r)(M|m)", "&lt;form");
		ret = ret.replaceAll("</(F|f)(O|o)(R|r)(M|m)", "&lt;form");

		return ret;
	}

	/**
	 * <pre>
	 * Description : Html 코드가 들어간 문서를 표시할때 태그에 손상없이 보이기 위한 메서드.
	 * </pre>
	 *
	 * @param strString 입력 데이터
	 * @return HTML 태그를 치환한 문자열
	 */
	public static String checkHtmlView(final String strString) throws Exception{
		String strNew = "";

			StringBuffer strTxt = new StringBuffer("");

			char chrBuff;
			int len = strString.length();

			for (int i = 0; i < len; i++) {
				chrBuff = strString.charAt(i);

				switch (chrBuff) {
					case '<':
						strTxt.append("&lt;");
						break;
					case '>':
						strTxt.append("&gt;");
						break;
					case '"':
						strTxt.append("&quot;");
						break;
					case '\'':
						strTxt.append("&apos;");
						break;
					//case 10:
					//strTxt.append("<br>");
					//break;
					//case ' ':
					//strTxt.append("&nbsp;");
					//break;
					//case '&' :
					//strTxt.append("&amp;");
					//break;
					default:
						strTxt.append(chrBuff);
						break;
				}
			}

			strNew = strTxt.toString();


		return strNew;
	}

	/**
	 *
	 * <pre>
	 * Description : 문자열에서 개인정보 패턴을 추출하여 '*' 로 치환한다.
	 * (ex. 750101-1234567 -> ******-*******).
	 * </pre>
	 *
	 * @param str : 개인정보가 포함된 문자열
	 * @return '*'로 치환된 문자열
	 */
	public static String chkRegExp(final String str) {
		String rtrnStr = "";
		if (str != null && !str.equals("")) {
			rtrnStr = str;
			String regExp = "";
			String regExpPttrn =
					"([01][0-9][[:space:],~-]+[1-4][0-9]|[2-9][0-9][[:space:],~-]+[1-2][0-9])|"
							+ //주민등록번호
							"([a-zA-Z][-~.[:space:]][0-9])|"
							+ //여권번호
							"[0-9][-~.[:space:]][0-9][-~.[:space:]][0-9]|"
							+ //운전면허 등록번호
							"01[016789][-~.[:space:]][0-9]{3,4}[-~.[:space:]][0-9]|"
							+ //핸드폰 번호
							"([01][0-9][[:space:]~-]+[1-8][0-9]|[2-9][0-9][[:space:]~-]+[1256][0-9])|"
							+ //외국인등록번호
							"[34569][0-9][-~.[:space:]][0-9][-~.[:space:]][0-9][-~.[:space:]][0-9]|"
							+ //신용카드번호
							"[1257][-~.[:space:]][0-9]|"
							+ //건강보험 등록번호
							"([0-9][-~.[:space:]][0-9][-~.[:space:]][0-9]|"
							+ //계좌번호
							"[0-9][-~.[:space:]]([0-9]{5,6}[-~.[:space:]][0-9]|"
							+ "[0-9][-~.[:space:]][0-9]|[0-9]{2,3}[-~.[:space:]][0-9]|[0-9][-~.[:space:]][0-9]|"
							+ "[0-9][-~.[:space:]][0-9]{4,6}[-~.[:space:]][0-9]|"
							+ "[0-9][-~.[:space:]][0-9][-~.[:space:]][0-9]|[0-9][-~.[:space:]][0-9][-~.[:space:]][0-9]|"
							+ "[0-9][-~.[:space:]][0-9][-~.[:space:]][0-9]|"
							+ "[0-9][-~.[:space:]][0-9][-~.[:space:]][0-9]|[0-9][-~.[:space:]][0-9][-~.[:space:]][0-9])|"
							+ "[0-9][-~.[:space:]]([0-9][-~.[:space:]][0-9]|"
							+ "[0-9][-~.[:space:]][0-9][-~.[:space:]][0-9])|[0-9][-~.[:space:]][0-9][-~.[:space:]][0-9]|"
							+ "[0-9][-~.[:space:]][0-9][-~.[:space:]][0-9]{5,6})";

			//정규식 패턴으로 등록
			Pattern pattern = Pattern.compile(regExpPttrn);

			//입력받은 문자열 중에 패턴에 등록된 정규식이 포함되어 있는지 검사
			Matcher matches = pattern.matcher(str);

			//정규식이 포함되어 있으면
			if (matches.find()) {
				regExp = matches.group();

				//정규식의 숫자를 '*'로 치환
				regExp = regExp.replaceAll("[\\d]", "*");

				//원문 전체 글에서 정규식을 치환된 정규식으로 치환
				rtrnStr = rtrnStr.replaceAll(regExpPttrn, regExp);
			}
		}
		return rtrnStr;
	}

	/**
	 * <pre>
	 * Description : JavaScriptEngine을 이용하여 산식 문자열 계산.
	 * </pre>
	 *
	 * @param mathExpression 산식 문자열
	 * @return Object
	 * @throws ScriptException ScriptException
	 */
	public static Object evalMath(final String mathExpression) throws ScriptException {
		ScriptEngineManager seManager = new ScriptEngineManager();
		ScriptEngine sEngine = seManager.getEngineByName("js");
		if(sEngine != null){
			return sEngine.eval(mathExpression);
		}else{
			return null;
		}
	}
	
	/**
     * Post 방식
     * Https
     * @throws Exception
     */
    private void sendPostHttps() throws Exception {

        String url = "https://사용할주소";
        String urlParameters = "sn=C02G8416DRJM&cn=&locale=&caller=&num=12345";
        URL obj = new URL(url);
        HttpsURLConnection con = (HttpsURLConnection) obj.openConnection();

        //add reuqest header
        con.setRequestMethod("POST");
        con.setRequestProperty("User-Agent",  "Mozilla/5.0");
        con.setConnectTimeout(10000);       //컨텍션타임아웃 10초
        con.setReadTimeout(5000);           //컨텐츠조회 타임아웃 5총
        // Send post request
        con.setDoOutput(true);              //항상 갱신된내용을 가져옴.
        DataOutputStream wr = new DataOutputStream(con.getOutputStream());
        wr.writeBytes(urlParameters);
        wr.flush();
        wr.close();

        int responseCode = con.getResponseCode();
        System.out.println("\nSending 'POST' request to URL : " + url);
        System.out.println("Post parameters : " + urlParameters);
        System.out.println("Response Code : " + responseCode);

        Charset charset = Charset.forName("UTF-8");
        BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream(),charset));
        String inputLine;
        StringBuffer response = new StringBuffer();

        while ((inputLine = in.readLine()) != null) {
            response.append(inputLine);
        }
        in.close();
        System.out.println(response.toString());
    }


    /**
     * Post 방식
     * Https
     * @throws Exception
     */
    public static void sendPost() throws Exception {

        String ur = "http://l-www.hyundaimedia.com:9000/loginProcess2.do";
        URL url = new URL(ur); // 호출할 url
        Map<String,Object> params = new LinkedHashMap<>(); // 파라미터 세팅
        params.put("id", "ispadm");
        params.put("pwd", "1111");
 
        StringBuilder postData = new StringBuilder();
        for(Map.Entry<String,Object> param : params.entrySet()) {
            if(postData.length() != 0) postData.append('&');
            postData.append(URLEncoder.encode(param.getKey(), "UTF-8"));
            postData.append('=');
            postData.append(URLEncoder.encode(String.valueOf(param.getValue()), "UTF-8"));
        }
        byte[] postDataBytes = postData.toString().getBytes("UTF-8");
 
        HttpURLConnection conn = (HttpURLConnection)url.openConnection();
        conn.setRequestMethod("POST");
        conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
        conn.setRequestProperty("Content-Length", String.valueOf(postDataBytes.length));
        conn.setDoOutput(true);
        conn.getOutputStream().write(postDataBytes); // POST 호출
 
        BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
 
        String inputLine;
        while((inputLine = in.readLine()) != null) { // response 출력
            System.out.println(inputLine);
        }
 
        in.close();
    }


}