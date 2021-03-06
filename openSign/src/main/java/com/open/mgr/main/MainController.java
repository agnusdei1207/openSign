package com.open.mgr.main;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.open.cmmn.excel.ExcelView;
import com.open.cmmn.model.CmmnDefaultVO;
import com.open.cmmn.service.CmmnService;
import com.open.cmmn.util.DateUtils;
import com.open.mgr.login.service.LoginVO;
import com.open.mgr.mgr0006.service.Mgr0006VO;
import com.open.mgr.mgr0111.service.Mgr0111VO;
import com.open.mgr.mgr0117.service.Mgr0117VO;
import com.open.mgr.mgr0118.service.Mgr0118VO;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

   
@Controller 
public class MainController {

	@Resource(name = "cmmnService")
    protected CmmnService cmmnService;
	
	 /** Program ID **/
    private final static String PROGRAM_ID = "Main";
   
    /** folderPath **/              
    private final static String folderPath = "/mgr/main/";
    
    @Autowired
	ExcelView excelView;
      
	@SuppressWarnings("unchecked") 
	@RequestMapping(value = "/mgr/main.do")             
	public String list(@ModelAttribute("searchVO") CmmnDefaultVO searchVO, ModelMap model) throws Exception {
		 
		/* DB 데이터 기준 날짜 조회 */
		List<Mgr0117VO> yearList = (List<Mgr0117VO>) cmmnService.selectList(searchVO, PROGRAM_ID+".selectYearList");
		model.addAttribute("yearList", yearList);
		model.addAttribute("thisYear", ""+DateUtils.getThisYear());
		model.addAttribute("thisMonth", ""+DateUtils.getThisMonth());
		  
		/* 날짜 값 셋팅 */
		String year = DateUtils.getNowDate("yyyy");     
		String month = DateUtils.getNowDate("MM"); 
		searchVO.setSchEtc02(year + "." + month);  
		
		/* 식대 총계 */    
		Mgr0117VO eatTotal = (Mgr0117VO)cmmnService.selectContents(searchVO, PROGRAM_ID + ".searchEatLogSelectContents"); 
		model.addAttribute("eatTotal", eatTotal);
		/* 초과근무 총계 */ 
		Mgr0118VO overTimeTotal = (Mgr0118VO)cmmnService.selectContents(searchVO, PROGRAM_ID + ".searchOverTimeSelectContents"); 
		model.addAttribute("overTimeTotal", overTimeTotal);
		       
		return folderPath + "main";  
	}
	   
	    
	@RequestMapping("/mgr/statistics/midArea.do")             
	public String midArea(@ModelAttribute("searchVO") CmmnDefaultVO searchVO, ModelMap model, HttpServletRequest request) throws Exception {
		
		/* default 세션 회원 조회 */
		HttpSession session = request.getSession();    
		LoginVO loginVO = (LoginVO)session.getAttribute("loginVO");    
		               
		/* 초과근무 검색 값 SEQ 셋팅 */    
		if(searchVO.getSchEtc04() == null || "".equals(searchVO.getSchEtc04())){  
			searchVO.setSchEtc04(loginVO.getLoginSeq());
		}        
		
		/* 회원 조회 */    
		LoginVO selectedUserVO  = (LoginVO)cmmnService.selectContents(searchVO, PROGRAM_ID + ".userNameSelectContents");
		model.addAttribute("selectedUserVO", selectedUserVO);
		     
		/* default 날짜 값 설정 */
		String nowDay = DateUtils.getNowDate("dd");  
		String year = DateUtils.getNowDate("yyyy");    
		String month = DateUtils.getNowDate("MM");     
		
		/* 날짜 검색 시 날짜 값 셋팅 */ 
		if(null != searchVO.getExcelYear() && !"".equals(searchVO.getExcelYear())){
			year = searchVO.getExcelYear();   
		}            
		if(null != searchVO.getExcelMonth() && !"".equals(searchVO.getExcelMonth())){
			month = searchVO.getExcelMonth();
			if(Integer.parseInt(month) < 10){   
				month = "0"+month;   
			}     
			nowDay = String.valueOf(DateUtils.getLastDayOfMonth(year + month + "01", "")); // 마지막 날짜 가져오기 
		}
		                        
		/* 현재 날짜까지 조회  nowDay */         
		int[] arrLogCnt = new int[Integer.parseInt(nowDay)];  
		Mgr0117VO[] arrMgr0117VO = new Mgr0117VO[arrLogCnt.length]; // 식대
		Mgr0118VO[] arrMgr0118VO = new Mgr0118VO[arrLogCnt.length]; // 초과근무    
		Mgr0118VO[] arrPrivateWorkTime = new Mgr0118VO[arrLogCnt.length]; // 개인 초과근무
		          
		for(int i=1; i <= arrLogCnt.length; i++){ 
			String day = ""; 
			if((int)(Math.log10(i)+1) == 1){ // 1 자리수  
				day = "0"+i;      
			}else if((int)(Math.log10(i)+1) == 2){ // 2 자리수 
				day = ""+i;   
			}                
			/* 날짜 정보 셋팅 */                               
			searchVO.setSchEtc01(year+"."+month+"."+day); 
			
			/* 조회 결과 배열에 담기*/                      
			arrMgr0117VO[i-1] = (Mgr0117VO)cmmnService.selectContents(searchVO, PROGRAM_ID + ".eatPriceLogSelectContents"); 
			arrMgr0118VO[i-1] = (Mgr0118VO)cmmnService.selectContents(searchVO, PROGRAM_ID + ".overTimeLogSelectContents"); 
			arrPrivateWorkTime[i-1] = (Mgr0118VO)cmmnService.selectContents(searchVO, PROGRAM_ID + ".privateWorkOverTime"); 
		}              
		               
		model.addAttribute("arrMgr0117VO", arrMgr0117VO);
		model.addAttribute("arrMgr0118VO", arrMgr0118VO); 
		model.addAttribute("arrPrivateWorkTime", arrPrivateWorkTime);
		model.addAttribute("month", month);  
		 
		return  folderPath + "midArea";  
	}      
	   
	
	@RequestMapping("/mgr/statistics/modalList.do")
	public String popList(@ModelAttribute("searchVO") Mgr0117VO searchVO, ModelMap model, HttpServletRequest request) throws Exception {
		
		return folderPath + "modalList"; 
	}     
	  
	@SuppressWarnings("unchecked")
	@RequestMapping("/mgr/statistics/modalAddList.do")
	public String popFindAddList(@ModelAttribute("searchVO") Mgr0117VO searchVO, ModelMap model) throws Exception {
		 
		searchVO.setPageUnit(8);   
		searchVO.setPageSize(5);      
          
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPopPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit()); 
		paginationInfo.setPageSize(searchVO.getPageSize());
		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());    
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		       
		List<?> resultList = new ArrayList<>(); 
		   
		/* 직원 목록 조회 */
		int totCnt = cmmnService.selectCount(searchVO, "Mgr0117.modalSelectCount" );
		resultList = (List<Mgr0006VO>) cmmnService.selectList(searchVO, "Mgr0117.modalSelectList");
		 
		paginationInfo.setTotalRecordCount(totCnt);  
		model.addAttribute("paginationInfo", paginationInfo);
		model.addAttribute("resultList", resultList);   
		            
		return folderPath + "modalAddList";
	}
	   
	/* 즐겨찾기 추가 및 해제 */
	@ResponseBody   
	@SuppressWarnings("rawtypes") 
	@RequestMapping("/mgr/statistics/addFvrts.do")   
	public Map addFvrts(@ModelAttribute("searchVO") Mgr0117VO searchVO, String chk_state) throws Exception {
		  
		Map<String, String> map = new HashMap<>();  
		/* 즐겨찾기에 이미 등록되어 있는지 체크 */
		int cnt = (Integer) cmmnService.selectCount(searchVO, "Mgr0117.fvrtsCheckCount"); 
		   
		if(cnt > 0){      
			/* 체크박스 체크 상태 */
			if("N".equals(chk_state)){   
				searchVO.setUseYn("N");
			}else{             
				searchVO.setUseYn("Y");      
			}   
			cmmnService.updateContents(searchVO, "Mgr0117.updateFvrtsContents"); // 등록되어 있다면 update!
		}else{  
			  
			cmmnService.insertContents(searchVO, "Mgr0117.insertFvrtsContents"); // 미등록 상태라면 insert!
		}
		map.put("result", "success");
		return map;  
	}        
	  
	/* 차트 클릭 시 상세보기 */
	@SuppressWarnings("unchecked")
	@RequestMapping("/mgr/statistics/{proc}Point.do")   
	public String eatPoint(@ModelAttribute("searchVO") Mgr0117VO searchVO, ModelMap model, @PathVariable String proc) throws Exception {
		
		/* 결과 값 저장 변수 */
		ArrayList<String> resultInfo = new ArrayList<>();
		 
		/* 날짜 값 셋팅 */
		String year = DateUtils.getNowDate("yyyy");
		searchVO.setSchEtc05(year + "." + searchVO.getSchEtc05().split("_")[0].replace("/", "."));  
		
		/* 변수 선언 */
		int divnCnt = 0; 
		String stringDivnCnt = ""; 
		String userSeq = ""; 
		String info = "";    
		  
		/* 식대 */
		if("eat".equals(proc)){ 
			/* 식사인원, 가격, 그룹 수, 그룹 내 인원 수 조회 */          
			List<Mgr0117VO> circleList = (List<Mgr0117VO>)cmmnService.selectList(searchVO, PROGRAM_ID + ".eatPointClickSelectList"); 
			  
			for (int i = 0; i < circleList.size(); i++) {  
				divnCnt = circleList.get(i).getUserSeq().split(",").length; 
				stringDivnCnt += "," + divnCnt;
				userSeq += "," + circleList.get(i).getUserSeq(); 
				info += "," + circleList.get(i).getPrice();
			}          
			     
			String[] arrUserSeq = userSeq.split(","); // 사용자 SEQ
			String[] arrDivnCnt = stringDivnCnt.split(","); // 그룹 수
			String[] arrPrice = info.split(","); // 가격
			  
			/* 이름 조회 */ 
			String userName = "";                   
			for(int i = 1; i < arrUserSeq.length; i++){
				searchVO.setSchEtc06(arrUserSeq[i]); 
				LoginVO loginVO = (LoginVO)cmmnService.selectContents(searchVO, PROGRAM_ID + ".findNameSelectContents"); 
				userName += "," + loginVO.getName();
			}   
			
			/* 조회 결과 배열에 담기 */ 
			String[] arrUserName = userName.split(","); // 사용자 이름 저장
			String[] resultUserName = new String[arrDivnCnt.length]; // 이름 배열 : 그룹 수 만큼 길이로 설정    
			String[] resultPrice = new String[arrDivnCnt.length]; // 가격 배열 : 그룹 수 만큼 길이로 설정
			
			int savePoint = 0; // 마지막 인덱스 저장      
			int idx = 0;  
			for(int i = 1; i < arrDivnCnt.length; i++){ // 그룹 수 만큼 반복
				int	cutLength = Integer.parseInt(arrDivnCnt[i]); // 그륩별 식사 인원수  
				String groupNames = "";
				String str = "";  
				 
				if(idx == 0){ // 최초 첫번째 바퀴부터 
					for(int j = 1; j <= cutLength; j++){ // 이름 꺼내기
						if(j == cutLength){
							str = ""; 
						}else{              
							str = ","; 
						}                   
						groupNames += arrUserName[j] + str; // 이름 문자열 구분값     
						savePoint = j;        
					}              
				}else{ // 두번째 바퀴부터                    
					for(int j = savePoint; j < savePoint + cutLength; j++){ // 마지막 인덱스 < 마지막 인덱스 + 그룹별 식사 인원수
						if(j == savePoint + cutLength - 1){
							str = "";   
						}else{               
							str = ","; 
						}    
						groupNames += arrUserName[j+1] + str; // 마지막 인덱스 중복 방지  + 1
					}           
					/* 마지막 인덱스 + 그룹 내 인원 수 */
					savePoint = savePoint + cutLength;             
				}    
				
				resultUserName[idx] = groupNames; // 추출된 이름 배열에 담기  
				resultPrice[idx] = arrPrice[i]; // 추출된 가격 배열에 담기
				idx++;
			} 
			for(int i = 0; i < resultUserName.length -1; i++){
				resultInfo.add(resultUserName[i]+ "_" +resultPrice[i]);
			}     
			     
		}else if("overTime".equals(proc)){ /* 초과근무 차트 */    
			/* 날짜 값 schEtc05 */ 
			List<Mgr0118VO> circleList = (List<Mgr0118VO>)cmmnService.selectList(searchVO, PROGRAM_ID + ".overTimePointClickSelectList"); 
			String[] resultUserName = new String[circleList.size()];
			String[] arrOverTime = new String[circleList.size()];  
			            
			/* 이름 조회 schEtc06 */      
			for(int i = 0; i < circleList.size(); i++){
				searchVO.setSchEtc06(circleList.get(i).getEmplySeq()); 
				LoginVO loginVO = (LoginVO)cmmnService.selectContents(searchVO, PROGRAM_ID + ".findNameSelectContents"); 
				resultUserName[i] = loginVO.getName();
				arrOverTime[i] = circleList.get(i).getCol1();
			}   
			/* 최종 결과 저장 */    
			for(int i = 0; i < circleList.size(); i++){   
				resultInfo.add(resultUserName[i] + "_" + arrOverTime[i]);   
			}  
			
		} 
		model.addAttribute("resultInfo", resultInfo);     
		model.addAttribute("proc", proc);     
		return folderPath + "circleChart";
	} 
	 
	/* 엑셀 다운로드 */
	@SuppressWarnings("unchecked") 
	@RequestMapping("/mgr/statistics/excelDown.do")
	public ModelAndView excelDown(@ModelAttribute("searchVO") CmmnDefaultVO searchVO, ModelMap model) throws Exception{
		     
		ModelAndView mav = new ModelAndView(excelView);  
		
		/* default 날짜 값 설정  */       
		String year = DateUtils.getNowDate("yyyy");       
		String month = DateUtils.getNowDate("MM"); 
		String nowDay = DateUtils.getNowDate("dd"); 
		
		/* 날짜 검색 시  값 셋팅 */
		if(!"".equals(searchVO.getExcelYear())){
			year = searchVO.getExcelYear();  
		} 
		if(!"".equals(searchVO.getExcelMonth())){
			month = searchVO.getExcelMonth();  
			/* 날짜 포멧 형식 맞추기 */
			if(Integer.parseInt(month) < 10){
				month = "0" + month; 
			}
		}    
		/* 제목 URL 셋팅 */    
		String tit = "오픈노트_통계자료";  
		String url = "totalStatistics.xlsx"; 
		   
		/* 조회 할 날짜 값 셋팅 */                               
		searchVO.setSchEtc01(year+"."+month);  
		  
		/* 통계 조회 */
		List<Mgr0111VO> eatList = (List<Mgr0111VO>) cmmnService.selectList(searchVO, PROGRAM_ID+".excelEatLogSelectList" );
		List<Mgr0111VO> overTimeList  = (List<Mgr0111VO>) cmmnService.selectList(searchVO, PROGRAM_ID+".excelOverTimeSelectList" );
		List<Mgr0117VO> resultList = (List<Mgr0117VO>) cmmnService.selectList(searchVO, PROGRAM_ID+".statisticsExcelDown" );
		  
		/* 식사 인원 이름 셋팅 */  
		for(int i = 0; i < eatList.size(); i++){  
			String userNames = "";
			String[] arrUserSeq = new String[eatList.get(i).getUserSeq().split(",").length];
			arrUserSeq = eatList.get(i).getUserSeq().split(",");
			/* 조회 명단 이름 가져오기*/
			for(int j = 0; j < arrUserSeq.length; j++){   
				searchVO.setSchEtc02(arrUserSeq[j]);
				Mgr0006VO info = (Mgr0006VO)cmmnService.selectContents(searchVO, PROGRAM_ID+".UserSelectContents"); 
				String comma = ",";  
				if(j == arrUserSeq.length - 1){ 
					comma = "";    
				}    
				userNames += info.getName() + comma;
			}     
			eatList.get(i).setUserSeq(userNames); 
		}      
		 
		/* 값 담아주기 key : value */  
		mav.addObject("target", tit);       
		mav.addObject("source", url);
		mav.addObject("year", year);
		mav.addObject("month", month);
		mav.addObject("nowDay", nowDay);
		mav.addObject("eatList", eatList);
		mav.addObject("overTimeList", overTimeList);
		if(resultList.size() > 0){
			mav.addObject("result", resultList);
		}    
		
		return mav;
	}
}