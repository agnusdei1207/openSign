package com.open.cmmn.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Properties;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import com.open.cmmn.model.FileVO;
import com.open.cmmn.service.CmmnService;
import com.open.cmmn.service.FileMngService;
import com.open.cmmn.util.StringUtil;

import egovframework.rte.fdl.idgnr.EgovIdGnrService;

/**
 * <pre>
 * Class Name : FileMngController.java
 * Description: 파일 조회, 삭제, 다운로드 처리를 위한 컨트롤러 클래스.
 * Modification Information
 *
 *    수정일         수정자         수정내용
 *    -------        -------     -------------------
 *    2015.11.30.	 박현우		최초생성
 *
 * </pre>
 *
 * @author 박현우
 * @since 2015.11.30.
 * @version 1.0
 * @see <pre>
 *
 * </pre>
 */
@Controller
public class FileMngController {

	/**
	 * CmmnService.
	 */
	@Resource(name = "cmmnService")
	private CmmnService cmmnService;

	/**
	 * FileMngService.
	 */
	@Resource(name = "FileMngService")
	private FileMngService fileMngService;

	/**
	 * fileUploadProperties.
	 */
	@Resource(name = "fileUploadProperties")
	private Properties fileUploadProperties;
	
	/**
	 * globalProperties.
	 */
	@Resource(name = "globalProperties")
	private Properties globalProperties;

	/**
	 * MappingJackson2JsonView.
	 */
	@Resource
	private MappingJackson2JsonView ajaxView;

	/**
	 * FileMngService.
	 */
	/*@Resource(name = "excelUploadService")
	private ExcelUploadService excelUploadService;*/

	/**
	 * <pre>
	 * Description : 첨부파일에 대한 목록을 조회한다.
	 * </pre>
	 *
	 * @param fileVO 파일VO
	 * @param commandMap 파일정보 commandMap
	 * @param model ModelMap
	 * @return 파일리스트 View
	 * @throws Exception Exception
	 */
	@RequestMapping("/atch/selectFileInfs.do")
	public final String selectFileInfs(@ModelAttribute("fileVO") final FileVO fileVO, final Map<String, Object> commandMap, final ModelMap model)
			throws Exception {
		String atchFileId = StringUtil.nullString((String) commandMap.get("atchFileId"));
		String imgFileId = StringUtil.nullString((String) commandMap.get("imgFileId"));
		String updateFlag = StringUtil.nullString((String) commandMap.get("updateFlag"));
		String fileType = StringUtil.nullString((String) commandMap.get("fileType"));
		if (fileType.equals("img")) {
			fileVO.setAtchFileId(imgFileId);
		} else {
			fileVO.setAtchFileId(atchFileId);
		}
		List<FileVO> result = fileMngService.selectFileInfs(fileVO);

		model.addAttribute("fileList", result);
		model.addAttribute("updateFlag", updateFlag);
		model.addAttribute("fileType", fileType);
		model.addAttribute("fileListCnt", result.size());
		model.addAttribute("atchFileId", atchFileId);

		return "cmmn/fms/FileList";
	}

	/**
	 * <pre>
	 * Description : 첨부파일 변경을 위한 수정페이지로 이동한다.
	 * </pre>
	 *
	 * @param fileVO 파일VO
	 * @param commandMap 파일정보 commandMap
	 * @param model ModelMap
	 * @return 파일리스트 View
	 * @throws Exception Exception
	 */
	@RequestMapping("/atch/selectFileInfsForUpdate.do")
	public final String selectFileInfsForUpdate(@ModelAttribute("searchVO") final FileVO fileVO, final Map<String, Object> commandMap,
			final ModelMap model) throws Exception {

		String atchFileId = (String) commandMap.get("param_atchFileId");

		fileVO.setAtchFileId(atchFileId);

		List<FileVO> result = fileMngService.selectFileInfs(fileVO);

		model.addAttribute("fileList", result);
		model.addAttribute("updateFlag", "Y");
		model.addAttribute("fileListCnt", result.size());
		model.addAttribute("atchFileId", atchFileId);

		return "cmmn/fms/FileList";
	}

	/**
	 * <pre>
	 * Description : 첨부파일에 대한 삭제를 처리한다.
	 * </pre>
	 *
	 * @param fileVO 파일VO
	 * @return JSON Object
	 * @throws Exception Exception
	 */
	@RequestMapping("/atch/deleteFileInfs.do")
	public final ModelAndView deleteFileinf(@ModelAttribute("searchVO") final FileVO fileVO) throws Exception {

		ModelAndView modelAndView = new ModelAndView();
		MappingJackson2JsonView jsonView = new MappingJackson2JsonView();
		modelAndView.setView(jsonView);

		fileMngService.deleteFileInfDetail(fileVO);

		int fileCnt = fileMngService.selectFileCnt(fileVO);

		if (fileCnt == 0) {
			fileMngService.deleteAllFileInf(fileVO);
		}

		modelAndView.addObject("result", "true");

		return modelAndView;
	}

	/**
	 * <pre>
	 * Description : 이미지 첨부파일에 대한 목록을 조회한다.
	 * </pre>
	 *
	 * @param fileVO 파일VO
	 * @param commandMap 파일정보 commandMap
	 * @param model ModelMap
	 * @return 이미지 파일리스트 View
	 * @throws Exception Exception
	 */
	@RequestMapping("/atch/selectImageFileInfs.do")
	public final String
			selectImageFileInfs(@ModelAttribute("fileVO") final FileVO fileVO, final Map<String, Object> commandMap, final ModelMap model)
					throws Exception {

		//String atchFileId = (String) commandMap.get("atchFileId");

		//fileVO.setAtchFileId(fileVO.getAtchFileId());
		List<FileVO> result = fileMngService.selectImageFileList(fileVO);

		model.addAttribute("fileList", result);

		model.addAttribute("atchFileId", fileVO.getAtchFileId());
		model.addAttribute("atchFileIdNm", fileVO.getAtchFileIdNm());
		return "cmmn/fms/ImgFileList";
	}

	/**
	 * <pre>
	 * Description : 이미지 첨부파일에 대한 목록을 조회한다.
	 * </pre>
	 *
	 * @param fileVO 파일VO
	 * @param commandMap 파일정보 commandMap
	 * @param model ModelMap
	 * @return 이미지 파일리스트 View
	 * @throws Exception Exception
	 */
	@RequestMapping("/atch/selectImageFileInfsWithSubject.do")
	public final String selectImageFileInfsWithSubject(@ModelAttribute("fileVO") final FileVO fileVO, final Map<String, Object> commandMap,
			final ModelMap model) throws Exception {

		//String atchFileId = (String) commandMap.get("atchFileId");

		//fileVO.setAtchFileId(fileVO.getAtchFileId());
		List<FileVO> result = fileMngService.selectImageFileListWithSubject(fileVO);

		model.addAttribute("fileList", result);

		model.addAttribute("atchFileId", fileVO.getAtchFileId());
		model.addAttribute("atchFileIdNm", fileVO.getAtchFileIdNm());
		return "cmmn/fms/ImgFileListWithSubject";
	}

	/**
	 * <pre>
	 * Description : 에디터 사진 첨부 화면을 조회한다.
	 * </pre>
	 *
	 * @param fileVO 파일VO
	 * @return 에디터 업로드 폼
	 * @throws Exception Exception
	 */
	@RequestMapping("/manage/atch/editorUploadForm.do")
	public final String editorUploadForm(@ModelAttribute("fileVO") final FileVO fileVO) throws Exception {

		return "cmmn/fms/editorUploadForm";
	}

	/**
	 * <pre>
	 * Description : 에디터 첨부파일을 처리한다.
	 * </pre>
	 *
	 * @param multiRequest MultipartHttpServletRequest
	 * @param fileVO 파일VO
	 * @param model Model
	 * @return 에디터 콜백 View
	 * @throws Exception Exception
	 */
	@RequestMapping("/atch/editorFileInfs.do")
	public final String editorFileInfs(final MultipartHttpServletRequest multiRequest, @ModelAttribute("fileVO") final FileVO fileVO,
			final Model model) throws Exception {

		String callbackFunc = multiRequest.getParameter("callback_func");
		String altText = multiRequest.getParameter("altText");
		String atchFileId = "";
		String realFilenm = "";
		int width = 0;
		int height = 0;

		final Map<String, MultipartFile> files = multiRequest.getFileMap();
		if (!files.isEmpty()) {
			List<FileVO> result = fileMngService.parseFileInf(files, "IMG", 0, atchFileId, "file.editor.path", altText);

			if (result != null && result.size() > 0 && !"".equals(result.get(0).getFileResult())) {
				fileVO.setEditorErrstr("error");
			} else {
				fileMngService.insertFileInfs(result);
				
				if(result != null){
					atchFileId = result.get(0).getAtchFileId();
					realFilenm = result.get(0).getOrignFileNm();
					width = result.get(0).getImageWidth();
					height = result.get(0).getImageHeight();
				}
				if (!atchFileId.equals("")) {
					fileVO.setCallBackFunc(callbackFunc);
					fileVO.setEditorNewLine("true");
					fileVO.setEditorFileName(realFilenm);
					fileVO.setAltText(altText);
					fileVO.setImageWidth(width);
					fileVO.setImageHeight(height);
					fileVO.setEditorFileURL(fileUploadProperties.getProperty("file.imageDownPath") + atchFileId);
				} else {
					fileVO.setEditorErrstr("error");
				}
			}
		} else {
			fileVO.setEditorErrstr("error");
		}

		model.addAttribute("fileVO", fileVO);

		return "cmmn/fms/editorCallBack";
	}

	/**
	 * <pre>
	 * Description : 첨부파일을 업로드한다.
	 * </pre>
	 *
	 * @param fileVO 파일VO
	 * @param model Model
	 * @return 파일 리스트 View
	 * @throws Exception Exception
	 */
	@RequestMapping(value = "/atch/fileUpload.do")
	public final String fileUpload(@ModelAttribute("fileVO") final FileVO fileVO, final Model model) throws Exception {
		
		//첨부파일 갯수
		int intFileCnt = 0;
		try {
			if (fileVO.getFileCnt() != null && !"".equals(fileVO.getFileCnt())) {
				intFileCnt = Integer.parseInt(fileVO.getFileCnt());
			} else {
				intFileCnt = 1;
			}
		} catch (RuntimeException e) {
			intFileCnt = 1;
		}
		fileVO.setFileCnt(intFileCnt + "");

		if (fileVO.getAtchFileId() != null && !"".equals(fileVO.getAtchFileId())) {
			fileVO.setAtchFileId(fileVO.getAtchFileId());
			//List<FileVO> resultList = fileMngService.selectFileInfs(fileVO);
			List<FileVO> resultList = fileMngService.selectFileInfsNew(fileVO);
			model.addAttribute("resultList", resultList);
		}
		model.addAttribute("atchFileId", fileVO.getAtchFileId());
		model.addAttribute("fileCnt", intFileCnt);
		model.addAttribute("atchFileIdNm", fileVO.getAtchFileIdNm());

		return "cmmn/fms/fncFileList";
	}
	
	
	

	/**
	 * <pre>
	 * Description : 첨부파일을 업로드한다.
	 * </pre>
	 *
	 * @param fileVO 파일VO
	 * @param model Model
	 * @return 파일 리스트 View
	 * @throws Exception Exception
	 */
	@RequestMapping(value = "/atch/fileFtUpload.do")
	public final String fileFtUpload(@ModelAttribute("fileVO") final FileVO fileVO, final Model model) throws Exception {
		
		//첨부파일 갯수
		int intFileCnt = 0;
		try {
			if (fileVO.getFileCnt() != null && !"".equals(fileVO.getFileCnt())) {
				intFileCnt = Integer.parseInt(fileVO.getFileCnt());
			} else {
				intFileCnt = 1;
			}
		} catch (RuntimeException e) {
			intFileCnt = 1;
		}
		fileVO.setFileCnt(intFileCnt + "");

		if (fileVO.getAtchFileId() != null && !"".equals(fileVO.getAtchFileId())) {
			fileVO.setAtchFileId(fileVO.getAtchFileId());
			//List<FileVO> resultList = fileMngService.selectFileInfs(fileVO);
			List<FileVO> resultList = fileMngService.selectFileInfsNew(fileVO);
			model.addAttribute("resultList", resultList);
		}
		model.addAttribute("atchFileId", fileVO.getAtchFileId());
		model.addAttribute("fileCnt", intFileCnt);
		model.addAttribute("atchFileIdNm", fileVO.getAtchFileIdNm());

		return "cmmn/fms/fncFtFileList";
	}
	
	
	
	/**
	 * <pre>
	 * Description : 첨부파일을 업로드한다.
	 * </pre>
	 *
	 * @param fileVO 파일VO
	 * @param model Model
	 * @return 파일 리스트 View
	 * @throws Exception Exception
	 */
	@RequestMapping(value = "/atch/fileUpload2.do")
	public final String fileUpload2(@ModelAttribute("fileVO") final FileVO fileVO, final Model model) throws Exception {
		
		//첨부파일 갯수
		int intFileCnt = 0;
		try {
			if (fileVO.getFileCnt() != null && !"".equals(fileVO.getFileCnt())) {
				intFileCnt = Integer.parseInt(fileVO.getFileCnt());
			} else {
				intFileCnt = 1;
			}
		} catch (RuntimeException e) {
			intFileCnt = 1;
		}
		fileVO.setFileCnt(intFileCnt + "");
		
		if (fileVO.getAtchFileId() != null && !"".equals(fileVO.getAtchFileId())) {
			fileVO.setAtchFileId(fileVO.getAtchFileId());
//			List<FileVO> resultList = fileMngService.selectFileInfs(fileVO);
			List<FileVO> resultList = fileMngService.selectFileInfsNew(fileVO);
			model.addAttribute("resultList", resultList);
		}
		model.addAttribute("atchFileId", fileVO.getAtchFileId());
		model.addAttribute("fileCnt", intFileCnt);
		model.addAttribute("atchFileIdNm", fileVO.getAtchFileIdNm());
		
		return "cmmn/fms/fncByteFileList2";
	}

	/**
	 * <pre>
	 * Description : 첨부파일을 업로드한다.
	 * </pre>
	 *
	 * @param fileVO 파일VO
	 * @param model Model
	 * @return 파일 리스트 View
	 * @throws Exception Exception
	 */
	@RequestMapping(value = "/atch/fileIconList.do")
	public final String fileIconList(@ModelAttribute("fileVO") final FileVO fileVO, final Model model) throws Exception {

		int intFileCnt = 0;
		try {
			if (fileVO.getFileCnt() != null && !"".equals(fileVO.getFileCnt())) {
				intFileCnt = Integer.parseInt(fileVO.getFileCnt());
			} else {
				intFileCnt = 1;
			}
		} catch (RuntimeException e) {
			intFileCnt = 1;
		}
		fileVO.setFileCnt(intFileCnt + "");

		if (fileVO.getAtchFileId() != null && !"".equals(fileVO.getAtchFileId())) {
			fileVO.setAtchFileId(fileVO.getAtchFileId());
			List<FileVO> resultList = fileMngService.selectFileInfs(fileVO);
			model.addAttribute("resultList", resultList);
		}
		model.addAttribute("atchFileId", fileVO.getAtchFileId());
		model.addAttribute("fileCnt", intFileCnt);
		model.addAttribute("atchFileIdNm", fileVO.getAtchFileIdNm());

		return "cmmn/fms/fncFileListIcon";
	}

	/**
	 * <pre>
	 * Description : 첨부파일을 업로드한다.
	 * </pre>
	 *
	 * @param fileVO 파일VO
	 * @param model Model
	 * @return 파일 리스트 View
	 * @throws Exception Exception
	 */
	@RequestMapping(value = "/atch/fileUploadWithSubject.do")
	public final String fileUploadWithSubject(@ModelAttribute("fileVO") final FileVO fileVO, final Model model) throws Exception {

		int intFileCnt = 0;
		try {
			if (fileVO.getFileCnt() != null && !"".equals(fileVO.getFileCnt())) {
				intFileCnt = Integer.parseInt(fileVO.getFileCnt());
			} else {
				intFileCnt = 1;
			}
		} catch (RuntimeException e) {
			intFileCnt = 1;
		}
		fileVO.setFileCnt(intFileCnt + "");

		if (fileVO.getAtchFileId() != null && !"".equals(fileVO.getAtchFileId())) {
			fileVO.setAtchFileId(fileVO.getAtchFileId());
			List<FileVO> resultList = fileMngService.selectFileInfsWithSubject(fileVO);
			model.addAttribute("resultList", resultList);
		}
		model.addAttribute("fileSubject", fileVO.getFileSubject());
		model.addAttribute("atchFileId", fileVO.getAtchFileId());
		model.addAttribute("fileCnt", intFileCnt);
		model.addAttribute("atchFileIdNm", fileVO.getAtchFileIdNm());

		return "cmmn/fms/fncFileWithSubjectList";
	}

	/**
	 * <pre>
	 * Description : 첨부파일을 삭제 처리한다.
	 * </pre>
	 *
	 * @param fileVO 파일VO
	 * @param request HttpServletRequest
	 * @return 파일 업로드 페이지 redirect
	 * @throws Exception Exception
	 */
	/*@RequestMapping("/atch/fileDelete.do")
	public final String fileDelete(@ModelAttribute("fileVO") final FileVO fileVO, final HttpServletRequest request) throws Exception {

		fileMngService.deleteFileInfDetail(fileVO);
		List<FileVO> resultList = fileMngService.selectFileInfs(fileVO);
		if (resultList.size() == 0) {
			fileMngService.deleteAllFileInf(fileVO);
		}

		return "redirect:/atch/fileUpload.do?atchFileId=" + fileVO.getAtchFileId() + "&fileCnt=" + fileVO.getFileCnt() + "&atchFileIdNm="
				+ fileVO.getAtchFileIdNm() + "&updateType=" + fileVO.getUpdateType();
	}*/

	/**
	 * <pre>
	 * Description : 첨부파일을 업로드 처리한다.
	 * </pre>
	 *
	 * @param multiRequest MultipartHttpServletRequest
	 * @param fileVO 파일VO
	 * @param response HttpServletResponse
	 * @param model ModelMap
	 * @return 파일 업로드 페이지 redirect
	 * @throws Exception Exception
	 */
	@RequestMapping(value = "/atch/fileUploadAction.do")
	public final String fileUploadAction(final MultipartHttpServletRequest multiRequest, @ModelAttribute("fileVO") final FileVO fileVO,
			final HttpServletResponse response, final ModelMap model) throws Exception {
		String atchFileId = StringUtil.nullString(multiRequest.getParameter("atchFileId"));
		List<FileVO> resultList = null;

		response.setHeader("Content-Type", "text/javascript");

		final Map<String, MultipartFile> files = multiRequest.getFileMap();
		if (!files.isEmpty()) {

			resultList = fileMngService.parseFileInf(files, "ATCH", 0, atchFileId, "", null);

			if (resultList != null && resultList.size() > 0 && !"".equals(resultList.get(0).getFileResult())) {
				model.addAttribute("error", resultList.get(0).getFileResult());
				return "cmmn/execute";
			}
			
			for (FileVO fileVO2 : resultList) {
				if(fileVO.getParentSeq() == null || fileVO.getParentSeq().equals("")){
					fileVO2.setParentSeq(null);
				}else{
					fileVO2.setParentSeq(fileVO.getParentSeq());
				}
			}
			
			if ("".equals(atchFileId) || atchFileId == null) {
				fileMngService.insertFileInfs(resultList);
			} else {
				fileMngService.updateFileInfs(resultList);
			}
			if(resultList != null){
				fileVO.setAtchFileId(resultList.get(0).getAtchFileId());
			}
		}

		return "redirect:/atch/fileUpload.do?atchFileId=" + fileVO.getAtchFileId() + "&fileCnt=" + fileVO.getFileCnt() + "&atchFileIdNm="
				+ fileVO.getAtchFileIdNm() + "&updateType=" + fileVO.getUpdateType() + "&parentSeq=" + fileVO.getParentSeq();
	}
	
	@RequestMapping(value = "/atch/fileFtUploadAction.do")
	public final String fileFtUploadAction(final MultipartHttpServletRequest multiRequest, @ModelAttribute("fileVO") final FileVO fileVO,
			final HttpServletResponse response, final ModelMap model) throws Exception {
		String atchFileId = StringUtil.nullString(multiRequest.getParameter("atchFileId"));
		List<FileVO> resultList = null;

		response.setHeader("Content-Type", "text/javascript");

		final Map<String, MultipartFile> files = multiRequest.getFileMap();
		if (!files.isEmpty()) {

			resultList = fileMngService.parseFileInf(files, "ATCH", 0, atchFileId, "", null);

			if (resultList != null && resultList.size() > 0 && !"".equals(resultList.get(0).getFileResult())) {
				model.addAttribute("error", resultList.get(0).getFileResult());
				return "cmmn/execute";
			}
			
			for (FileVO fileVO2 : resultList) {
				if(fileVO.getParentSeq() == null || fileVO.getParentSeq().equals("")){
					fileVO2.setParentSeq(null);
				}else{
					fileVO2.setParentSeq(fileVO.getParentSeq());
				}
			}
			
			if ("".equals(atchFileId) || atchFileId == null) {
				fileMngService.insertFileInfs(resultList);
			} else {
				fileMngService.updateFileInfs(resultList);
			}
			if(resultList != null){
				fileVO.setAtchFileId(resultList.get(0).getAtchFileId());
			}
		}

		return "redirect:/atch/fileFtUpload.do?atchFileId=" + fileVO.getAtchFileId() + "&fileCnt=" + fileVO.getFileCnt() + "&atchFileIdNm="
				+ fileVO.getAtchFileIdNm() + "&updateType=" + fileVO.getUpdateType() + "&parentSeq=" + fileVO.getParentSeq();
	}
	
	
	
	
	@RequestMapping(value = "/atch/moFileUploadAction.do")
	public final String moFileUploadAction(final MultipartHttpServletRequest multiRequest, @ModelAttribute("fileVO") final FileVO fileVO,
			final HttpServletResponse response, final ModelMap model) throws Exception {
		String atchFileId = StringUtil.nullString(multiRequest.getParameter("atchFileId"));
		List<FileVO> resultList = null;

		response.setHeader("Content-Type", "text/javascript");

		final Map<String, MultipartFile> files = multiRequest.getFileMap();
		if (!files.isEmpty()) {

			resultList = fileMngService.parseFileInf(files, "ATCH", 0, atchFileId, "", null);

			if (resultList != null && resultList.size() > 0 && !"".equals(resultList.get(0).getFileResult())) {
				model.addAttribute("error", resultList.get(0).getFileResult());
				return "cmmn/execute";
			}
			
			for (FileVO fileVO2 : resultList) {
				if(fileVO.getParentSeq() == null || fileVO.getParentSeq().equals("")){
					fileVO2.setParentSeq(null);
				}else{
					fileVO2.setParentSeq(fileVO.getParentSeq());
				}
			}
			
			if ("".equals(atchFileId) || atchFileId == null) {
				fileMngService.insertFileInfs(resultList);
			} else {
				fileMngService.updateFileInfs(resultList);
			}
			if(resultList != null){
				fileVO.setAtchFileId(resultList.get(0).getAtchFileId());
			}
		}
		
		return "redirect:/atch/moFileUpload.do?atchFileId=" + fileVO.getAtchFileId() + "&fileCnt=" + fileVO.getFileCnt() + "&atchFileIdNm="
				+ fileVO.getAtchFileIdNm() + "&updateType=" + fileVO.getUpdateType() + "&parentSeq=" + fileVO.getParentSeq();
	}
	

	/**
	 * <pre>
	 * Description : 첨부파일을 업로드 처리한다.
	 * </pre>
	 *
	 * @param multiRequest MultipartHttpServletRequest
	 * @param fileVO 파일VO
	 * @param response HttpServletResponse
	 * @param model ModelMap
	 * @param pfileSubject 파일 제목
	 * @return 파일 업로드 페이지 redirect
	 * @throws Exception Exception
	 */
	@RequestMapping(value = "/atch/fileUploadWithSubjectAction.do")
	public final String
			fileUploadWithSubjectAction(final MultipartHttpServletRequest multiRequest, @ModelAttribute("fileVO") final FileVO fileVO,
					final HttpServletResponse response, final ModelMap model,
					@RequestParam(value = "fileSubject", required = false) final String pfileSubject) throws Exception {

		String fileSubjectNm = pfileSubject;
		String atchFileId = StringUtil.nullString(multiRequest.getParameter("atchFileId"));
		List<FileVO> resultList = null;

		response.setHeader("Content-Type", "text/javascript");

		final Map<String, MultipartFile> files = multiRequest.getFileMap();
		if (!files.isEmpty()) {

			resultList = fileMngService.parseFileInfWithSubject(files, "ATCH", 0, atchFileId, "", null, fileSubjectNm);

			if (resultList != null && resultList.size() > 0 && !"".equals(resultList.get(0).getFileResult())) {
				model.addAttribute("error", resultList.get(0).getFileResult());
				return "cmmn/execute";
			}

			if ("".equals(atchFileId) || atchFileId == null) {
				fileMngService.insertFileInfsWithSubject(resultList);
			} else {
				fileMngService.updateFileInfsWithSubject(resultList);
			}

			fileVO.setAtchFileId(resultList.get(0).getAtchFileId());
		}

		return "redirect:/atch/fileUploadWithSubject.do?atchFileId=" + fileVO.getAtchFileId() + "&fileCnt=" + fileVO.getFileCnt() + "&atchFileIdNm="
				+ fileVO.getAtchFileIdNm() + "&updateType=" + fileVO.getUpdateType() + "&fileSubject=" + fileVO.getFileSubject();
	}

	/**
	 * <pre>
	 * Description : 첨부파일을 업로드 처리한다.
	 * </pre>
	 *
	 * @param multiRequest MultipartHttpServletRequest
	 * @param fileVO 파일VO
	 * @param response HttpServletResponse
	 * @return JSON View
	 * @throws Exception Exception
	 */
	@RequestMapping(value = "/atch/fileUpload.action")
	public final ModelAndView fileUploadJson(final MultipartHttpServletRequest multiRequest, @ModelAttribute("fileVO") final FileVO fileVO,
			final HttpServletResponse response) throws Exception {
		String atchFileId = StringUtil.nullString(multiRequest.getParameter("atchFileId"));
		List<FileVO> resultList = null;

		response.setHeader("Content-Type", "text/javascript");

		Map<String, Object> model = new HashMap<String, Object>();
		final Map<String, MultipartFile> files = multiRequest.getFileMap();
		if (!files.isEmpty()) {

			resultList = fileMngService.parseFileInf(files, "ATCH", 0, atchFileId, "", null);
			if ("".equals(atchFileId) || atchFileId == null) {
				fileMngService.insertFileInfs(resultList);
			} else {
				fileMngService.updateFileInfs(resultList);
			}
			model.put("result", true);

			fileVO.setAtchFileId(resultList.get(0).getAtchFileId());
			resultList = null;
			resultList = fileMngService.selectFileInfs(fileVO);
			model.put("resultList", resultList);

		} else {
			model.put("result", false);
		}

		return new ModelAndView(ajaxView, model);
	}

	/**
	 * <pre>
	 * Description : 파일명, 파일폼 이름으로 이미지 파일을 업로드한다.
	 * </pre>
	 *
	 * @param pFileFormNm 파일 폼 이름 (not required)
	 * @param multiRequest MultipartHttpServletRequest
	 * @param fileVO 파일VO
	 * @param response HttpServletResponse
	 * @return JSON View
	 * @throws Exception Exception
	 */
	@RequestMapping(value = { "/atch/atchFileUpload.do", "/m/atch/atchFileUpload.do" })
	public final ModelAndView imgFileUpload(@RequestParam(value = "fileFormNm", required = false) final String pFileFormNm,
			final MultipartHttpServletRequest multiRequest, @ModelAttribute("fileVO") final FileVO fileVO, final HttpServletResponse response)
			throws Exception {

		response.setHeader("Content-Type", "text/javascript");
		String fileFormNm = pFileFormNm;
		String atchFileId = StringUtil.nullString(multiRequest.getParameter("imgAtchFileId"));
		List<FileVO> resultList = null;

		Map<String, Object> model = new HashMap<String, Object>();
		final Map<String, MultipartFile> files = multiRequest.getFileMap();
		if (!files.isEmpty()) {

			Iterator<Entry<String, MultipartFile>> itrCheck = files.entrySet().iterator();

			int fileCnt = 0;
			while (itrCheck.hasNext()) { // 파일검사
				Entry<String, MultipartFile> entry = itrCheck.next();
				if (entry != null && fileFormNm.equals(entry.getKey())) {
					fileCnt++;
				}
			}
			if (fileCnt > 0) {
				if (fileFormNm == null || fileFormNm.equals("")) {
					fileFormNm = "fileForm";
				}

				resultList = fileMngService.multiParseFileInf(files, "ATCH", 0, atchFileId, "", null, fileFormNm);

				if ("".equals(atchFileId) || atchFileId == null) {
					fileMngService.insertFileInfs(resultList);
				} else {
					fileMngService.updateFileInfs(resultList);
				}
				model.put("result", true);

				fileVO.setAtchFileId(resultList.get(0).getAtchFileId());
				resultList = null;
				resultList = fileMngService.selectFileInfs(fileVO);
				model.put("resultList", resultList);
			}
		} else {
			model.put("result", false);
		}

		return new ModelAndView(ajaxView, model);
	}

	/**
	 * <pre>
	 * Description : 첨부파일을 삭제 처리한다.
	 * </pre>
	 *
	 * @param fileVO 파일VO
	 * @param request HttpServletRequest
	 * @return JSON View
	 * @throws Exception Exception
	 */
	@RequestMapping("/atch/fileDelete.do")
	public final ModelAndView fileDeleteJson(@ModelAttribute("fileVO") final FileVO fileVO, final HttpServletRequest request) throws Exception {

		Map<String, Object> model = new HashMap<String, Object>();

		fileMngService.deleteFileInfDetail(fileVO);
		List<FileVO> resultList = fileMngService.selectFileInfs(fileVO);
		if (resultList.size() == 0) {
			fileMngService.deleteAllFileInf(fileVO);
		}
		model.put("result", true);
		model.put("resultList", resultList);

		return new ModelAndView(ajaxView, model);
	}

	/**
	 * <pre>
	 * Description : 첨부파일을 전체 조회한다.
	 * </pre>
	 *
	 * @param fileVO 파일VO
	 * @param request HttpServletRequest
	 * @return JSON View
	 * @throws Exception Exception
	 */
	@RequestMapping(value = { "/atch/getFileList.do", "/m/atch/getFileList.do" })
	public final ModelAndView getFileList(@ModelAttribute("fileVO") final FileVO fileVO, final HttpServletRequest request) throws Exception {

		Map<String, Object> model = new HashMap<String, Object>();

		List<FileVO> resultList = fileMngService.selectFileInfs(fileVO);
		model.put("result", true);
		model.put("resultList", resultList);

		return new ModelAndView(ajaxView, model);
	}

	/**
	 * <pre>
	 * Description : 첨부파일을 조회한다.
	 * </pre>
	 *
	 * @param pfileVO 파일VO
	 * @param request HttpServletRequest
	 * @return JSON View
	 * @throws Exception Exception
	 */
	@RequestMapping(value = { "/atch/getFile.do", "/m/atch/getFile.do" })
	public final ModelAndView getFile(@ModelAttribute("fileVO") final FileVO pfileVO, final HttpServletRequest request) throws Exception {

		Map<String, Object> model = new HashMap<String, Object>();

		FileVO fileVO = fileMngService.selectFileInf(pfileVO);
		model.put("result", true);
		model.put("fileVO", fileVO);

		return new ModelAndView(ajaxView, model);
	}

	
	 /**
     * 첨부파일을 처리한다.
     * 
     * @param fileVO
     * @param model
     * @return
     * @throws Exception
     */
	@RequestMapping(value="/atch/fileInfs.do")
    public ModelAndView fileInfs(final MultipartHttpServletRequest multiRequest, @ModelAttribute("fileVO") FileVO fileVO, ModelMap model, HttpServletResponse response, HttpServletRequest request) throws Exception {
	    String atchFileId = StringUtil.nullString(multiRequest.getParameter("atchFileId"));
	    List<FileVO> resultList =  null;

		response.setHeader("Content-Type", "text/javascript");
		
		HttpSession session = request.getSession();
		String regId=(String)session.getAttribute("loginMgrId");
		fileVO.setLoginId(regId);
		
	    final Map<String, MultipartFile> files = multiRequest.getFileMap();
	    if (!files.isEmpty()) {
	    	resultList = fileMngService.parseFileInf(files, "ATCH", 0, atchFileId, "", null);
	    	Iterator iter = resultList.iterator();
	    	int i = 0;
	    	
	    	if (resultList != null && resultList.size() > 0 && !"".equals(resultList.get(0).getFileResult())) {
				model.addAttribute("error", resultList.get(0).getFileResult());
			}
	    	if (resultList != null){
	    		resultList.get(i).setOrignFileNm(new String(resultList.get(i).getOrignFileNm().getBytes("8859_1"),"UTF-8"));// ajax formdata로 넘길시 한글꺠짐문제....
	    	}
			if ("".equals(atchFileId) || atchFileId == null) {
			    fileMngService.insertFileInfs(resultList);
			} else {
				fileMngService.updateFileInfs(resultList);
			}
			if(resultList != null){
				fileVO.setAtchFileId(resultList.get(0).getAtchFileId());
			}
	    }
	    
	    model.addAttribute("atchFileId", fileVO.getAtchFileId());
	    
		return new ModelAndView(ajaxView,model);
    }
	
	
	 @Resource(name = "fileIdGnrService")
    private EgovIdGnrService idgenService;
	 
	@RequestMapping(value="/atch/getAtchFileId.do")
	public ModelAndView getAtchFilrId(ModelMap model) throws Exception{
		
		 String atchFileIdString = idgenService.getNextStringId();
		 
		 FileVO fileVO = new FileVO();
		 fileVO.setAtchFileId(atchFileIdString);
		 
		 fileMngService.insertFileMaster(fileVO);
		 model.addAttribute("atchFileId", atchFileIdString);
		 
		return new ModelAndView(ajaxView,model);
	}
	
	@RequestMapping("/atch/editorFileInfsJson.do")
    public ModelAndView editorFileInfsJson(
          final MultipartHttpServletRequest multiRequest, 
          @ModelAttribute("fileVO") FileVO fileVO, 
            ModelMap model) throws Exception {
       
       String callback_func = StringUtil.nullString(multiRequest.getParameter("callback_func"));
       String altText = StringUtil.nullString(multiRequest.getParameter("altText"));
       String atchFileId = "";
       String realFilenm = "";
       int width = 0;
       int height = 0;
       
       final Map<String, MultipartFile> files = multiRequest.getFileMap();
       if (!files.isEmpty()) {
          List<FileVO> result = fileMngService.parseFileInf(files, "IMG", 0, atchFileId, "file.editor.path", altText);
          fileMngService.insertFileInfs(result);
      
          atchFileId = result.get(0).getAtchFileId();
          realFilenm = result.get(0).getOrignFileNm();
          width = result.get(0).getImageWidth();
          height = result.get(0).getImageHeight();
          if(!atchFileId.equals("")){
             fileVO.setCallBackFunc(callback_func);
             fileVO.setEditorNewLine("true");
             fileVO.setEditorFileName(realFilenm);
             fileVO.setAltText(altText);
             fileVO.setImageWidth(width);
             fileVO.setImageHeight(height);
             fileVO.setEditorFileURL(fileUploadProperties.getProperty("file.imageDownPath")+atchFileId);
          }else{
             fileVO.setEditorErrstr("error");
          }
       }else{
          fileVO.setEditorErrstr("error");
       }
       //System.out.println("====>"+fileVO.getEditorFileURL());
       model.addAttribute("fileVO", fileVO);
       String sFileInfo = "&bNewLine=true";
       if(fileVO != null){
             sFileInfo += "&sFileName="+fileVO.getEditorFileName();
             sFileInfo += "&sFileURL="+fileVO.getEditorFileURL().replace("=", "-_-");
       }
       model.addAttribute("sFileInfo", sFileInfo);
       return new ModelAndView(ajaxView , model);
    }
	
	
	
	@RequestMapping(value = "/atch/byteFileUploadAction.do")
	public final String byteFileUploadAction(final MultipartHttpServletRequest multiRequest, @ModelAttribute("fileVO") final FileVO fileVO,
			final HttpServletResponse response, final ModelMap model) throws Exception {
		String atchFileId = StringUtil.nullString(multiRequest.getParameter("atchFileId"));
		List<FileVO> resultList = null;
		response.setHeader("Content-Type", "text/javascript");

		final Map<String, MultipartFile> files = multiRequest.getFileMap();
		if (!files.isEmpty()) {

			resultList = fileMngService.parseFileInf(files, "BLOB", 0, atchFileId, "", null);

			if (resultList != null && resultList.size() > 0 && !"".equals(resultList.get(0).getFileResult())) {
				model.addAttribute("error", resultList.get(0).getFileResult());
				return "cmmn/execute";
			}
			if ("".equals(atchFileId) || atchFileId == null) {
				atchFileId = fileMngService.insertFileInfs(resultList);
			} else {
				fileMngService.updateFileInfs(resultList);
			}
			try {
	            Class.forName("oracle.jdbc.driver.OracleDriver");
	        } catch (ClassNotFoundException e) {
	            System.out.println(e.getMessage());
	        }
	        
	        Connection con = null;
	        PreparedStatement stmt = null;
	        
	        
	        try {
	        	fileVO.setAtchFileId(atchFileId);
	        	List<FileVO> fileList = fileMngService.selectFileInfs(fileVO);
	            con = DriverManager.getConnection(globalProperties.getProperty("db.con"), globalProperties.getProperty("db.user"),globalProperties.getProperty("db.pwd"));
	            for (FileVO fileVO2 : fileList) {
					System.out.println(fileVO2.getFileStreCours());
	            	File f = new File(fileVO2.getFileStreCours()+"\\"+fileVO2.getStreFileNm());    
	            	FileInputStream fis = new FileInputStream(f);
	            	stmt = con.prepareStatement( "update t_atch_file_detail set atch_file = ? where atch_file_id = ? and file_sn = ?");
	            	stmt.setBinaryStream(1, fis,(int)f.length());
	            	stmt.setString(2, fileVO2.getAtchFileId());
	            	stmt.setString(3, fileVO2.getFileSn());
	            	int rownum = stmt.executeUpdate();
	            	if (fis != null) {
	    				try {
	    					fis.close();
	    				} catch (IOException efis) {
	    					System.out.println("IGNORED: " + efis.getMessage());
	    				}catch (NullPointerException efis) {
	    					System.out.println("IGNORED: " + efis.getMessage());
	    				}catch (ClassCastException efis) {
	    					System.out.println("IGNORED: " + efis.getMessage());
	    				}
	    			}
	            	if(rownum >0){
	            		System.out.println("삽입성공");
	            	}else
	            	{
	            		System.out.println("실패");
	            	}
				}
	            
	        } catch (SQLException e) {
	            System.out.println("E :: "+e.getMessage());
	        }
	        finally {
	                //사용한 객체 close
	                try {
	                    if(con != null) con.close();
	                    if(stmt != null) stmt.close();
	                } catch (SQLException e) {
	                    
	                }
	            
	        }
	        if(resultList != null){
	        	fileVO.setAtchFileId(resultList.get(0).getAtchFileId());
	        }
		}
		return "redirect:/atch/byteFileUpload.do?atchFileId=" + fileVO.getAtchFileId() + "&fileCnt=" + fileVO.getFileCnt() + "&atchFileIdNm="
				+ fileVO.getAtchFileIdNm() + "&updateType=" + fileVO.getUpdateType();
	}
	
	
	@RequestMapping(value = "/atch/byteFileUploadAction2.do")
	public final String byteFileUploadAction2(final MultipartHttpServletRequest multiRequest, @ModelAttribute("fileVO") final FileVO fileVO,
			final HttpServletResponse response, final ModelMap model) throws Exception {
		String atchFileId = StringUtil.nullString(multiRequest.getParameter("atchFileId"));
		List<FileVO> resultList = null;
		response.setHeader("Content-Type", "text/javascript");
		
		final Map<String, MultipartFile> files = multiRequest.getFileMap();
		if (!files.isEmpty()) {
			
			resultList = fileMngService.parseFileInf(files, "BLOB", 0, atchFileId, "", null);
			
			if (resultList != null && resultList.size() > 0 && !"".equals(resultList.get(0).getFileResult())) {
				model.addAttribute("error", resultList.get(0).getFileResult());
				return "cmmn/execute";
			}
			if ("".equals(atchFileId) || atchFileId == null) {
				atchFileId = fileMngService.insertFileInfs(resultList);
			} else {
				fileMngService.updateFileInfs(resultList);
			}
			
			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
			} catch (ClassNotFoundException e) {
				System.out.println(e.getMessage());
			}
			
			Connection con = null;
			PreparedStatement stmt = null;
			
			
			try {
				fileVO.setAtchFileId(atchFileId);
				List<FileVO> fileList = fileMngService.selectFileInfs(fileVO);
				con = DriverManager.getConnection(globalProperties.getProperty("db.con"), globalProperties.getProperty("db.user"),globalProperties.getProperty("db.pwd"));
				
				for (FileVO fileVO2 : fileList) {
					
					File f = new File(fileVO2.getFileStreCours()+"\\"+fileVO2.getStreFileNm());    
					FileInputStream fis = new FileInputStream(f);
					
					stmt = con.prepareStatement( "update t_atch_file_detail set atch_file = ? where atch_file_id = ? and file_sn = ?");
					stmt.setBinaryStream(1, fis,(int)f.length());
					stmt.setString(2, fileVO2.getAtchFileId());
					stmt.setString(3, fileVO2.getFileSn());
					int rownum = stmt.executeUpdate();
					if (fis != null) {
						try {
							fis.close();
						} catch (IOException efis) {
							System.out.println("IGNORED: " + efis.getMessage());
						}catch (NullPointerException efis) {
							System.out.println("IGNORED: " + efis.getMessage());
						}catch (ClassCastException efis) {
							System.out.println("IGNORED: " + efis.getMessage());
						}
					}
					if(rownum >0){
						System.out.println("삽입성공");
					}else
					{
						System.out.println("실패");
					}
				}
				
			} catch (SQLException e) {
				System.out.println("E :: "+e.getMessage());
			}
			finally {
				//사용한 객체 close
				try {
					if(con != null) con.close();
					if(stmt != null) stmt.close();
				} catch (SQLException e) {
					
				}
				
			}
			if(resultList != null){
				fileVO.setAtchFileId(resultList.get(0).getAtchFileId());
			}
		}
		return "redirect:/atch/byteFileUpload.do?atchFileId=" + fileVO.getAtchFileId() + "&fileCnt=" + fileVO.getFileCnt() + "&atchFileIdNm="
		+ fileVO.getAtchFileIdNm() + "&updateType=" + fileVO.getUpdateType();
	}
	
	/**
     * 첨부파일을 처리한다.
     * 
     * @param fileVO
     * @param model
     * @return
     * @throws Exception
     */
	
	@RequestMapping("/atch/fileImsi.do")
    public ModelAndView fileImsiDel( @ModelAttribute("fileVO") FileVO fileVO,ModelMap model,HttpServletRequest request) throws Exception {
		
		String msg = StringUtil.nullString(request.getParameter("msg"));
		
		if(msg.equals("DELETE")){
			fileMngService.deleteFileInfDetailImsi(fileVO);
		}else if(msg.equals("UPDATE")){
			fileMngService.updateFileImsi(fileVO);
		}
		
		return new ModelAndView(ajaxView, model);
    }
	
}
