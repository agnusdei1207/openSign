package com.open.cmmn;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import egovframework.rte.fdl.cmmn.exception.handler.ExceptionHandler;

/**
 * <pre>
 * Class Name : EgovComOthersExcepHndlr.java
 * Description: Other Exception Handler.
 * Modification Information
 * 
 *    수정일         수정자         수정내용
 *    -------        -------     -------------------
 *    2016. 11. 1.	 User		최초생성
 *
 * </pre>
 *
 * @author User
 * @since 2016. 11. 1.
 * @version 1.0
 * @see <pre>
 *
 * </pre>
 */
public class EgovComOthersExcepHndlr implements ExceptionHandler {

	/**
	 * LOGGER.
	 */
	private static final Logger LOGGER = LoggerFactory
			.getLogger(EgovComOthersExcepHndlr.class);

	/**
	 * @see egovframework.rte.fdl.cmmn.exception.handler.ExceptionHandler#occur(java.lang.Exception,
	 *      java.lang.String)
	 */
	@Override
	public final void
			occur(final Exception exception, final String packageName) {
		//log.debug(" EgovServiceExceptionHandler run...............");
		LOGGER.error(packageName, exception);
	}
}
