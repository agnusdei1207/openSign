package com.open.cmmn;

import java.io.IOException;
import java.io.Reader;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.BodyTagSupport;

import org.apache.taglibs.standard.tag.common.core.Util;

/**
 * <pre>
 * Class Name : EgovComCrossSiteHndlr.java
 * Description: Cross-Site Scripting 체크하여 값을 되돌려 받는 핸들러 JSP TLD, 자바에서 사용가능.
 * Modification Information
 *
 *    수정일         수정자         수정내용
 *    -------        -------     -------------------
 *   2010.11.09  장동한          최초 생성
 *
 * </pre>
 *
 * @author 공통서비스 장동한
 * @since 2010.11.09
 * @version 1.0
 * @see <pre>
 *
 * </pre>
 */
public class EgovComCrossSiteHndlr extends BodyTagSupport {

	/*
	 * (One almost wishes XML and JSP could support "anonymous tags," given the
	 * amount of trouble we had naming this one!) :-) - sb
	 */

	// *********************************************************************
	// Internal state

	/**
	 * serialVersionUID.
	 */
	private static final long serialVersionUID = -6750233818675360686L;
	/**
	 * Maximum size of Buffer.
	 */
	private static final int MAX_BUFFER = 4096;

	/** tag attribute. */
	private Object value;

	/** tag attribute. */
	private String def;

	/** tag attribute. */
	private boolean escapeXml;

	/** non-space body needed?. */
	private boolean needBody;

	// *********************************************************************
	// Construction and initialization

	/**
	 * .
	 */
	private String mDiffChar = "()[]{}\"',:;= \t\r\n%!+-";
	//private String mDiffChar ="()[]{}\"',:;=%!+-";
	/**
	 * .
	 */
	private String[] mArrDiffChar = {
			"&#40;", "&#41;",
			"&#91;", "&#93;",
			"&#123;", "&#125;",
			"&#34;", "&#39;",
			"&#44;", "&#58;",
			"&#59;", "&#61;",
			" ", "\t", //" ","\t",
			"\r", "\n", //"\r","\n",
			"&#37;", "&#33;",
			"&#43;", "&#45;"
	};

	/**
	 * Constructs a new handler. As with TagSupport, subclasses should not
	 * provide other constructors and are expected to call the superclass
	 * constructor.
	 */
	public EgovComCrossSiteHndlr() {
		super();
		init();
	}

	/**
	 * <pre>
	 * Description : resets local state.
	 * </pre>
	 */
	private void init() {
		value = null;
		def = null;
		escapeXml = true;
		needBody = false;
	}

	//

	/**
	 * <pre>
	 * Description : Releases any resources we may have (or inherit).
	 * </pre>
	 *
	 * @see javax.servlet.jsp.tagext.BodyTagSupport#release()
	 */
	@Override
	public final void release() {
		super.release();
		init();
	}

	/**
	 * <pre>
	 * Description : evaluates 'value' and determines if the body should be evaluted.
	 * </pre>
	 *
	 * @see javax.servlet.jsp.tagext.BodyTagSupport#doStartTag()
	 */
	@Override
	public final int doStartTag() throws JspException {

		needBody = false; // reset state related to 'default'
		this.bodyContent = null; // clean-up body (just in case container is
									// pooling tag handlers)

		JspWriter out = pageContext.getOut();
		//LOGGER.debug("EgovComCrossSiteFilter> ============================");
		try {
			// print value if available; otherwise, try 'default'
			if (value != null) {
				//LOGGER.debug("EgovComCrossSiteFilter> =value");
				String sWriteEscapedXml = getWriteEscapedXml();
				//LOGGER.debug("EgovComCrossSiteFilter sWriteEscapedXml>" + sWriteEscapedXml);
				out.print(sWriteEscapedXml);
				return SKIP_BODY;
			} else {
				// if we don't have a 'default' attribute, just go to the body
				if (def == null) {
					needBody = true;
					return EVAL_BODY_BUFFERED;
				}

				//LOGGER.debug("EgovComCrossSiteFilter def> ="+def);

				// if we do have 'default', print it
				if (def != null) {
					// good 'default'
					out(pageContext, escapeXml, def);
					//LOGGER.debug("EgovComCrossSiteFilter> ="+def);
				}
				return SKIP_BODY;
			}
		} catch (IOException ex) {
			throw new JspException(ex.toString(), ex);
		}
	}

	/**
	 * <pre>
	 * Description : prints the body if necessary; reports errors.
	 * </pre>
	 *
	 * @see javax.servlet.jsp.tagext.BodyTagSupport#doEndTag()
	 */
	@Override
	public final int doEndTag() throws JspException {
		try {
			//LOGGER.debug("EgovComCrossSiteFilter ==== doEndTag");
			if (!needBody) {
				return EVAL_PAGE; // nothing more to do
			}

			// trim and print out the body
			if (bodyContent != null && bodyContent.getString() != null) {
				//String sWriteEscapedXml = getWriteEscapedXml();
				//out2(pageContext, escapeXml, sWriteEscapedXml.toString());
				//LOGGER.debug("EgovComCrossSiteFilter> end");
				//LOGGER.debug("EgovComCrossSiteFilter sWriteEscapedXml > sWriteEscapedXml");
				out(pageContext, escapeXml, bodyContent.getString().trim());

			}
			return EVAL_PAGE;
		} catch (IOException ex) {
			throw new JspException(ex.toString(), ex);
		}
	}

	// *********************************************************************
	// Public utility methods

	/**
	 * <pre>
	 * Description :  Outputs <tt>text</tt> to <tt>pageContext</tt>'s current JspWriter. If
	 * <tt>escapeXml</tt> is true, performs the following substring replacements
	 * (to facilitate output to XML/HTML pages):
	 *
	 * & -> &amp; < -> &lt; > -> &gt; " -> &#034; ' -> &#039;
	 *
	 * See also Util.escapeXml().
	 * </pre>
	 *
	 * @param pageContext PageContext
	 * @param escapeXml true/false
	 * @param obj Object
	 * @throws IOException IOException
	 */
	public static void out(final PageContext pageContext,
			final boolean escapeXml,
			final Object obj) throws IOException {
		JspWriter w = pageContext.getOut();

		if (!escapeXml) {
			// write chars as is
			if (obj instanceof Reader) {
				Reader reader = (Reader) obj;
				char[] buf = new char[MAX_BUFFER];
				int count;
				while ((count = reader.read(buf, 0, MAX_BUFFER)) != -1) {
					w.write(buf, 0, count);
				}
			} else {
				w.write(obj.toString());
			}
		} else {
			// escape XML chars
			if (obj instanceof Reader) {
				Reader reader = (Reader) obj;
				char[] buf = new char[MAX_BUFFER];
				int count;
				while ((count = reader.read(buf, 0, MAX_BUFFER)) != -1) {
					writeEscapedXml(buf, count, w);
				}
			} else {
				String text = obj.toString();
				writeEscapedXml(text.toCharArray(), text.length(), w);
			}
		}

	}

	/**
	 * @param pageContext PageContext
	 * @param escapeXml true/false
	 * @param obj Object
	 * @throws IOException IOException
	 */
	public static void out2(final PageContext pageContext,
			final boolean escapeXml,
			final Object obj) throws IOException {
		JspWriter w = pageContext.getOut();

		w.write(obj.toString());

	}

	/**
	 * <pre>
	 * Description : Optimized to create no extra objects and write directly to the JspWriter
	 * using blocks of escaped and unescaped characters.
	 * </pre>
	 *
	 * @param buffer buffer
	 * @param length length
	 * @param w JspWriter
	 * @throws IOException IOException
	 */
	private static void writeEscapedXml(final char[] buffer, final int length,
			final JspWriter w)
			throws IOException {
		int start = 0;

		for (int i = 0; i < length; i++) {
			char c = buffer[i];
			if (c <= Util.HIGHEST_SPECIAL) {
				char[] escaped = Util.specialCharactersRepresentation[c];
				if (escaped != null) {
					// add unescaped portion
					if (start < i) {
						w.write(buffer, start, i - start);
					}
					// add escaped xml
					w.write(escaped);
					start = i + 1;
				}
			}
		}
		// add rest of unescaped portion
		if (start < length) {
			w.write(buffer, start, length - start);
		}
	}

	/**
	 * <pre>
	 * Description : Optimized to create no extra objects and write directly to the JspWriter
	 * using blocks of escaped and unescaped characters.
	 * </pre>
	 *
	 * @return String
	 * @throws IOException IOException
	 */
	private String getWriteEscapedXml() throws IOException {
		String sRtn = "";

		Object obj = this.value;

		@SuppressWarnings("unused")
		int start = 0;
		String text = obj.toString();

		int length = text.length();
		char[] buffer = text.toCharArray();
		boolean booleanDiff = false;
		//String sDiffChar
		//String sArrDiffChar
		char[] cDiffChar = this.mDiffChar.toCharArray();

		for (int i = 0; i < length; i++) {
			char c = buffer[i];

			booleanDiff = false;

			for (int k = 0; k < cDiffChar.length; k++) {
				if (c == cDiffChar[k]) {
					sRtn = sRtn + mArrDiffChar[k];
					booleanDiff = true;
					continue;
				}
			}

			if (booleanDiff) {
				continue;
			}

			if (c <= Util.HIGHEST_SPECIAL) {
				char[] escaped = Util.specialCharactersRepresentation[c];
				if (escaped != null) {
					// add unescaped portion
					//if (start < i) {
					//	sRtn = sRtn + text.substring(start, i - start);
					//}
					// add escaped xml
					//sRtn = sRtn + escaped;
					//LOGGER.debug(buffer[i]+" :: " + escaped);
					for (char element : escaped) {
						//LOGGER.debug(buffer[i]+" :>: " + escaped[j]);
						sRtn = sRtn + element;
					}
					//sRtn = sRtn+ escaped.toString();
					//sRtn = sRtn + String.valueOf(buffer[i]);
					start = i + 1;
				} else {
					sRtn = sRtn + c;
				}
			} else {
				sRtn = sRtn + c;
			}
		}

		return sRtn;
	}

	/**
	 * @param pValue the value to set
	 */
	public final void setValue(final Object pValue) {
		value = pValue;
	}

	/**
	 * @param pDef the def to set
	 */
	public final void setDef(final String pDef) {
		def = pDef;
	}

	/**
	 * @param pEscapeXml the escapeXml to set
	 */
	public final void setEscapeXml(final boolean pEscapeXml) {
		escapeXml = pEscapeXml;
	}

	/*
	 * public static void main(String[] args) throws IOException
	 * {
	 *
	 * EgovComCrossSiteHndlr egovComCrossSiteHndlr = new
	 * EgovComCrossSiteHndlr();
	 *
	 * egovComCrossSiteHndlr.value = "TRNSMIT";
	 *
	 * String sCrossSiteHndlr = egovComCrossSiteHndlr.getWriteEscapedXml();
	 * //LOGGER.debug("writeEscapedXml " +
	 * egovComCrossSiteHndlr.getWriteEscapedXml());
	 *
	 * LOGGER.debug("sCrossSiteHndlr|"+ sCrossSiteHndlr + "|");
	 *
	 * try{
	 * LOGGER.debug("TRY TEST 1");
	 * throw new Exception();
	 * }catch(Exception e){
	 * LOGGER.debug("TRY TEST 2");
	 * }finally{
	 * LOGGER.debug("TRY TEST 3");
	 *
	 * }
	 *
	 * }
	 */
}
