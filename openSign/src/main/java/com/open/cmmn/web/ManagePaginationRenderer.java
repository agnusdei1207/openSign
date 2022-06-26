package com.open.cmmn.web;

import javax.servlet.ServletContext;

import org.springframework.web.context.ServletContextAware;

import egovframework.rte.ptl.mvc.tags.ui.pagination.AbstractPaginationRenderer;

/**
 * ImagePaginationRenderer.java 클래스.
 *
 * @author 서준식
 * @since 2011. 9. 16.
 * @version 1.0
 * @see
 *
 *      <pre>
 * << 개정이력(Modification Information) >>
 * 
 *   수정일      수정자           수정내용
 *  -------    -------------    ----------------------
 *   2011. 9. 16.   서준식       이미지 경로에 ContextPath추가
 * </pre>
 */
public class ManagePaginationRenderer extends AbstractPaginationRenderer implements ServletContextAware {

	/**
	 * ServletContext.
	 */
	@SuppressWarnings("unused")
	private ServletContext servletContext;

	/**
	 * Constructor of ImagePaginationRenderer.java class.
	 */
	public ManagePaginationRenderer() {
		// no-op
	}

	/**
	 * <pre>
	 * Description : initVariables.
	 * </pre>
	 */
	public void initVariables() {
		firstPageLabel = "<a href=\"#\" class=\"btn_page first\" onclick=\"{0}(''addList'',''addList.do'',{1}); return false;\"><span class=\"hide\">처음페이지로 가기</span></a>\n";
		previousPageLabel = "<a href=\"#\" class=\"btn_page prev\" onclick=\"{0}(''addList'',''addList.do'',{1}); return false;\"><span class=\"hide\">이전페이지로 가기</span></a>\n";
		currentPageLabel = "<strong>{0}</strong>\n";
		otherPageLabel = "<a href=\"#\" onclick=\"{0}(''addList'',''addList.do'',{1}); return false;\">{2}</a>\n";
		nextPageLabel = "<a href=\"#\" class=\"btn_page next\" onclick=\"{0}(''addList'',''addList.do'',{1}); return false;\"><span class=\"hide\">다음페이지로 가기</span></a>\n";
		lastPageLabel = "<a href=\"#\" class=\"btn_page last\" onclick=\"{0}(''addList'',''addList.do'',{1}); return false;\"><span class=\"hide\">마지막페이지로 가기</span></a>\n";
	}

	@Override
	public void setServletContext(final ServletContext pServletContext) {
		this.servletContext = pServletContext;
		initVariables();
	}

}
