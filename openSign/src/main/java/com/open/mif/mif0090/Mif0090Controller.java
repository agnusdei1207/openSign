package com.open.mif.mif0090;

import java.util.List;
import java.util.Properties;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import com.open.cmmn.service.CmmnService;
import com.open.cmmn.service.FileMngService;
import com.open.cmmn.util.DateUtils;
import com.open.cmmn.util.StringUtil;
import com.open.mgr.cmmnBoard.service.CmmnBoardVO;
import com.open.mgr.mgr0003.service.Mgr0003VO;
import com.open.mif.mif0090.service.Mif0090VO;

import egovframework.rte.fdl.property.EgovPropertyService;

@Controller
public class Mif0090Controller {

	@Resource(name = "cmmnService")
    protected CmmnService cmmnService;
	
	@Resource(name = "FileMngService")
    private FileMngService fileMngService;
    
	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;
	
	/** fileUploadProperties */
	@Resource(name = "fileUploadProperties")
	Properties fileUploadProperties;
	
	/**
	 * MappingJackson2JsonView.
	 */
	@Resource
	private MappingJackson2JsonView ajaxView;
	
	
    /** Program ID **/
    private final static String PROGRAM_ID = "Mif0090";

    /** folderPath **/
    private final static String folderPath = "/mif/mif0090/";
	
	Logger log = Logger.getLogger(this.getClass());
	
	@RequestMapping(folderPath +"clnd.do")
	public String clnd(@ModelAttribute("clndVO") Mif0090VO clndVO, ModelMap model, HttpServletRequest request) throws Exception {
		
		String nowDate = DateUtils.getNowDate("yyyyMMdd");
		
		if(StringUtil.nullString(clndVO.getClSlctYearMnth()).equals("")){
			clndVO.setClSlctYearMnth(nowDate.substring(0,6));
		}
		
		//기준일을 선택한 달 1일로 설정
		String slctDate = clndVO.getClSlctYearMnth()+"01";
		
		clndVO.setClPrevYearMnth(DateUtils.addYearMonthDay(slctDate, 0, -1, 0).substring(0,6));
		clndVO.setClNextYearMnth(DateUtils.addYearMonthDay(slctDate, 0, 1, 0).substring(0,6));
		clndVO.setClFirstDayOfWeek(Integer.toString(DateUtils.getFirstWeekdayOfMonth(slctDate, "yyyyMMdd")));
		clndVO.setClLastDay(Integer.toString(DateUtils.getLastDayOfMonth(slctDate, "yyyyMMdd")));
		
		model.addAttribute("eduList", null);
		return folderPath + "clnd";
	}
}