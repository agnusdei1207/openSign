package com.open.mgr.mgr0117.service;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

import com.open.cmmn.model.CmmnDefaultVO;
import com.open.cmmn.util.StringUtil;


@SuppressWarnings("serial")
@Alias("mgr0117VO")
public class Mgr0117VO extends CmmnDefaultVO implements Serializable {
	
	private String elSeq     ;  
	private String number    ;   
	private String state	 ;
	private String atchFileId;  
	private String rgstDt    ;  
	private String rgstId    ;  
	private String rgstSeq   ;  
	private String eatDate   ;  
	private String userSeq   ;
	private String price     ;  
	private String rstrnName ;  
	private String etc       ;
	private String name      ;
	private String approver  ;
	
	/* 즐겨찾기 */ 
	private String fvrtsSeq  ;
	private String fvrtsYn   ;
	private String useYn     ;
	  
	/* 엑셀 */
	private String excelRow	 ;
	
	
	public String getApprover() {
		return approver;
	}
	public void setApprover(String approver) {
		this.approver = approver;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getFvrtsYn() {
		return fvrtsYn;
	}
	public void setFvrtsYn(String fvrtsYn) {
		this.fvrtsYn = fvrtsYn;
	}
	public String getExcelRow() {
		return excelRow;
	}
	public void setExcelRow(String excelRow) {
		this.excelRow = excelRow;
	}
	public String getUseYn() {
		return useYn;
	}
	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}
	public String getFvrtsSeq() {
		return fvrtsSeq;
	}
	public void setFvrtsSeq(String fvrtsSeq) {
		this.fvrtsSeq = fvrtsSeq;
	}
	public String getRgstSeq() { 
		return rgstSeq;
	}
	public void setRgstSeq(String rgstSeq) {
		this.rgstSeq = rgstSeq;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getElSeq() {
		return elSeq;
	}
	public void setElSeq(String elSeq) {
		this.elSeq = elSeq;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	} 
	public String getAtchFileId() {
		return atchFileId;
	}
	public void setAtchFileId(String atchFileId) {
		this.atchFileId = atchFileId;
	}
	public String getRgstDt() {
		return rgstDt;
	}
	public void setRgstDt(String rgstDt) {
		this.rgstDt = rgstDt;
	}
	public String getRgstId() {
		return rgstId;
	}
	public void setRgstId(String rgstId) {
		this.rgstId = rgstId;
	}
	
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	
	public String getEatDate() { 
		return eatDate;
	}
	public void setEatDate(String eatDate) {
		this.eatDate = eatDate;
	}
	
	public String getUserSeq() {
		return userSeq;
	}
	public void setUserSeq(String userSeq) {
		this.userSeq = userSeq;
	}
	public String getRstrnName() {
		return rstrnName;
	}
	public void setRstrnName(String rstrnName) {
		this.rstrnName = rstrnName;
	}
	public String getEtc() {
		return etc;
	}
	public void setEtc(String etc) {
		this.etc = etc; 
	}
	
	
	
	
}