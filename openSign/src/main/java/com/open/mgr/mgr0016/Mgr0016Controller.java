package com.open.mgr.mgr0016;

import java.util.List;
import java.util.Properties;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.ehcache.EhCacheCacheManager;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import com.open.cmmn.excel.ExcelView;
import com.open.cmmn.service.CmmnService;
import com.open.cmmn.service.FileMngService;
import com.open.cmmn.util.DateUtils;
import com.open.cmmn.util.StringUtil;
import com.open.mgr.mgr0016.service.Mgr0016VO;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

/** 공지사항 게시판을 관리하는 컨트롤러 클래스를 정의한다.
 */
@Controller
public class Mgr0016Controller {

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

	@Autowired
	ExcelView excelView;
	
	/**
	 * MappingJackson2JsonView.
	 */
	@Resource
	private MappingJackson2JsonView ajaxView;
	
    /** Program ID **/
    private final static String PROGRAM_ID = "Mgr0016";

    /** folderPath **/
    private final static String folderPath = "/mgr/mgr0016/";

	//@Resource(name = "beanValidator")
	//protected DefaultBeanValidator beanValidator;
	
    @Autowired
	private EhCacheCacheManager cacheManager;
    
	Logger log = Logger.getLogger(this.getClass());

	
	/**
	 * 게시판 관리 화면을 조회한다.
	 * @param searchVO 검색조건
	 * @param model
	 * @return "content/contentList"
	 * @throws Exception
	 */
	@RequestMapping(folderPath+"list.do")
	public String list( @ModelAttribute("searchVO") Mgr0016VO searchVO,  ModelMap model,HttpServletRequest request) throws Exception {
		
		if(StringUtil.nullString(searchVO.getSearchStartDate()).equals("") && StringUtil.nullString(searchVO.getSearchEndDate()).equals("")){
			String nowDate = DateUtils.getNowDate("yyyy.MM.dd");
			searchVO.setSearchStartDate(nowDate);
			searchVO.setSearchEndDate(nowDate);
		}
		
		return ".mLayout:"+ folderPath + "list";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(folderPath + "addList.do")
	public String addList(@ModelAttribute("searchVO") Mgr0016VO searchVO, ModelMap model, HttpServletRequest request) throws Exception {
		
		String jsp = "";
		String listSql = "";
		String cntSql = "";
		String divn = StringUtil.nullString(searchVO.getSearchDivn());
		
		if(divn.equals("A")){
			jsp = "A";
			listSql = ".menuLogSelectList";
			cntSql = ".menuLogSelectCount";
		}
		if(divn.equals("T") || divn.equals("O")){
			jsp = "TO";
			listSql = ".logSelectList";
			cntSql = ".logSelectCount";
		}
		if(divn.equals("F")){
			jsp = "F";
			listSql = ".failLogSelectList";
			cntSql = ".failLogSelectCount";
		}
		
		searchVO.setPageUnit(Integer.parseInt(searchVO.getSchEtc15()));
		searchVO.setPageSize(10);

		/** pageing setting */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());
		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		int totCnt = cmmnService.selectCount(searchVO, PROGRAM_ID + cntSql );
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		
		List<Mgr0016VO> resultList = (List<Mgr0016VO>) cmmnService.selectList(searchVO, PROGRAM_ID + listSql);
		model.addAttribute("resultList", resultList);
		
		return folderPath + "addList_"+jsp;
	}
	
	//계정잠금해제
	@ResponseBody
	@RequestMapping(value = folderPath + "resetFailCnt.do", method = RequestMethod.POST) 
	public ModelAndView resetFailCnt(Mgr0016VO mgr0016VO, ModelMap model, HttpServletRequest request) throws Exception {
		cmmnService.updateContents(mgr0016VO, PROGRAM_ID+".resetFailCnt");
		return new ModelAndView(ajaxView, model);
	}
	
	//계정잠금해제 일괄처리
	@ResponseBody
	@RequestMapping(value = folderPath + "resetArrFailCnt.do", method = RequestMethod.POST) 
	public ModelAndView resetArrFailCnt(Mgr0016VO mgr0016VO, ModelMap model, HttpServletRequest request) throws Exception {
		
		String result = "fail";
		String msg = "처리가 실패하였습니다";
		if(mgr0016VO.getArrTemp() != null){
			if(mgr0016VO.getArrTemp().length > 0){
				cmmnService.updateContents(mgr0016VO, PROGRAM_ID+".resetArrFailCnt");
				msg = "일괄 잠금해제 되었습니다";
				result = "success";
			}
		}
		model.addAttribute("msg", msg);
		model.addAttribute("result", result);
		return new ModelAndView(ajaxView, model);
	}
}
