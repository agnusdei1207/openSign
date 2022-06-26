package com.open.mgr.mgr0111.service;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

import com.open.cmmn.model.CmmnDefaultVO;

/* 엑셀 다운로드 및 하이차트 VO */
@Alias("mgr0111VO")
@SuppressWarnings("serial")
public class Mgr0111VO extends CmmnDefaultVO implements Serializable {
	 
	private int totalPrice   ;
	private int avgPrice     ;
	private int totalTime    ;
	private int avgTime 	 ; 
	private int price 		 ; 
	
	private String rgstDt    ;
	private String rgstId    ;
	private String excelRow  ;
	private String workTime  ;
	private String staDate   ;
	private String endDate   ;
	private String cont      ;
	private String emplySeq  ;
	private String number 	 ;
	private String state  	 ;
	private String rstrnName ;
	private String etc  	 ;
	private String userSeq   ;
	private String elSeq     ;
	private String atchFileId;
	private String eatDate	 ;
	
	
	public String getEatDate() {
		return eatDate;
	}
	public void setEatDate(String eatDate) {
		this.eatDate = eatDate;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
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
	public String getUserSeq() {
		return userSeq;
	}
	public void setUserSeq(String userSeq) {
		this.userSeq = userSeq;
	}
	public String getElSeq() {
		return elSeq;
	}
	public void setElSeq(String elSeq) {
		this.elSeq = elSeq;
	}
	public String getAtchFileId() {
		return atchFileId;
	}
	public void setAtchFileId(String atchFileId) {
		this.atchFileId = atchFileId;
	}
	public String getRgstId() {
		return rgstId;
	}
	public void setRgstId(String rgstId) {
		this.rgstId = rgstId;
	}
	public String getStaDate() {
		return staDate;
	}
	public void setStaDate(String staDate) {
		this.staDate = staDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getCont() {
		return cont;
	}
	public void setCont(String cont) {
		this.cont = cont;
	}
	public String getEmplySeq() {
		return emplySeq;
	}
	public void setEmplySeq(String emplySeq) {
		this.emplySeq = emplySeq;
	}
	public String getWorkTime() {
		return workTime;
	}
	public void setWorkTime(String workTime) {
		this.workTime = workTime;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public int getAvgPrice() {
		return avgPrice;
	}
	public void setAvgPrice(int avgPrice) {
		this.avgPrice = avgPrice;
	}
	public int getTotalTime() {
		return totalTime;
	}
	public void setTotalTime(int totalTime) {
		this.totalTime = totalTime;
	}
	public int getAvgTime() {
		return avgTime;
	}
	public void setAvgTime(int avgTime) {
		this.avgTime = avgTime;
	}
	public String getRgstDt() {
		return rgstDt;
	}
	public void setRgstDt(String rgstDt) {
		this.rgstDt = rgstDt;
	}
	public String getExcelRow() {
		return excelRow;
	}
	public void setExcelRow(String excelRow) {
		this.excelRow = excelRow;
	}
	
	
	
	
	
	
}