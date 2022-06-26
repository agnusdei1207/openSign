/*************************************************************
프로그램명 : FileMngServiceImpl.java
설명 : 파일정보의 관리를 위한 구현 클래스
작성자 : 박현우
소속 : (주)애드캡슐소프트
일자 : 2015.11.30.
프로그램설명
파일정보의 관리를 위한 구현 클래스
 **프로그램이력**
수정일             작업근거                 유지보수담당
2015.11.30.     (00000)신규생성		  박현우
 *************************************************************/
package com.open.cmmn.service.impl;

import java.awt.Image;
import java.awt.image.BufferedImage;
import java.awt.image.PixelGrabber;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Properties;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.ImageIcon;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import com.open.cmmn.dao.FileManageDAO;
import com.open.cmmn.model.FileVO;
import com.open.cmmn.service.FileMngService;
import com.open.cmmn.util.FileReadUtil;
import com.open.cmmn.util.StringUtil;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

@Service("FileMngService")
public class FileMngServiceImpl extends EgovAbstractServiceImpl implements FileMngService {

	@Resource(name = "FileManageDAO")
	private FileManageDAO fileMngDAO;

	public static final int BUFF_SIZE = 2048;

	/** fileUploadProperties . */
	@Resource(name = "fileUploadProperties")
	Properties fileUploadProperties;

	@Resource(name = "fileIdGnrService")
	private EgovIdGnrService idgenService;

	public static final Logger logger = LoggerFactory.getLogger(FileMngServiceImpl.class.getName());

	/**
	 * 여러 개의 파일을 삭제한다.
	 *
	 * @see egovframework.FileMngService.cmm.service.FileMngService#deleteFileInfs(java.util.List)
	 */
	@Override
	@SuppressWarnings({ "rawtypes" })
	public void deleteFileInfs(final List fvoList) throws Exception {
		fileMngDAO.deleteFileInfs(fvoList);
	}

	/**
	 * 하나의 파일에 대한 정보(속성 및 상세)를 등록한다.
	 *
	 * @see egovframework.FileMngService.cmm.service.FileMngService#insertFileInf(com.kosep.cm.model.FileVO)
	 */
	@Override
	public String insertFileInf(final FileVO fvo) throws Exception {
		String atchFileId = fvo.getAtchFileId();

		fileMngDAO.insertFileInf(fvo);

		return atchFileId;
	}

	/**
	 * 여러 개의 파일에 대한 정보(속성 및 상세)를 등록한다.
	 *
	 * @see egovframework.FileMngService.cmm.service.FileMngService#insertFileInfs(java.util.List)
	 */
	@Override
	@SuppressWarnings({ "rawtypes" })
	public String insertFileInfs(final List fvoList) throws Exception {
		String atchFileId = "";
		if (fvoList.size() != 0) {
			atchFileId = fileMngDAO.insertFileInfs(fvoList);
		}
		if (atchFileId == "") {
			atchFileId = null;
		}
		return atchFileId;
	}

	/**
	 * 하나의 파일에 대한 정보(속성 및 상세)를 등록한다.
	 *
	 * @see egovframework.FileMngService.cmm.service.FileMngService#insertFileInf(com.kosep.cm.model.FileVO)
	 */
	@Override
	public String insertFileInfWithSubject(final FileVO fvo) throws Exception {
		String atchFileId = fvo.getAtchFileId();

		fileMngDAO.insertFileInfWithSubject(fvo);

		return atchFileId;
	}

	/**
	 * 여러 개의 파일에 대한 정보(속성 및 상세)를 등록한다.
	 *
	 * @see egovframework.FileMngService.cmm.service.FileMngService#insertFileInfs(java.util.List)
	 */
	@Override
	@SuppressWarnings({ "rawtypes" })
	public String insertFileInfsWithSubject(final List fvoList) throws Exception {
		String atchFileId = "";
		if (fvoList.size() != 0) {
			atchFileId = fileMngDAO.insertFileInfsWithSubject(fvoList);
		}
		if (atchFileId == "") {
			atchFileId = null;
		}
		return atchFileId;
	}

	/**
	 * 파일에 대한 목록을 조회한다.
	 *
	 * @see egovframework.FileMngService.cmm.service.FileMngService#selectFileInfs(com.kosep.cm.model.FileVO)
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<FileVO> selectFileInfs(final FileVO fvo) throws Exception {
		return (List<FileVO>) fileMngDAO.selectFileInfs(fvo);
	}
	
	@Override
	@SuppressWarnings("unchecked")
	public List<FileVO> selectFileInfsNew(final FileVO fvo) throws Exception {
		return (List<FileVO>) fileMngDAO.selectFileInfsNew(fvo);
	}

	/**
	 * 파일에 대한 목록을 조회한다.
	 *
	 * @see egovframework.FileMngService.cmm.service.FileMngService#selectFileInfs(com.kosep.cm.model.FileVO)
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<FileVO> selectFileInfsWithSubject(final FileVO fvo) throws Exception {
		return (List<FileVO>) fileMngDAO.selectFileInfsWithSubject(fvo);
	}

	/**
	 * 여러 개의 파일에 대한 정보(속성 및 상세)를 수정한다.
	 *
	 * @see egovframework.FileMngService.cmm.service.FileMngService#updateFileInfs(java.util.List)
	 */
	@Override
	@SuppressWarnings({ "rawtypes" })
	public void updateFileInfs(final List fvoList) throws Exception {
		//Delete & Insert
		fileMngDAO.updateFileInfs(fvoList);
	}

	/**
	 * 여러 개의 파일에 대한 정보(속성 및 상세)를 수정한다.
	 *
	 * @see egovframework.FileMngService.cmm.service.FileMngService#updateFileInfs(java.util.List)
	 */
	@Override
	@SuppressWarnings({ "rawtypes" })
	public void updateFileInfsWithSubject(final List fvoList) throws Exception {
		//Delete & Insert
		fileMngDAO.updateFileInfsWithSubject(fvoList);
	}

	/**
	 * 여러 개의 파일에 대한 정보(속성 및 상세)를 수정한다.
	 *
	 * @see egovframework.FileMngService.cmm.service.FileMngService#updateFileInfs(java.util.List)
	 */
	@Override
	@SuppressWarnings({ "rawtypes" })
	public void mergeUpdateFileInfs(final List fvoList) throws Exception {
		//Delete & Insert
		for (int i = 0; i < fvoList.size(); i++) {
			FileVO fvo = (FileVO) fvoList.get(i);
			fvo = fileMngDAO.selectFileInf(fvo);
			File uFile = new File(fvo.getFileStreCours(), fvo.getStreFileNm());
			uFile.delete();
			uFile.deleteOnExit();
		}

		fileMngDAO.mergeUpdateFileInfs(fvoList);
	}

	/**
	 * 하나의 파일을 삭제한다.
	 *
	 * @see egovframework.FileMngService.cmm.service.FileMngService#deleteFileInf(com.kosep.cm.model.FileVO)
	 */
	@Override
	public void deleteFileInfDetail(FileVO fvo) throws Exception {

		fvo = fileMngDAO.selectFileInf(fvo);

		File uFile = new File(fvo.getFileStreCours(), fvo.getStreFileNm());
		uFile.delete();
		uFile.deleteOnExit();

		fileMngDAO.deleteFileInfDetail(fvo);
	}

	/**
	 * 하나의 파일을 삭제한다.
	 *
	 * @see egovframework.FileMngService.cmm.service.FileMngService#deleteFileInf(com.kosep.cm.model.FileVO)
	 */
	@Override
	public void deleteFileInf(final FileVO fvo) throws Exception {
		fileMngDAO.deleteFileInf(fvo);
	}

	/**
	 * 파일에 대한 상세정보를 조회한다.
	 *
	 * @see egovframework.FileMngService.cmm.service.FileMngService#selectFileInf(com.kosep.cm.model.FileVO)
	 */
	@Override
	public FileVO selectFileInf(final FileVO fvo) throws Exception {
		return fileMngDAO.selectFileInf(fvo);
	}
	
	@Override
	public FileVO selectFileDetailInf(final FileVO fvo) throws Exception {
		return fileMngDAO.selectFileDetailInf(fvo);
	}

	/**
	 * 파일 구분자에 대한 최대값을 구한다.
	 *
	 * @see egovframework.FileMngService.cmm.service.FileMngService#getMaxFileSN(com.kosep.cm.model.FileVO)
	 */
	@Override
	public int getMaxFileSN(final FileVO fvo) throws Exception {
		return fileMngDAO.getMaxFileSN(fvo);
	}

	/**
	 * 파일 구분자에 대한 최대값을 구한다.
	 *
	 * @see egovframework.FileMngService.cmm.service.FileMngService#getMaxFileSN(com.kosep.cm.model.FileVO)
	 */
	@Override
	public String getFileMaxSn(final FileVO fvo) throws Exception {
		return fileMngDAO.getFileMaxSn(fvo);
	}

	/**
	 * 전체 파일을 삭제한다.
	 *
	 * @see egovframework.FileMngService.cmm.service.FileMngService#deleteAllFileInf(com.kosep.cm.model.FileVO)
	 */
	@Override
	public void deleteAllFileInf(final FileVO fvo) throws Exception {

		fileMngDAO.deleteAllFileInf(fvo);
	}

	/**
	 * 수정되는 파일 사용여부 Y로 업데이트
	 *
	 * @see egovframework.FileMngService.cmm.service.FileMngService#deleteAllFileInf(com.kosep.cm.model.FileVO)
	 */
	@Override
	public void updateAllFileInf(final FileVO fvo) throws Exception {
		fileMngDAO.updateAllFileInf(fvo);
	}

	/**
	 * 파일명 검색에 대한 목록을 조회한다.
	 *
	 * @see egovframework.FileMngService.cmm.service.FileMngService#selectFileListByFileNm(com.kosep.cm.model.FileVO)
	 */
	@Override
	public Map<String, Object> selectFileListByFileNm(final FileVO fvo) throws Exception {
		@SuppressWarnings("unchecked")
		List<FileVO> result = (List<FileVO>) fileMngDAO.selectFileListByFileNm(fvo);
		int cnt = fileMngDAO.selectFileListCntByFileNm(fvo);

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("resultList", result);
		map.put("resultCnt", Integer.toString(cnt));

		return map;
	}

	/**
	 * 이미지 파일에 대한 목록을 조회한다.
	 *
	 * @see egovframework.FileMngService.cmm.service.FileMngService#selectImageFileList(com.kosep.cm.model.FileVO)
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<FileVO> selectImageFileList(final FileVO vo) throws Exception {
		return (List<FileVO>) fileMngDAO.selectImageFileList(vo);
	}

	/**
	 * 이미지 파일에 대한 목록을 조회한다.
	 *
	 * @see egovframework.FileMngService.cmm.service.FileMngService#selectImageFileList(com.kosep.cm.model.FileVO)
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<FileVO> selectImageFileListWithSubject(final FileVO vo) throws Exception {
		return (List<FileVO>) fileMngDAO.selectImageFileListWithSubject(vo);
	}

	/**
	 * 이미지 파일에 대한 목록을 조회한다.
	 *
	 * @see egovframework.FileMngService.cmm.service.FileMngService#selectImageFileList(com.kosep.cm.model.FileVO)
	 */
	@Override
	public int selectFileCnt(final FileVO vo) throws Exception {
		return fileMngDAO.selectFileCnt(vo);
	}

	@Override
	public HashMap<String, String> fileManage(String atchFileId, final Map<String, MultipartFile> files, String keyStr, final String storePath)
			throws Exception {
		HashMap<String, String> hashMap = new HashMap<String, String>();
		String fileExceptionMsg = "";
		atchFileId = StringUtil.nullString(atchFileId);
		keyStr = StringUtil.nullString(keyStr);
		if (!files.isEmpty()) {
			if (atchFileId == null || atchFileId.equals("")) {
				List<FileVO> result = parseFileInf(files, keyStr, 0, atchFileId, storePath, null);
				for (int i = 0; i < result.size(); i++) {
					String fileResult = StringUtil.nullString(result.get(i).getFileResult());
					if (!"".equals(fileResult)) {
						fileExceptionMsg += result.get(i).getFileResult() + "\\n";
					}
				}
				if (fileExceptionMsg.equals("")) {
					atchFileId = StringUtil.nullString(insertFileInfs(result));
				}
				hashMap.put("atchFileId", atchFileId);
				hashMap.put("fileExceptionMsg", fileExceptionMsg);
			} else {
				FileVO fvo = new FileVO();
				fvo.setAtchFileId(atchFileId);

				//수정되는파일 사용여부 Y로 업데이트
				updateAllFileInf(fvo);

				int cnt = getMaxFileSN(fvo);
				List<FileVO> result = parseFileInf(files, keyStr, cnt, atchFileId, storePath, null);
				for (int i = 0; i < result.size(); i++) {
					String fileResult = StringUtil.nullString(result.get(i).getFileResult());
					if (!"".equals(fileResult)) {
						fileExceptionMsg += result.get(i).getFileResult() + "\\n";
					}
				}
				if (fileExceptionMsg.equals("")) {
					updateFileInfs(result);
					int fileCnt = selectFileCnt(fvo);
					if (fileCnt == 0) {
						atchFileId = "";
					}
				}
				hashMap.put("atchFileId", atchFileId);
				hashMap.put("fileExceptionMsg", fileExceptionMsg);
			}
		}
		return hashMap;
	}

	/**
	 * 첨부파일에 대한 목록 정보를 취득한다.
	 *
	 * @param files
	 * @return
	 * @throws Exception
	 */
	@Override
	public List<FileVO> parseFileInf(final Map<String, MultipartFile> files, final String KeyStr, final int fileKeyParam, final String atchFileId, final String saveKey, final String fileCn) throws Exception {
		int fileKey = fileKeyParam;

		String storePathString = "";
		String atchFileIdString = "";
		String fileUploadPath = "";
		String fileExlPath = "";
		
		fileUploadPath = fileUploadProperties.getProperty("file.upload.path").replaceAll("\\.\\.", "");
		fileExlPath = fileUploadProperties.getProperty("file.exl.path").replaceAll("\\.\\.", "") + getFolderPath();
		
		if ("".equals(saveKey) || saveKey == null) {
			storePathString = fileUploadPath + getFolderPath();
		} else if ("xls".equals(saveKey)) {
			storePathString = fileExlPath + getFolderPath();
		} else {
				storePathString = fileUploadProperties.getProperty(saveKey).replaceAll("\\.\\.", "");
		}

		if ("".equals(atchFileId) || atchFileId == null) {
			atchFileIdString = idgenService.getNextStringId();
		} else {
			atchFileIdString = atchFileId;
		}

		if (storePathString != null && !"".equals(storePathString)) {
			File saveFolder = new File(storePathString);
			if (!saveFolder.exists() || saveFolder.isFile()) {
				saveFolder.mkdirs();
			}
		}
		Iterator<Entry<String, MultipartFile>> itrCheck = files.entrySet().iterator();
		Iterator<Entry<String, MultipartFile>> itr = files.entrySet().iterator();
		MultipartFile file;
		String filePath = "";
		List<FileVO> result = new ArrayList<FileVO>();
		FileVO fvo;
		int exceptionCnt = 0;
		while (itrCheck.hasNext()) { // 파일검사
			Entry<String, MultipartFile> entry = itrCheck.next();
			file = entry.getValue();
			String orginFileName = file.getOriginalFilename();

			// 원 파일명이 없는 경우 처리 (첨부가 되지 않은 input file type)
			if ("".equals(orginFileName)) {
				continue;
			}
			if (!checkFileExt(file, KeyStr)) {
				fvo = new FileVO();
				fvo.setFileResult("[" + orginFileName + "] 파일은 등록 할수 없는 파일 확장자입니다.");
				result.add(fvo);
				exceptionCnt++;
				continue;
			}
			if (!checkFileSize(file)) { // 파일검사
				fvo = new FileVO();
				fvo.setFileResult("[" + orginFileName + "] 파일은 허용용량을 초과 하였습니다.");
				result.add(fvo);
				exceptionCnt++;
				continue;
			}
			//			logger.debug("==================================================================================>"+exceptionCnt);
			if (exceptionCnt > 0) {
				return result;
			}
		}
		while (itr.hasNext()) {
			Entry<String, MultipartFile> entry = itr.next();
			file = entry.getValue();
			String orginFileName = file.getOriginalFilename();

			// 원 파일명이 없는 경우 처리 (첨부가 되지 않은 input file type)
			if ("".equals(orginFileName)) {
				continue;
			}

			int index = orginFileName.lastIndexOf(".");
			String fileExt = orginFileName.substring(index + 1).toLowerCase();
			String newName = KeyStr + StringUtil.getTimeStamp() + atchFileIdString + fileKey;
			String fileContent = "";
			long _size = file.getSize();
			fvo = new FileVO();
			fvo.setFileExtsn(fileExt);
			fvo.setFileStreCours(storePathString);
			fvo.setFileSize(Long.toString(_size));
			fvo.setOrignFileNm(orginFileName);
			fvo.setStreFileNm(newName);
			fvo.setAtchFileId(atchFileIdString);
			fvo.setFileSn(String.valueOf(fileKey));
			fvo.setFileType(file.getContentType());
			
			if(KeyStr.equals("BLOB")){
				fvo.setAtchFile(file.getBytes());
			}
			if (!"".equals(orginFileName)) {
				filePath = storePathString + File.separator + newName;

				if (filePath != null && !"".equals(filePath)) {
					file.transferTo(new File(filePath));
				}
				
				if (fileExt.equals("png") || fileExt.equals("bmp") || fileExt.equals("gif") || fileExt.equals("jpg")) {
					Image img = new ImageIcon(filePath).getImage();
					fvo.setImageWidth(img.getWidth(null));
					fvo.setImageHeight(img.getHeight(null));
				}
				if(fileExt.equals("xlsx") || fileExt.equals("docx") || fileExt.equals("pptx")){
					fileContent = FileReadUtil.docxFileContentParser(filePath,fileExt);
				}else if(fileExt.equals("xls") || fileExt.equals("doc") || fileExt.equals("ppt")){
					fileContent = FileReadUtil.docFileContentParser(filePath,fileExt);
				}else if(fileExt.equals("pdf")){
					fileContent = FileReadUtil.pdfFileParser(filePath,fileExt);
				}else if(fileExt.equals("hwp")){
					fileContent = FileReadUtil.hwpFileParser(filePath,fileExt);
				}
				fvo.setFileCn(fileContent);
			}
			
			result.add(fvo);
			fileKey++;
		}

		return result;
	}

	/**
	 * 첨부파일에 대한 목록 정보를 취득한다.
	 *
	 * @param files
	 * @return
	 * @throws Exception
	 */
	@Override
	public List<FileVO> parseFileInfWithSubject(final Map<String, MultipartFile> files, final String KeyStr, final int fileKeyParam,
			final String atchFileId, final String saveKey, final String fileCn, final String fileSubject) throws Exception {
		int fileKey = fileKeyParam;

		String storePathString = "";
		String atchFileIdString = "";
		String fileExlPath  = "";
		String fileUploadPath = "";
		
		fileUploadPath = fileUploadProperties.getProperty("file.upload.path").replaceAll("\\.\\.", "");
		fileExlPath = fileUploadProperties.getProperty("file.exl.path").replaceAll("\\.\\.", "") + getFolderPath();

		if ("".equals(saveKey) || saveKey == null) {
			storePathString = fileUploadPath + getFolderPath();
		} else if ("xls".equals(saveKey)) {
			storePathString = fileExlPath + getFolderPath();
		} else {
			if(fileUploadProperties.getProperty(saveKey) != null){
				storePathString = fileUploadProperties.getProperty(saveKey).replaceAll("\\.\\.", "");
			}
		}

		if ("".equals(atchFileId) || atchFileId == null) {
			atchFileIdString = idgenService.getNextStringId();
		} else {
			atchFileIdString = atchFileId;
		}

		if (storePathString != null && !"".equals(storePathString)) {
			File saveFolder = new File(storePathString);

			if (!saveFolder.exists() || saveFolder.isFile()) {
				saveFolder.mkdirs();
			}
		}

		Iterator<Entry<String, MultipartFile>> itrCheck = files.entrySet().iterator();
		Iterator<Entry<String, MultipartFile>> itr = files.entrySet().iterator();
		MultipartFile file;
		String filePath = "";
		List<FileVO> result = new ArrayList<FileVO>();
		FileVO fvo;
		int exceptionCnt = 0;
		while (itrCheck.hasNext()) { // 파일검사
			Entry<String, MultipartFile> entry = itrCheck.next();
			file = entry.getValue();
			String orginFileName = file.getOriginalFilename();

			// 원 파일명이 없는 경우 처리 (첨부가 되지 않은 input file type)
			if ("".equals(orginFileName)) {
				continue;
			}
			if (!checkFileExt(file, KeyStr)) {
				fvo = new FileVO();
				fvo.setFileResult("[" + orginFileName + "] 파일은 등록 할수 없는 파일 확장자입니다.");
				result.add(fvo);
				exceptionCnt++;
				continue;
			}
			if (!checkFileSize(file)) { // 파일검사
				fvo = new FileVO();
				fvo.setFileResult("[" + orginFileName + "] 파일은 허용용량을 초과 하였습니다.");
				result.add(fvo);
				exceptionCnt++;
				continue;
			}
			//			logger.debug("==================================================================================>"+exceptionCnt);
			if (exceptionCnt > 0) {
				return result;
			}
		}

		while (itr.hasNext()) {
			Entry<String, MultipartFile> entry = itr.next();
			file = entry.getValue();
			String orginFileName = file.getOriginalFilename();

			// 원 파일명이 없는 경우 처리 (첨부가 되지 않은 input file type)
			if ("".equals(orginFileName)) {
				continue;
			}
			int index = orginFileName.lastIndexOf(".");
			String fileExt = orginFileName.substring(index + 1).toLowerCase();
			String newName = KeyStr + StringUtil.getTimeStamp() + atchFileIdString + fileKey;
			long _size = file.getSize();
			fvo = new FileVO();
			fvo.setFileExtsn(fileExt);
			fvo.setFileStreCours(storePathString);
			fvo.setFileSize(Long.toString(_size));
			fvo.setOrignFileNm(orginFileName);
			fvo.setStreFileNm(newName);
			fvo.setAtchFileId(atchFileIdString);
			fvo.setFileSn(String.valueOf(fileKey));
			fvo.setFileType(file.getContentType());
			fvo.setFileSubject(fileSubject);

			if (!"".equals(orginFileName)) {
				filePath = storePathString + File.separator + newName;

				if (filePath != null && !"".equals(filePath)) {
					file.transferTo(new File(filePath));
				}

				if (fileExt.equals("png") || fileExt.equals("bmp") || fileExt.equals("gif") || fileExt.equals("jpg")) {
					Image img = new ImageIcon(filePath).getImage();
					fvo.setImageWidth(img.getWidth(null));
					fvo.setImageHeight(img.getHeight(null));
				}
				
				String fileContent="";
				if(fileExt.equals("xlsx") || fileExt.equals("docx") || fileExt.equals("pptx")){
					fileContent = FileReadUtil.docxFileContentParser(filePath,fileExt);
				}else if(fileExt.equals("xls") || fileExt.equals("doc") || fileExt.equals("ppt")){
					fileContent = FileReadUtil.docFileContentParser(filePath,fileExt);
				}else if(fileExt.equals("pdf")){
					fileContent = FileReadUtil.pdfFileParser(filePath,fileExt);
				}else if(fileExt.equals("hwp")){
					fileContent = FileReadUtil.hwpFileParser(filePath,fileExt);
				}
				
				fvo.setFileCn(fileContent);
			}
			result.add(fvo);
			fileKey++;
		}

		return result;
	}

	/**
	 * 첨부파일에 대한 목록 정보를 취득한다.
	 *
	 * @param files
	 * @return
	 * @throws Exception
	 */
	@Override
	public List<FileVO> userParseFileInf(final Map<String, MultipartFile> files, final String KeyStr, final int fileKeyParam,
			final String atchFileId, final String saveKey, final String fileCn) throws Exception {
		int fileKey = fileKeyParam;
		String storePathString = "";
		String atchFileIdString = "";

		if ("".equals(saveKey) || saveKey == null) {
			storePathString = (fileUploadProperties.getProperty("file.upload.path").replaceAll("\\.\\.", "")) + getFolderPath();
		} else if ("xls".equals(saveKey)) {
			storePathString = (fileUploadProperties.getProperty("file.exl.path").replaceAll("\\.\\.", "")) + getFolderPath();
		} else {
			storePathString = (fileUploadProperties.getProperty(saveKey).replaceAll("\\.\\.", ""));
		}

		if ("".equals(atchFileId) || atchFileId == null) {
			atchFileIdString = idgenService.getNextStringId();
		} else {
			atchFileIdString = atchFileId;
		}

		if (storePathString != null && !"".equals(storePathString)) {
			File saveFolder = new File(storePathString);
			if (!saveFolder.exists() || saveFolder.isFile()) {
				saveFolder.mkdirs();
			}
		}

		Iterator<Entry<String, MultipartFile>> itrCheck = files.entrySet().iterator();
		Iterator<Entry<String, MultipartFile>> itr = files.entrySet().iterator();
		MultipartFile file;
		String filePath = "";
		List<FileVO> result = new ArrayList<FileVO>();
		FileVO fvo;
		int exceptionCnt = 0;
		try {
			while (itrCheck.hasNext()) { // 파일검사
				Entry<String, MultipartFile> entry = itrCheck.next();
				file = entry.getValue();
				String orginFileName = file.getOriginalFilename();

				// 원 파일명이 없는 경우 처리 (첨부가 되지 않은 input file type)
				if ("".equals(orginFileName)) {
					continue;
				}
				if (!checkFileExt(file, KeyStr)) {
					fvo = new FileVO();
					fvo.setFileResult("[" + orginFileName + "] 파일은 등록 할수 없는 파일 확장자입니다.");
					result.add(fvo);
					exceptionCnt++;
					continue;
				}
				if (!checkFileSize(file)) { // 파일검사
					fvo = new FileVO();
					fvo.setFileResult("[" + orginFileName + "] 파일은 허용용량을 초과 하였습니다.");
					result.add(fvo);
					exceptionCnt++;
					continue;
				}
				//					logger.debug("==================================================================================>"+exceptionCnt);
				if (exceptionCnt > 0) {
					return result;
				}
			}

			while (itr.hasNext()) {
				Entry<String, MultipartFile> entry = itr.next();
				file = entry.getValue();
				String orginFileName = file.getOriginalFilename();

				// 원 파일명이 없는 경우 처리 (첨부가 되지 않은 input file type)
				if ("".equals(orginFileName)) {
					continue;
				}

				int index = orginFileName.lastIndexOf(".");
				String fileExt = orginFileName.substring(index + 1).toLowerCase();
				String newName = KeyStr + StringUtil.getTimeStamp() + atchFileIdString + fileKey;
				long _size = file.getSize();
				fvo = new FileVO();
				fvo.setFileExtsn(fileExt);
				fvo.setFileStreCours(storePathString);
				fvo.setFileSize(Long.toString(_size));
				fvo.setOrignFileNm(orginFileName);
				fvo.setStreFileNm(newName);
				fvo.setAtchFileId(atchFileIdString);
				fvo.setFileSn(String.valueOf(fileKey));
				fvo.setFileType(file.getContentType());

				if (!"".equals(orginFileName)) {
					filePath = storePathString + File.separator + newName;
					file.transferTo(new File(filePath));

					if (fileExt.equals("png") || fileExt.equals("gif") || fileExt.equals("jpg") || fileExt.equals("jpeg")) {
						try {
							Image img = new ImageIcon(filePath).getImage();
							/*
							 * int width = 1280;
							 * int height = 1280;
							 * if(_size > 5242880){
							 * File file1 = new File(fvo.getFileStreCours(), fvo.getStreFileNm());
							 * File file2 = new File(fvo.getFileStreCours(), fvo.getStreFileNm()+"_thumb");
							 * resize(file1, file2, fileExt, width, height);
							 * fvo.setStreFileNm(fvo.getStreFileNm()+"_thumb");
							 * filePath = fvo.getFileStreCours() + File.separator + fvo.getStreFileNm()+"_thumb";
							 * _size = file2.length();
							 * fvo.setFileSize(Long.toString(_size));
							 * img = new ImageIcon(filePath).getImage();
							 * fvo.setImageWidth(img.getWidth(null));
							 * fvo.setImageHeight(img.getHeight(null));
							 * file1.delete();
							 * }else{
							 * fvo.setImageWidth(img.getWidth(null));
							 * fvo.setImageHeight(img.getHeight(null));
							 * }
							 */
							fvo.setImageWidth(img.getWidth(null));
							fvo.setImageHeight(img.getHeight(null));

						} catch (RuntimeException e) {
							fvo = new FileVO();
							fvo.setFileResult("허용되지 않은 파일 업로드로 인해 처리 되지 않았습니다. 첨부 파일을 확인하여 주시기 바랍니다.");
							result.add(fvo);
							exceptionCnt++;
							//					    		logger.error("Image get size Error");
							continue;
						}
					} else {

						fvo.setImageWidth(0);
						fvo.setImageHeight(0);
					}
					
					String fileContent="";
					if(fileExt.equals("xlsx") || fileExt.equals("docx") || fileExt.equals("pptx")){
						fileContent = FileReadUtil.docxFileContentParser(filePath,fileExt);
					}else if(fileExt.equals("xls") || fileExt.equals("doc") || fileExt.equals("ppt")){
						fileContent = FileReadUtil.docFileContentParser(filePath,fileExt);
					}else if(fileExt.equals("pdf")){
						fileContent = FileReadUtil.pdfFileParser(filePath,fileExt);
					}else if(fileExt.equals("hwp")){
						fileContent = FileReadUtil.hwpFileParser(filePath,fileExt);
					}
					
					fvo.setFileCn(fileContent);
				}
				result.add(fvo);
				fileKey++;
			}
		} catch (RuntimeException e) {
			fvo = new FileVO();
			fvo.setFileResult("허용되지 않은 파일 업로드로 인해 처리 되지 않았습니다. 첨부 파일을 확인하여 주시기 바랍니다.");
			result.add(fvo);
			exceptionCnt++;
		}

		return result;
	}

	/**
	 * 첨부파일에 대한 목록 정보를 취득한다.
	 *
	 * @param files
	 * @return
	 * @throws Exception
	 */
	@Override
	public List<FileVO> multiParseFileInf(final Map<String, MultipartFile> files, final String KeyStr, final int fileKeyParam,
			final String atchFileId, final String saveKey, final String fileCn, final String fileFormNm) throws Exception {
		int fileKey = fileKeyParam;

		String storePathString = "";
		String atchFileIdString = "";

		if ("".equals(saveKey) || saveKey == null) {
			storePathString = (fileUploadProperties.getProperty("file.upload.path").replaceAll("\\.\\.", "")) + getFolderPath();
		} else if ("xls".equals(saveKey)) {
			storePathString = (fileUploadProperties.getProperty("file.exl.path").replaceAll("\\.\\.", "")) + getFolderPath();
		} else {
			storePathString = (fileUploadProperties.getProperty(saveKey).replaceAll("\\.\\.", ""));
		}

		if ("".equals(atchFileId) || atchFileId == null) {
			atchFileIdString = idgenService.getNextStringId();
		} else {
			atchFileIdString = atchFileId;
		}

		if (storePathString != null && !"".equals(storePathString)) {
			File saveFolder = new File(storePathString);
			if (!saveFolder.exists() || saveFolder.isFile()) {
				saveFolder.mkdirs();
			}
		}

		Iterator<Entry<String, MultipartFile>> itrCheck = files.entrySet().iterator();
		Iterator<Entry<String, MultipartFile>> itr = files.entrySet().iterator();
		MultipartFile file;
		String filePath = "";
		List<FileVO> result = new ArrayList<FileVO>();
		FileVO fvo;
		int exceptionCnt = 0;

		while (itrCheck.hasNext()) { // 파일검사
			Entry<String, MultipartFile> entry = itrCheck.next();
			//		    logger.debug("========================>["+fileFormNm+"]");
			//		    logger.debug("========================>["+entry.getKey()+"]");
			if (entry != null && fileFormNm.equals(entry.getKey())) {
				file = entry.getValue();
				String orginFileName = file.getOriginalFilename();

				// 원 파일명이 없는 경우 처리 (첨부가 되지 않은 input file type)
				if ("".equals(orginFileName)) {
					continue;
				}
				if (!checkFileExt(file, KeyStr)) {
					fvo = new FileVO();
					fvo.setFileResult("[" + orginFileName + "] 파일은 등록 할수 없는 파일 확장자입니다.");
					result.add(fvo);
					exceptionCnt++;
					continue;
				}
				if (!checkFileSize(file)) { // 파일검사
					fvo = new FileVO();
					fvo.setFileResult("[" + orginFileName + "] 파일은 허용용량을 초과 하였습니다.");
					result.add(fvo);
					exceptionCnt++;
					continue;
				}
				if (exceptionCnt > 0) {
					return result;
				}
			}
		}

		while (itr.hasNext()) {
			Entry<String, MultipartFile> entry = itr.next();
			if (entry != null && fileFormNm.equals(entry.getKey())) {
				file = entry.getValue();
				String orginFileName = file.getOriginalFilename();

				// 원 파일명이 없는 경우 처리 (첨부가 되지 않은 input file type)
				if ("".equals(orginFileName)) {
					continue;
				}

				int index = orginFileName.lastIndexOf(".");
				String fileExt = orginFileName.substring(index + 1).toLowerCase();
				String newName = KeyStr + StringUtil.getTimeStamp() + atchFileIdString + fileKey;
				long _size = file.getSize();
				fvo = new FileVO();

				if (!"".equals(orginFileName)) {
					filePath = storePathString + File.separator + newName;

					if (filePath != null && !"".equals(filePath)) {
						file.transferTo(new File(filePath));
					}

					if (fileExt.equals("png") || fileExt.equals("bmp") || fileExt.equals("gif") || fileExt.equals("jpg")) {
						try {
							Image img = new ImageIcon(filePath).getImage();
							fvo.setImageWidth(img.getWidth(null));
							fvo.setImageHeight(img.getHeight(null));
						} catch (RuntimeException e) {
							//				    		logger.error("Image get size Error");
							continue;
						}
					}
					
					String fileContent="";
					if(fileExt.equals("xlsx") || fileExt.equals("docx") || fileExt.equals("pptx")){
						fileContent = FileReadUtil.docxFileContentParser(filePath,fileExt);
					}else if(fileExt.equals("xls") || fileExt.equals("doc") || fileExt.equals("ppt")){
						fileContent = FileReadUtil.docFileContentParser(filePath,fileExt);
					}else if(fileExt.equals("pdf")){
						fileContent = FileReadUtil.pdfFileParser(filePath,fileExt);
					}else if(fileExt.equals("hwp")){
						fileContent = FileReadUtil.hwpFileParser(filePath,fileExt);
					}
					
					fvo.setFileCn(fileContent);
				}

				fvo.setFileExtsn(fileExt);
				fvo.setFileStreCours(storePathString);
				fvo.setFileSize(Long.toString(_size));
				fvo.setOrignFileNm(orginFileName);
				fvo.setStreFileNm(newName);
				fvo.setAtchFileId(atchFileIdString);
				fvo.setFileSn(String.valueOf(fileKey));
				fvo.setFileType(file.getContentType());
				
				
				result.add(fvo);
				fileKey++;
			}
		}

		return result;
	}

	public String getFolderPath() {
		Calendar calVal = Calendar.getInstance();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmm");
		String today = dateFormat.format(calVal.getTime());

		StringBuffer datePath = new StringBuffer();
		datePath.append(File.separator).append(today.substring(0, 4)).append(File.separator).append(today.substring(4, 6)).append(File.separator)
				.append(today.substring(6, 8)).append(File.separator).append(today.substring(8, 10));

		return datePath.toString();
	}

	/**
	 * 첨부파일을 서버에 저장한다.
	 *
	 * @param file
	 * @param newName
	 * @param stordFilePath
	 * @throws Exception
	 */
	protected void writeUploadedFile(final MultipartFile file, final String newName, final String stordFilePath) throws Exception {
		InputStream stream = null;
		OutputStream bos = null;
		String stordFilePathReal = (stordFilePath == null ? "" : stordFilePath).replaceAll("\\.\\.", "");
		try {
			stream = file.getInputStream();
			File cFile = new File(stordFilePathReal);

			if (!cFile.isDirectory()) {
				boolean _flag = cFile.mkdir();
				if (!_flag) {
					throw new IOException("Directory creation Failed ");
				}
			}

			bos = new FileOutputStream(stordFilePathReal + File.separator + newName);

			int bytesRead = 0;
			byte[] buffer = new byte[BUFF_SIZE];

			while ((bytesRead = stream.read(buffer, 0, BUFF_SIZE)) != -1) {
				bos.write(buffer, 0, bytesRead);
			}
		} catch (FileNotFoundException fnfe) {
			logger.error("오류발생");
		} catch (IOException ioe) {
			logger.error("오류발생");
		} catch (Exception e) {
			logger.error("오류발생");
		} finally {
			if (bos != null) {
				try {
					bos.close();
				} catch (IOException ignore) {
					logger.error("오류발생");
				}
			}
			if (stream != null) {
				try {
					stream.close();
				} catch (IOException ignore) {
					logger.error("오류발생");
				}
			}
		}
	}

	/**
	 * 서버의 파일을 다운로드한다.
	 *
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	public static void downFile(final HttpServletRequest request, final HttpServletResponse response) throws Exception {

		String downFileName = StringUtil.isNullToString(request.getAttribute("downFile")).replaceAll("\\.\\.", "");
		String orgFileName = StringUtil.isNullToString(request.getAttribute("orgFileName")).replaceAll("\\.\\.", "");

		/*
		 * if ((String)request.getAttribute("downFile") == null) {
		 * downFileName = "";
		 * } else {
		 * downFileName = StringUtil.isNullToString(request.getAttribute("downFile"));
		 * }
		 */

		/*
		 * if ((String)request.getAttribute("orgFileName") == null) {
		 * orgFileName = "";
		 * } else {
		 * orgFileName = (String)request.getAttribute("orginFile");
		 * }
		 */

		if (downFileName != null && !"".equals(downFileName)) {

			File file = new File(downFileName);

			if (!file.exists()) {
				throw new FileNotFoundException(downFileName);
			}
			if (!file.isFile()) {
				throw new FileNotFoundException(downFileName);
			}

			byte[] b = new byte[BUFF_SIZE]; //buffer size 2K.
			String fName = (new String(orgFileName.getBytes(), "UTF-8")).replaceAll("\r\n", "");
			response.setContentType("application/x-msdownload");
			response.setHeader("Content-Disposition:", "attachment; filename=" + fName);
			response.setHeader("Content-Transfer-Encoding", "binary");
			response.setHeader("Pragma", "no-cache");
			response.setHeader("Expires", "0");

			BufferedInputStream fin = null;
			BufferedOutputStream outs = null;

			try {
				fin = new BufferedInputStream(new FileInputStream(file));
				outs = new BufferedOutputStream(response.getOutputStream());
				int read = 0;

				while ((read = fin.read(b)) != -1) {
					outs.write(b, 0, read);
				}
			} finally {
				if (outs != null) {
					try {
						outs.close();
					} catch (IOException ignore) {
						logger.error("오류발생");
					}
				}
				if (fin != null) {
					try {
						fin.close();
					} catch (IOException ignore) {
						logger.error("오류발생");
					}
				}
			}
		}
	}

	/**
	 * 파일을 실제 물리적인 경로에 생성한다.
	 *
	 * @param file
	 * @param newName
	 * @param stordFilePath
	 * @throws Exception
	 */
	protected static void writeFile(final MultipartFile file, String newName, String stordFilePath) throws Exception {
		InputStream stream = null;
		OutputStream bos = null;
		newName = StringUtil.isNullToString(newName).replaceAll("\\.\\.", "");
		stordFilePath = StringUtil.isNullToString(stordFilePath).replaceAll("\\.\\.", "");
		try {
			stream = file.getInputStream();
			File cFile = new File(stordFilePath);

			if (!cFile.isDirectory()) {
				cFile.mkdir();
			}

			bos = new FileOutputStream(stordFilePath + File.separator + newName);

			int bytesRead = 0;
			byte[] buffer = new byte[BUFF_SIZE];

			while ((bytesRead = stream.read(buffer, 0, BUFF_SIZE)) != -1) {
				bos.write(buffer, 0, bytesRead);
			}
		} catch (FileNotFoundException fnfe) {
			logger.error("오류발생");
		} catch (IOException ioe) {
			logger.error("오류발생");
		} catch (Exception e) {
			logger.error("오류발생");
		} finally {
			if (bos != null) {
				try {
					bos.close();
				} catch (IOException ignore) {
					logger.error("오류발생");
				}
			}
			if (stream != null) {
				try {
					stream.close();
				} catch (IOException ignore) {
					logger.error("오류발생");
				}
			}
		}
	}

	/**
	 * 서버 파일에 대하여 다운로드를 처리한다.
	 *
	 * @param response
	 * @param streFileNm
	 *        : 파일저장 경로가 포함된 형태
	 * @param orignFileNm
	 * @throws Exception
	 */
	public void downFile(final HttpServletResponse response, final String streFileNm, final String orignFileNm) throws Exception {
		String downFileName = StringUtil.isNullToString(streFileNm).replaceAll("\\.\\.", "");
		String orgFileName = StringUtil.isNullToString(orignFileNm).replaceAll("\\.\\.", "");

		File file = new File(downFileName);

		if (!file.exists()) {
			throw new FileNotFoundException(downFileName);
		}

		if (!file.isFile()) {
			throw new FileNotFoundException(downFileName);
		}

		//byte[] b = new byte[BUFF_SIZE]; //buffer size 2K.
		int fSize = (int) file.length();
		if (fSize > 0) {
			BufferedInputStream in = null;

			try {
				in = new BufferedInputStream(new FileInputStream(file));

				String mimetype = "text/html"; //"application/x-msdownload"

				response.setBufferSize(fSize);
				response.setContentType(mimetype);
				response.setHeader("Content-Disposition:", "attachment; filename=" + orgFileName);
				response.setContentLength(fSize);
				FileCopyUtils.copy(in, response.getOutputStream());
			} finally {
				if (in != null) {
					try {
						in.close();
					} catch (IOException ignore) {
						logger.error("오류발생");
					}
				}
			}
			response.getOutputStream().flush();
			response.getOutputStream().close();
		}
	}

	public boolean isAllowExt(final String fileType, final String fileExt) throws Exception {
		String allowExt = "";
		if (fileType != null && fileType.equals("IMG")) {
				allowExt = fileUploadProperties.getProperty("file.imgExt").replaceAll("\\.\\.", "");
		} else if (fileType != null && fileType.equals("DOC")) {
				allowExt = fileUploadProperties.getProperty("file.docExt").replaceAll("\\.\\.", "");
		} else {
				allowExt = fileUploadProperties.getProperty("file.fileExt").replaceAll("\\.\\.", "");
		}

		if (fileExt != null && !fileExt.equals("") && allowExt.indexOf(fileExt.toLowerCase()) > -1) {
			return true;
		} else {
			return false;
		}
	}

	private boolean checkFileExt(final MultipartFile file, final String fileType) throws Exception {
		String fileName = file.getOriginalFilename();
		if (fileName.equals("")) {
			return false;
		}
		return isAllowExt(fileType, getExt(fileName));
	}

	private boolean checkFileSize(final MultipartFile file) throws Exception {

		String orginFileName = file.getOriginalFilename();
		String allowExt = "";
		if(fileUploadProperties.getProperty("file.imgExt2") != null){
			allowExt = fileUploadProperties.getProperty("file.imgExt2").replaceAll("\\.\\.", "");
		}
		String fileExt = getExt(orginFileName);

		if (fileExt != null && !fileExt.equals("") && allowExt.indexOf(fileExt.toLowerCase()) > -1) {
			if(file != null){
				if (file.getSize() > Long.parseLong(fileUploadProperties.getProperty("file.image.FileSize").replaceAll("\\.\\.", ""))) {
					return false;
				}
			}
		} else {
			if(file != null){
				if (file.getSize() > Long.parseLong(fileUploadProperties.getProperty("file.FileSize").replaceAll("\\.\\.", ""))) {
					return false;
				}
			}
		}
		return true;
	}

	private String getExt(final String fileName) {
		return fileName.substring(fileName.lastIndexOf(".") + 1);
	}

	/**
	 * 썸네일 생성
	 *
	 * @param newFile 원본 이미지 파일 경로
	 * @param newFile2 썸네일로 저장할 이미지 파일 경로
	 * @param fileExtsn 확장자
	 * @param width 줄일 가로 길이
	 * @param height 줄일 세로 길이
	 * @throws IOException
	 */
	@Override
	public void resize(final File newFile, final File newFile2, final String fileExtsn, final int width, final int height) throws IOException {

		Image srcImg = null;
		//        if (fileExtsn.equals("bmp") || fileExtsn.equals("png") || fileExtsn.equals("gif")) {
		srcImg = ImageIO.read(newFile);
		//        } else {
		// BMP가 아닌 경우 ImageIcon을 활용해서 Image 생성
		// 이렇게 하는 이유는 getScaledInstance를 통해 구한 이미지를
		// PixelGrabber.grabPixels로 리사이즈 할때
		// 빠르게 처리하기 위함이다.
		//            srcImg = new ImageIcon(newFile.toURL()).getImage();
		//        }
		int srcWidth = 0;
		int srcHeight = 0;
		double ratio = 0.00;
		if(srcImg != null){
			srcWidth = srcImg.getWidth(null);
		}
		if(srcImg != null){
			srcHeight =	srcImg.getHeight(null);
		}
		int destWidth = -1, destHeight = -1;

		if (srcWidth > width && srcWidth > srcHeight) {
			destWidth = width;
			
			if(srcWidth > 0){
				ratio = ((double) width) / ((double) srcWidth);
			}
			destHeight = (int) (srcHeight * ratio);
		} else if (srcWidth > width && srcWidth < srcHeight) {
			if(srcWidth > 0){
				ratio = ((double) height) / ((double) srcHeight);
			}
			destWidth = (int) (srcWidth * ratio);
			destHeight = height;
		} else if (srcHeight > height) {
			if(srcWidth > 0){
				ratio = ((double) height) / ((double) srcHeight);
			}
			destWidth = (int) (srcWidth * ratio);
			destHeight = height;
		} else {
			destWidth = srcWidth;
			destHeight = srcHeight;
		}
		Image imgTarget = null;
		if(srcImg != null){
			imgTarget = srcImg.getScaledInstance(destWidth, destHeight, Image.SCALE_SMOOTH);
		}
		int pixels[] = new int[destWidth * destHeight];
		PixelGrabber pg = new PixelGrabber(imgTarget, 0, 0, destWidth, destHeight, pixels, 0, destWidth);
		try {
			pg.grabPixels();
		} catch (InterruptedException e) {
			throw new IOException("오류발생");
		}
		BufferedImage destImg = new BufferedImage(destWidth, destHeight, BufferedImage.TYPE_INT_RGB);
		destImg.setRGB(0, 0, destWidth, destHeight, pixels, 0, destWidth);

		ImageIO.write(destImg, "jpg", newFile2);

	}
	
	 /**
     * 마스터파일 생성
     * 
     * @see egovframework.FileMngService.cmm.service.FileMngService#deleteAllFileInf(com.kosep.cm.model.FileVO)
     */
    @Override
    public void insertFileMaster(FileVO fvo) throws Exception {
    	fileMngDAO.insertFileMaster(fvo);
    }
    
    /**
     * 하나의 파일을 삭제한다.
     * 
     * @see egovframework.FileMngService.cmm.service.FileMngService#deleteFileInf(com.kosep.cm.model.FileVO)
     */
    @Override
	public void deleteFileInfDetailImsi(FileVO fvo) throws Exception {
    	
    	/*fvo = fileMngDAO.selectFileInf(fvo);
    	
    	File uFile = new File(fvo.getFileStreCours(), fvo.getStreFileNm());
    	if(uFile.exists()){
    		uFile.deleteOnExit();
    	}*/
    	
    	fileMngDAO.deleteFileInfDetailImsi(fvo);
    	fileMngDAO.updateFileImsiDelYn(fvo);
    	
    	int fileCnt = fileMngDAO.selectFileCnt(fvo);
    	if(fileCnt > 0){
    		fileMngDAO.updateAllFileInf(fvo);
    	}
    }
    
    /**
     * 임시파일 Y로 업데이트
     * 
     * @see egovframework.FileMngService.cmm.service.FileMngService#deleteAllFileInf(com.kosep.cm.model.FileVO)
     */
    @Override
	public void updateFileImsi(FileVO fvo) throws Exception {
    	fileMngDAO.deleteFileDetailDel(fvo);
    	fileMngDAO.updateFileImsi(fvo);
    	
    	int fileCnt = fileMngDAO.selectFileCnt(fvo);
    	if(fileCnt > 0){
    		fileMngDAO.updateAllFileInf(fvo);
    	}
    	
    }
    /**
     * 임시파일 Y로 업데이트
     * 
     * @see egovframework.FileMngService.cmm.service.FileMngService#deleteAllFileInf(com.kosep.cm.model.FileVO)
     */
    @Override
    public void updateFileImsiDelYn(FileVO fvo) throws Exception {
    	fileMngDAO.updateFileImsiDelYn(fvo);
    }
    
    public void deleteFileDel(FileVO fvo) throws Exception {
    	fileMngDAO.deleteFileDel(fvo);
    }
}
