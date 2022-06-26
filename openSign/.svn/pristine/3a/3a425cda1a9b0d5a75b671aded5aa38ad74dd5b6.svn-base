package com.open.cmmn.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.open.cmmn.dao.CmmnDAO;
import com.open.cmmn.service.CmmnService;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

/**
 * <pre>
 * Class Name : CmmnServiceImpl.java
 * Description: CmmnServiceImpl.
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
@Service("cmmnService")
public class CmmnServiceImpl extends EgovAbstractServiceImpl implements CmmnService {

	/** CmmnDAO . */
	@Autowired
	private CmmnDAO cmmnDAO;

	@Override
	public List<?> selectList(final Object paramVO, final String queryId) throws Exception {
		return cmmnDAO.selectList(paramVO, queryId);
	}

	@Override
	public Map<?, ?> selectMap(final Object paramVO, final String queryId, final String mapKey) throws Exception {
		return cmmnDAO.selectMap(paramVO, queryId, mapKey);
	}

	@Override
	public int selectCount(final Object paramVO, final String queryId) throws Exception {
		return cmmnDAO.selectCount(paramVO, queryId);
	}

	@Override
	public Object selectContents(final Object paramVO, final String queryId) throws Exception {
		return cmmnDAO.selectContents(paramVO, queryId);
	}

	@Override
	public void insertContents(final Object paramVO, final String queryId) throws Exception {
		cmmnDAO.insertContents(paramVO, queryId);
	}

	@Override
	public Object insertSelectKey(final Object pParamVO, final String pQueryId) throws Exception {
		return cmmnDAO.insertSelectKey(pParamVO, pQueryId);
	}

	@Override
	public void updateContents(final Object paramVO, final String queryId) throws Exception {
		cmmnDAO.updateContents(paramVO, queryId);
	}

	@Override
	public void deleteContents(final Object paramVO, final String queryId) throws Exception {
		cmmnDAO.deleteContents(paramVO, queryId);
	}
	
	@Override
	public void insertAllContents(final List<?> paramList, final String queryId) throws Exception {
		cmmnDAO.insertAllContents(paramList, queryId);
	}
	

}
