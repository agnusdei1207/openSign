package com.open.mgr.mgr0118.service;

import java.io.Serializable;
import java.util.List;

import org.apache.ibatis.type.Alias;

import com.open.cmmn.model.CmmnDefaultVO;
import com.open.cmmn.util.StringUtil;

@Alias("mgr0118VO")
public class Mgr0118VO extends CmmnDefaultVO implements Serializable {
	private static final long serialVersionUID = 2172623835339565860L;
	
	/* T_OVER_TIME */
	private String otSeq;
	private String rgstDt;
	private String rvseDt;
	private String rgstId;
	private String rvseId;
	private String approver;
	private String prjctNm;
	private String etc;
	private String status;
	
	private String seq;
	private String position;
	private String name;
	private String teamMail;
	
	/* T_OVER_ADD */
	private String adSeq;
	private String emplySeq;
	private String staDate;
	private String endDate;
	private String staHour;
	private String staMin;
	private String endHour;
	private String endMin;
	private String cont;
	private String emplyName;
	
	/* 엑셀 */
	private String excelRow;
	
	
	public String getTeamMail() {
		return teamMail;
	}
	public void setTeamMail(String teamMail) {
		this.teamMail = teamMail;
	}
	public String getOtSeq() {
		return otSeq;
	}
	public void setOtSeq(String otSeq) {
		this.otSeq = otSeq;
	}
	public String getRgstDt() {
		return rgstDt;
	}
	public void setRgstDt(String rgstDt) {
		this.rgstDt = rgstDt;
	}
	public String getRvseDt() {
		return rvseDt;
	}
	public void setRvseDt(String rvseDt) {
		this.rvseDt = rvseDt;
	}
	public String getRgstId() {
		return rgstId;
	}
	public void setRgstId(String rgstId) {
		this.rgstId = rgstId;
	}
	public String getRvseId() {
		return rvseId;
	}
	public void setRvseId(String rvseId) {
		this.rvseId = rvseId;
	}
	public String getPrjctNm() {
		return prjctNm;
	}
	public void setPrjctNm(String prjctNm) {
		this.prjctNm = prjctNm;
	}
	public String getEtc() {
		return etc;
	}
	public void setEtc(String etc) {
		this.etc = etc;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAdSeq() {
		return adSeq;
	}
	public void setAdSeq(String adSeq) {
		this.adSeq = adSeq;
	}
	public String getEmplySeq() {
		return emplySeq;
	}
	public void setEmplySeq(String emplySeq) {
		this.emplySeq = emplySeq;
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
	public String getStaHour() {
		return staHour;
	}
	public void setStaHour(String staHour) {
		this.staHour = staHour;
	}
	public String getStaMin() {
		return staMin;
	}
	public void setStaMin(String staMin) {
		this.staMin = staMin;
	}
	public String getCont() {
		return cont;
	}
	public void setCont(String cont) {
		this.cont = cont;
	}
	public String getEmplyName() {
		return emplyName;
	}
	public void setEmplyName(String emplyName) {
		this.emplyName = emplyName;
	}
	public String getExcelRow() {
		return excelRow;
	}
	public void setExcelRow(String excelRow) {
		this.excelRow = excelRow;
	}
	public String getEndHour() {
		return endHour;
	}
	public void setEndHour(String endHour) {
		this.endHour = endHour;
	}
	public String getEndMin() {
		return endMin;
	}
	public void setEndMin(String endMin) {
		this.endMin = endMin;
	}
	public String getApprover() {
		return approver;
	}
	public void setApprover(String approver) {
		this.approver = approver;
	}
	
	
			   
}

