package com.open.cmmn;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import egovframework.rte.fdl.cmmn.exception.handler.ExceptionHandler;

/**
 * <pre>
 * Class Name : EgovComExcepHndlr.java
 * Description:  공통서비스의 exception 처리 클래스.
 * Modification Information
 *
 *    수정일         수정자         수정내용
 *    -------        -------     -------------------
 *    2016. 11. 1.	 User		최초생성
 *
 * </pre>
 *
 * @author 공통 서비스 개발팀 이삼섭
 * @since 2009. 3. 13.
 * @version 1.0
 * @see <pre>
 *
 * </pre>
 */
public class EgovComExcepHndlr implements ExceptionHandler {

	/**
	 * LOGGER.
	 */
	private static final Logger LOGGER = LoggerFactory
			.getLogger(EgovComExcepHndlr.class);

	/**
	 * @see egovframework.rte.fdl.cmmn.exception.handler.ExceptionHandler#occur(java.lang.Exception,
	 *      java.lang.String)
	 */
	@Override
	public final void occur(final Exception ex, final String packageName) {
		LOGGER.debug("[HANDLER][PACKAGE]::: {}", packageName);
		LOGGER.debug("[HANDLER][Exception]:::", ex);
	}
}
