package com.open.cmmn.service;

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
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Properties;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import com.open.cmmn.model.FileVO;
import com.open.cmmn.util.StringUtil;

import egovframework.rte.fdl.idgnr.EgovIdGnrService;

/**
 * @Class Name : FileMngService.java
 * @Description : 파일정보의 관리를 위한 서비스 인터페이스
 * @Modification Information
 *
 *               수정일 수정자 수정내용
 *               ------- ------- -------------------
 *               2012.11.01. 박현우 최초생성
 *
 * @author hw.park
 * @since 2012.11.01.
 * @version
 * @see
 *
 */
@Component("FileMngUtil")
public class FileMngUtil {
	/**
	 * Log4j Logger.
	 */
	private static final Logger LOGGER = LogManager.getLogger(FileMngUtil.class.getName());

	public static final int BUFF_SIZE = 2048;

	/**
	 * globalProperties.
	 */
	@Resource(name = "globalProperties")
	private Properties globalProperties;

	/**
	 * fileUploadProperties.
	 */
	@Resource(name = "fileUploadProperties")
	private Properties fileUploadProperties;

	@Resource(name = "fileIdGnrService")
	private EgovIdGnrService idgenService;

	public String getFolderPath() {
		Calendar calVal = Calendar.getInstance();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
		String today = dateFormat.format(calVal.getTime());

		StringBuffer datePath = new StringBuffer();
		datePath.append(File.separator).append(today.substring(0, 4)).append(File.separator).append(today.substring(4, 6)).append(File.separator)
				.append(today.substring(6, 8));

		return datePath.toString();
	}

	/**
	 * 첨부파일에 대한 업로드 정보를 취득한다.
	 *
	 * @param files
	 * @return
	 * @throws Exception
	 */
	public List<FileVO> parseFieldInfs(final Map<String, MultipartFile> files, final String KeyStr, final int fileKeyParam, final String atchFileId,
			final String storePath, final String fieldName) throws Exception {

		int fileKey = fileKeyParam;
		String atchFileIdString = "";
		String storePathString = "";

		if ("".equals(storePath) || storePath == null) {
			storePathString = globalProperties.getProperty("Globals.fileStorePath") + getFolderPath();
		} else {
			storePathString = globalProperties.getProperty(storePath);
		}

		if ("".equals(atchFileId) || atchFileId == null) {
			atchFileIdString = idgenService.getNextStringId();
		} else {
			atchFileIdString = atchFileId;
		}

		File saveFolder = new File(storePathString);

		if (!saveFolder.exists() || saveFolder.isFile()) {
			saveFolder.setExecutable(false);
			saveFolder.setReadable(true);
			saveFolder.setWritable(false);

			saveFolder.mkdirs();
		}

		String filePath = "";
		List<FileVO> result = new ArrayList<FileVO>();
		FileVO fvo;

		MultipartFile file;
		for (Map.Entry<String, MultipartFile> entry : files.entrySet()) {
			file = entry.getValue();
			if (file.getName().equals(fieldName)) {
				if (!checkFile(file, "document")) { // 파일검사
					continue;
				}
				String orginFileName = file.getOriginalFilename();
				// 파일명이 없는 경우
				if ("".equals(orginFileName)) {
					continue;
				}

				int index = orginFileName.lastIndexOf(".");
				String fileExt = orginFileName.substring(index + 1);
				String newName = KeyStr + StringUtil.getTimeStamp() + fileKey;
				long _size = file.getSize();

				if (!"".equals(orginFileName)) {
					filePath = storePathString + File.separator + newName;
					file.transferTo(new File(filePath));
				}
				fvo = new FileVO();
				fvo.setFileExtsn(fileExt);
				fvo.setFileStreCours(getFolderPath());
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

	/**
	 * 첨부파일에 대한 목록 정보를 취득한다.(file_ 로 시작하는 파일첨부만 첨부시킨다)
	 *
	 * @param files
	 * @return
	 * @throws Exception
	 */
	public List<FileVO> parseFileInfBoardVO(final Map<String, MultipartFile> files, final String KeyStr, final int fileKeyParam,
			final String atchFileId, final String storePath) throws Exception {
		int fileKey = fileKeyParam;

		String storePathString = "";
		String atchFileIdString = "";

		if ("".equals(storePath) || storePath == null) {
			storePathString = globalProperties.getProperty("Globals.fileStorePath") + getFolderPath();
		} else {
			storePathString = globalProperties.getProperty(storePath);
		}

		if ("".equals(atchFileId) || atchFileId == null) {
			atchFileIdString = idgenService.getNextStringId();
		} else {
			atchFileIdString = atchFileId;
		}

		File saveFolder = new File(storePathString);

		if (!saveFolder.exists() || saveFolder.isFile()) {
			saveFolder.setExecutable(false);
			saveFolder.setReadable(true);
			saveFolder.setWritable(false);

			saveFolder.mkdirs();
		}

		Iterator<Entry<String, MultipartFile>> itr = files.entrySet().iterator();
		MultipartFile file;
		String filePath = "";
		List<FileVO> result = new ArrayList<FileVO>();
		FileVO fvo;

		while (itr.hasNext()) {
			Entry<String, MultipartFile> entry = itr.next();
			file = entry.getValue();
			String orginFileName = file.getOriginalFilename();

			if (!checkFile(file, "document")) { // 파일검사
				continue;
			}
			//--------------------------------------
			// 원 파일명이 없는 경우 처리
			// (첨부가 되지 않은 input file type)
			//--------------------------------------
			if ("".equals(orginFileName)) {
				continue;
			}
			////------------------------------------

			if (file.getName().indexOf("file_") > -1) {
				int index = orginFileName.lastIndexOf(".");
				//String fileName = orginFileName.substring(0, index);
				String fileExt = orginFileName.substring(index + 1);
				String newName = KeyStr + StringUtil.getTimeStamp() + fileKey;
				long _size = file.getSize();

				if (!"".equals(orginFileName)) {
					filePath = storePathString + File.separator + newName;
					file.transferTo(new File(filePath));
				}
				fvo = new FileVO();
				fvo.setFileExtsn(fileExt);
				fvo.setFileStreCours(storePathString);
				fvo.setFileSize(Long.toString(_size));
				fvo.setOrignFileNm(orginFileName);
				fvo.setStreFileNm(newName);
				fvo.setAtchFileId(atchFileIdString);
				fvo.setFileSn(String.valueOf(fileKey));
				fvo.setFileType(file.getContentType());

				//writeFile(file, newName, storePathString);
				result.add(fvo);

				fileKey++;
			}
		}

		return result;
	}

	/**
	 * 첨부파일에 대한 목록 정보를 취득한다.(file_ 로 시작하는 파일첨부만 첨부시킨다)
	 *
	 * @param files
	 * @return
	 * @throws Exception
	 */
	public List<FileVO> parseFileInfExt(final Map<String, MultipartFile> files, final String KeyStr, final int fileKeyParam, final String atchFileId,
			final String storePath, final String fileNm) throws Exception {
		int fileKey = fileKeyParam;

		String storePathString = "";
		String atchFileIdString = "";

		if ("".equals(storePath) || storePath == null) {
			storePathString = globalProperties.getProperty("Globals.fileStorePath") + getFolderPath();
		} else {
			storePathString = globalProperties.getProperty(storePath);
		}

		if ("".equals(atchFileId) || atchFileId == null) {
			atchFileIdString = idgenService.getNextStringId();
		} else {
			atchFileIdString = atchFileId;
		}

		File saveFolder = new File(storePathString);

		if (!saveFolder.exists() || saveFolder.isFile()) {
			saveFolder.setExecutable(false);
			saveFolder.setReadable(true);
			saveFolder.setWritable(false);

			saveFolder.mkdirs();
		}

		Iterator<Entry<String, MultipartFile>> itr = files.entrySet().iterator();
		MultipartFile file;
		String filePath = "";
		List<FileVO> result = new ArrayList<FileVO>();
		FileVO fvo;

		while (itr.hasNext()) {
			Entry<String, MultipartFile> entry = itr.next();
			file = entry.getValue();
			String orginFileName = file.getOriginalFilename();

			if (!checkFile(file, "document")) { // 파일검사
				continue;
			}
			//--------------------------------------
			// 원 파일명이 없는 경우 처리
			// (첨부가 되지 않은 input file type)
			//--------------------------------------
			if ("".equals(orginFileName)) {
				continue;
			}
			////------------------------------------

			if (file.getName().indexOf(fileNm) > -1) {
				int index = orginFileName.lastIndexOf(".");
				//String fileName = orginFileName.substring(0, index);
				String fileExt = orginFileName.substring(index + 1);
				String newName = KeyStr + StringUtil.getTimeStamp() + fileKey;
				long _size = file.getSize();

				if (!"".equals(orginFileName)) {
					filePath = storePathString + File.separator + newName;
					file.transferTo(new File(filePath));
				}
				fvo = new FileVO();
				fvo.setFileExtsn(fileExt);
				fvo.setFileStreCours(storePathString);
				fvo.setFileSize(Long.toString(_size));
				fvo.setOrignFileNm(orginFileName);
				fvo.setStreFileNm(newName);
				fvo.setAtchFileId(atchFileIdString);
				fvo.setFileSn(String.valueOf(fileKey));
				fvo.setFileType(file.getContentType());

				//writeFile(file, newName, storePathString);
				result.add(fvo);

				fileKey++;
			}
		}

		return result;
	}

	/**
	 * 첨부파일에 대한 목록 정보를 취득한다.(form에서 넘어오는 모든 file 타입을 저장시킨다)
	 *
	 * @param files
	 * @return
	 * @throws Exception
	 */
	public List<FileVO> parseFileInf(final Map<String, MultipartFile> files, final String KeyStr, final int fileKeyParam, final String atchFileId,
			final String storePath) throws Exception {
		int fileKey = fileKeyParam;

		String storePathString = "";
		String atchFileIdString = "";

		if ("".equals(storePath) || storePath == null) {
			storePathString = globalProperties.getProperty("Globals.fileStorePath") + getFolderPath();
		} else {
			storePathString = globalProperties.getProperty(storePath);
		}

		if ("".equals(atchFileId) || atchFileId == null) {
			atchFileIdString = idgenService.getNextStringId();
		} else {
			atchFileIdString = atchFileId;
		}

		File saveFolder = new File(storePathString);

		if (!saveFolder.exists() || saveFolder.isFile()) {
			saveFolder.setExecutable(false);
			saveFolder.setReadable(true);
			saveFolder.setWritable(false);

			saveFolder.mkdirs();
		}

		Iterator<Entry<String, MultipartFile>> itr = files.entrySet().iterator();
		MultipartFile file;
		String filePath = "";
		List<FileVO> result = new ArrayList<FileVO>();
		FileVO fvo;

		while (itr.hasNext()) {
			Entry<String, MultipartFile> entry = itr.next();
			file = entry.getValue();
			String orginFileName = file.getOriginalFilename();

			if (!checkFile(file, "document")) { // 파일검사
				continue;
			}
			//--------------------------------------
			// 원 파일명이 없는 경우 처리
			// (첨부가 되지 않은 input file type)
			//--------------------------------------
			if ("".equals(orginFileName)) {
				continue;
			}
			////------------------------------------

			int index = orginFileName.lastIndexOf(".");
			//String fileName = orginFileName.substring(0, index);
			String fileExt = orginFileName.substring(index + 1);
			String newName = KeyStr + StringUtil.getTimeStamp() + fileKey;
			long _size = file.getSize();

			if (!"".equals(orginFileName)) {
				filePath = storePathString + File.separator + newName;
				file.transferTo(new File(filePath));
			}
			fvo = new FileVO();
			fvo.setFileExtsn(fileExt);
			fvo.setFileStreCours(storePathString);
			fvo.setFileSize(Long.toString(_size));
			fvo.setOrignFileNm(orginFileName);
			fvo.setStreFileNm(newName);
			fvo.setAtchFileId(atchFileIdString);
			fvo.setFileSn(String.valueOf(fileKey));
			fvo.setFileType(file.getContentType());

			//writeFile(file, newName, storePathString);
			result.add(fvo);

			fileKey++;
		}

		return result;
	}

	/**
	 * 첨부파일에 대한 목록 정보를 취득한다.(1가지 단건 파일첨부)
	 *
	 * @param files
	 * @return
	 * @throws Exception
	 */
	public FileVO parseFileInfOnly(final MultipartFile file, final String KeyStr, final int fileKeyParam, final String atchFileId,
			final String storePath) throws Exception {

		int fileKey = fileKeyParam;

		String storePathString = "";
		String atchFileIdString = "";

		//저장경로 설정
		if ("".equals(storePath) || storePath == null) {
			storePathString = globalProperties.getProperty("Globals.fileStorePath") + getFolderPath();
		} else {
			storePathString = globalProperties.getProperty(storePath);
		}

		if ("".equals(atchFileId) || atchFileId == null) {
			atchFileIdString = idgenService.getNextStringId();
		} else {
			atchFileIdString = atchFileId;
		}

		File saveFolder = new File(storePathString);

		if (!saveFolder.exists() || saveFolder.isFile()) {
			saveFolder.setExecutable(false);
			saveFolder.setReadable(true);
			saveFolder.setWritable(false);

			saveFolder.mkdirs();
		}

		FileVO fvo = new FileVO();
		String filePath = "";
		String orginFileName = file.getOriginalFilename();
		int index = orginFileName.lastIndexOf(".");
		String fileExt = orginFileName.substring(index + 1);
		String newName = KeyStr + StringUtil.getTimeStamp() + fileKey;
		long _size = file.getSize();

		if (!"".equals(orginFileName)) {
			filePath = storePathString + File.separator + newName;
			file.transferTo(new File(filePath));
		}

		fvo.setFileExtsn(fileExt); //확장자
		fvo.setFileStreCours(storePathString); //저장경로
		fvo.setFileSize(Long.toString(_size)); //파일크기
		fvo.setOrignFileNm(orginFileName); //실제파일명
		fvo.setStreFileNm(newName); //물리파일명
		fvo.setAtchFileId(atchFileIdString); //첨부파일 아이디
		fvo.setFileSn(String.valueOf(fileKey)); //첨부파일 일련번호
		fvo.setFileType(file.getContentType()); //파일타입

		return fvo;
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
			LOGGER.debug("fnfe: 오류발생");//fnf// ignore
		} catch (IOException ioe) {
			LOGGER.debug("ioe: 오류발생");//io// ignore
		} catch (Exception e) {
			LOGGER.debug("e: 오류발생");//// ignore
		} finally {
			if (bos != null) {
				try {
					bos.close();
				} catch (IOException ignore) {
					LOGGER.debug("IGNORED: 오류발생");
				}
			}
			if (stream != null) {
				try {
					stream.close();
				} catch (IOException ignore) {
					LOGGER.debug("IGNORED: 오류발생");
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

		File file = new File(downFileName);

		if (!file.exists()) {
			throw new FileNotFoundException(downFileName);
		}

		if (!file.isFile()) {
			throw new FileNotFoundException(downFileName);
		}

		byte[] b = new byte[BUFF_SIZE]; //buffer size 2K.
		String fName = (new String(orgFileName.getBytes(), "UTF-8")).replaceAll("\r", "").replaceAll("\n", "");
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
					LOGGER.debug("IGNORED: 오류발생");
				}
			}
			if (fin != null) {
				try {
					fin.close();
				} catch (IOException ignore) {
					LOGGER.debug("IGNORED: 오류발생");
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

			cFile.setExecutable(false);
			cFile.setReadable(true);
			cFile.setWritable(false);

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
			LOGGER.debug("fnfe: 오류발생");//fnf// ignore
		} catch (IOException ioe) {
			LOGGER.debug("ioe: 오류발생");//io// ignore
		} catch (Exception e) {
			LOGGER.debug("e: 오류발생");//// ignore
		} finally {
			if (bos != null) {
				try {
					bos.close();
				} catch (IOException ignore) {
					LOGGER.debug("오류발생");
				}
			}

			if (stream != null) {
				try {
					stream.close();
				} catch (IOException ignore) {
					LOGGER.debug("오류발생");
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
		//	String downFileName = StringUtil.isNullToString(request.getAttribute("downFile")).replaceAll("\\.\\.","");
		//	String orgFileName = StringUtil.isNullToString(request.getAttribute("orgFileName")).replaceAll("\\.\\.","");
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
						LOGGER.debug("IGNORED: 오류발생");
					}
				}
			}
			response.getOutputStream().flush();
			response.getOutputStream().close();
		}

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
	public static void resize(final File newFile, final File newFile2, final String fileExtsn, final int width, final int height) throws IOException {

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
		if(srcImg != null){
			srcWidth = srcImg.getWidth(null);
		}
		double ratio = 0.00;
		int srcHeight = 0;
		if(srcImg != null){
			srcHeight = srcImg.getHeight(null);
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
			LOGGER.debug("연결 예외 발생");
		}
		BufferedImage destImg = new BufferedImage(destWidth, destHeight, BufferedImage.TYPE_INT_RGB);
		destImg.setRGB(0, 0, destWidth, destHeight, pixels, 0, destWidth);

		ImageIO.write(destImg, "jpg", newFile2);
	}

	public boolean isAllowExt(final String fileType, final String fileExt) throws Exception {
		String allowExt = "";
		if (fileType != null && fileType.equals("image")) {
			allowExt = fileUploadProperties.getProperty("file.imgExt2");
			//allowExt = Globals.FILE_EXT_IMAGE;
		} else if (fileType != null && fileType.equals("document")) {
			allowExt = fileUploadProperties.getProperty("file.fileExt");
			//allowExt = Globals.FILE_EXT_DOCUMENT;
		}

		if (allowExt == null) {
			allowExt = "";
		}
		if (fileExt == null) {
			return false;
		}
		if (allowExt.indexOf(fileExt.toLowerCase()) == -1) {
			throw new Exception();
		} else {
			return true;
		}
	}

	private boolean checkFile(final MultipartFile file, final String fileType) throws Exception {
		String fileName = file.getOriginalFilename();
		if (fileName.equals("")) {
			return false;
		}
		// 확장자 검사 : throw exception
		try {
			isAllowExt(fileType, getExt(file));
		} catch (RuntimeException e) {
			throw new Exception(getExt(file) + "은(는) 허용되지 않은 파일입니다.");
		}
		return true;
	}

	private String getExt(final MultipartFile file) {
		String fileName = file.getOriginalFilename();
		if (fileName.equals("")) {
			return "";
		} else {
			return fileName.substring(fileName.lastIndexOf(".") + 1);
		}
	}
}