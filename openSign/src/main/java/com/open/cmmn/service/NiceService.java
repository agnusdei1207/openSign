package com.open.cmmn.service;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

/**
 * <pre>
 * Class Name : CmmnService.java
 * Description: .
 * Modification Information
 *
 *    수정일         수정자         수정내용
 *    -------        -------     -------------------
 *    2017. 1. 19.	 User		최초생성
 *
 * </pre>
 *
 * @author User
 * @since 2017. 1. 19.
 * @version 1.0
 * @see <pre>
 *
 * </pre>
 */
public interface NiceService {

	/**
	 * <pre>
	 * Description : 목록을 조회한다.
	 * </pre>
	 *
	 */
	HashMap<String, String> getNiceHp(HttpServletRequest request, String folderPath);

}