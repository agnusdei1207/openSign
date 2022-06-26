package com.open.mgr.mgr0016.service;

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
@Alias("mgr0016VO")
public class Mgr0016VO extends CmmnDefaultVO implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -8192420272775711412L;
	
	/* 로그 일련번호 */
	private String logSeq;
	/* 접속IP */
	private String clientIp;
	/* 등록자 */
	private String rgstId;
	/* 등록일 */
	private String rgstDt;
	/* 로그구분 */
	private String logDivn;
	/* 아이디 */
	private String id;
	/* 이름 */
	private String name;
	
	private String menuLogSeq;
	private String menuUrl;
	private String menuCd;
	private String menuDivn;
	
	private String menuNm;
	private String searchDivn;
	private String cnt;
	private String failCnt;
	private String seq;
	
	private String[] arrTemp;
	
	
	public String[] getArrTemp() {
		return arrTemp;
	}
	public void setArrTemp(String[] arrTemp) {
		this.arrTemp = arrTemp;
	}
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getFailCnt() {
		return failCnt;
	}
	public void setFailCnt(String failCnt) {
		this.failCnt = failCnt;
	}
	public String getCnt() {
		return cnt;
	}
	public void setCnt(String cnt) {
		this.cnt = cnt;
	}
	public String getMenuNm() {
		return menuNm;
	}
	public void setMenuNm(String menuNm) {
		this.menuNm = menuNm;
	}
	public String getSearchDivn() {
		return searchDivn;
	}
	public void setSearchDivn(String searchDivn) {
		this.searchDivn = searchDivn;
	}
	public String getLogSeq() {
		return logSeq;
	}
	public void setLogSeq(String logSeq) {
		this.logSeq = logSeq;
	}
	public String getClientIp() {
		return clientIp;
	}
	public void setClientIp(String clientIp) {
		this.clientIp = clientIp;
	}
	public String getRgstId() {
		return rgstId;
	}
	public void setRgstId(String rgstId) {
		this.rgstId = rgstId;
	}
	public String getRgstDt() {
		return rgstDt;
	}
	public void setRgstDt(String rgstDt) {
		this.rgstDt = rgstDt;
	}
	public String getLogDivn() {
		return logDivn;
	}
	public void setLogDivn(String logDivn) {
		this.logDivn = logDivn;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMenuLogSeq() {
		return menuLogSeq;
	}
	public void setMenuLogSeq(String menuLogSeq) {
		this.menuLogSeq = menuLogSeq;
	}
	public String getMenuUrl() {
		return menuUrl;
	}
	public void setMenuUrl(String menuUrl) {
		this.menuUrl = menuUrl;
	}
	public String getMenuCd() {
		return menuCd;
	}
	public void setMenuCd(String menuCd) {
		this.menuCd = menuCd;
	}
	public String getMenuDivn() {
		return menuDivn;
	}
	public void setMenuDivn(String menuDivn) {
		this.menuDivn = menuDivn;
	}
}