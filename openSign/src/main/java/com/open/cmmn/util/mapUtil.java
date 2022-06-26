package com.open.cmmn.util;

import java.util.HashMap;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.web.client.RestTemplate;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

public class mapUtil {

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public static HashMap<String, String> getLocation(String address ) throws Exception {
		
		HashMap<String, String> map = new HashMap<>();
		String serverHost   = "https://dapi.kakao.com";
		String keywordPath    = "/v2/local/search/address.json";
		String queryString = "?query="+address;
		String restApiKey = "688f0cad3d174b146919898d55c300b0";

		String baseUrl = serverHost + keywordPath + queryString;
		LinkedMultiValueMap<String, String> parameters = new LinkedMultiValueMap<String, String>();
		
		HttpHeaders headers = new HttpHeaders();
		headers.add("Accept", "application/json");
		headers.add("Authorization", "KakaoAK " + restApiKey);
		
		RestTemplate restTemplate = new RestTemplate();
		HttpEntity entity = new HttpEntity("parameters", headers);
		ResponseEntity re= restTemplate.exchange(baseUrl, HttpMethod.GET, entity, String.class);
		JSONParser jsonParser = new JSONParser(); 
		JSONObject jsonObject = (JSONObject) jsonParser.parse(re.getBody().toString()); 
		JSONArray documents = (JSONArray) jsonObject.get("documents");
		System.out.println("documents :: "+documents);
		
		// null검사를 위한 변수
		String mapY = "";
		String mapX = "";
		String mapSi = "";
		String mapGu = "";
		String mapDong = "";
		//String mapZipCode = "";
		
		
		if(documents != null && documents.size() > 0){
			JSONObject data = (JSONObject) documents.get(0);
			JSONObject addrData = (JSONObject) data.get("address");
			JSONObject roadAddrData = (JSONObject) data.get("road_address");
			
			
			if(addrData != null && roadAddrData != null){
				// null검사
				if(!StringUtil.nullString(addrData.get("y").toString()).equals("")){
					mapY = addrData.get("y").toString();
				}
				if(!StringUtil.nullString(addrData.get("x").toString()).equals("")){
					mapX = addrData.get("x").toString();
				}
				if(!StringUtil.nullString(addrData.get("region_1depth_name").toString()).equals("")){
					mapSi = addrData.get("region_1depth_name").toString();
				}
				if(!StringUtil.nullString(addrData.get("region_2depth_name").toString()).equals("")){
					mapGu = addrData.get("region_2depth_name").toString();
				}
				if(!StringUtil.nullString(addrData.get("region_3depth_name").toString()).equals("")){
					mapDong = addrData.get("region_3depth_name").toString();
				}
				/*if(!StringUtil.nullString(addrData.get("zip_code").toString()).equals("")){
					mapZipCode = addrData.get("zip_code").toString();
				}*/
			}
			
			map.put("y", mapY);
			map.put("x", mapX);	
			map.put("si", mapSi);
			map.put("gu", mapGu);
			map.put("dong", mapDong);
			//map.put("postCode", mapZipCode);
		}
		
		return map;
	}
	
	
	
}