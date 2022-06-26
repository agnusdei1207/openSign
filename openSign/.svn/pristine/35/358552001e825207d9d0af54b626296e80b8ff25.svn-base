package com.open.cmmn.web;

import javax.servlet.http.HttpServletRequest;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.open.cmmn.service.CmmnErrorDbLogService;

/**
 * <pre>
 * Class Name : ReplyManageBoController.java
 * Description: 댓글 Controller.
 * Modification Information
 *
 *    수정일         수정자         수정내용
 *    -------        -------     -------------------
 *    2016. 11. 13.	 User		최초생성
 *
 * </pre>
 *
 * @author User
 * @since 2016. 11. 13.
 * @version 1.0
 * @see <pre>
 *
 * </pre>
 */
@Controller
public class CmmnErrorController {

	/**
	 * Log4j Logger.
	 */
	private static final Logger LOGGER = LogManager.getLogger(CmmnErrorController.class.getName());

	/**
	 * CmmnService.
	 */
	@Autowired
	private CmmnErrorDbLogService cmmnErrorDbLogService;

	/**
	 * <pre>
	 * Description : .
	 * </pre>
	 *
	 * @param request HttpServletRequest
	 * @param model Model
	 * @return "cmmn/error/error"
	 * @throws Exception Exception
	 */
	@RequestMapping(value = "/error/throwable.do")
	public String throwable(final HttpServletRequest request, final Model model) throws Exception {
		cmmnErrorDbLogService.uploadError();
		LOGGER.info("예외가 발생하였습니다.");
		return "cmmn/error/error";
	}

	/**
	 * <pre>
	 * Description : .
	 * </pre>
	 *
	 * @param request HttpServletRequest
	 * @param model Model
	 * @return "cmmn/error/error"
	 * @throws Exception Exception
	 */
	@RequestMapping(value = "/error/exception.do")
	public String exception(final HttpServletRequest request, final Model model) throws Exception {
		cmmnErrorDbLogService.uploadError();
		LOGGER.info("예외가 발생하였습니다.");
		return "cmmn/error/error";
	}

	/**
	 * <pre>
	 * Description : .
	 * </pre>
	 *
	 * @param request HttpServletRequest
	 * @param model Model
	 * @return "cmmn/error/error"
	 * @throws Exception Exception
	 */
	@RequestMapping(value = "/error/error400.do")
	public String error400(final HttpServletRequest request, final Model model) throws Exception {
		cmmnErrorDbLogService.uploadError();
		LOGGER.info("잘못된 요청입니다.");
		return "cmmn/error/error";
	}

	/**
	 * <pre>
	 * Description : .
	 * </pre>
	 *
	 * @param request HttpServletRequest
	 * @param model Model
	 * @return "cmmn/error/error"
	 * @throws Exception Exception
	 */
	@RequestMapping(value = "/error/error403.do")
	public String error403(final HttpServletRequest request, final Model model) throws Exception {
		cmmnErrorDbLogService.uploadError();
		LOGGER.info("접근이 금지되었습니다.");
		return "cmmn/error/error";
	}

	/**
	 * <pre>
	 * Description : .
	 * </pre>
	 *
	 * @param request HttpServletRequest
	 * @param model Model
	 * @return "cmmn/error/error"
	 * @throws Exception Exception
	 */
	@RequestMapping(value = "/error/error404.do")
	public String error404(final HttpServletRequest request, final Model model) throws Exception {
		//cmmnErrorDbLogService.uploadError();
		LOGGER.info("페이지가 존재하지 않습니다.");
		return "cmmn/error/error404";
	}

	/**
	 * <pre>
	 * Description : .
	 * </pre>
	 *
	 * @param request HttpServletRequest
	 * @param model Model
	 * @return "cmmn/error/error"
	 * @throws Exception Exception
	 */
	@RequestMapping(value = "/error/error405.do")
	public String error405(final HttpServletRequest request, final Model model) throws Exception {
		cmmnErrorDbLogService.uploadError();
		LOGGER.info("요청된 메소드가 허용되지 않습니다.");
		return "cmmn/error/error";
	}

	/**
	 * <pre>
	 * Description : .
	 * </pre>
	 *
	 * @param request HttpServletRequest
	 * @param model Model
	 * @return "cmmn/error/error"
	 * @throws Exception Exception
	 */
	@RequestMapping(value = "/error/error500.do")
	public String error500(final HttpServletRequest request, final Model model) throws Exception {
		cmmnErrorDbLogService.uploadError();
		LOGGER.info("서버에 오류가 발생하였습니다.");
		return "cmmn/error/error";
	}

	/**
	 * <pre>
	 * Description : .
	 * </pre>
	 *
	 * @param request HttpServletRequest
	 * @param model Model
	 * @return "cmmn/error/error"
	 * @throws Exception Exception
	 */
	@RequestMapping(value = "/error/error503.do")
	public String error503(final HttpServletRequest request, final Model model) throws Exception {
		cmmnErrorDbLogService.uploadError();
		LOGGER.info("서비스를 사용할 수 업습니다.");
		return "cmmn/error/error";
	}

}
