package com.open.mgr.mgr0116.service;

import java.io.Serializable;
import java.util.List;

import org.apache.ibatis.type.Alias;

import com.open.cmmn.model.CmmnDefaultVO;


@Alias("mgr0116VO")
public class Mgr0116VO extends CmmnDefaultVO implements Serializable {
	private static final long serialVersionUID = 2172623835339565860L;
	   
	private String clSeq 	  ;
	private String name       ;
	private String number     ;
	private String state      ;
	private String rgstDt     ;
	private String rgstId     ;
	private String rgstSeq    ;
	private String approver   ;
	 
	private String rentalDate ;
	private String returnDate ;
	private String Etc		  ; 
	
	/* 엑셀 */
	private String excelRow	  ;   
	private String useYn	  ; 
 	
	  
	
	
	
	public String getApprover() {
		return approver;
	}
	public void setApprover(String approver) {
		this.approver = approver;
	}
	public String getUseYn() {
		return useYn;
	}
	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}
	public String getExcelRow() {
		return excelRow;
	}
	public void setExcelRow(String excelRow) {
		this.excelRow = excelRow;
	}
	public String getRgstSeq() {
		return rgstSeq;
	}
	public void setRgstSeq(String rgstSeq) {
		this.rgstSeq = rgstSeq; 
	}
	
	public String getClSeq() {
		return clSeq;
	}
	public void setClSeq(String clSeq) {
		this.clSeq = clSeq;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
 	public String getRentalDate() {
		return rentalDate;
	}
	public void setRentalDate(String rentalDate) {
		this.rentalDate = rentalDate;
	}
	
	public String getReturnDate() {
		return returnDate;
	}
	public void setReturnDate(String returnDate) {
		this.returnDate = returnDate;
	}
	public String getEtc() {
		return Etc;
	}
	public void setEtc(String etc) {
		Etc = etc;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
	
	
}