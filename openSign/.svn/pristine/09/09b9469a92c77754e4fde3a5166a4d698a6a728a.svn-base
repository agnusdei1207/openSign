package com.open.cmmn.web;

import java.io.IOException;
import java.util.Base64;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import okhttp3.MediaType;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;

public class SmsManager {
	
	
	/**
	 * SMS 단문 발송
	 * 단문으로 문자를 발송할 수 있습니다. 90byte까지 단문으로 발송되며, 90byte가 넘는 경우에는 단문으로 잘려 발송됩니다.
	 * @throws IOException 
	 * @throws ParseException 
	 */
	private static final String CALL_BACK = "01053313949";
	
	@SuppressWarnings("deprecation")
	public static void sendSms(String pNum,String msg) throws IOException, ParseException  {
		smsToken();
		OkHttpClient client = new OkHttpClient();
		MediaType mediaType = MediaType.parse("application/x-www-form-urlencoded");
		RequestBody body = RequestBody.create(mediaType, "phone="+pNum+"&callback="+CALL_BACK+"&message="+msg+"&refkey=OPENNOTE00002");
		Request request = new Request.Builder()
		.url("https://sms.gabia.com/api/send/sms")
		.post(body)
		.addHeader("Content-Type", "application/x-www-form-urlencoded")
		.addHeader("Authorization", "Basic "+Base64.getEncoder().withoutPadding().encodeToString(smsToken().getBytes()))
		.addHeader("cache-control", "no-cache")
		.build();
		Response response = client.newCall(request).execute();
		
		smsResult();
	}
	
	/**
	 * LMS 장문 발송
	 * 장문으로 문자를 발송할 수 있습니다. 문자 내용에 제목을 추가할 수 있습니다.
	 * @throws IOException 
	 */
	@SuppressWarnings("deprecation")
	public static void sendLms(String pNum,String msg,String title) throws Exception {
		OkHttpClient client = new OkHttpClient();

		MediaType mediaType = MediaType.parse("application/x-www-form-urlencoded");
		RequestBody body = RequestBody.create(mediaType, "phone="+pNum+"&callback="+CALL_BACK+"&message="+msg+"&subject="+title);
		Request request = new Request.Builder()
		.url("https://sms.gabia.com/api/send/lms")
		.post(body)
		.addHeader("Content-Type", "application/x-www-form-urlencoded")
		.addHeader("Authorization", "Basic "+Base64.getEncoder().withoutPadding().encodeToString(smsToken().getBytes()))
		.addHeader("cache-control", "no-cache")
		.build();

		Response response = client.newCall(request).execute();
	}
	
	
	
	/**
	 * 사용자 인증
	 * 토큰발급
	 * @throws IOException 
	 * @throws ParseException 
	 */
	public static String smsToken() throws IOException, ParseException  {
		OkHttpClient client = new OkHttpClient();
		String smsId = "open1010:";
		String appKey = smsId+"19509494e1eb91a37f97e0e7c3f7ab2f"; // appKey 는 sms_id : app_key 조합
		String access_token = "";
		MediaType mediaType = MediaType.parse("application/x-www-form-urlencoded");
		RequestBody body = RequestBody.create(mediaType, "grant_type=client_credentials");
		Request request = new Request.Builder()
		.url("https://sms.gabia.com/oauth/token")
		.post(body)
		.addHeader("Content-Type", "application/x-www-form-urlencoded")
		.addHeader("Authorization", "Basic "+Base64.getEncoder().withoutPadding().encodeToString(appKey.getBytes()))
		.addHeader("cache-control", "no-cache")
		.build();

		Response response = client.newCall(request).execute();
		String jsonData = response.body().string();
		JSONParser parser = new JSONParser();
		JSONObject data = (JSONObject) parser.parse(jsonData);
		
		access_token = smsId+data.get("access_token").toString();// access_token 는 sms_id : access_token 조합
		return access_token;
	}
	
	/**
	 * 발송결과확인
	 * @throws IOException 
	 * @throws ParseException 
	 */
	public static void smsResult() throws IOException, ParseException  {
		OkHttpClient client = new OkHttpClient();

		MediaType mediaType = MediaType.parse("application/x-www-form-urlencoded");
		RequestBody body = RequestBody.create(mediaType, "undefined=");
		Request request = new Request.Builder()
		.url("https://sms.gabia.com/api/result_log/byRefkey?refkey=OPENNOTE00002")
		.get()
		.addHeader("Authorization", "Basic "+Base64.getEncoder().withoutPadding().encodeToString(smsToken().getBytes()))
		.addHeader("cache-control", "no-cache")
		.build();
		
		Response response = client.newCall(request).execute();
		String jsonData = response.body().string();
		JSONParser parser = new JSONParser();
		JSONObject data = (JSONObject) parser.parse(jsonData);
	}
	
}