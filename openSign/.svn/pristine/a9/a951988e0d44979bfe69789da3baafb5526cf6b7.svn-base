package com.open.cmmn.web;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.open.cmmn.model.FileVO;
import com.open.cmmn.service.FileMngService;
import com.open.cmmn.util.StringUtil;

/**
 * <pre>
 * Class Name : FileDownloadController.java
 * Description: 파일 다운로드를 위한 컨트롤러 클래스.
 * Modification Information
 * 
 *    수정일         수정자         수정내용
 *    -------        -------     -------------------
 *     2012.11.01	 User		최초생성
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
@Controller
public class FileDownloadController {

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
	 * LOGGER.
	 */
	private Logger log = LoggerFactory.getLogger(this.getClass());

	/**
	 * <pre>
	 * 	 Description : 브라우저 구분 얻기.
	 * </pre>
	 *
	 * @param request HttpServletRequest
	 * @return BROWSER String
	 */
	private String getBrowser(final HttpServletRequest request) {
		String header = request.getHeader("User-Agent");
		if (header.indexOf("MSIE") > -1) {
			return "MSIE";
		} else if (header.indexOf("Chrome") > -1) {
			return "Chrome";
		} else if (header.indexOf("Opera") > -1) {
			return "Opera";
		} else if (header.indexOf("Trident") > -1) { // IE11 문자열 깨짐 방지
			return "Trident";
		}
		return "Firefox";
	}

	/**
	 * <pre>
	 * Description : Disposition 지정하기.
	 * </pre>
	 *
	 * @param filename 파일이름
	 * @param request HttpServletRequest
	 * @param response HttpServletResponse
	 * @throws Exception Exception
	 */
	private void setDisposition(String filename,
			final HttpServletRequest request,
			final HttpServletResponse response) throws Exception {
		String browser = getBrowser(request);

		String dispositionPrefix = "attachment; filename=";
		String encodedFilename = null;

		if (browser.equals("MSIE")) {
			encodedFilename =
					URLEncoder.encode(filename, "UTF-8").replaceAll("\\+",
							"%20");
		} else if (browser.equals("Trident")) {
			encodedFilename =
					URLEncoder.encode(filename, "UTF-8").replaceAll("\\+",
							"%20");
		} else if (browser.equals("Firefox")) {
			encodedFilename =
					"\"" + new String(filename.getBytes("UTF-8"), "8859_1")
							+ "\"";
		} else if (browser.equals("Opera")) {
			encodedFilename =
					"\"" + new String(filename.getBytes("UTF-8"), "8859_1")
							+ "\"";
		} else if (browser.equals("Chrome")) {
			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < filename.length(); i++) {
				char c = filename.charAt(i);
				if (c > '~') {
					sb.append(URLEncoder.encode("" + c, "UTF-8"));
				} else {
					sb.append(c);
				}
			}
			encodedFilename = "\""+sb.toString()+"\"";
		} else {
			//throw new RuntimeException("Not supported browser");
			throw new IOException("Not supported browser");
		}

		response.setHeader("Content-Disposition", dispositionPrefix
				+ encodedFilename);

		if ("Opera".equals(browser)) {
			response.setContentType("application/octet-stream;charset=UTF-8");
		}
	}

	/**
	 * <pre>
	 * Description : 첨부파일로 등록된 파일에 대하여 다운로드를 제공한다.
	 * </pre>
	 *
	 * @param request HttpServletRequest
	 * @param response HttpServletResponse
	 * @throws Exception Exception
	 */
	@RequestMapping(value = "/atch/fileDown.do")
	public final void cvplFileDownload(final HttpServletRequest request,
			final HttpServletResponse response) throws Exception {

		String atchFileId = StringUtil.nullString(request.getParameter("atchFileId"));
		String fileSn = StringUtil.nullString(request.getParameter("fileSn"));
		String streFileNm = StringUtil.nullString(request.getParameter("streFileNm"));

		try {
			@SuppressWarnings("unused")
			int fileSnTemp = Integer.parseInt(fileSn);
		} catch (NumberFormatException e) {
			fileSn = "0";
		}

		FileVO fileVO = new FileVO();
		fileVO.setAtchFileId(atchFileId);

		/*
		 * if(fileSn.equals("0")){
		 * fileSn = fileMngService.getFileMaxSn(fileVO);
		 * }
		 */

		fileVO.setFileSn(fileSn);
		fileVO.setStreFileNm(streFileNm);
		FileVO fvo = fileMngService.selectFileInf(fileVO);
		//FileVO fvo = fileMngService.selectFileDetailInf(fileVO);


		File uFile = null;
		int fSize = 0;

		if (fvo != null) {
			uFile = new File(fvo.getFileStreCours(), fvo.getStreFileNm());
			fSize = (int) uFile.length();
			System.out.println(fSize);
		}

		if (fSize > 0) {
			String mimetype = "application/x-msdownload";

			//response.setBufferSize(fSize);	// OutOfMemeory 발생
			response.setContentType(mimetype);
			//response.setHeader("Content-Disposition", "attachment; filename=\"" + URLEncoder.encode(fvo.getOrignlFileNm(), "utf-8") + "\"");
			setDisposition(fvo.getOrignFileNm(), request, response);
			response.setContentLength(fSize);

			/*
			 * FileCopyUtils.copy(in, response.getOutputStream());
			 * in.close();
			 * response.getOutputStream().flush();
			 * response.getOutputStream().close();
			 */
			BufferedInputStream in = null;
			BufferedOutputStream out = null;

			try {
				in = new BufferedInputStream(new FileInputStream(uFile));
				out = new BufferedOutputStream(response.getOutputStream());

				FileCopyUtils.copy(in, out);
				out.flush();
			} catch (FileNotFoundException  ex) {
				log.debug("IGNORED: 오류발생");
			} catch(IOException e){
				log.debug("IGNORED: 오류발생");
			}finally {
				if (in != null) {
					try {
						in.close();
					} catch (IOException ignore) {
						// no-op
						log.debug("IGNORED: 오류발생");
					}
				}
				if (out != null) {
					try {
						out.close();
					} catch (IOException ignore) {
						// no-op
						log.debug("IGNORED: 오류발생");
					}
				}
			}

		} else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter printwriter = response.getWriter();
			printwriter.println("<!DOCTYPE html>");
			printwriter.println("<html lang=\"ko\">");
			printwriter.println("<head> <title>error</title>");
			printwriter
					.println("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />");
			printwriter.println("<script type=\"text/javascript\">");
			printwriter.println("alert(\"" + ("등록된 첨부파일이 존재하지 않습니다.") + "\");");
			if(request.getHeader("REFERER").indexOf("ft/fc/fc01/fc0107") > -1){
				printwriter.println("history.back();");
			}else{
				printwriter.println("self.close();");
			}
			printwriter.println("</script>");
			printwriter.println("</head>");
			printwriter.println("</html>");
			printwriter.flush();
			printwriter.close();
		}
	}

	/**
	 * <pre>
	 * Description : 첨부파일로 등록된 파일에 대하여 다운로드를 제공한다.
	 * </pre>
	 *
	 * @param request HttpServletRequest
	 * @param response HttpServletResponse
	 * @throws Exception Exception
	 */
	@RequestMapping(value = "/m/atch/fileDown.do")
	public final void cvplMFileDownload(final HttpServletRequest request,
			final HttpServletResponse response) throws Exception {

		String atchFileId = StringUtil.nullString(request.getParameter("atchFileId"));
		String fileSn = StringUtil.nullString(request.getParameter("fileSn"));

		try {
			@SuppressWarnings("unused")
			int fileSnTemp = Integer.parseInt(fileSn);
		} catch (NumberFormatException e) {
			fileSn = "0";
		}

		FileVO fileVO = new FileVO();
		fileVO.setAtchFileId(atchFileId);

		/*
		 * if(fileSn.equals("0")){
		 * fileSn = fileMngService.getFileMaxSn(fileVO);
		 * }
		 */

		fileVO.setFileSn(fileSn);
		FileVO fvo = fileMngService.selectFileInf(fileVO);

		/*
		 * if (fvo != null && fvo.getRegId() != null &&
		 * !fvo.getRegId().equals("")) {
		 * 
		 * 
		 * }else{
		 * response.setContentType("text/html; charset=UTF-8");
		 * PrintWriter printwriter = response.getWriter();
		 * printwriter.println("<!DOCTYPE html>");
		 * printwriter.println("<html lang=\"ko\">");
		 * printwriter.println("<head> <title>error</title>");
		 * printwriter.println(
		 * "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />"
		 * );
		 * printwriter.println("<script type=\"text/javascript\">");
		 * printwriter.println("alert(\""+("등록된 첨부파일이 존재하지 않습니다.")+"\");");
		 * printwriter.println("</script>");
		 * printwriter.println("</head>");
		 * printwriter.println("</html>");
		 * printwriter.flush();
		 * printwriter.close();
		 * }
		 * 
		 * }
		 */

		File uFile = null;
		int fSize = 0;

		if (fvo != null) {
			uFile = new File(fvo.getFileStreCours(), fvo.getStreFileNm());
			fSize = (int) uFile.length();
		}

		if (fSize > 0) {
			String mimetype = "application/x-msdownload";

			//response.setBufferSize(fSize);	// OutOfMemeory 발생
			response.setContentType(mimetype);
			//response.setHeader("Content-Disposition", "attachment; filename=\"" + URLEncoder.encode(fvo.getOrignlFileNm(), "utf-8") + "\"");
			setDisposition(fvo.getOrignFileNm(), request, response);
			response.setContentLength(fSize);

			/*
			 * FileCopyUtils.copy(in, response.getOutputStream());
			 * in.close();
			 * response.getOutputStream().flush();
			 * response.getOutputStream().close();
			 */
			BufferedInputStream in = null;
			BufferedOutputStream out = null;

			try {
				in = new BufferedInputStream(new FileInputStream(uFile));
				out = new BufferedOutputStream(response.getOutputStream());

				FileCopyUtils.copy(in, out);
				out.flush();
			} catch (FileNotFoundException ex) {
				//ex.printStackTrace();
				// 다음 Exception 무시 처리
				// Connection reset by peer: socket write error
				log.debug("IGNORED: 오류발생");
			} catch (IOException ex) {
			//ex.printStackTrace();
			// 다음 Exception 무시 처리
			// Connection reset by peer: socket write error
			log.debug("IGNORED: 오류발생");
			}finally {
				if (in != null) {
					try {
						in.close();
					} catch (IOException ignore) {
						// no-op
						log.debug("IGNORED: 오류발생");
					}
				}
				if (out != null) {
					try {
						out.close();
					} catch (IOException ignore) {
						// no-op
						log.debug("IGNORED: 오류발생");
					}
				}
			}

		} else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter printwriter = response.getWriter();
			printwriter.println("<!DOCTYPE html>");
			printwriter.println("<html lang=\"ko\">");
			printwriter.println("<head> <title>error</title>");
			printwriter
					.println("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />");
			printwriter.println("<script type=\"text/javascript\">");
			printwriter.println("alert(\"" + ("등록된 첨부파일이 존재하지 않습니다.") + "\");");
			printwriter.println("</script>");
			printwriter.println("</head>");
			printwriter.println("</html>");
			printwriter.flush();
			printwriter.close();
		}
	}
	 /**
     * 썸네일에 대한 미리보기 기능을 제공한다.
     * 
     * @param atchFileId
     * @param fileSn
     * @param response
     * @throws Exception
     */
    @RequestMapping("/atch/getImageThumb.do")
    public void getImageInfThumb(Map<String, Object> commandMap, HttpServletResponse response, HttpServletRequest request) throws Exception {

		String atchFileId =StringUtil.nullConvert(request.getParameter("atchFileId"));
		String fileSn = StringUtil.nullConvert(request.getParameter("fileSn"));
		int width = Integer.parseInt(StringUtil.nullConvert(request.getParameter("width")));
		int height = Integer.parseInt(StringUtil.nullConvert(request.getParameter("height")));
				
		if(fileSn == null || fileSn.equals("")){
			fileSn = "0";
		}
	
		FileVO vo = new FileVO();
	
		vo.setAtchFileId(atchFileId);
		vo.setFileSn(fileSn);
		
		FileVO fvo = fileMngService.selectFileInf(vo);
		File file = new File(fvo.getFileStreCours(), fvo.getStreFileNm());
		File file2 = new File(fvo.getFileStreCours(), fvo.getStreFileNm()+"_thumb"+StringUtil.replaceFilePath(width+"")+"x"+StringUtil.replaceFilePath(height+""));
		
		// 미리 만들어진 썸네일이 없다면 메소드 호출
		if(!file2.exists()){
			fileMngService.resize(file, file2, fvo.getFileExtsn(), width, height);
		}
		FileInputStream fis = null;
		new FileInputStream(file2);
	
		BufferedInputStream in = null;
		ByteArrayOutputStream bStream = null;
		try{
			if(file2 != null){
				fis = new FileInputStream(file2);
			}
			if(fis != null){
				in = new BufferedInputStream(fis);
			}
			bStream = new ByteArrayOutputStream();
			int imgByte;
			while ((imgByte = in.read()) != -1) {
			    bStream.write(imgByte);
			}
			
			String type = "";
	
			if (fvo.getFileExtsn() != null && !"".equals(fvo.getFileExtsn())) {
			    if ("jpg".equals(fvo.getFileExtsn().toLowerCase())) {
				type = "image/jpeg";
			    } else {
				type = "image/" + fvo.getFileExtsn().toLowerCase();
			    }
			    type = "image/" + fvo.getFileExtsn().toLowerCase();
	
			} else {
			    log.info("Image fileType is null.");
			}
			
			response.setHeader("Content-Type", type);
			response.setContentLength(bStream.size());
			
			bStream.writeTo(response.getOutputStream());
			
			response.getOutputStream().flush();
			response.getOutputStream().close();
	
		    
		}catch(IOException e){
			log.info("IOException");//e.printStackTrace();
		}catch (NullPointerException e) {
			log.info("NullPointerException");//e.printStackTrace();
		}catch (ClassCastException e) {
			log.info("ClassCastException");//e.printStackTrace();
		}
		finally{
			if (bStream != null) {
				try {
					bStream.close();
				} catch (IOException est) {
				    log.info("IGNORED: " + est.getMessage());
				}catch (NullPointerException est) {
					log.info("IGNORED: " + est.getMessage());
				}catch (ClassCastException est) {
					log.info("IGNORED: " + est.getMessage());
				}
			}
			if (in != null) {
				try {
					in.close();
				} catch (IOException ei) {
				    log.info("IGNORED: " + ei.getMessage());
				}catch (NullPointerException ei) {
					log.info("IGNORED: " + ei.getMessage());
				}catch (ClassCastException ei) {
					log.info("IGNORED: " + ei.getMessage());
				}
			}
			if (fis != null) {
				try {
					fis.close();
				} catch (IOException efis) {
				    log.info("IGNORED: " + efis.getMessage());
				}catch (NullPointerException efis) {
					log.info("IGNORED: " + efis.getMessage());
				}catch (ClassCastException efis) {
					log.info("IGNORED: " + efis.getMessage());
				}
			}
		}
    }
	/**
	 * <pre>
	 * Description : 첨부된 이미지에 대한 미리보기 기능을 제공한다.
	 * </pre>
	 *
	 * @param request HttpServletRequest
	 * @param response HttpServletResponse
	 * @throws Exception Exception
	 */
	@RequestMapping("/atch/getImage.do")
	public final void getImageInf(final HttpServletRequest request, final HttpServletResponse response) throws Exception {
		String atchFileId = StringUtil.nullString(request.getParameter("atchFileId"));
		String fileSn = StringUtil.nullString(request.getParameter("fileSn"));

		if (atchFileId == null || atchFileId.equals("")) {
			return;
		}

		if (fileSn == null || fileSn.equals("")) {
			fileSn = "0";
		}
		FileVO vo = new FileVO();

		vo.setAtchFileId(atchFileId);
		vo.setFileSn(fileSn);

		FileVO fvo = fileMngService.selectFileInf(vo);

		//String fileLoaction = fvo.getFileStreCours() + fvo.getStreFileNm();

		File file = new File(fvo.getFileStreCours(), fvo.getStreFileNm());
		FileInputStream fis = null;

		BufferedInputStream in = null;
		ByteArrayOutputStream bStream = null;
		try {
			fis = new FileInputStream(file);
			in = new BufferedInputStream(fis);
			bStream = new ByteArrayOutputStream();
			int imgByte;
			while ((imgByte = in.read()) != -1) {
				bStream.write(imgByte);
			}

			String type = "";

			if (fvo.getFileExtsn() != null && !"".equals(fvo.getFileExtsn())) {
				if ("jpg".equals(fvo.getFileExtsn().toLowerCase())) {
					type = "image/jpeg"; //TODO 정말 이런걸까?
				} else {
					type = "image/" + fvo.getFileExtsn().toLowerCase();
				}
				type = "image/" + fvo.getFileExtsn().toLowerCase();

			} else {
				log.debug("Image fileType is null.");
			}

			response.setHeader("Content-Type", type);
			response.setContentLength(bStream.size());

			bStream.writeTo(response.getOutputStream());

			response.getOutputStream().flush();
			response.getOutputStream().close();

		} catch (FileNotFoundException e) {
			log.error(e.toString());
			// ignore
		} catch (IOException e) {
			log.error(e.toString());
			// ignore
		}finally {
			if (bStream != null) {
				try {
					bStream.close();
				} catch (IOException est) {
					log.debug("IGNORED: 오류발생");
				}
			}
			if (in != null) {
				try {
					in.close();
				} catch (IOException ei) {
					log.debug("IGNORED: 오류발생");
				}
			}
			if (fis != null) {
				try {
					fis.close();
				} catch (IOException efis) {
					log.debug("IGNORED: 오류발생");
				}
			}
		}
	}
	
	/**
	 * <pre>
	 * Description : 첨부된 이미지에 대한 미리보기 기능을 제공한다.
	 * </pre>
	 *
	 * @param request HttpServletRequest
	 * @param response HttpServletResponse
	 * @throws Exception Exception
	 */
	@RequestMapping("/atch/getVideo.do")
	public final void getVideoInf(final HttpServletRequest request, final HttpServletResponse response) throws Exception {
		String atchFileId = StringUtil.nullString(request.getParameter("atchFileId"));
		String fileSn = StringUtil.nullString(request.getParameter("fileSn"));

		if (atchFileId == null || atchFileId.equals("")) {
			return;
		}

		if (fileSn == null || fileSn.equals("")) {
			fileSn = "0";
		}
		FileVO vo = new FileVO();

		vo.setAtchFileId(atchFileId);
		vo.setFileSn(fileSn);

		FileVO fvo = fileMngService.selectFileInf(vo);

		//String fileLoaction = fvo.getFileStreCours() + fvo.getStreFileNm();

		File file = new File(fvo.getFileStreCours(), fvo.getStreFileNm());
		FileInputStream fis = null;

		BufferedInputStream in = null;
		ByteArrayOutputStream bStream = null;
		try {
			fis = new FileInputStream(file);
			in = new BufferedInputStream(fis);
			bStream = new ByteArrayOutputStream();
			int imgByte;
			while ((imgByte = in.read()) != -1) {
				bStream.write(imgByte);
			}

			String type = "";

			if (fvo.getFileExtsn() != null && !"".equals(fvo.getFileExtsn())) {
				type = "video/" + fvo.getFileExtsn().toLowerCase();

			} else {
				log.debug("Video fileType is null.");
			}

			response.setHeader("Content-Type", type);
			response.setContentLength(bStream.size());

			bStream.writeTo(response.getOutputStream());

			response.getOutputStream().flush();
			response.getOutputStream().close();

		} catch (FileNotFoundException e) {
			log.error(e.toString());
			// ignore
		} catch (IOException e) {
			log.error(e.toString());
			// ignore
		}finally {
			if (bStream != null) {
				try {
					bStream.close();
				} catch (IOException est) {
					log.debug("IGNORED: 오류발생");
				}
			}
			if (in != null) {
				try {
					in.close();
				} catch (IOException ei) {
					log.debug("IGNORED: 오류발생");
				}
			}
			if (fis != null) {
				try {
					fis.close();
				} catch (IOException efis) {
					log.debug("IGNORED: 오류발생");
				}
			}
		}
	}

	/**
	 * <pre>
	 * Description : 첨부된 이미지에 대한 미리보기 기능을 제공한다.
	 * </pre>
	 *
	 * @param atchFileId 첨부파일 ID
	 * @param model Model
	 * @return String View
	 * @throws Exception Exception
	 */
	@RequestMapping(value = "/atch/getFileList.do", method = RequestMethod.POST, headers = "Content-type=application/x-www-form-urlencoded")
	public final String getFileList( @RequestParam("atchFileId") final String atchFileId, final Model model) throws Exception {
		FileVO vo = new FileVO();
		vo.setAtchFileId(atchFileId);
		List<FileVO> fileList = fileMngService.selectFileInfs(vo);
		model.addAttribute("menuNm", "파일 첨부 목록");
		model.addAttribute("fileList", fileList);
		return ".mPopLayout:/cmmn/fms/fileList";
	}
	
	
	
	@RequestMapping("/atch/byteGetImage.do")
	public final void byteGetImage(final HttpServletRequest request, final HttpServletResponse response) throws Exception {
		String atchFileId = StringUtil.nullString(request.getParameter("atchFileId"));
		String fileSn = StringUtil.nullString(request.getParameter("fileSn"));

		if (atchFileId == null || atchFileId.equals("")) {
			return;
		}

		if (fileSn == null || fileSn.equals("")) {
			fileSn = "0";
		}
		FileVO vo = new FileVO();

		vo.setAtchFileId(atchFileId);
		vo.setFileSn(fileSn);

		FileVO fvo = fileMngService.selectFileInf(vo);

		//String fileLoaction = fvo.getFileStreCours() + fvo.getStreFileNm();

		InputStream fis = null;

		BufferedInputStream in = null;
		ByteArrayOutputStream bStream = null;
		try {
			fis = new ByteArrayInputStream(fvo.getAtchFile());
			in = new BufferedInputStream(fis);
			bStream = new ByteArrayOutputStream();
			int imgByte;
			while ((imgByte = in.read()) != -1) {
				bStream.write(imgByte);
			}

			String type = "";

			if (fvo.getFileExtsn() != null && !"".equals(fvo.getFileExtsn())) {
				if ("jpg".equals(fvo.getFileExtsn().toLowerCase())) {
					type = "image/jpeg"; //TODO 정말 이런걸까?
				} else {
					type = "image/" + fvo.getFileExtsn().toLowerCase();
				}
				type = "image/" + fvo.getFileExtsn().toLowerCase();

			} else {
				log.debug("Image fileType is null.");
			}

			response.setHeader("Content-Type", type);
			response.setContentLength(bStream.size());

			bStream.writeTo(response.getOutputStream());

			response.getOutputStream().flush();
			response.getOutputStream().close();

		} catch (IOException e) {
			log.error(e.toString());
			// ignore
		} finally {
			if (bStream != null) {
				try {
					bStream.close();
				} catch (IOException est) {
					log.debug("IGNORED: 오류발생");
				}
			}
			if (in != null) {
				try {
					in.close();
				} catch (IOException ei) {
					log.debug("IGNORED: 오류발생");
				}
			}
			if (fis != null) {
				try {
					fis.close();
				} catch (IOException efis) {
					log.debug("IGNORED: 오류발생");
				}
			}
		}
	}
	
	
	@RequestMapping(value = "/atch/byteFileDown.do")
	public final void byteFileDown(final HttpServletRequest request, final HttpServletResponse response) throws Exception {

		String atchFileId = StringUtil.nullString(request.getParameter("atchFileId"));
		String fileSn = StringUtil.nullString(request.getParameter("fileSn"));

		try {
			@SuppressWarnings("unused")
			int fileSnTemp = Integer.parseInt(fileSn);
		} catch (NumberFormatException e) {
			fileSn = "0";
		}

		FileVO fileVO = new FileVO();
		fileVO.setAtchFileId(atchFileId);
		fileVO.setFileSn(fileSn);
		FileVO fvo = fileMngService.selectFileInf(fileVO);


		File uFile = null;
		int fSize = 0;

		if (fvo != null ) {
			String mimetype = "application/x-msdownload";
			
			response.setContentType(mimetype);
			setDisposition(fvo.getOrignFileNm(), request, response);                                                                                                                                                                                                                 
			response.setContentLength(fSize);
			
			BufferedInputStream in = null;
			BufferedOutputStream out = null;
			
			try {
				in = new BufferedInputStream(new ByteArrayInputStream(fvo.getAtchFile()));
				out = new BufferedOutputStream(response.getOutputStream());
				
				FileCopyUtils.copy(in, out);
				out.flush();
			} catch (IOException ex) {
				log.debug("IGNORED: 오류발생");
			} finally {
				if (in != null) {
					try {
						in.close();
					} catch (IOException ignore) {
						// no-op
						log.debug("IGNORED: 오류발생");
					}
				}
				if (out != null) {
					try {
						out.close();
					} catch (IOException ignore) {
						// no-op
						log.debug("IGNORED: 오류발생");
					}
				}
			}
			
		} else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter printwriter = response.getWriter();
			printwriter.println("<!DOCTYPE html>");
			printwriter.println("<html lang=\"ko\">");
			printwriter.println("<head> <title>error</title>");
			printwriter.println("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />");
			printwriter.println("<script type=\"text/javascript\">");
			printwriter.println("alert(\"" + ("등록된 첨부파일이 존재하지 않습니다.") + "\");");
			printwriter.println("self.close();");
			printwriter.println("</script>");
			printwriter.println("</head>");
			printwriter.println("</html>");
			printwriter.flush();
			printwriter.close();
		}

	}
	
	@RequestMapping("/atch/imgPop.do")
	public static String imgPop(ModelMap model,HttpServletRequest request) throws Exception {
		
		String atchFileId = StringUtil.nullString(request.getParameter("atchFileId"));
		String fileSn = StringUtil.nullString(request.getParameter("fileSn"));
		
		model.addAttribute("atchFileId", atchFileId);
		model.addAttribute("fileSn", fileSn);
		
		return ".mPopLayout:/cmmn/fms/fileImgPop";
	}
	
}
