package com.open.mgr.mgr0017.service;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

import com.open.cmmn.model.CmmnDefaultVO;

/**
 * Content VO 클래스
 * @author 공통서비스 개발팀 yd.go
 * @since 2016.09.08
 * @version 1.0
 * @see
 *  
 
 */
@Alias("mgr0017VO")
public class Mgr0017VO extends CmmnDefaultVO implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -8192420272775711412L;
	
	/* 에러 일련번호 */
	private String seq;
	/* 에러종류 */
	private String errType;
	/* 에러메시지 */
	private String errMsg;
	/* 에러전체메시지 */
	private String fullErrMsg;
	/* 파라미터값 */
	private String paramVal;
	/* 메뉴코드 */
	private String errMenuCd;
	/* 에러페이지 */
	private String errPage;
	/* 에러페이지URL */
	private String errPageUrl;
	/* 등록일 */
	private String rgstDt;
	/* IP */
	private String ip;
	/* 등록자 */
	private String rgstId;
	/* 메뉴이름 */
	private String menuNm;
	
	
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getErrType() {
		return errType;
	}
	public void setErrType(String errType) {
		this.errType = errType;
	}
	public String getErrMsg() {
		return errMsg;
	}
	public void setErrMsg(String errMsg) {
		this.errMsg = errMsg;
	}
	public String getFullErrMsg() {
		return fullErrMsg;
	}
	public void setFullErrMsg(String fullErrMsg) {
		this.fullErrMsg = fullErrMsg;
	}
	public String getParamVal() {
		return paramVal;
	}
	public void setParamVal(String paramVal) {
		this.paramVal = paramVal;
	}
	public String getErrMenuCd() {
		return errMenuCd;
	}
	public void setErrMenuCd(String errMenuCd) {
		this.errMenuCd = errMenuCd;
	}
	public String getErrPage() {
		return errPage;
	}
	public void setErrPage(String errPage) {
		this.errPage = errPage;
	}
	public String getErrPageUrl() {
		return errPageUrl;
	}
	public void setErrPageUrl(String errPageUrl) {
		this.errPageUrl = errPageUrl;
	}
	public String getRgstDt() {
		return rgstDt;
	}
	public void setRgstDt(String rgstDt) {
		this.rgstDt = rgstDt;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getRgstId() {
		return rgstId;
	}
	public void setRgstId(String rgstId) {
		this.rgstId = rgstId;
	}
	public String getMenuNm() {
		return menuNm;
	}
	public void setMenuNm(String menuNm) {
		this.menuNm = menuNm;
	}

	
	
	
	
}