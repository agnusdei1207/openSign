package com.open.cmmn.model;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

import com.open.cmmn.util.SessionUtil;
import com.open.cmmn.util.StringUtil;

/**
 * <pre>
 * Class Name : CmmnDefaultVO.java
 * Description: 검색 정보를 담고있는 VO 클래스를 정의한다.
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
@Alias("cmmnDefaultVO")
public class CmmnDefaultVO implements Serializable {

	/**
	 * serialVersionUID..
	 */
	private static final long serialVersionUID = 5888300176455581852L;

	/** 현재 페이지 . */
	private int pageIndex = 1;
	
	/** pop 페이지 **/
	private int popPageIndex = 1;

	/** 검색조건 . */
	private String searchCondition = "";

	/** 검색키워드 . */
	private String searchKeyword = "";

	/** 검색시작일시 . */
	private String searchStartDate = "";

	/** 검색종료일시 . */
	private String searchEndDate = "";

	/** 검색 사용여부 . */
	private String searchDispYn = "";

	/** 기타 검색 조건 . */
	private String schEtc01 = "";

	/** 기타 검색 조건 . */
	private String schEtc02 = "";

	/** 기타 검색 조건 . */
	private String schEtc03 = "";

	/** 기타 검색 조건 . */
	private String schEtc04 = "";

	/** 기타 검색 조건. */
	private String schEtc05 = "";

	/** 기타 검색 조건. */
	private String schEtc06 = "";

	/** 기타 검색 조건. */
	private String schEtc07 = "";

	/** 기타 검색 조건. */
	private String schEtc08 = "";

	/** 기타 검색 조건. */
	private String schEtc09 = "";

	/** 기타 검색 조건. */
	private String schEtc10 = "";

	/** 기타 검색 조건. */
	private String[] schEtc11;

	/** 기타 검색 조건. */
	private String[] schEtc12;
	
	/** 기타 검색 조건. */
	private String schEtc13 = "";
	/** 기타 검색 조건. */
	private String schEtc14 = "";
	/** 기타 검색 조건. */
	private String schEtc15 = "";
	
	/* 팝업 검색어 */
	private String popSearchKeyword = "";
	
	/* 팝업 검색 조건 */
	private String popSearchCondition = "";
	
	/* 공지 검색구분*/
	private String notiCondition;
	/* 등록일 공지 시작일 종료일 검색구분*/
	private String dateCondition;
	/* 사업소 분류 검색구분*/
	private String placeCondition;

	/* 첨부파일 유무 */
	private String fileChk;
	
	/** 페이지 갯수 . */
	private int pageUnit; // properties에서 설정

	/** 페이지 사이즈 . */
	private int pageSize; // properties에서 설정

	/** 검색 페이지 사이즈 . */
	private int schPageUnit; // properties에서 설정

	/** 시작 인덱스 . */
	private int firstIndex = 1;

	/** 끝 인덱스 . */
	private int lastIndex = 1;
	
	
	private String pUnit;
	private String boardDivn;
	private String boardCd;
	private String loginSeq;
	private String siteClcd;
	
	private String mgrDivn;
	
	private String col1;
	private String col2;
	private String col3;
	private String col4;
	private String col5;
	private String col6;
	private String col7;
	private String col8;
	private String col9;
	private String col10;
	private String col11;
	private String col12;
	private String col13;
	private String col14;
	private String col15;
	private String col16;
	
	private String schYearMon;

	private String[] arrCol1;
	private String[] arrCol2;
	private String[] arrCol3;
	private String[] arrCol4;
	private String[] arrCol5;
	private String[] arrCol6;
	private String[] arrCol7;
	private String[] arrCol8;
	private String[] arrCol9;
	private String[] arrCol10;
	private String[] arrCol11;
	private String[] arrCol12;
	private String[] arrCol13;
	private String[] arrCol14;
	
	
	public String getpUnit() {
		return pUnit;
	}

	public void setpUnit(String pUnit) {
		this.pUnit = pUnit;
	}

	/**
	 * 로그인 아이디.
	 */
	@SuppressWarnings("unused")
	private String loginId;

	/**
	 * 로그인 사용자명.
	 */
	@SuppressWarnings("unused")
	private String loginNm;

	/** 등록 시퀀스. */
	private int insertSeq;
	
	private String frontLoginAuth;

	/**
	 * @return insertSeq
	 */
	public int getInsertSeq() {
		return insertSeq;
	}

	/**
	 * @param pInsertSeq insertSeq
	 */
	public void setInsertSeq(final int pInsertSeq) {
		this.insertSeq = pInsertSeq;
	}

	/**
	 * DEFAULT_RECORD_COUNT_PER_PAGE .
	 */
	private static final int DEFAULT_RECORD_COUNT_PER_PAGE = 10;
	/** 페이지 별 레코드 갯수 . */
	private int recordCountPerPage = DEFAULT_RECORD_COUNT_PER_PAGE;

	/** 로그인 사용자 아이디 . */
	//private String loginId = "";

	/** 로그인 사용자 명 . */
	//private String loginNm = "";

	/** 공통 게시판 코드 . */
	private String schBoardCd = "";

	/** 공통 게시판 코드 . */
	private String schCategoryCd = "";

	/** 등록자 아이디 . */
	private String regId = "";

	/** 등록자 명 . */
	private String regNm = "";

	/** 등록 일시 . */
	private String regDate = "";

	/** 수정자 아이디 . */
	private String modId = "";

	/** 수정 일시 . */
	private String modDate = "";

	/** 첨부파일 아이디 . */
	private String atchFileId = "";
	/**
	 * atchFileIdNm.
	 */
	private String atchFileIdNm = "";
	/**
	 * updateType.
	 */
	private String updateType = "";

	/**
	 * schBranchCd.
	 */
	private String schBranchCd = "";
	/**
	 * Array of arrBranchCd.
	 */
	private String[] arrBranchCd;
	/** 첨부파일 순번 . */
	private String fileSn = "";

	/** 채널파일 순번 . */
	private String chDivn = "";

	/** 검색 채널구분 . */
	private String searchChDivn = "";

	/** 업무구분 . */
	private String procType = "";
	
	private String frontLoginSeq;
	
	private String frontLoginId;

	private String frontLoginCmpy;
	 
	/* 모달 팝업  구분*/
	private String popDivn;
	
	/* 엑셀 다운 */
	private String excelDivn;
	
	private String excelYear;
	
	private String excelMonth;
	
	
	public String getPopDivn() {
		return popDivn;
	}

	public void setPopDivn(String popDivn) {
		this.popDivn = popDivn;
	}

	/**
	 * <pre>
	 * Description :  검색 조건을 를 설정한다.
	 * </pre>
	 *
	 * @param vo 검색조건
	 */
	public void setSearchVO(final CmmnDefaultVO vo) {
		this.pageIndex = vo.pageIndex;
		this.searchCondition = vo.getSearchCondition();
		this.searchKeyword = vo.getSearchKeyword();
		this.searchStartDate = vo.getSearchStartDate();
		this.searchEndDate = vo.getSearchEndDate();
		this.searchDispYn = vo.getSearchDispYn();
		this.searchChDivn = vo.getSearchChDivn();
		this.schEtc01 = vo.getSchEtc01();
		this.schEtc02 = vo.getSchEtc02();
		this.schEtc03 = vo.getSchEtc03();
		this.schEtc04 = vo.getSchEtc04();
		this.schEtc05 = vo.getSchEtc05();
		this.schEtc06 = vo.getSchEtc06();
		this.schEtc07 = vo.getSchEtc07();
		this.schEtc08 = vo.getSchEtc08();
		this.schEtc09 = vo.getSchEtc09();
		this.schEtc10 = vo.getSchEtc10();
		this.schEtc13 = vo.getSchEtc13();
		this.schEtc14 = vo.getSchEtc14();
		this.schEtc15 = vo.getSchEtc15();
		this.schBoardCd = vo.getSchBoardCd();
		this.schCategoryCd = vo.getSchCategoryCd();
		this.pageUnit = vo.pageUnit;
		this.pageSize = vo.pageSize;
		this.schPageUnit = vo.schPageUnit;
		this.firstIndex = vo.firstIndex;
		this.lastIndex = vo.lastIndex;
		this.recordCountPerPage = vo.recordCountPerPage;
		this.schBranchCd = vo.schBranchCd;
		this.boardDivn = vo.boardDivn;
		this.boardCd = vo.boardCd;
		
	}

	/**
	 * <pre>
	 * Description :  끝인덱스를 반환한다.
	 * </pre>
	 *
	 * @return 끝인덱스
	 */
	public int getLastIndex() {
		return lastIndex;
	}

	/**
	 * <pre>
	 * Description :  끝인덱스를 설정한다.
	 * </pre>
	 *
	 * @param pLastIndex 를 설정한다.될 끝인덱스
	 */
	public void setLastIndex(final int pLastIndex) {
		this.lastIndex = pLastIndex;
	}

	/**
	 * <pre>
	 * Description :  recordCountPerPage를 반환한다.
	 * </pre>
	 *
	 * @return recordCountPerPage
	 */
	public int getRecordCountPerPage() {
		return recordCountPerPage;
	}

	/**
	 * <pre>
	 * Description :  recordCountPerPage를 설정한다.
	 * </pre>
	 *
	 * @param pRecordCountPerPage 를 설정한다.될 recordCountPerPage
	 */
	public void setRecordCountPerPage(final int pRecordCountPerPage) {
		this.recordCountPerPage = pRecordCountPerPage;
	}

	/**
	 * <pre>
	 * Description :  first Index를 반환한다.
	 * </pre>
	 *
	 * @return first Index
	 */
	public int getFirstIndex() {
		return firstIndex;
	}

	/**
	 * <pre>
	 * Description :  first Index를 설정한다.
	 * </pre>
	 *
	 * @param pFirstIndex 를 설정한다.될 first Index
	 */
	public void setFirstIndex(final int pFirstIndex) {
		this.firstIndex = pFirstIndex;
	}

	/**
	 * <pre>
	 * Description :  현재 페이지를 반환한다.
	 * </pre>
	 *
	 * @return int 현재 페이지
	 */
	public int getPageIndex() {
		return pageIndex;
	}

	/**
	 * <pre>
	 * Description :  현재 페이지를 설정한다.
	 * </pre>
	 *
	 * @param pPageIndex 를 설정한다.될 현재 페이지
	 */
	public void setPageIndex(final int pPageIndex) {
		this.pageIndex = pPageIndex;
	}

	/**
	 * <pre>
	 * Description :  검색조건을 반환한다.
	 * </pre>
	 *
	 * @return String 검색조건
	 */
	public String getSearchCondition() {
		return searchCondition;
	}

	/**
	 * <pre>
	 * Description :  검색조건을 설정한다.
	 * </pre>
	 *
	 * @param pSearchCondition 검색조건
	 */
	public void setSearchCondition(final String pSearchCondition) {
		this.searchCondition = pSearchCondition;
	}

	/**
	 * <pre>
	 * Description :  검색키워드를 반환한다.
	 * </pre>
	 *
	 * @return String 검색키워드
	 */
	public String getSearchKeyword() {
		return searchKeyword;
	}

	/**
	 * <pre>
	 * Description :  검색키워드를 설정한다.
	 * </pre>
	 *
	 * @param pSearchKeyword 를 설정한다.될 검색키워드
	 */
	public void setSearchKeyword(final String pSearchKeyword) {
		this.searchKeyword = pSearchKeyword;
	}

	/**
	 * <pre>
	 * Description :  검색시작일시를 반환한다.
	 * </pre>
	 *
	 * @return String 검색키워드
	 */
	public String getSearchStartDate() {
		return searchStartDate;
	}

	/**
	 * <pre>
	 * Description :  검색시작일시를 설정한다.
	 * </pre>
	 *
	 * @param pSearchStartDate 를 설정한다.될 검색키워드
	 */
	public void setSearchStartDate(final String pSearchStartDate) {
		this.searchStartDate = pSearchStartDate;
	}

	/**
	 * <pre>
	 * Description :  검색종료일시를 반환한다.
	 * </pre>
	 *
	 * @return String 검색키워드
	 */
	public String getSearchEndDate() {
		return searchEndDate;
	}

	/**
	 * <pre>
	 * Description :  검색종료일시를 설정한다.
	 * </pre>
	 *
	 * @param pSearchEndDate 를 설정한다.될 검색키워드
	 */
	public void setSearchEndDate(final String pSearchEndDate) {
		this.searchEndDate = pSearchEndDate;
	}

	/**
	 * <pre>
	 * Description :  전시여부를 반환한다.
	 * </pre>
	 *
	 * @return String 검색사용여부
	 */
	public String getSearchDispYn() {
		return searchDispYn;
	}

	/**
	 * @param pSearchDispYn 전시여부를 설정한다.
	 */
	public void setSearchDispYn(final String pSearchDispYn) {
		this.searchDispYn = pSearchDispYn;
	}

	/**
	 * <pre>
	 * Description :  페이지 수를 반환한다.
	 * </pre>
	 *
	 * @return int 페이지 수
	 */
	public int getPageUnit() {
		return pageUnit;
	}

	/**
	 * <pre>
	 * Description :  페이지 수를 설정한다.
	 * </pre>
	 *
	 * @param pPageUnit 페이지 수
	 */
	public void setPageUnit(final int pPageUnit) {
		this.pageUnit = pPageUnit;
	}

	/**
	 * <pre>
	 * Description :  페이지 사이즈를 반환한다.
	 * </pre>
	 *
	 * @return int 페이지 사이즈
	 */
	public int getPageSize() {
		return pageSize;
	}

	/**
	 * <pre>
	 * Description :  페이지 사이즈를 설정한다.
	 * </pre>
	 *
	 * @param pPageSize 페이지 사이즈
	 */
	public void setPageSize(final int pPageSize) {
		this.pageSize = pPageSize;
	}

	/** @return SchPageUnit. */
	public int getSchPageUnit() {
		return schPageUnit;
	}

	/** @param pSchPageUnit pSchPageUnit. */
	public void setSchPageUnit(final int pSchPageUnit) {
		this.schPageUnit = pSchPageUnit;
	}

	// User Auth
	/**
	 * @return Login ID
	 * @throws Exception 
	 */
	public String getLoginId() throws Exception {
		if (SessionUtil.getUserDetails() != null) {
			return StringUtil.nullString(SessionUtil.getUserDetails().getId());
		} else {
			return "";
		}
	}

	/** @param pLoginId pLoginId. */
	/*
	 * public void setLoginId(final String pLoginId) {
	 * this.loginId = pLoginId;
	 * }
	 */
	/**
	 * @return LoginNm
	 * @throws Exception 
	 */
	public String getLoginNm() throws Exception {
		if (SessionUtil.getUserDetails() != null) {
			return StringUtil.nullString(SessionUtil.getUserDetails().getName());
		} else {
			return "";
		}
	}

	/** @param pLoginNm pLoginNm. */
	/*
	 * public void setLoginNm(final String pLoginNm) {
	 * this.loginNm = pLoginNm;
	 * }
	 */
	// User Auth
	/**
	 * @return 로그인 권한 리스트
	 */
	/*public List<String> getLoginAutho() {
		List<String> listAuth = new ArrayList<String>();

		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		if (authentication != null) {
			Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();

			Iterator<? extends GrantedAuthority> iter = authorities.iterator();

			while (iter.hasNext()) {
				GrantedAuthority auth = iter.next();
				listAuth.add(auth.getAuthority());
			}
			return listAuth;
		} else {
			return null;
		}
	}*/

	/**
	 * <pre>
	 * Description :  검색에 대한 정보를 문자열로 반환한다.
	 * </pre>
	 *
	 * @return String 검색에 대한 정보
	 */
	@Override
	public String toString() {
		return "SearchVO [pageIndex=" + pageIndex + ", searchCondition=" + searchCondition + ", searchKeyword=" + searchKeyword + ", searchDispYn="
				+ searchDispYn + ", pageUnit=" + pageUnit + ", pageSize=" + pageSize + ", searchStartDate=" + searchStartDate + ", searchEndDate="
				+ searchEndDate + "]";
	}

	/** @return UpdateType. */
	public String getUpdateType() {
		return updateType;
	}

	/** @param pUpdateType pUpdateType. */
	public void setUpdateType(final String pUpdateType) {
		this.updateType = pUpdateType;
	}

	/** @return AtchFileIdNm. */
	public String getAtchFileIdNm() {
		return atchFileIdNm;
	}

	/** @param pAtchFileIdNm pAtchFileIdNm. */
	public void setAtchFileIdNm(final String pAtchFileIdNm) {
		this.atchFileIdNm = pAtchFileIdNm;
	}

	/** @param pRegId 등록자 아이디의 정보를 설정한다. */
	public void setRegId(final String pRegId) {
		this.regId = pRegId;
	}

	/** @return 등록자 아이디의 정보를 리턴한다. */
	public String getRegId() {
		return regId;
	}

	/** @param pRegNm 등록자 명의 정보를 설정한다. */
	public void setRegNm(final String pRegNm) {
		this.regNm = pRegNm;
	}

	/** @return 등록자 명의 정보를 리턴한다. */
	public String getRegNm() {
		return regNm;
	}

	/** @param pRegDate 등록 일시의 정보를 설정한다. */
	public void setRegDate(final String pRegDate) {
		this.regDate = pRegDate;
	}

	/** @return 등록 일시의 정보를 리턴한다. */
	public String getRegDate() {
		return regDate;
	}

	/** @param pModId 수정자 아이디의 정보를 설정한다. */
	public void setModId(final String pModId) {
		this.modId = pModId;
	}

	/** @return 수정자 아이디의 정보를 리턴한다. */
	public String getModId() {
		return modId;
	}

	/** @param pModDate 수정 일시의 정보를 설정한다. */
	public void setModDate(final String pModDate) {
		this.modDate = pModDate;
	}

	/** @return 수정 일시의 정보를 리턴한다. */
	public String getModDate() {
		return modDate;
	}

	/** @param pAtchFileId 첨부파일의 정보를 설정한다. */
	public void setAtchFileId(final String pAtchFileId) {
		this.atchFileId = pAtchFileId;
	}

	/** @return 첨부파일의 정보를 리턴한다. */
	public String getAtchFileId() {
		return atchFileId;
	}

	/** @param pFileSn 첨부파일 순번의 정보를 설정한다. */
	public void setFileSn(final String pFileSn) {
		this.fileSn = pFileSn;
	}

	/** @return 첨부파일 순번의 정보를 리턴한다. */
	public String getFileSn() {
		return fileSn;
	}

	/** @param pChDivn 채널구분의 정보를 설정한다. */
	public void setChDivn(final String pChDivn) {
		this.chDivn = pChDivn;
	}

	/** @return 채널구분의 정보를 리턴한다. */
	public String getChDivn() {
		return chDivn;
	}

	/** @param pSearchChDivn 채널구분의 정보를 설정한다. */
	public void setSearchChDivn(final String pSearchChDivn) {
		this.searchChDivn = pSearchChDivn;
	}

	/** @return 채널구분의 정보를 리턴한다. */
	public String getSearchChDivn() {
		return searchChDivn;
	}

	/** @param pProcType 업무구분의 정보를 설정한다. */
	public void setProcType(final String pProcType) {
		this.procType = pProcType;
	}

	/** @return 업무구분의 정보를 리턴한다. */
	public String getProcType() {
		return procType;
	}

	/** @param pSchEtc01 기타검색조건의 정보를 설정한다. */
	public void setSchEtc01(final String pSchEtc01) {
		this.schEtc01 = pSchEtc01;
	}

	/** @return 기타검색조건의 정보를 리턴한다. */
	public String getSchEtc01() {
		return schEtc01;
	}

	/** @param pSchEtc02 기타검색조건의 정보를 설정한다. */
	public void setSchEtc02(final String pSchEtc02) {
		this.schEtc02 = pSchEtc02;
	}

	/** @return 기타검색조건의 정보를 리턴한다. */
	public String getSchEtc02() {
		return schEtc02;
	}

	/** @param pSchEtc03 기타검색조건의 정보를 설정한다. */
	public void setSchEtc03(final String pSchEtc03) {
		this.schEtc03 = pSchEtc03;
	}

	/** @return 기타검색조건의 정보를 리턴한다. */
	public String getSchEtc03() {
		return schEtc03;
	}

	/** @param pSchEtc04 기타검색조건의 정보를 설정한다. */
	public void setSchEtc04(final String pSchEtc04) {
		this.schEtc04 = pSchEtc04;
	}

	/** @return 기타검색조건의 정보를 리턴한다. */
	public String getSchEtc04() {
		return schEtc04;
	}

	/** @param pSchBoardCd 기타검색조건의 정보를 설정한다. */
	public void setSchBoardCd(final String pSchBoardCd) {
		this.schBoardCd = pSchBoardCd;
	}

	/** @return 기타검색조건의 정보를 리턴한다. */
	public String getSchBoardCd() {
		return schBoardCd;
	}

	/**
	 * @return the schCategoryCd
	 */
	public final String getSchCategoryCd() {
		return schCategoryCd;
	}

	/**
	 * @param pSchCategoryCd the schCategoryCd to set
	 */
	public final void setSchCategoryCd(final String pSchCategoryCd) {
		schCategoryCd = pSchCategoryCd;
	}

	/**
	 * @return the schEtc05
	 */
	public final String getSchEtc05() {
		return schEtc05;
	}

	/**
	 * @param pSchEtc05 the schEtc05 to set
	 */
	public final void setSchEtc05(final String pSchEtc05) {
		schEtc05 = pSchEtc05;
	}

	/**
	 * @return the schEtc06
	 */
	public final String getSchEtc06() {
		return schEtc06;
	}

	/**
	 * @param pSchEtc06 the schEtc06 to set
	 */
	public final void setSchEtc06(final String pSchEtc06) {
		schEtc06 = pSchEtc06;
	}

	/**
	 * @return the schEtc07
	 */
	public final String getSchEtc07() {
		return schEtc07;
	}

	/**
	 * @param pSchEtc07 the schEtc07 to set
	 */
	public final void setSchEtc07(final String pSchEtc07) {
		schEtc07 = pSchEtc07;
	}

	/**
	 * @return the schEtc08
	 */
	public final String getSchEtc08() {
		return schEtc08;
	}

	/**
	 * @param pSchEtc08 the schEtc08 to set
	 */
	public final void setSchEtc08(final String pSchEtc08) {
		schEtc08 = pSchEtc08;
	}

	/**
	 * @return the schEtc09
	 */
	public final String getSchEtc09() {
		return schEtc09;
	}

	/**
	 * @param pSchEtc09 the schEtc09 to set
	 */
	public final void setSchEtc09(final String pSchEtc09) {
		schEtc09 = pSchEtc09;
	}

	/**
	 * @return the schEtc10
	 */
	public final String getSchEtc10() {
		return schEtc10;
	}

	/**
	 * @param pSchEtc10 the schEtc10 to set
	 */
	public final void setSchEtc10(final String pSchEtc10) {
		schEtc10 = pSchEtc10;
	}

	/**
	 * @return the schEtc11
	 */
	public final String[] getSchEtc11() {
		return schEtc11;
	}

	/**
	 * @param pSchEtc11 the schEtc11 to set
	 */
	public final void setSchEtc11(final String[] pSchEtc11) {
		schEtc11 = pSchEtc11;
	}

	/**
	 * @return the schEtc12
	 */
	public final String[] getSchEtc12() {
		return schEtc12;
	}

	/**
	 * @param pSchEtc12 the schEtc12 to set
	 */
	public final void setSchEtc12(final String[] pSchEtc12) {
		schEtc12 = pSchEtc12;
	}

	/**
	 * @return the arrBranchCd
	 */
	public final String[] getArrBranchCd() {
		return arrBranchCd;
	}

	/**
	 * @param pArrBranchCd the arrBranchCd to set
	 */
	public final void setArrBranchCd(final String[] pArrBranchCd) {
		arrBranchCd = pArrBranchCd;
	}

	/** @return SchBranchCd. */
	public String getSchBranchCd() {
		return schBranchCd;
	}

	/** @param pSchBranchCd pSchBranchCd. */
	public void setSchBranchCd(final String pSchBranchCd) {
		this.schBranchCd = pSchBranchCd;
	}

	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}

	public String getBoardDivn() {
		return boardDivn;
	}

	public void setBoardDivn(String boardDivn) {
		this.boardDivn = boardDivn;
	}

	public String getBoardCd() {
		return boardCd;
	}

	public void setBoardCd(String boardCd) {
		this.boardCd = boardCd;
	}

	public String getLoginSeq() throws Exception {
		if (SessionUtil.getUserDetails() != null) {
			return StringUtil.nullString(SessionUtil.getUserDetails().getSeq());
		} else {
			return "";
		}
	}

	public void setLoginSeq(String loginSeq) {
		this.loginSeq = loginSeq;
	}

	public String[] getArrCol1() {
		String[] newArrCol1 = null;
		if(this.arrCol1 != null){
			newArrCol1 = new String[arrCol1.length];
			for (int i = 0; i < arrCol1.length; i++) {
				newArrCol1[i] = this.arrCol1[i];
			}
		}
		return newArrCol1;
	}
	public void setArrCol1(String[] arrCol1) {
		this.arrCol1 = new String[arrCol1.length];
		for (int i = 0; i < arrCol1.length; i++) 
		this.arrCol1[i] = arrCol1[i];
	}
	public String[] getArrCol2() {
		String[] newArrCol2 = null;
		if(this.arrCol2 != null){
			newArrCol2 = new String[arrCol1.length];
			for (int i = 0; i < arrCol2.length; i++) {
				newArrCol2[i] = this.arrCol2[i];
			}
		}
		return newArrCol2;
	}
	public void setArrCol2(String[] arrCol2) {
		this.arrCol2 = new String[arrCol2.length];
		for (int i = 0; i < arrCol2.length; i++) 
		this.arrCol2[i] = arrCol2[i];
	}
	public String[] getArrCol3() {
		String[] newArrCol3 = null;
		if(this.arrCol3 != null){
			newArrCol3 = new String[arrCol1.length];
			for (int i = 0; i < arrCol3.length; i++) {
				newArrCol3[i] = this.arrCol3[i];
			}
		}
		return newArrCol3;
	}
	public void setArrCol3(String[] arrCol3) {
		this.arrCol3 = new String[arrCol3.length];
		for (int i = 0; i < arrCol3.length; i++) 
		this.arrCol3[i] = arrCol3[i];
	}
	public String[] getArrCol4() {
		String[] newArrCol4 = null;
		if(this.arrCol4 != null){
			newArrCol4 = new String[arrCol1.length];
			for (int i = 0; i < arrCol4.length; i++) {
				newArrCol4[i] = this.arrCol4[i];
			}
		}
		return newArrCol4;
	}
	public void setArrCol4(String[] arrCol4) {
		this.arrCol4 = new String[arrCol4.length];
		for (int i = 0; i < arrCol4.length; i++) 
		this.arrCol4[i] = arrCol4[i];
	}
	public String[] getArrCol5() {
		String[] newArrCol5 = null;
		if(this.arrCol5 != null){
			newArrCol5 = new String[arrCol1.length];
			for (int i = 0; i < arrCol5.length; i++) {
				newArrCol5[i] = this.arrCol5[i];
			}
		}
		return newArrCol5;
	}
	public void setArrCol5(String[] arrCol5) {
		this.arrCol5 = new String[arrCol5.length];
		for (int i = 0; i < arrCol5.length; i++) 
		this.arrCol5[i] = arrCol5[i];
	}
	public String[] getArrCol6() {
		String[] newArrCol6 = null;
		if(this.arrCol6 != null){
			newArrCol6 = new String[arrCol1.length];
			for (int i = 0; i < arrCol6.length; i++) {
				newArrCol6[i] = this.arrCol6[i];
			}
		}
		return newArrCol6;
	}
	public void setArrCol6(String[] arrCol6) {
		this.arrCol6 = new String[arrCol6.length];
		for (int i = 0; i < arrCol6.length; i++) 
		this.arrCol6[i] = arrCol6[i];
	}
	public String[] getArrCol7() {
		String[] newArrCol7 = null;
		if(this.arrCol7 != null){
			newArrCol7 = new String[arrCol1.length];
			for (int i = 0; i < arrCol7.length; i++) {
				newArrCol7[i] = this.arrCol7[i];
			}
		}
		return newArrCol7;
	}
	public void setArrCol7(String[] arrCol7) {
		this.arrCol7 = new String[arrCol7.length];
		for (int i = 0; i < arrCol7.length; i++) 
		this.arrCol7[i] = arrCol7[i];
	}
	public String[] getArrCol8() {
		String[] newArrCol8 = null;
		if(this.arrCol8 != null){
			newArrCol8 = new String[arrCol1.length];
			for (int i = 0; i < arrCol8.length; i++) {
				newArrCol8[i] = this.arrCol8[i];
			}
		}
		return newArrCol8;
	}
	public void setArrCol8(String[] arrCol8) {
		this.arrCol8 = new String[arrCol8.length];
		for (int i = 0; i < arrCol8.length; i++) 
		this.arrCol8[i] = arrCol8[i];
	}
	public String[] getArrCol9() {
		String[] newArrCol9 = null;
		if(this.arrCol9 != null){
			newArrCol9 = new String[arrCol1.length];
			for (int i = 0; i < arrCol9.length; i++) {
				newArrCol9[i] = this.arrCol9[i];
			}
		}
		return newArrCol9;
	}
	public void setArrCol9(String[] arrCol9) {
		this.arrCol9 = new String[arrCol9.length];
		for (int i = 0; i < arrCol9.length; i++) 
		this.arrCol9[i] = arrCol9[i];
	}
	public String[] getArrCol10() {
		String[] newArrCol10 = null;
		if(this.arrCol10 != null){
			newArrCol10 = new String[arrCol1.length];
			for (int i = 0; i < arrCol10.length; i++) {
				newArrCol10[i] = this.arrCol10[i];
			}
		}
		return newArrCol10;
	}
	public void setArrCol10(String[] arrCol10) {
		this.arrCol10 = new String[arrCol10.length];
		for (int i = 0; i < arrCol10.length; i++) 
		this.arrCol10[i] = arrCol10[i];
	}

	public String[] getArrCol11() {
		String[] newArrCol11 = null;
		if(this.arrCol11 != null){
			newArrCol11 = new String[arrCol1.length];
			for (int i = 0; i < arrCol11.length; i++) {
				newArrCol11[i] = this.arrCol11[i];
			}
	}
		return newArrCol11;
	}
	public void setArrCol11(String[] arrCol11) {
		this.arrCol11 = new String[arrCol11.length];
		for (int i = 0; i < arrCol11.length; i++) 
		this.arrCol11[i] = arrCol11[i];
	}

	public String[] getArrCol12() {
		String[] newArrCol12 = null;
		if(this.arrCol12 != null){
			newArrCol12 = new String[arrCol1.length];
			for (int i = 0; i < arrCol12.length; i++) {
				newArrCol12[i] = this.arrCol12[i];
			}
	}
		return newArrCol12;
	}
	public void setArrCol12(String[] arrCol12) {
		this.arrCol12 = new String[arrCol12.length];
		for (int i = 0; i < arrCol12.length; i++) 
		this.arrCol12[i] = arrCol12[i];
	}

	public String[] getArrCol13() {
		String[] newArrCol13 = null;
		if(this.arrCol13 != null){
			newArrCol13 = new String[arrCol1.length];
			for (int i = 0; i < arrCol13.length; i++) {
				newArrCol13[i] = this.arrCol13[i];
			}
	}
		return newArrCol13;
	}

	public void setArrCol13(String[] arrCol13) {
		this.arrCol13 = new String[arrCol13.length];
		for (int i = 0; i < arrCol13.length; i++) 
		this.arrCol13[i] = arrCol13[i];
	}

	public String[] getArrCol14() {
		String[] newArrCol14 = null;
		if(this.arrCol14 != null){
			newArrCol14 = new String[arrCol1.length];
			for (int i = 0; i < arrCol14.length; i++) {
				newArrCol14[i] = this.arrCol14[i];
			}
	}
		return newArrCol14;
	}

	public void setArrCol14(String[] arrCol14) {
		this.arrCol14 = new String[arrCol14.length];
		for (int i = 0; i < arrCol14.length; i++) 
		this.arrCol14[i] = arrCol14[i];
	}

	public void setLoginNm(String loginNm) {
		this.loginNm = loginNm;
	}

	public String getCol1() {
		return col1;
	}

	public void setCol1(String col1) {
		this.col1 = col1;
	}

	public String getCol2() {
		return col2;
	}

	public void setCol2(String col2) {
		this.col2 = col2;
	}

	public String getCol3() {
		return col3;
	}

	public void setCol3(String col3) {
		this.col3 = col3;
	}

	public String getCol4() {
		return col4;
	}

	public void setCol4(String col4) {
		this.col4 = col4;
	}

	public String getCol5() {
		return col5;
	}

	public void setCol5(String col5) {
		this.col5 = col5;
	}

	public String getCol6() {
		return col6;
	}

	public void setCol6(String col6) {
		this.col6 = col6;
	}

	public String getCol7() {
		return col7;
	}

	public void setCol7(String col7) {
		this.col7 = col7;
	}

	public String getCol8() {
		return col8;
	}

	public void setCol8(String col8) {
		this.col8 = col8;
	}

	public String getCol9() {
		return col9;
	}

	public void setCol9(String col9) {
		this.col9 = col9;
	}

	public String getCol10() {
		return col10;
	}

	public String getCol11() {
		return col11;
	}

	public void setCol11(String col11) {
		this.col11 = col11;
	}

	public String getCol12() {
		return col12;
	}

	public void setCol12(String col12) {
		this.col12 = col12;
	}

	public void setCol10(String col10) {
		this.col10 = col10;
	}

	public String getCol13() {
		return col13;
	}

	public void setCol13(String col13) {
		this.col13 = col13;
	}

	public String getCol14() {
		return col14;
	}

	public void setCol14(String col14) {
		this.col14 = col14;
	}

	public String getCol15() {
		return col15;
	}

	public void setCol15(String col15) {
		this.col15 = col15;
	}

	public String getCol16() {
		return col16;
	}

	public void setCol16(String col16) {
		this.col16 = col16;
	}

	public String getSchEtc13() {
		return schEtc13;
	}

	public void setSchEtc13(String schEtc13) {
		this.schEtc13 = schEtc13;
	}

	public String getSchEtc14() {
		return schEtc14;
	}

	public void setSchEtc14(String schEtc14) {
		this.schEtc14 = schEtc14;
	}

	public String getSchEtc15() {
		return schEtc15;
	}

	public void setSchEtc15(String schEtc15) {
		this.schEtc15 = schEtc15;
	}
	public String getDateCondition() {
		return dateCondition;
	}

	public void setDateCondition(String dateCondition) {
		this.dateCondition = dateCondition;
	}

	public String getNotiCondition() {
		return notiCondition;
	}

	public void setNotiCondition(String notiCondition) {
		this.notiCondition = notiCondition;
	}

	public String getPlaceCondition() {
		return placeCondition;
	}

	public void setPlaceCondition(String placeCondition) {
		this.placeCondition = placeCondition;
	}
	
	public String getFileChk() {
		return fileChk;
	}

	public void fileChk(String fileChk) {
		this.fileChk = fileChk;
	}

	public void setFrontLoginSeq(String frontLoginSeq) {
		this.frontLoginSeq = frontLoginSeq;
	}
	
	

	public String getSiteClcd() {
		return siteClcd;
	}

	public void setSiteClcd(String siteClcd) {
		this.siteClcd = siteClcd;
	}

	/*public String getFrontLoginId() throws Exception {
		if (SessionUtil.getUserFrtDetails() != null) {
			return StringUtil.nullString(SessionUtil.getUserFrtDetails().getUserId());
		} else {
			return "";		
		}
	}*/

	public void setFrontLoginId(String frontLoginId) {
		this.frontLoginId = frontLoginId;
	}


	/*public String getFrontLoginAuth() throws Exception {
		if (SessionUtil.getUserFrtDetails() != null) {
			return StringUtil.nullString(SessionUtil.getUserFrtDetails().getUserAuth());
		} else {
			return "";		
		}
	}*/

	public void setFrontLoginAuth(String frontLoginAuth) {
		this.frontLoginAuth = frontLoginAuth;
	}

	/*public String getFrontLoginCmpy() throws Exception {
		if (SessionUtil.getUserFrtDetails() != null) {
			return StringUtil.nullString(SessionUtil.getUserFrtDetails().getCmpy());
		} else {
			return "";		
		}
	}*/

	public void setFrontLoginCmpy(String frontLoginCmpy) {
		this.frontLoginCmpy = frontLoginCmpy;
	}

	public String getMgrDivn() {
		return mgrDivn;
	}

	public void setMgrDivn(String mgrDivn) {
		this.mgrDivn = mgrDivn;
	}

	public String getSchYearMon() {
		return schYearMon;
	}

	public void setSchYearMon(String schYearMon) {
		this.schYearMon = schYearMon;
	}

	public int getPopPageIndex() {
		return popPageIndex;
	}

	public void setPopPageIndex(int popPageIndex) {
		this.popPageIndex = popPageIndex;
	}

	public String getPopSearchKeyword() {
		return popSearchKeyword;
	}

	public void setPopSearchKeyword(String popSearchKeyword) {
		this.popSearchKeyword = popSearchKeyword;
	}
 
	public String getPopSearchCondition() {
		return popSearchCondition;
	}

	public void setPopSearchCondition(String popSearchCondition) {
		this.popSearchCondition = popSearchCondition;
	}

	public String getExcelDivn() {
		return excelDivn;
	}

	public void setExcelDivn(String excelDivn) {
		this.excelDivn = excelDivn;
	}

	public String getExcelYear() {
		return excelYear;
	}

	public void setExcelYear(String excelYear) {
		this.excelYear = excelYear;
	}

	public String getExcelMonth() {
		return excelMonth;
	}

	public void setExcelMonth(String excelMonth) {
		this.excelMonth = excelMonth;
	}
	
	
	
}
