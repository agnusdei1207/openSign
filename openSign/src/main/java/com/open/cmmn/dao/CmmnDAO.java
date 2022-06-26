package com.open.cmmn.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

/**
 * <pre>
 * Class Name : CmmnDAO.java
 * Description: 공통 DAO.
 * Modification Information
 *
 *    수정일         수정자         수정내용
 *    -------        -------     -------------------
 *    2016. 11. 3.	 User		최초생성
 *
 * </pre>
 *
 * @author User
 * @since 2016. 11. 3.
 * @version 1.0
 * @see <pre>
 *
 * </pre>
 */
@Repository("cmmnDAO")
public class CmmnDAO {

	/**
	 * SqlSessionTemplate.
	 */
	@Resource(name = "sqlMapClientCommon")
	private SqlSessionTemplate template;

	/**
	 * Mapper Package.
	 */
	private static final String PACKAGE_NAME = "com.open.";

	/**
	 * <pre>
	 * Description :  목록을 조회한다.
	 * </pre>
	 *
	 * @param paramVO 조회용 Object,
	 * @param queryId String QueryId
	 * @return List
	 * @exception Exception Exception
	 */
	public List<?> selectList(final Object paramVO, final String queryId) throws Exception {
		String mQueryId = "";
		if (queryId != null && (queryId.equals("") || queryId.indexOf(".") < 0)) {
			mQueryId = queryId + ".selectList";
		} else {
			mQueryId = queryId;
		}
		return template.selectList(PACKAGE_NAME + mQueryId, paramVO);
	}

	/**
	 * <pre>
	 * Description :  맵을 조회한다.
	 * </pre>
	 *
	 * @param paramVO 조회용 Object,
	 * @param queryId String QueryId
	 * @param mapKey return Map에서 키가 될 컬럼명
	 * @return Map
	 * @exception Exception Exception
	 */
	public Map<?, ?> selectMap(final Object paramVO, final String queryId, final String mapKey) throws Exception {
		String mQueryId = "";
		if (queryId != null && (queryId.equals("") || queryId.indexOf(".") < 0)) {
			mQueryId = queryId + ".selectMap";
		} else {
			mQueryId = queryId;
		}
		return template.selectMap(PACKAGE_NAME + mQueryId, paramVO, mapKey);
	}

	/**
	 * <pre>
	 * Description :  전체 레코드 카운터를 조회한다.
	 * </pre>
	 *
	 * @param paramVO 조회용 Object
	 * @param queryId String QueryId
	 * @return int
	 * @exception Exception Exception
	 */
	public int selectCount(final Object paramVO, final String queryId) throws Exception {
		String mQueryId = "";
		if (queryId != null && (queryId.equals("") || queryId.indexOf(".") < 0)) {
			mQueryId = queryId + ".selectCount";
		} else {
			mQueryId = queryId;
		}
		return (Integer) template.selectOne(PACKAGE_NAME + mQueryId, paramVO);
	}

	/**
	 * <pre>
	 * Description :  상세정보를 조회한다.
	 * </pre>
	 *
	 * @param paramVO 조회용 Object
	 * @param queryId String QueryId
	 * @return Object
	 * @exception Exception Exception
	 */
	public Object selectContents(final Object paramVO, final String queryId) throws Exception {
		String mQueryId = "";
		if (queryId != null && (queryId.equals("") || queryId.indexOf(".") < 0)) {
			mQueryId = queryId + ".selectContents";
		} else {
			mQueryId = queryId;
		}
		return template.selectOne(PACKAGE_NAME + mQueryId, paramVO);
	}

	/**
	 * <pre>
	 * Description :  정보를 입력한다.
	 * </pre>
	 *
	 * @param paramVO 조회용 Object
	 * @param queryId String QueryId
	 * @exception Exception Exception
	 */
	public void insertContents(final Object paramVO, final String queryId) throws Exception {
		String mQueryId = "";
		if (queryId != null && (queryId.equals("") || queryId.indexOf(".") < 0)) {
			mQueryId = queryId + ".insertContents";
		} else {
			mQueryId = queryId;
		}
		template.insert(PACKAGE_NAME + mQueryId, paramVO);
	}

	/**
	 * <pre>
	 * Description :  정보를 수정한다.
	 * </pre>
	 *
	 * @param paramVO 조회용 Object
	 * @param queryId String QueryId
	 * @exception Exception Exception
	 */
	public void updateContents(final Object paramVO, final String queryId) throws Exception {
		String mQueryId = "";
		if (queryId != null && (queryId.equals("") || queryId.indexOf(".") < 0)) {
			mQueryId = queryId + ".updateContents";
		} else {
			mQueryId = queryId;
		}
		template.update(PACKAGE_NAME + mQueryId, paramVO);
	}

	/**
	 * <pre>
	 * Description :  정보를 삭제한다.
	 * </pre>
	 *
	 * @param paramVO 조회용 Object
	 * @param queryId String QueryId
	 * @exception Exception Exception
	 */
	public void deleteContents(final Object paramVO, final String queryId) throws Exception {
		String mQueryId = "";
		if (queryId != null && (queryId.equals("") || queryId.indexOf(".") < 0)) {
			mQueryId = queryId + ".deleteContents";
		} else {
			mQueryId = queryId;
		}
		template.delete(PACKAGE_NAME + mQueryId, paramVO);
	}

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
	public Object insertSelectKey(final Object paramVO, final String queryId) throws Exception {
		String mQueryId = "";
		if (queryId != null && (queryId.equals("") || queryId.indexOf(".") < 0)) {
			mQueryId = queryId + ".insertSelectKey";
		} else {
			mQueryId = queryId;
		}
		template.insert(PACKAGE_NAME + mQueryId, paramVO);
		return paramVO;
	}
	
	/**
	 * <pre>
	 * Description :  다중정보를 입력한다.
	 * </pre>
	 *
	 * @param paramVO 조회용 Object
	 * @param queryId String QueryId
	 * @return Object
	 * @throws Exception Exception
	 */
	public void insertAllContents(final List<?> paramList, final String queryId) throws Exception {
		String mQueryId = "";
		if (queryId != null && (queryId.equals("") || queryId.indexOf(".") < 0)) {
			mQueryId = queryId + ".insertAllContents";
		} else {
			mQueryId = queryId;
		}
		template.insert(PACKAGE_NAME + mQueryId, paramList);
	}
	

}
