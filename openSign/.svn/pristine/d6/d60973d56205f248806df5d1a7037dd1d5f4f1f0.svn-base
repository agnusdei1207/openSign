package com.open.cmmn.service;

import java.util.List;
import java.util.Map;

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
public interface CmmnService {

	/**
	 * <pre>
	 * Description : 목록을 조회한다.
	 * </pre>
	 *
	 * @param paramVO 조회용 VO
	 * @param queryId QueryId
	 * @return List
	 * @throws Exception Exception
	 */
	List<?> selectList(Object paramVO, String queryId) throws Exception;

	/**
	 * <pre>
	 * Description : 맵을 조회한다.
	 * </pre>
	 *
	 * @param paramVO 조회용 VO
	 * @param queryId String QueryId
	 * @param mapKey map의 Key Property
	 * @return Map
	 * @throws Exception Exception
	 */
	Map<?, ?> selectMap(Object paramVO, String queryId, String mapKey) throws Exception;

	/**
	 * <pre>
	 * Description : 레코드 카운터를 조회한다.
	 * </pre>
	 *
	 * @param paramVO 조회용 Object
	 * @param queryId QueryId
	 * @return int
	 * @throws Exception Exception
	 */
	int selectCount(Object paramVO, String queryId) throws Exception;

	/**
	 * <pre>
	 * Description : 상세정보를 조회한다.
	 * </pre>
	 *
	 * @param paramVO 조회용 Object
	 * @param queryId QueryId
	 * @return Object
	 * @throws Exception Exception
	 */
	Object selectContents(Object paramVO, String queryId) throws Exception;

	/**
	 * <pre>
	 * Description : 정보를 입력한다.
	 * </pre>
	 *
	 * @param paramVO 조회용 Object
	 * @param queryId QueryId
	 * @throws Exception Exception
	 */
	void insertContents(Object paramVO, String queryId) throws Exception;

	/**
	 * <pre>
	 * Description : 정보를 입력하고 입력한 키를 반환한다.
	 * </pre>
	 *
	 * @param paramVO 조회용 Object
	 * @param queryId String QueryId
	 * @return Object
	 * @throws Exception Exception
	 */
	Object insertSelectKey(Object paramVO, String queryId) throws Exception;

	/**
	 * <pre>
	 * Description : 정보를 수정한다.
	 * </pre>
	 * 
	 * @param paramVO 조회용 Object
	 * @param queryId QueryId
	 * @throws Exception Exception
	 */
	void updateContents(Object paramVO, String queryId) throws Exception;

	/**
	 * <pre>
	 * Description : 정보를 삭제한다.
	 * </pre>
	 * 
	 * @param paramVO 조회용 Object
	 * @param queryId QueryId
	 * @throws Exception Exception
	 */
	void deleteContents(Object paramVO, String queryId) throws Exception;
	
	/**
	 * <pre>
	 * Description : 다중 정보를 입력한다.
	 * </pre>
	 *
	 * @param paramVO 조회용 Object
	 * @param queryId QueryId
	 * @throws Exception Exception
	 */
	void insertAllContents(List<?> paramList, String queryId) throws Exception;
	

}