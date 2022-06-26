/*************************************************************
프로그램명 : FileMngService.java
설명 : 파일정보의 관리를 위한 서비스 인터페이스
작성자 : 박현우
소속 : (주)애드캡슐소프트
일자 : 2015.11.30.
프로그램설명
파일정보의 관리를 위한 서비스 인터페이스
 **프로그램이력**
수정일             작업근거                 유지보수담당
2015.11.30.     (00000)신규생성		  박현우
 *************************************************************/
package com.open.cmmn.service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.open.cmmn.model.FileVO;

public interface FileMngService {

	/**
	 * 파일에 대한 목록을 조회한다.
	 *
	 * @param fvo
	 * @return
	 * @throws Exception
	 */
	public List<FileVO> selectFileInfs(FileVO fvo) throws Exception;
	
	public List<FileVO> selectFileInfsNew(FileVO fvo) throws Exception;

	/**
	 * 파일에 대한 목록을 조회한다.
	 *
	 * @param fvo
	 * @return
	 * @throws Exception
	 */
	public List<FileVO> selectFileInfsWithSubject(FileVO fvo) throws Exception;

	/**
	 * 하나의 파일에 대한 정보(속성 및 상세)를 등록한다.
	 *
	 * @param fvo
	 * @throws Exception
	 */
	public String insertFileInf(FileVO fvo) throws Exception;

	/**
	 * 여러 개의 파일에 대한 정보(속성 및 상세)를 등록한다.
	 *
	 * @param fvoList
	 * @throws Exception
	 */
	@SuppressWarnings({ "rawtypes" })
	public String insertFileInfs(List fvoList) throws Exception;

	/**
	 * 하나의 파일에 대한 정보(속성 및 상세)를 등록한다.
	 *
	 * @param fvo
	 * @throws Exception
	 */
	public String insertFileInfWithSubject(FileVO fvo) throws Exception;

	/**
	 * 여러 개의 파일에 대한 정보(속성 및 상세)를 등록한다.
	 *
	 * @param fvoList
	 * @throws Exception
	 */
	@SuppressWarnings({ "rawtypes" })
	public String insertFileInfsWithSubject(List fvoList) throws Exception;

	/**
	 * 여러 개의 파일에 대한 정보(속성 및 상세)를 수정한다.
	 *
	 * @param fvoList
	 * @throws Exception
	 */
	@SuppressWarnings({ "rawtypes" })
	public void updateFileInfs(List fvoList) throws Exception;

	/**
	 * 여러 개의 파일에 대한 정보(속성 및 상세)를 수정한다.
	 *
	 * @param fvoList
	 * @throws Exception
	 */
	@SuppressWarnings({ "rawtypes" })
	public void updateFileInfsWithSubject(List fvoList) throws Exception;

	/**
	 * 여러 개의 파일에 대한 정보(속성 및 상세)를 수정한다.
	 *
	 * @param fvoList
	 * @throws Exception
	 */
	@SuppressWarnings({ "rawtypes" })
	public void mergeUpdateFileInfs(List fvoList) throws Exception;

	/**
	 * 여러 개의 파일을 삭제한다.
	 *
	 * @param fvoList
	 * @throws Exception
	 */
	@SuppressWarnings({ "rawtypes" })
	public void deleteFileInfs(List fvoList) throws Exception;

	/**
	 * 하나의 파일을 삭제한다.
	 *
	 * @param fvo
	 * @throws Exception
	 */
	public void deleteFileInfDetail(FileVO fvo) throws Exception;

	/**
	 * 하나의 파일을 삭제한다.
	 *
	 * @param fvo
	 * @throws Exception
	 */
	public void deleteFileInf(FileVO fvo) throws Exception;

	/**
	 * 파일에 대한 상세정보를 조회한다.
	 *
	 * @param fvo
	 * @return
	 * @throws Exception
	 */
	public FileVO selectFileInf(FileVO fvo) throws Exception;
	
	public FileVO selectFileDetailInf(FileVO fvo) throws Exception;

	/**
	 * 파일 구분자에 대한 최대값을 구한다.
	 *
	 * @param fvo
	 * @return
	 * @throws Exception
	 */
	public int getMaxFileSN(FileVO fvo) throws Exception;

	/**
	 * 파일 구분자에 대한 최대값을 구한다.
	 *
	 * @param fvo
	 * @return
	 * @throws Exception
	 */
	public String getFileMaxSn(FileVO fvo) throws Exception;

	/**
	 * 전체 파일을 삭제한다.
	 *
	 * @param fvo
	 * @throws Exception
	 */
	public void deleteAllFileInf(FileVO fvo) throws Exception;

	/**
	 * 수정되는 파일 사용여부 Y로 업데이트
	 *
	 * @param fvo
	 * @throws Exception
	 */
	public void updateAllFileInf(FileVO fvo) throws Exception;

	/**
	 * 파일명 검색에 대한 목록을 조회한다.
	 *
	 * @param fvo
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> selectFileListByFileNm(FileVO fvo) throws Exception;

	/**
	 * 이미지 파일에 대한 목록을 조회한다.
	 *
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public List<FileVO> selectImageFileList(FileVO vo) throws Exception;

	/**
	 * 이미지 파일에 대한 목록을 조회한다.
	 *
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public List<FileVO> selectImageFileListWithSubject(FileVO vo) throws Exception;

	/**
	 * 파일에 대한 갯수를 조회한다.
	 *
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public int selectFileCnt(FileVO vo) throws Exception;

	/**
	 * 공통으로 파일을 처리한다.
	 *
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public HashMap<String, String> fileManage(String atchFileId, Map<String, MultipartFile> files, String keyStr, String storePath) throws Exception;

	/**
	 * 첨부파일에 대한 목록 정보를 취득한다.
	 *
	 * @param files
	 * @return
	 * @throws Exception
	 */
	public List<FileVO> parseFileInf(Map<String, MultipartFile> files, String KeyStr, int fileKeyParam, String atchFileId, String saveKey,
			String fileCn) throws Exception;

	/**
	 * 첨부파일에 대한 목록 정보를 취득한다.
	 *
	 * @param files
	 * @return
	 * @throws Exception
	 */
	public List<FileVO> parseFileInfWithSubject(Map<String, MultipartFile> files, String KeyStr, int fileKeyParam, String atchFileId, String saveKey,
			String fileCn, String fileSubject) throws Exception;

	/**
	 * 첨부파일에 대한 목록 정보를 취득한다.
	 *
	 * @param files
	 * @return
	 * @throws Exception
	 */
	public List<FileVO> userParseFileInf(Map<String, MultipartFile> files, String KeyStr, int fileKeyParam, String atchFileId, String saveKey,
			String fileCn) throws Exception;

	/**
	 * 첨부파일에 대한 목록 정보를 취득한다.
	 *
	 * @param files
	 * @return
	 * @throws Exception
	 */
	public List<FileVO> multiParseFileInf(Map<String, MultipartFile> files, String KeyStr, int fileKeyParam, String atchFileId, String saveKey,
			String fileCn, String fileForm) throws Exception;

	public void resize(File newFile, File newFile2, String fileExtsn, int width, int height) throws IOException;
	
	  /**
     * 마스터 파일 id생성
     * 
     * @param fvo
     * @throws Exception
     */
     public void insertFileMaster(FileVO fvo) throws Exception; 
     
     /**
      * 임시 파일을 삭제한다.
      * 
      * @param fvo
      * @throws Exception
      */
     public void deleteFileInfDetailImsi(FileVO fvo) throws Exception;
     
     /**
      * 임시파일 Y변경
      * 
      * @param fvo
      * @throws Exception
      */
     public void updateFileImsi(FileVO fvo) throws Exception;  
     
     /**
      * 임시파일 Y변경
      * 
      * @param fvo
      * @throws Exception
      */
     public void updateFileImsiDelYn(FileVO fvo) throws Exception;  
     
     public void deleteFileDel(FileVO fvo) throws Exception;  
}
