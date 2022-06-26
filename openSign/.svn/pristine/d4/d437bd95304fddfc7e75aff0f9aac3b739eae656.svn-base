package com.open.mgr.mgr0017;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.open.cmmn.model.CmmnDefaultVO;
import com.open.cmmn.service.CmmnService;
import com.open.cmmn.util.DateUtils;
import com.open.cmmn.util.StringUtil;
import com.open.mgr.mgr0017.service.Mgr0017VO;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

/** 공지사항 게시판을 관리하는 컨트롤러 클래스를 정의한다.
 */
@Controller
public class Mgr0017Controller {

	@Resource(name = "cmmnService")
    protected CmmnService cmmnService;
	
    /** Program ID **/
    private final static String PROGRAM_ID = "Mgr0017";

    /** folderPath **/
    private final static String folderPath = "/mgr/mgr0017/";

    
	Logger log = Logger.getLogger(this.getClass());

	@RequestMapping(folderPath+"list.do")
	public String list( @ModelAttribute("searchVO") CmmnDefaultVO searchVO,  ModelMap model,HttpServletRequest request) throws Exception {
		
		if(StringUtil.nullString(searchVO.getSearchStartDate()).equals("")){
			searchVO.setSearchStartDate(DateUtils.getCurrentDate("yyyy.MM.dd"));
			if(StringUtil.nullString(searchVO.getSearchEndDate()).equals("")){
				searchVO.setSearchEndDate(DateUtils.getCurrentDate("yyyy.MM.dd"));
			}
		}
		
		
		
		return ".mLayout:"+ folderPath + "list";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(folderPath+"addList.do")
	public String addList( @ModelAttribute("searchVO") CmmnDefaultVO searchVO,  ModelMap model,HttpServletRequest request) throws Exception {
		
		searchVO.setPageUnit(10);
		searchVO.setPageSize(11);

		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());
		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		List<Mgr0017VO> boardList = (List<Mgr0017VO>) cmmnService.selectList(searchVO, PROGRAM_ID);		
		model.addAttribute("resultList", boardList);  

		int totCnt = cmmnService.selectCount(searchVO, PROGRAM_ID);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		
		return folderPath + "addList";  
	}
	  
	@RequestMapping(folderPath +"view.do")
	public String view(@ModelAttribute("searchVO") Mgr0017VO searchVO, Model model, HttpServletRequest request) throws Exception {
		
		Mgr0017VO mgr0017VO = new Mgr0017VO();
		mgr0017VO = (Mgr0017VO) cmmnService.selectContents(searchVO, PROGRAM_ID );
		model.addAttribute("mgr0017VO", mgr0017VO);
		
		return ".mLayout:"+ folderPath + "view";
	}
 
	

}
