package com.open.cmmn.model;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

/**
 * <pre>
 * Class Name : FileVO.java
 * Description: 파일정보 처리를 위한 VO 클래스.
 * Modification Information
 * 
 *    수정일         수정자         수정내용
 *    -------        -------     -------------------
 *    2016. 11. 15.	 User		최초생성
 *
 * </pre>
 *
 * @author User
 * @since 2016. 11. 15.
 * @version 1.0
 * @see <pre>
 *
 * </pre>
 */
@Alias("FileVO")
@SuppressWarnings("serial")
public class FileVO extends CmmnDefaultVO implements Serializable {

	/**
	 * 파일내용.
	 */
	private String fileCn = "";
	/**
	 * 파일확장자.
	 */
	private String fileExtsn = "";
	/**
	 * 파일크기.
	 */
	private String fileSize = "";
	/**
	 * 파일저장경로.
	 */
	private String fileStreCours = "";
	/**
	 * 원파일명.
	 */
	private String orignFileNm = "";
	/**
	 * 저장파일명.
	 */
	private String streFileNm = "";
	/**
	 * 저장파일타입.
	 */
	private String fileType = "";
	/**
	 * 첨부 결과.
	 */
	private String fileResult = "";
	/**
	 * 삭제 여부.
	 */
	private String delYn = "";

	/**
	 * 삭제 콜백.
	 * */
	private String callBackFuncDelete;
	/**
	 * 입력 콜백.
	 * */
	private String callBackFuncInsert;

	/**
	 * 콜백.
	 */
	private String callBackFunc;

	/**
	 * 에디터 새줄.
	 */
	private String editorNewLine;
	/**
	 * 에디터 파일 이름.
	 */
	private String editorFileName;
	/**
	 * 에디터 파일 URL.
	 */
	private String editorFileURL;
	/**
	 * 대체 텍스트.
	 */
	private String altText;
	/**
	 * 에디터 에러메세지.
	 */
	private String editorErrstr;
	/**
	 * 이미지 너비.
	 */
	private int imageWidth = 0;
	/**
	 * 이미지 높이.
	 */
	private int imageHeight = 0;
	/** deleteFlag. */
	private String deleteFlag;

	/**
	 * 파일 수.
	 */
	private String fileCnt;

	/**
	 * 파일 제목 : 사용자 지정.
	 */
	private String fileSubject;
	
	
	private byte[] atchFile; 
	
	private String parentSeq;
	
	
	/**
	 * @return the fileSubject
	 */
	public final String getFileSubject() {
		return fileSubject;
	}

	/**
	 * @param pFileSubject the fileSubject to set
	 */
	public final void setFileSubject(final String pFileSubject) {
		fileSubject = pFileSubject;
	}

	/**
	 * @return 삭제된 파일 구분자를 리턴한다.
	 */
	public String getDeleteFlag() {
		return deleteFlag;
	}

	/** @param pDeleteFlag pDeleteFlag. */
	public void setDeleteFlag(final String pDeleteFlag) {
		this.deleteFlag = pDeleteFlag;
	}

	/** @return FileCnt. */
	public String getFileCnt() {
		return fileCnt;
	}

	/** @param pFileCnt pFileCnt. */
	public void setFileCnt(final String pFileCnt) {
		this.fileCnt = pFileCnt;
	}

	/**
	 * fileCn attribute를 리턴한다.
	 *
	 * @return the fileCn
	 */
	public String getFileCn() {
		return fileCn;
	}

	/**
	 * fileCn attribute 값을 설정한다.
	 *
	 * @param pFileCn
	 *        the fileCn to set
	 */
	public void setFileCn(final String pFileCn) {
		this.fileCn = pFileCn;
	}

	/**
	 * fileExtsn attribute를 리턴한다.
	 *
	 * @return the fileExtsn
	 */
	public String getFileExtsn() {
		return fileExtsn;
	}

	/**
	 * fileExtsn attribute 값을 설정한다.
	 *
	 * @param pFileExtsn
	 *        the fileExtsn to set
	 */
	public void setFileExtsn(final String pFileExtsn) {
		this.fileExtsn = pFileExtsn;
	}

	/**
	 * fileSize attribute를 리턴한다.
	 *
	 * @return the fileSize
	 */
	public String getFileSize() {
		return fileSize;
	}

	/**
	 * fileSize attribute 값을 설정한다.
	 *
	 * @param pFileSize
	 *        the fileSize to set
	 */
	public void setFileSize(final String pFileSize) {
		this.fileSize = pFileSize;
	}

	/**
	 * fileStreCours attribute를 리턴한다.
	 *
	 * @return the fileStreCours
	 */
	public String getFileStreCours() {
		return fileStreCours;
	}

	/**
	 * fileStreCours attribute 값을 설정한다.
	 *
	 * @param pFileStreCours
	 *        the fileStreCours to set
	 */
	public void setFileStreCours(final String pFileStreCours) {
		this.fileStreCours = pFileStreCours;
	}

	/**
	 * orignFileNm attribute를 리턴한다.
	 *
	 * @return the orignFileNm
	 */
	public String getOrignFileNm() {
		return orignFileNm;
	}

	/**
	 * orignFileNm attribute 값을 설정한다.
	 *
	 * @param pOrignFileNm
	 *        the orignFileNm to set
	 */
	public void setOrignFileNm(final String pOrignFileNm) {
		this.orignFileNm = pOrignFileNm;
	}

	/**
	 * streFileNm attribute를 리턴한다.
	 *
	 * @return the streFileNm
	 */
	public String getStreFileNm() {
		return streFileNm;
	}

	/**
	 * streFileNm attribute 값을 설정한다.
	 *
	 * @param pStreFileNm
	 *        the streFileNm to set
	 */
	public void setStreFileNm(final String pStreFileNm) {
		this.streFileNm = pStreFileNm;
	}

	/**
	 * fileType attribute 값을 설정한다.
	 *
	 * @param pFileType
	 *        the fileType to set
	 */
	public void setFileType(final String pFileType) {
		this.fileType = pFileType;
	}

	/**
	 * fileType attribute를 리턴한다.
	 *
	 * @return the fileType
	 */
	public String getFileType() {
		return fileType;
	}

	/**
	 * @return the fileResult
	 */
	public final String getFileResult() {
		return fileResult;
	}

	/**
	 * @param pFileResult the fileResult to set
	 */
	public final void setFileResult(final String pFileResult) {
		fileResult = pFileResult;
	}

	/**
	 * @return the delYn
	 */
	public final String getDelYn() {
		return delYn;
	}

	/**
	 * @param pDelYn the delYn to set
	 */
	public final void setDelYn(final String pDelYn) {
		delYn = pDelYn;
	}

	/**
	 * @return the callBackFuncDelete
	 */
	public final String getCallBackFuncDelete() {
		return callBackFuncDelete;
	}

	/**
	 * @param pCallBackFuncDelete the callBackFuncDelete to set
	 */
	public final void setCallBackFuncDelete(final String pCallBackFuncDelete) {
		callBackFuncDelete = pCallBackFuncDelete;
	}

	/**
	 * @return the callBackFuncInsert
	 */
	public final String getCallBackFuncInsert() {
		return callBackFuncInsert;
	}

	/**
	 * @param pCallBackFuncInsert the callBackFuncInsert to set
	 */
	public final void setCallBackFuncInsert(final String pCallBackFuncInsert) {
		callBackFuncInsert = pCallBackFuncInsert;
	}

	/**
	 * @return the callBackFunc
	 */
	public final String getCallBackFunc() {
		return callBackFunc;
	}

	/**
	 * @param pCallBackFunc the callBackFunc to set
	 */
	public final void setCallBackFunc(final String pCallBackFunc) {
		callBackFunc = pCallBackFunc;
	}

	/**
	 * @return the editorNewLine
	 */
	public final String getEditorNewLine() {
		return editorNewLine;
	}

	/**
	 * @param pEditorNewLine the editorNewLine to set
	 */
	public final void setEditorNewLine(final String pEditorNewLine) {
		editorNewLine = pEditorNewLine;
	}

	/**
	 * @return the editorFileName
	 */
	public final String getEditorFileName() {
		return editorFileName;
	}

	/**
	 * @param pEditorFileName the editorFileName to set
	 */
	public final void setEditorFileName(final String pEditorFileName) {
		editorFileName = pEditorFileName;
	}

	/**
	 * @return the editorFileURL
	 */
	public final String getEditorFileURL() {
		return editorFileURL;
	}

	/**
	 * @param pEditorFileURL the editorFileURL to set
	 */
	public final void setEditorFileURL(final String pEditorFileURL) {
		editorFileURL = pEditorFileURL;
	}

	/**
	 * @return the altText
	 */
	public final String getAltText() {
		return altText;
	}

	/**
	 * @param pAltText the altText to set
	 */
	public final void setAltText(final String pAltText) {
		altText = pAltText;
	}

	/**
	 * @return the editorErrstr
	 */
	public final String getEditorErrstr() {
		return editorErrstr;
	}

	/**
	 * @param pEditorErrstr the editorErrstr to set
	 */
	public final void setEditorErrstr(final String pEditorErrstr) {
		editorErrstr = pEditorErrstr;
	}

	/**
	 * @return the imageWidth
	 */
	public final int getImageWidth() {
		return imageWidth;
	}

	/**
	 * @param pImageWidth the imageWidth to set
	 */
	public final void setImageWidth(final int pImageWidth) {
		imageWidth = pImageWidth;
	}

	/**
	 * @return the imageHeight
	 */
	public final int getImageHeight() {
		return imageHeight;
	}

	/**
	 * @param pImageHeight the imageHeight to set
	 */
	public final void setImageHeight(final int pImageHeight) {
		imageHeight = pImageHeight;
	}

	public byte[] getAtchFile() {
		return atchFile;
	}

	public void setAtchFile(byte[] atchFile) {
		this.atchFile = atchFile;
	}

	public String getParentSeq() {
		return parentSeq;
	}

	public void setParentSeq(String parentSeq) {
		this.parentSeq = parentSeq;
	}

}
