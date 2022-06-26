package com.open.cmmn.web;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.support.WebBindingInitializer;
import org.springframework.web.context.request.WebRequest;

/**
 * <pre>
 * Class Name : EgovBindingInitializer.java
 * Description: WebBindingInitializer Implementation.
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
public class EgovBindingInitializer implements WebBindingInitializer {

	/**
	 * @see org.springframework.web.bind.support.WebBindingInitializer#initBinder(org.springframework.web.bind.WebDataBinder,
	 *      org.springframework.web.context.request.WebRequest)
	 */
	@Override
	public final void
			initBinder(final WebDataBinder binder, final WebRequest request) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		dateFormat.setLenient(false);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(
				dateFormat, false));
		binder.registerCustomEditor(String.class,
				new StringTrimmerEditor(false));
	}

}
