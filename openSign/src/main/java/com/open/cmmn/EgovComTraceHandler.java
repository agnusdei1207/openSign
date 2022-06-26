package com.open.cmmn;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import egovframework.rte.fdl.cmmn.trace.handler.TraceHandler;

/**
 * <pre>
 * Class Name : EgovComTraceHandler.java
 * Description: 공통서비스의 trace 처리 클래스
 * Modification Information
 *
 *    수정일         수정자         수정내용
 *    -------        -------     -------------------
 *    2011. 09. 30.     JJY
 *
 * </pre>
 *
 * @author JJY
 * @since 2011. 9. 30.
 * @version 1.0
 * @see <pre>
 *
 * </pre>
 */
public class EgovComTraceHandler implements TraceHandler {

	/**
	 * LOGGER.
	 */
	private static final Logger LOGGER = LoggerFactory
			.getLogger(EgovComTraceHandler.class);

	/**
	 * @see egovframework.rte.fdl.cmmn.trace.handler.TraceHandler#todo(java.lang.Class,
	 *      java.lang.String)
	 */
	@Override
	public final void todo(final Class<?> clazz, final String message) {
		LOGGER.debug("[TRACE]CLASS::: {}", clazz.getName());
		LOGGER.debug("[TRACE]MESSAGE::: {}", message);
		//이곳에서 후속처리로 필요한 액션을 취할 수 있다.
	}
}
