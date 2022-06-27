package com.open.mgr.mgr0013.service;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

import com.open.cmmn.model.CmmnDefaultVO;

 
@Alias("mgr0013VO")
public class Mgr0013VO extends CmmnDefaultVO implements Serializable {
	private static final long serialVersionUID = 2172623835339565860L;
	
	private String sendSeq;
	private String useYn;
	private String rgstId;
	private String rgstDt;
	private String ttl;
	private String cont;
	private String dvsn;
	private String rgstNm;
	private String sendDetailSeq;
	private String userSeq;
	private String userAddr;
	private String userDvsn;
	private String userNm;
	
	private String userId;
	private String userMail;
	private String userMblp;
	
	private String menuGrp;
	
	private String arrUserSeq;
	private String arrUserNm;
	private String arrUserMail;
	private String[] arrTemp;
	private String[] arrayUserSeq;
	private String[] arrayUserNm;
	private String[] arrayUserMail;
	
	
	
	public String getMenuGrp() {
		return menuGrp;
	}
	public void setMenuGrp(String menuGrp) {
		this.menuGrp = menuGrp;
	}
	public String[] getArrayUserSeq() {
		return arrayUserSeq;
	}
	public void setArrayUserSeq(String[] arrayUserSeq) {
		this.arrayUserSeq = arrayUserSeq;
	}
	public String[] getArrayUserNm() {
		return arrayUserNm;
	}
	public void setArrayUserNm(String[] arrayUserNm) {
		this.arrayUserNm = arrayUserNm;
	}
	public String[] getArrayUserMail() {
		return arrayUserMail;
	}
	public void setArrayUserMail(String[] arrayUserMail) {
		this.arrayUserMail = arrayUserMail;
	}
	public String getArrUserNm() {
		return arrUserNm;
	}
	public void setArrUserNm(String arrUserNm) {
		this.arrUserNm = arrUserNm;
	}
	public String getArrUserMail() {
		return arrUserMail;
	}
	public void setArrUserMail(String arrUserMail) {
		this.arrUserMail = arrUserMail;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserMail() {
		return userMail;
	}
	public void setUserMail(String userMail) {
		this.userMail = userMail;
	}
	public String getUserMblp() {
		return userMblp;
	}
	public void setUserMblp(String userMblp) {
		this.userMblp = userMblp;
	}
	public String getArrUserSeq() {
		return arrUserSeq;
	}
	public void setArrUserSeq(String arrUserSeq) {
		this.arrUserSeq = arrUserSeq;
	}
	public String[] getArrTemp() {
		return arrTemp;
	}
	public void setArrTemp(String[] arrTemp) {
		this.arrTemp = arrTemp;
	}
	public String getUserNm() {
		return userNm;
	}
	public void setUserNm(String userNm) {
		this.userNm = userNm;
	}
	public String getSendSeq() {
		return sendSeq;
	}
	public void setSendSeq(String sendSeq) {
		this.sendSeq = sendSeq;
	}
	public String getUseYn() {
		return useYn;
	}
	public void setUseYn(String useYn) {
		this.useYn = useYn;
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
	public String getTtl() {
		return ttl;
	}
	public void setTtl(String ttl) {
		this.ttl = ttl;
	}
	public String getCont() {
		return cont;
	}
	public void setCont(String cont) {
		this.cont = cont;
	}
	public String getDvsn() {
		return dvsn;
	}
	public void setDvsn(String dvsn) {
		this.dvsn = dvsn;
	}
	public String getRgstNm() {
		return rgstNm;
	}
	public void setRgstNm(String rgstNm) {
		this.rgstNm = rgstNm;
	}
	public String getSendDetailSeq() {
		return sendDetailSeq;
	}
	public void setSendDetailSeq(String sendDetailSeq) {
		this.sendDetailSeq = sendDetailSeq;
	}
	public String getUserSeq() {
		return userSeq;
	}
	public void setUserSeq(String userSeq) {
		this.userSeq = userSeq;
	}
	public String getUserAddr() {
		return userAddr;
	}
	public void setUserAddr(String userAddr) {
		this.userAddr = userAddr;
	}
	public String getUserDvsn() {
		return userDvsn;
	}
	public void setUserDvsn(String userDvsn) {
		this.userDvsn = userDvsn;
	} 
}