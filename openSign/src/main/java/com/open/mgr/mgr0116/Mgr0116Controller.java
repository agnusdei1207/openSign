package com.open.mgr.mgr0116;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.open.cmmn.excel.ExcelView;
import com.open.cmmn.service.CmmnService;
import com.open.cmmn.util.DateUtils;
import com.open.mgr.mgr0116.service.Mgr0116VO;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

/** 공지사항 게시판을 관리하는 컨트롤러 클래스를 정의한다.
 */
@Controller
public class Mgr0116Controller {

	@Resource(name = "cmmnService")
    protected CmmnService cmmnService;
	
	@Autowired
	ExcelView excelView;
	
	/** Program ID **/
    private final static String PROGRAM_ID = "Mgr0116";

    /** folderPath **/
    private final static String folderPath = "/mgr/mgr0116/";
        
	@RequestMapping(folderPath + "list.do")
	public String list(@ModelAttribute("searchVO") Mgr0116VO searchVO) throws Exception {
		  
		String time = DateUtils.getCurrentDate("yyyy.MM.dd");
		searchVO.setSearchStartDate(time);
		searchVO.setSearchEndDate(time);
		 
		return ".mLayout:" + folderPath + "list";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(folderPath + "addList.do")
	public String addList(@ModelAttribute("searchVO") Mgr0116VO searchVO, ModelMap model) throws Exception {
			   
		searchVO.setPageUnit(7);  
		searchVO.setPageSize(8);
		
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());
		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		int	totCnt = cmmnService.selectCount(searchVO, PROGRAM_ID);
		paginationInfo.setTotalRecordCount(totCnt);
		List<Mgr0116VO>	resultList = (List<Mgr0116VO>) cmmnService.selectList(searchVO, PROGRAM_ID );
		     
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("resultList", resultList);  
		
		return folderPath + "addList";
	}
	 
	@SuppressWarnings("unchecked")
	@RequestMapping(folderPath + "{procType}Form.do")
	public String form(@ModelAttribute("searchVO") Mgr0116VO searchVO, ModelMap model, @PathVariable String procType) throws Exception {
			
		Mgr0116VO mgr0116VO = new Mgr0116VO();
		mgr0116VO = (Mgr0116VO) cmmnService.selectContents(searchVO, PROGRAM_ID);
		
		if("update".equals(procType)){
			model.addAttribute("mgr0116VO", mgr0116VO);
		}    
		  
		List<Mgr0116VO>	cardList = (List<Mgr0116VO>) cmmnService.selectList(searchVO, PROGRAM_ID + ".cardSelectList");
		model.addAttribute("cardList", cardList);
		 
		return ".mLayout:" + folderPath + "form";
	}
	 
	@RequestMapping(folderPath + "{procType}Proc.do")
	public String proc(@ModelAttribute("searchVO") Mgr0116VO searchVO, ModelMap model, @PathVariable String procType) throws Exception {
		
		String message = "";
		String cmmnScript = "";
		
		if(procType.equals("insert") ){  
			cmmnService.insertContents(searchVO, PROGRAM_ID );
			message = "등록되었습니다";
			cmmnScript = "list.do";  
		} else if(procType.equals("update")){
    		cmmnService.updateContents(searchVO, PROGRAM_ID);
    		message = "수정되었습니다"; 
    		cmmnScript = "updateForm.do";
		} else if(procType.equals("delete")){
			cmmnService.deleteContents(searchVO, PROGRAM_ID);
			message = "삭제되었습니다";
			cmmnScript = "list.do";
		} else{
			return "redirect:list.do";
		}
		     
		model.addAttribute("pName", "clSeq");	
		model.addAttribute("pValue", searchVO.getClSeq());
		model.addAttribute("message", message);
		model.addAttribute("cmmnScript", cmmnScript);
		return "cmmn/execute";
	}
	  
	/* 엑셀 다운로드 */
	@SuppressWarnings("unchecked") 
	@RequestMapping(folderPath + "excelDown.do")
	public ModelAndView excelDown(@ModelAttribute("searchVO") Mgr0116VO mgr0116VO) throws Exception{
		  
		ModelAndView mav = new ModelAndView(excelView);  
		String tit = "카드반출대창";      
		String url = "/cardLog.xlsx";  
		             
		List<Mgr0116VO> resultList = (List<Mgr0116VO>) cmmnService.selectList(mgr0116VO, PROGRAM_ID+".excelDownSelectList" );
		
		mav.addObject("target", tit);   
		mav.addObject("source", url); 
		        
		if(resultList.size() > 0){
			mav.addObject("result", resultList);
		}    
		
		return mav;
	}
	

}