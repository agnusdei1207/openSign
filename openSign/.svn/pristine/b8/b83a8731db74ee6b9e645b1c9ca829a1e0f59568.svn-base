package com.open.cmmn.dao;

import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.open.cmmn.model.FileVO;

/**
 * <pre>
 * Class Name : FileManageDAO.java
 * Description: 파일정보 관리를 위한 데이터 처리 클래스.
 * Modification Information
 *
 *    수정일         수정자         수정내용
 *    -------        -------     -------------------
 *    2012.11.01.	 박현우		최초생성
 *
 * </pre>
 *
 * @author User
 * @since 2012.11.01.
 * @version 1.0
 * @see <pre>
 *
 * </pre>
 */
@Repository("FileManageDAO")
public class FileManageDAO {

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
	 * Description : 여러 개의 파일에 대한 정보(속성 및 상세)를 등록한다.
	 * </pre>
	 *
	 * @param fileList 파일리스트
	 * @return 첨부파일ID
	 * @throws Exception Exception
	 */
	@SuppressWarnings("rawtypes")
	public final String insertFileInfs(final List fileList) throws Exception {
		FileVO vo = (FileVO) fileList.get(0);
		String atchFileId = vo.getAtchFileId();
		template.insert(PACKAGE_NAME + "FileManageDAO.insertFileMaster", vo);

		Iterator iter = fileList.iterator();
		while (iter.hasNext()) {
			vo = (FileVO) iter.next();
			template.insert(PACKAGE_NAME + "FileManageDAO.insertFileDetail", vo);
		}

		return atchFileId;
	}

	/**
	 * <pre>
	 * Description : 여러 개의 파일에 대한 정보(속성 및 상세)를 등록한다.
	 * </pre>
	 *
	 * @param fileList 파일리스트
	 * @return 첨부파일ID
	 * @throws Exception Exception
	 */
	@SuppressWarnings("rawtypes")
	public final String insertFileInfsWithSubject(final List fileList) throws Exception {
		FileVO vo = (FileVO) fileList.get(0);
		String atchFileId = vo.getAtchFileId();

		template.insert(PACKAGE_NAME + "FileManageDAO.insertFileMaster", vo);

		Iterator iter = fileList.iterator();
		while (iter.hasNext()) {
			vo = (FileVO) iter.next();

			template.insert(PACKAGE_NAME + "FileManageDAO.insertFileDetailWithSubject", vo);
		}

		return atchFileId;
	}

	/**
	 * <pre>
	 * Description : 하나의 파일에 대한 정보(속성 및 상세)를 등록한다.
	 * </pre>
	 *
	 * @param vo 파일VO
	 * @throws Exception Exception
	 */
	public final void insertFileInf(final FileVO vo) throws Exception {
		template.insert(PACKAGE_NAME + "FileManageDAO.insertFileMaster", vo);
		template.insert(PACKAGE_NAME + "FileManageDAO.insertFileDetail", vo);
	}

	/**
	 * <pre>
	 * Description : 하나의 파일에 대한 정보(속성 및 상세)를 등록한다.
	 * </pre>
	 *
	 * @param vo 파일VO
	 * @throws Exception Exception
	 */
	public final void insertFileInfWithSubject(final FileVO vo) throws Exception {
		template.insert(PACKAGE_NAME + "FileManageDAO.insertFileMaster", vo);
		template.insert(PACKAGE_NAME + "FileManageDAO.insertFileDetailWithSubject", vo);
	}

	/**
	 * <pre>
	 * Description : 여러 개의 파일에 대한 정보(속성 및 상세)를 수정한다.
	 * </pre>
	 *
	 * @param fileList 파일리스트
	 * @throws Exception Exception
	 */
	@SuppressWarnings("rawtypes")
	public final void updateFileInfs(final List fileList) throws Exception {
		FileVO vo;
		Iterator iter = fileList.iterator();
		int i = 0;
		while (iter.hasNext()) {
			vo = (FileVO) iter.next();

			if (i == 0) {
				template.update(PACKAGE_NAME + "FileManageDAO.updateCOMTNFILE", vo);
			}

			template.insert(PACKAGE_NAME + "FileManageDAO.insertFileDetail", vo);
			i++;
		}
	}

	/**
	 * <pre>
	 * Description : 여러 개의 파일에 대한 정보(속성 및 상세)를 수정한다.
	 * </pre>
	 *
	 * @param fileList 파일리스트
	 * @throws Exception Exception
	 */
	@SuppressWarnings("rawtypes")
	public final void updateFileInfsWithSubject(final List fileList) throws Exception {
		FileVO vo;
		Iterator iter = fileList.iterator();
		int i = 0;
		while (iter.hasNext()) {
			vo = (FileVO) iter.next();

			if (i == 0) {
				template.update(PACKAGE_NAME + "FileManageDAO.updateCOMTNFILE", vo);
			}

			template.insert(PACKAGE_NAME + "FileManageDAO.insertFileDetailWithSubject", vo);
			i++;
		}
	}

	/**
	 * <pre>
	 * Description : 여러 개의 파일에 대한 정보(속성 및 상세)를 수정한다.
	 * </pre>
	 *
	 * @param fileList 파일리스트
	 * @throws Exception Exception
	 */
	@SuppressWarnings("rawtypes")
	public final void mergeUpdateFileInfs(final List fileList) throws Exception {
		FileVO vo;
		Iterator iter = fileList.iterator();
		int i = 0;
		while (iter.hasNext()) {
			vo = (FileVO) iter.next();

			if (i == 0) {
				template.update(PACKAGE_NAME + "FileManageDAO.updateCOMTNFILE", vo);
				template.delete(PACKAGE_NAME + "FileManageDAO.deleteFileDetailAll", vo);
			}

			template.insert(PACKAGE_NAME + "FileManageDAO.insertFileDetail", vo);

			i++;
		}
	}

	/**
	 * <pre>
	 * Description : 여러 개의 파일을 삭제한다.
	 * </pre>
	 *
	 * @param fileList 파일리스트
	 * @throws Exception Exception
	 */
	@SuppressWarnings("rawtypes")
	public final void deleteFileInfs(final List fileList) throws Exception {
		Iterator iter = fileList.iterator();
		FileVO vo;
		while (iter.hasNext()) {
			vo = (FileVO) iter.next();

			template.delete(PACKAGE_NAME + "FileManageDAO.deleteFileDetail", vo);
		}
	}

	/**
	 * <pre>
	 * Description : 하나의 파일을 삭제한다.
	 * </pre>
	 *
	 * @param fvo 파일정보
	 * @throws Exception Exception
	 */
	public final void deleteFileInfDetail(final FileVO fvo) throws Exception {
		template.delete(PACKAGE_NAME + "FileManageDAO.deleteFileDetail", fvo);
	}

	/**
	 * <pre>
	 * Description : 하나의 파일을 삭제한다.
	 * </pre>
	 *
	 * @param fvo 파일정보
	 * @throws Exception Exception
	 */
	public final void deleteFileInf(final FileVO fvo) throws Exception {
		template.delete(PACKAGE_NAME + "FileManageDAO.deleteFile", fvo);
	}

	/**
	 * <pre>
	 * Description : 파일에 대한 목록을 조회한다.
	 * </pre>
	 *
	 * @param vo 파일정보
	 * @return 파일리스트
	 * @throws Exception Exception
	 */
	public final List<?> selectFileInfs(final FileVO vo) throws Exception {
		return template.selectList(PACKAGE_NAME + "FileManageDAO.selectFileList", vo);
	}
	
	public final List<?> selectFileInfsNew(final FileVO vo) throws Exception {
		return template.selectList(PACKAGE_NAME + "FileManageDAO.selectFileListNew", vo);
	}

	/**
	 * <pre>
	 * Description : 파일에 대한 목록을 조회한다.
	 * </pre>
	 *
	 * @param vo 파일정보
	 * @return 파일리스트
	 * @throws Exception Exception
	 */
	public final List<?> selectFileInfsWithSubject(final FileVO vo) throws Exception {
		return template.selectList(PACKAGE_NAME + "FileManageDAO.selectFileListWithSubject", vo);
	}

	/**
	 * <pre>
	 * Description : 파일 구분자에 대한 최대값을 구한다.
	 * </pre>
	 *
	 * @param fvo 파일정보
	 * @return 파일 SN 최대값 int
	 * @throws Exception Exception
	 */
	public final int getMaxFileSN(final FileVO fvo) throws Exception {
		return (Integer) template.selectOne(PACKAGE_NAME + "FileManageDAO.getMaxFileSN", fvo);
	}

	/**
	 * <pre>
	 * Description : 파일 구분자에 대한 최대값을 구한다.
	 * </pre>
	 *
	 * @param fvo 파일정보
	 * @return 파일 SN 최대값 String
	 * @throws Exception Exception
	 */
	public final String getFileMaxSn(final FileVO fvo) throws Exception {
		return (String) template.selectOne(PACKAGE_NAME + "FileManageDAO.getFileMaxSn", fvo);
	}

	/**
	 * <pre>
	 * Description : 파일에 대한 상세정보를 조회한다.
	 * </pre>
	 *
	 * @param fvo 파일정보
	 * @return 파일상세정보
	 * @throws Exception Exception
	 */
	public final FileVO selectFileInf(final FileVO fvo) throws Exception {
		return (FileVO) template.selectOne(PACKAGE_NAME + "FileManageDAO.selectFileInf", fvo);
	}
	
	public final FileVO selectFileDetailInf(final FileVO fvo) throws Exception {
		return (FileVO) template.selectOne(PACKAGE_NAME + "FileManageDAO.selectFileDetailInf", fvo);
	}

	/**
	 * <pre>
	 * Description : 전체 파일을 삭제한다.
	 * </pre>
	 *
	 * @param fvo 파일정보
	 * @throws Exception Exception
	 */
	public final void deleteAllFileInf(final FileVO fvo) throws Exception {
		template.update(PACKAGE_NAME + "FileManageDAO.deleteCOMTNFILE", fvo);
	}

	/**
	 * <pre>
	 * Description : 수정되는 파일 사용여부 Y로 업데이트.
	 * </pre>
	 *
	 * @param fvo 파일정보
	 * @throws Exception Exception
	 */
	public final void updateAllFileInf(final FileVO fvo) throws Exception {
		template.update(PACKAGE_NAME + "FileManageDAO.updateCOMTNFILE", fvo);
	}

	/**
	 * <pre>
	 * Description : 파일명 검색에 대한 목록을 조회한다.
	 * </pre>
	 *
	 * @param fvo 파일정보
	 * @return 파일리스트
	 * @throws Exception Exception
	 */
	public final List<?> selectFileListByFileNm(final FileVO fvo) throws Exception {
		return template.selectList(PACKAGE_NAME + "FileManageDAO.selectFileListByFileNm", fvo);
	}

	/**
	 * <pre>
	 * Description :  파일명 검색에 대한 목록 전체 건수를 조회한다.
	 * </pre>
	 *
	 * @param fvo 파일정보
	 * @return 파일건수
	 * @throws Exception Exception
	 */
	public final int selectFileListCntByFileNm(final FileVO fvo) throws Exception {
		return (Integer) template.selectOne(PACKAGE_NAME + "FileManageDAO.selectFileListCntByFileNm", fvo);
	}

	/**
	 * <pre>
	 * Description : 이미지 파일에 대한 목록을 조회한다.
	 * </pre>
	 *
	 * @param vo 이미지 파일정보
	 * @return 이미지 파일 리스트
	 * @throws Exception Exception
	 */
	public final List<?> selectImageFileList(final FileVO vo) throws Exception {
		return template.selectList(PACKAGE_NAME + "FileManageDAO.selectImageFileList", vo);
	}

	/**
	 * <pre>
	 * Description : 이미지 파일에 대한 목록을 조회한다.
	 * </pre>
	 *
	 * @param vo 이미지 파일정보
	 * @return 이미지 파일 리스트
	 * @throws Exception Exception
	 */
	public final List<?> selectImageFileListWithSubject(final FileVO vo) throws Exception {
		return template.selectList(PACKAGE_NAME + "FileManageDAO.selectImageFileListWithSubject", vo);
	}

	/**
	 * <pre>
	 * Description : 이미지 파일에 대한 목록 전체 건수를 조회한다.
	 * </pre>
	 *
	 * @param vo 이미지 파일정보
	 * @return 이미지 파일 갯수
	 * @throws Exception Exception
	 */
	public final int selectFileCnt(final FileVO vo) throws Exception {
		return (Integer) template.selectOne(PACKAGE_NAME + "FileManageDAO.selectFileCnt", vo);
	}
	
	  /**
     * 하나의 파일에 대한 정보(속성 및 상세)를 등록한다.
     * 
     * @param vo
     * @throws Exception
     */
    public void insertFileMaster(FileVO vo) throws Exception {
    	template.insert(PACKAGE_NAME + "FileManageDAO.insertFileMaster", vo);
    }
    
    /**
     * 하나의 임시파일을 삭제한다.
     * 
     * @param fvo
     * @throws Exception
     */
    public void deleteFileInfDetailImsi(FileVO fvo) throws Exception {
    	template.delete(PACKAGE_NAME + "FileManageDAO.deleteFileDetailImsi", fvo);
    }
    
    /**
     * 임시파일 Y로 업데이트
     * 
     * @param fvo
     * @throws Exception
     */
    public void updateFileImsi(FileVO fvo) throws Exception {
    	template.update(PACKAGE_NAME + "FileManageDAO.updateFileImsi", fvo);
    }
    
    /**
     * 임시파일 Y로 업데이트
     * 
     * @param fvo
     * @throws Exception
     */
    public void updateFileImsiDelYn(FileVO fvo) throws Exception {
    	template.update(PACKAGE_NAME + "FileManageDAO.updateFileImsiDelYn", fvo);
    }
    
    /**
     * 하나의 파일을 삭제한다.
     * 
     * @param fvo
     * @throws Exception
     */
    public void deleteFileDetailDel(FileVO fvo) throws Exception {
    	template.delete(PACKAGE_NAME + "FileManageDAO.deleteFileDetailDel", fvo);
    }
    
    public void deleteFileDel(FileVO fvo) throws Exception {
    	template.delete(PACKAGE_NAME + "FileManageDAO.deleteFile", fvo);
    	template.delete(PACKAGE_NAME + "FileManageDAO.deleteFileDetailAll", fvo);
    }
}
