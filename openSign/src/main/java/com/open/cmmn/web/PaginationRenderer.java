package com.open.cmmn.web;

/**
 * <pre>
 * Class Name : PaginationRenderer.java
 * Description: PaginationRenderer interface.
 * Modification Information
 *   
 *    수정일         수정자         수정내용
 *    -------        -------     -------------------
 *   2015.11.30.	 박현우		최초생성
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
public interface PaginationRenderer {

	/**
	 * <pre>
	 * Description : renderPagination.
	 * </pre>
	 * 
	 * @param paginationInfo PaginationInfo
	 * @param jsFunction Javascript Function Name
	 * @return String 페이징 html
	 */
	String renderPagination(PaginationInfo paginationInfo, String jsFunction);

}
