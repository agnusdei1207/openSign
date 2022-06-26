package com.open.mgr.mgr0117;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.open.cmmn.excel.ExcelView;
import com.open.cmmn.service.CmmnService;
import com.open.cmmn.util.DateUtils;
import com.open.cmmn.util.StringUtil;
import com.open.mgr.mgr0006.service.Mgr0006VO;
import com.open.mgr.mgr0117.service.Mgr0117VO;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class Mgr0117Controller {
 
	@Resource(name = "cmmnService")  
    protected CmmnService cmmnService;
	
	@Autowired
	ExcelView excelView;
	
	/** Program ID **/ 
    private final static String PROGRAM_ID = "Mgr0117";
 
    /** folderPath **/
    private final static String folderPath = "/mgr/mgr0117/";
      
	@RequestMapping(folderPath + "list.do")
	public String list(@ModelAttribute("searchVO") Mgr0117VO searchVO) throws Exception {
		 
		/* fncDate 현재 날짜 설정 */
		String time = DateUtils.getCurrentDate("yyyy.MM.dd");
		searchVO.setSearchStartDate(time);  
		searchVO.setSearchEndDate(time);
		      
		return ".mLayout:" + folderPath + "list";
	} 
	
	@SuppressWarnings("unchecked")
	@RequestMapping(folderPath + "addList.do")
	public String addList(@ModelAttribute("searchVO") Mgr0117VO searchVO, ModelMap model) throws Exception {
			
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
		List<Mgr0117VO>	resultList = (List<Mgr0117VO>) cmmnService.selectList(searchVO, PROGRAM_ID );
		     
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("resultList", resultList);  
		
		return folderPath + "addList";
	} 
	      
	@RequestMapping(folderPath + "modalList.do")
	public String popList(@ModelAttribute("searchVO") Mgr0117VO searchVO) throws Exception {
		
		return folderPath + "modalList";
	}     
	  
	@SuppressWarnings("unchecked")
	@RequestMapping(folderPath + "modalAddList.do")
	public String popFindAddList(@ModelAttribute("searchVO") Mgr0117VO searchVO, ModelMap model) throws Exception {
		 
		searchVO.setPageUnit(10);
		searchVO.setPageSize(5);   
          
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPopPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit()); 
		paginationInfo.setPageSize(searchVO.getPageSize());
		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());    
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		        
		List<?> resultList = new ArrayList<>(); 
		  
		int totCnt = cmmnService.selectCount(searchVO, "Mgr0117.modalSelectCount" );
		resultList = (List<Mgr0006VO>) cmmnService.selectList(searchVO, "Mgr0117.modalSelectList");
		 
		paginationInfo.setTotalRecordCount(totCnt);  
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("resultList", resultList);   
		            
		return folderPath + "modalAddList";  
	}
	 
	@SuppressWarnings("unchecked")    
	@RequestMapping(folderPath + "{procType}Form.do") 
	public String form(@ModelAttribute("searchVO") Mgr0117VO searchVO, ModelMap model, @PathVariable String procType) throws Exception {
		  
		Mgr0117VO mgr0117VO = new Mgr0117VO();  
		if(!"".equals(StringUtil.nullString(searchVO.getElSeq())) && "update".equals(procType)){      
			mgr0117VO = (Mgr0117VO) cmmnService.selectContents(searchVO, PROGRAM_ID);
			model.addAttribute("mgr0117VO", mgr0117VO);         
			                
			/* 식사 인원  */
			if(!"".equals(StringUtil.nullString(mgr0117VO.getUserSeq()))){
				String[] tempArray = mgr0117VO.getUserSeq().split(",");
				for(int i = 0; i < tempArray.length; i++){       
					tempArray[i] = "'" + tempArray[i] + "'"; 
				}  
				  
				String temp = "";
				for(int i = 0; i < tempArray.length; i++){ 
					String comma = ",";	// 마지막 인덱스 전 : , 콤마 처리 
					if(i == tempArray.length - 1){ 
						comma = "";	// 마지막 인덱스 : 공백 처리  
					} 
					temp += tempArray[i] + comma;  
				}          
				mgr0117VO.setUserSeq(temp);   
				  
				/* 사용자 목록 조회 */
				List<Mgr0006VO>	userList = (List<Mgr0006VO>) cmmnService.selectList(mgr0117VO, PROGRAM_ID + ".UserSelectList");
				model.addAttribute("userList", userList); 
			}
		}       
		/* 등록된 카드 목록 조회 */     
		List<Mgr0117VO>	cardList = (List<Mgr0117VO>) cmmnService.selectList(searchVO, PROGRAM_ID + ".cardSelectList");
		model.addAttribute("cardList", cardList); 
		 
		return ".mLayout:" + folderPath + "form";
	}  
	 
	@RequestMapping(folderPath + "{procType}Proc.do")
	public String proc(@ModelAttribute("searchVO") Mgr0117VO searchVO, ModelMap model, @PathVariable String procType) throws Exception {
		
		String message = ""; 
		String cmmnScript = "";
		   
		if(procType.equals("insert") ){     
			searchVO.setUserSeq(fncSetPeopleList(searchVO.getUserSeq()));
			cmmnService.insertContents(searchVO, PROGRAM_ID );
			message = "등록되었습니다";
			cmmnScript = "list.do";  
		} else if(procType.equals("update")){  
			searchVO.setUserSeq(fncSetPeopleList(searchVO.getUserSeq()));
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
		 
		model.addAttribute("pName", "elSeq");	
		model.addAttribute("pValue", searchVO.getElSeq());
		model.addAttribute("message", message);
		model.addAttribute("cmmnScript", cmmnScript);
		return "cmmn/execute";
	}   
	
	 
	/* 즐겨찾기 추가 및 해제 */
	@ResponseBody   
	@SuppressWarnings("rawtypes") 
	@RequestMapping(folderPath + "addFvrts.do")   
	public Map addFvrts(@ModelAttribute("searchVO") Mgr0117VO searchVO, String chk_state) throws Exception {
		    
		Map<String, String> map = new HashMap<>(); 
		/* 즐겨찾기에 이미 등록되어 있는지 체크 */  
		int cnt = (Integer) cmmnService.selectCount(searchVO, PROGRAM_ID + ".fvrtsCheckCount");
		if(cnt > 0){     
			/* 체크박스 체크 상태 */
			if("N".equals(chk_state)){ 
				searchVO.setUseYn("N");
			}else{
				searchVO.setUseYn("Y");      
			}   
			cmmnService.updateContents(searchVO, PROGRAM_ID + ".updateFvrtsContents");
		}else{  
			
			cmmnService.insertContents(searchVO, PROGRAM_ID + ".insertFvrtsContents");
		}
		map.put("result", "success");
		return map;
	}
	  
	/* 엑셀 다운로드 */
	@SuppressWarnings("unchecked") 
	@RequestMapping(folderPath + "excelDown.do")
	public ModelAndView excelDown(@ModelAttribute("searchVO") Mgr0117VO mgr0117VO) throws Exception{
		  
		ModelAndView mav = new ModelAndView(excelView);  
		String tit = "식대";  
		String url = "/eatLog.xlsx";
		          
		List<Mgr0117VO> resultList = (List<Mgr0117VO>) cmmnService.selectList(mgr0117VO, PROGRAM_ID+".excelDownSelectList" );
		
		mav.addObject("target", tit);  
		mav.addObject("source", url);
		        
		if(resultList.size() > 0){
			mav.addObject("result", resultList);
		}    
		
		return mav;
	}
	 
	/* 식사 인원 명단 SEQ 입력 셋팅*/        
	public String fncSetPeopleList(String list){
		String userSeqList = "";          
		String[] tempList = list.split(",");
		for(int i = 0; i < tempList.length; i++){
			String sep = ",";
			if(i == tempList.length - 1){sep = "";}
			userSeqList += tempList[i].substring(0,20) + sep;
		}  
		return userSeqList;
	} 	

}
