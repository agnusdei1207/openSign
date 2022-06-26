package com.open.cmmn;

import java.util.Locale;

import org.springframework.context.MessageSource;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;

/**
 * <pre>
 * Class Name : EgovMessageSource.java
 * Description: 메시지 리소스 사용을 위한 MessageSource 인터페이스 및 ReloadableResourceBundleMessageSource 클래스의 구현체.
 * Modification Information
 *
 *    수정일         수정자         수정내용
 *    -------        -------     -------------------
 *    2009.03.11  이문준          최초 생성
 *
 * </pre>
 *
 * @author 이문준
 * @since 2009.03.11
 * @version 1.0
 * @see <pre>
 *
 * </pre>
 */
public class EgovMessageSource extends ReloadableResourceBundleMessageSource
		implements MessageSource {

	/**
	 * ReloadableResourceBundleMessageSource.
	 */
	private ReloadableResourceBundleMessageSource reloadableResourceBundleMessageSource;

	/**
	 * @return the reloadableResourceBundleMessageSource
	 */
	public final ReloadableResourceBundleMessageSource
			getReloadableResourceBundleMessageSource() {
		return reloadableResourceBundleMessageSource;
	}

	/**
	 * @param pReloadableResourceBundleMessageSource the
	 *        reloadableResourceBundleMessageSource to set
	 */
	public final
			void
			setReloadableResourceBundleMessageSource(
					final ReloadableResourceBundleMessageSource pReloadableResourceBundleMessageSource) {
		reloadableResourceBundleMessageSource =
				pReloadableResourceBundleMessageSource;
	}

	/**
	 * <pre>
	 * Description : 정의된 메세지 조회.
	 * </pre>
	 *
	 * @param code - 메세지 코드
	 * @return String
	 */
	public final String getMessage(final String code) {
		return getReloadableResourceBundleMessageSource().getMessage(code,
				null, Locale.getDefault());
	}

	/**
	 * <pre>
	 * Description : 정의된 메세지 조회.
	 * </pre>
	 *
	 * @param code - 메세지 코드
	 * @param args - 메세지 파라메터 배열
	 * @return String
	 */
	public final String getMessage(final String code, final Object[] args) {
		return getReloadableResourceBundleMessageSource().getMessage(code,
				args, Locale.getDefault());
	}
}
