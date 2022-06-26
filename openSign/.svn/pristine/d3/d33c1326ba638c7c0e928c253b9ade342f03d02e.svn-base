package com.open.cmmn.web;

/**
 * <pre>
 * Class Name : PaginationInfo.java
 * Description: 페이징 처리 Info.
 * Modification Information
 * 
 *    수정일         수정자         수정내용
 *    -------        -------     -------------------
 *    2015.11.30.	 박현우		최초생성
 *
 * </pre>
 *
 * @author 박현우
 * @since 2015.11.30.
 * @version 1.0
 * @see <pre>
 *
 * </pre>
 */
public class PaginationInfo {

	/**
	 * Required Fields
	 * - 이 필드들은 페이징 계산을 위해 반드시 입력되어야 하는 필드 값들이다.
	 */

	/**
	 * 현재 페이지 번호.
	 */
	private int currentPageNo;
	/**
	 * 한 페이지당 게시되는 게시물 건 수.
	 */
	private int recordCountPerPage;
	/**
	 * 페이지 리스트에 게시되는 페이지 건수.
	 */
	private int pageSize;
	/**
	 * 전체 게시물 건 수.
	 */
	private int totalRecordCount;

	/**
	 * @return the currentPageNo
	 */
	public final int getCurrentPageNo() {
		return currentPageNo;
	}

	/**
	 * @param pCurrentPageNo the currentPageNo to set
	 */
	public final void setCurrentPageNo(final int pCurrentPageNo) {
		currentPageNo = pCurrentPageNo;
	}

	/**
	 * @return the recordCountPerPage
	 */
	public final int getRecordCountPerPage() {
		return recordCountPerPage;
	}

	/**
	 * @param pRecordCountPerPage the recordCountPerPage to set
	 */
	public final void setRecordCountPerPage(final int pRecordCountPerPage) {
		recordCountPerPage = pRecordCountPerPage;
	}

	/**
	 * @return the pageSize
	 */
	public final int getPageSize() {
		return pageSize;
	}

	/**
	 * @param pPageSize the pageSize to set
	 */
	public final void setPageSize(final int pPageSize) {
		pageSize = pPageSize;
	}

	/**
	 * @return the totalRecordCount
	 */
	public final int getTotalRecordCount() {
		return totalRecordCount;
	}

	/**
	 * @param pTotalRecordCount the totalRecordCount to set
	 */
	public final void setTotalRecordCount(final int pTotalRecordCount) {
		totalRecordCount = pTotalRecordCount;
	}

	/**
	 * Not Required Fields
	 * - 이 필드들은 Required Fields 값을 바탕으로 계산해서 정해지는 필드 값이다.
	 */

	/**
	 * 페이지 개수.
	 */
	private int totalPageCount;
	/**
	 * 페이지 리스트의 첫 페이지 번호.
	 */
	private int firstPageNoOnPageList;
	/**
	 * 페이지 리스트의 마지막 페이지 번호.
	 */
	private int lastPageNoOnPageList;
	/**
	 * 페이징 SQL의 조건절에 사용되는 시작 rownum.
	 */
	private int firstRecordIndex;
	/**
	 * 페이징 SQL의 조건절에 사용되는 마지막 rownum.
	 */
	private int lastRecordIndex;

	/**
	 * @return the totalPageCount
	 */
	public final int getTotalPageCount() {
		totalPageCount =
				((getTotalRecordCount() - 1) / getRecordCountPerPage()) + 1;
		return totalPageCount;
	}

	/**
	 * @return the firstPageNo
	 */
	public final int getFirstPageNo() {
		return 1;
	}

	/**
	 * @return the lastPageNo
	 */
	public final int getLastPageNo() {
		return getTotalPageCount();
	}

	/**
	 * @return the firstPageNoOnPageList
	 */
	public final int getFirstPageNoOnPageList() {
		firstPageNoOnPageList =
				((getCurrentPageNo() - 1) / getPageSize()) * getPageSize() + 1;
		return firstPageNoOnPageList;
	}

	/**
	 * @return the lastPageNoOnPageList
	 */
	public final int getLastPageNoOnPageList() {
		lastPageNoOnPageList = getFirstPageNoOnPageList() + getPageSize() - 1;
		if (lastPageNoOnPageList > getTotalPageCount()) {
			lastPageNoOnPageList = getTotalPageCount();
		}
		return lastPageNoOnPageList;
	}

	/**
	 * @return the firstRecordIndex
	 */
	public final int getFirstRecordIndex() {
		firstRecordIndex = (getCurrentPageNo() - 1) * getRecordCountPerPage();
		return firstRecordIndex;
	}

	/**
	 * @return the lastRecordIndex
	 */
	public final int getLastRecordIndex() {
		lastRecordIndex = getCurrentPageNo() * getRecordCountPerPage();
		return lastRecordIndex;
	}
}
