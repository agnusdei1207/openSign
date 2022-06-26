package com.open.mgr.mgr0006.service;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

import com.open.cmmn.model.CmmnDefaultVO;
import com.open.cmmn.util.StringUtil;

/**
 * Content VO 클래스
 * 
 * @author 공통서비스 개발팀 yd.go
 * @since 2016.09.08
 * @version 1.0
 * @see
 * 
 * 
 */
@Alias("mgr0006VO")
public class Mgr0006VO extends CmmnDefaultVO implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 2172623835339565860L;

	/* 일련번호 */
	private String seq;
	
	/* 팀 일련번호 */
	private String teamSeq;

	/* 아이디 */
	private String id;

	/* 패스워드 */
	private String pwd;

	/* 패스워드2 */
	private String pwdChk;

	/* 이름 */
	private String name;
	
	/* 부서  */
	private String part;
		
	/* 직급 */
	private String position;
	
	/* 등록일 */
	private String rgstDt;

	/* 등록자 */
	private String rgstId;

	/* 메뉴일련번호 */
	private String menuSeq;

	/* 메뉴 배열 */
	private String[] arrMenu;

	/* 권한코드 */
	private String authCode;

	/* 전화번호 */
	private String tel;

	/* 사용여부 */
	private String useYn;

	/* 핸드폰 번호 */
	private String hp;

	/**/
	private String rank1;

	/**/
	private String rank2;

	/* 첨부파일 ID */
	private String atchFileId;

	/* 첨부파일 ID2 */
	private String atchFileId2;

	/* 이메일 */
	private String email;

	/* 권한코드 이름 */
	private String authCodeNm;

	/* 핸드폰1 */
	private String hp01;

	/* 핸드폰2 */
	private String hp02;

	/* 핸드폰3 */
	private String hp03;

	/* 전화번호1 */
	private String tel01;

	/* 전화번호2 */
	private String tel02;

	/* 최종접속일 */
	private String lastDate;

	/* push 여부 */
	private String pushYn;

	/* 개통확인서 시공책임자 */
	private String chargeYn;

	private String sosNm;
	private String sosCd1;
	private String pernr;
	private String ename;
	private String aupnr;
	private String aupnm;
	private String aprdt;
	private String sosCd2;

	private String sabeon;
	private String jikchek;
	private String jikwi;
	private String jAddr;
	private String telSa;
	private String telHand;
	private String autoYn;
	private String extnsNmbr;
	private String dprt;
	private String pDprt;
	private String dprtNm;
	private String siteClcd;

	private String siteClcdNm;
	private String dprt1;
	private String dprt2;

	private String failCnt;
	private String clientIp;
	private String comMailYn;
	private String fvrtsYn;
	

	/* 모달 팝업 리스트 조회 */
	private String elSeq;
	

	public String getElSeq() {
		return elSeq;
	}    

	public void setElSeq(String elSeq) {
		this.elSeq = elSeq;
	}
	public String getTeamSeq() {
		return teamSeq;
	}

	public void setTeamSeq(String teamSeq) {
		this.teamSeq = teamSeq;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public String getPart() {
		return part;
	}

	public void setPart(String part) {
		this.part = part;
	}

	public String getExtnsNmbr() {
		return extnsNmbr;
	}

	public void setExtnsNmbr(String extnsNmbr) {
		this.extnsNmbr = extnsNmbr;
	}

	public String getChargeYn() {
		return chargeYn;
	}

	public void setChargeYn(String chargeYn) {
		this.chargeYn = chargeYn;
	}

	public String getPushYn() {
		return pushYn;
	}

	public void setPushYn(String pushYn) {
		this.pushYn = pushYn;
	}

	public String getTel() throws Exception {

		if (!StringUtil.nullString(this.tel01).equals("") && !StringUtil.nullString(this.tel02).equals("")) {
			this.tel = this.tel01 + "-" + this.tel02;
		}

		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getUseYn() {
		return useYn;
	}

	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}

	public String getSeq() {
		return seq;
	}

	public void setSeq(String seq) {
		this.seq = seq;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getPwdChk() {
		return pwdChk;
	}

	public void setPwdChk(String pwdChk) {
		this.pwdChk = pwdChk;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	public String getMenuSeq() {
		return menuSeq;
	}

	public void setMenuSeq(String menuSeq) {
		this.menuSeq = menuSeq;
	}

	public String[] getArrMenu() {
		return arrMenu;
	}

	public void setArrMenu(String[] arrMenu) {
		this.arrMenu = arrMenu;
	}

	public String getAuthCode() {
		return authCode;
	}

	public void setAuthCode(String authCode) {
		this.authCode = authCode;
	}

	public String getHp() throws Exception {

		if (!StringUtil.nullString(this.hp01).equals("") && !StringUtil.nullString(this.hp02).equals("")
				&& !StringUtil.nullString(this.hp03).equals("")) {
			this.hp = this.hp01 + "-" + this.hp02 + "-" + this.hp03;
		}

		return hp;
	}

	public void setHp(String hp) {
		this.hp = hp;
	}

	public String getRank1() {
		return rank1;
	}

	public void setRank1(String rank1) {
		this.rank1 = rank1;
	}

	public String getRank2() {
		return rank2;
	}

	public void setRank2(String rank2) {
		this.rank2 = rank2;
	}

	public String getAtchFileId() {
		return atchFileId;
	}

	public void setAtchFileId(String atchFileId) {
		this.atchFileId = atchFileId;
	}

	public String getAtchFileId2() {
		return atchFileId2;
	}

	public void setAtchFileId2(String atchFileId2) {
		this.atchFileId2 = atchFileId2;
	}

	public String getHp01() {
		return hp01;
	}

	public void setHp01(String hp01) {
		this.hp01 = hp01;
	}

	public String getHp02() {
		return hp02;
	}

	public void setHp02(String hp02) {
		this.hp02 = hp02;
	}

	public String getHp03() {
		return hp03;
	}

	public void setHp03(String hp03) {
		this.hp03 = hp03;
	}

	public String getTel01() {
		return tel01;
	}

	public void setTel01(String tel01) {
		this.tel01 = tel01;
	}

	public String getTel02() {
		return tel02;
	}

	public void setTel02(String tel02) {
		this.tel02 = tel02;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getLastDate() {
		return lastDate;
	}

	public void setLastDate(String lastDate) {
		this.lastDate = lastDate;
	}

	public String getAuthCodeNm() {
		return authCodeNm;
	}

	public void setAuthCodeNm(String authCodeNm) {
		this.authCodeNm = authCodeNm;
	}

	public String getSosNm() {
		return sosNm;
	}

	public void setSosNm(String sosNm) {
		this.sosNm = sosNm;
	}

	public String getSosCd1() {
		return sosCd1;
	}

	public void setSosCd1(String sosCd1) {
		this.sosCd1 = sosCd1;
	}

	public String getPernr() {
		return pernr;
	}

	public void setPernr(String pernr) {
		this.pernr = pernr;
	}

	public String getEname() {
		return ename;
	}

	public void setEname(String ename) {
		this.ename = ename;
	}

	public String getAupnr() {
		return aupnr;
	}

	public void setAupnr(String aupnr) {
		this.aupnr = aupnr;
	}

	public String getAupnm() {
		return aupnm;
	}

	public void setAupnm(String aupnm) {
		this.aupnm = aupnm;
	}

	public String getAprdt() {
		return aprdt;
	}

	public void setAprdt(String aprdt) {
		this.aprdt = aprdt;
	}

	public String getSosCd2() {
		return sosCd2;
	}

	public void setSosCd2(String sosCd2) {
		this.sosCd2 = sosCd2;
	}

	public String getSabeon() {
		return sabeon;
	}

	public void setSabeon(String sabeon) {
		this.sabeon = sabeon;
	}

	public String getJikchek() {
		return jikchek;
	}

	public void setJikchek(String jikchek) {
		this.jikchek = jikchek;
	}

	public String getJikwi() {
		return jikwi;
	}

	public void setJikwi(String jikwi) {
		this.jikwi = jikwi;
	}

	public String getjAddr() {
		return jAddr;
	}

	public void setjAddr(String jAddr) {
		this.jAddr = jAddr;
	}

	public String getTelSa() {
		return telSa;
	}

	public void setTelSa(String telSa) {
		this.telSa = telSa;
	}

	public String getTelHand() {
		return telHand;
	}

	public void setTelHand(String telHand) {
		this.telHand = telHand;
	}

	public String getAutoYn() {
		return autoYn;
	}

	public void setAutoYn(String autoYn) {
		this.autoYn = autoYn;
	}

	public String getDprt() {
		return dprt;
	}

	public void setDprt(String dprt) {
		this.dprt = dprt;
	}

	public String getpDprt() {
		return pDprt;
	}

	public void setpDprt(String pDprt) {
		this.pDprt = pDprt;
	}

	public String getDprtNm() {
		return dprtNm;
	}

	public void setDprtNm(String dprtNm) {
		this.dprtNm = dprtNm;
	}

	public String getSiteClcd() {
		return siteClcd;
	}

	public void setSiteClcd(String siteClcd) {
		this.siteClcd = siteClcd;
	}

	public String getSiteClcdNm() {
		return siteClcdNm;
	}

	public void setSiteClcdNm(String siteClcdNm) {
		this.siteClcdNm = siteClcdNm;
	}

	public String getDprt1() {
		return dprt1;
	}

	public void setDprt1(String dprt1) {
		this.dprt1 = dprt1;
	}

	public String getDprt2() {
		return dprt2;
	}

	public void setDprt2(String dprt2) {
		this.dprt2 = dprt2;
	}

	public String getFailCnt() {
		return failCnt;
	}

	public void setFailCnt(String failCnt) {
		this.failCnt = failCnt;
	}

	public String getClientIp() {
		return clientIp;
	}

	public void setClientIp(String clientIp) {
		this.clientIp = clientIp;
	}

	public String getComMailYn() {
		return comMailYn;
	}

	public void setComMailYn(String comMailYn) {
		this.comMailYn = comMailYn;
	}

	public String getFvrtsYn() {
		return fvrtsYn;
	}

	public void setFvrtsYn(String fvrtsYn) {
		this.fvrtsYn = fvrtsYn;
	}
	

}