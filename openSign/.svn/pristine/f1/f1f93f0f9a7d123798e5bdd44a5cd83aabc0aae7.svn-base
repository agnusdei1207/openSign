package com.open.mgr.mgr0003;

import java.util.List;
import java.util.Properties;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.ehcache.EhCacheCacheManager;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import com.open.cmmn.excel.ExcelView;
import com.open.cmmn.service.CmmnService;
import com.open.cmmn.service.FileMngService;
import com.open.cmmn.util.StringUtil;
import com.open.mgr.mgr0003.service.Mgr0003VO;

import egovframework.rte.fdl.property.EgovPropertyService;

/**
 * @author adcap
 *
 */
@Controller
// @SecdionAttributes(types = BbsVO.clacd)
public class Mgr0003Controller {

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
	
	@Resource
	private MappingJackson2JsonView ajaxView;

	@Autowired 
	ExcelView excelView;
	
	/** Program ID **/
	private final static String PROGRAM_ID = "Mgr0003";
	


	/** folderPath **/
	private final static String folderPath = "/mgr/mgr0003/";

	Logger log = Logger.getLogger(this.getClass());

	/** Ehcache */
	  @Autowired
		private EhCacheCacheManager cacheManager;


	/**
	 * 메뉴권한 목록화면
	 * @param searchVO
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(folderPath +"list.do")
	public String cd001(@ModelAttribute("searchVO") Mgr0003VO searchVO, ModelMap model, HttpServletRequest request) throws Exception {
		
		if(StringUtil.nullString(searchVO.getpCd()).equals("")){
			searchVO.setpCd("0");
		}
		
		return ".mLayout:"+ folderPath +"list";
	}

	
	/**
	 * 메뉴권한 상세화면
	 * @param searchVO
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(folderPath  +"view.do")
	public String cd002(@ModelAttribute("searchVO") Mgr0003VO searchVO, Model model, HttpServletRequest request) throws Exception {
		String view = "";
		
		List<Mgr0003VO> cdList = (List<Mgr0003VO>) cmmnService.selectList(searchVO, PROGRAM_ID);
		model.addAttribute("cdList", cdList);
		
		if(StringUtil.nullString(searchVO.getCdCl()).equals("1")){
			view = folderPath + "list_1";
		}else if(StringUtil.nullString(searchVO.getCdCl()).equals("2")){
			view = folderPath + "list_2";
		}else if(StringUtil.nullString(searchVO.getCdCl()).equals("3")){
			view = folderPath + "list_3";
		}else if(StringUtil.nullString(searchVO.getCdCl()).equals("4")){
			view = folderPath + "list_4";
		}else if(StringUtil.nullString(searchVO.getCdCl()).equals("5")){
			view = folderPath + "list_5";
		}
		
		
		return view;
	}

	/**
	 * 메뉴권한 등록화면
	 * @param searchVO
	 * @param model
	 * @param procType
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(folderPath  +"form.do")
	public String cd003(@ModelAttribute("searchVO") Mgr0003VO searchVO, Model model, HttpServletRequest request) throws Exception {
		
		
		return ".mLayout:" + folderPath +"form";
	}
	

	/**
	 * 메뉴권한 처리
	 * @param searchVO
	 * @param bbsVO
	 * @param model
	 * @param status
	 * @param procType
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = folderPath  +"{procType}Proc.do", method = RequestMethod.POST)
	public ModelAndView cdProc(@ModelAttribute("searchVO") Mgr0003VO searchVO, ModelMap model, SessionStatus status,@PathVariable String procType, HttpServletRequest request) throws Exception {
/*		추가,등록,수정 삭제 처리와 위아래 처리*/
		String type="";
    	
    	if(procType.equals("insert")){
    		
    		int cdIdChk = cmmnService.selectCount(searchVO,PROGRAM_ID+".chkselectCount");
    		if(cdIdChk < 1){
    			cmmnService.insertContents(searchVO,PROGRAM_ID); // 1성공
        		type="등록";
    		}else{
    			type="OVER";
    		}
    		
    	}else if(procType.equals("update")){
    		cmmnService.updateContents(searchVO,PROGRAM_ID); // 1성공
    		type="수정";
    	}else if(procType.equals("delete")){
    		cmmnService.deleteContents(searchVO,PROGRAM_ID); // 1성공    	
    		type="삭제";
    	}else if(procType.equals("up")){
    		cmmnService.updateContents(searchVO,PROGRAM_ID + ".OrderUpTagetupdateContents"); // 1성공
    		cmmnService.updateContents(searchVO,PROGRAM_ID + ".OrderUpSelfupdateContents"); // 1성공
    	}else if(procType.equals("down")){
    		cmmnService.updateContents(searchVO,PROGRAM_ID + ".OrderDownTargetupdateContents"); // 1성공
    		cmmnService.updateContents(searchVO,PROGRAM_ID + ".OrderDownSelfupdateContents"); // 1성공
    	}else if(procType.equals("detailInsert")){
    		cmmnService.insertContents(searchVO,PROGRAM_ID + ".subinsertContents"); 
    		type="저장";
    	}
    	

    	model.addAttribute("type", type);
		
		
		return new ModelAndView(ajaxView,model);

	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping("/cdSel.do")
	public String siteList( @ModelAttribute("searchVO") Mgr0003VO searchVO,  ModelMap model,HttpServletRequest request) throws Exception {
		
		String gubun = StringUtil.nullString(request.getParameter("gubun"));
		String selVal = StringUtil.nullString(request.getParameter("selVal"));
		
		List<Mgr0003VO> cdList = (List<Mgr0003VO>) cmmnService.selectList(searchVO, PROGRAM_ID);
		model.addAttribute("cdList", cdList);
		model.addAttribute("gubun", gubun);
		model.addAttribute("selVal", selVal);
		
		return folderPath+"cdSel";
	}
	
	@RequestMapping("/cdNm.do")
	public ModelAndView cdNm( @ModelAttribute("searchVO") Mgr0003VO searchVO,  ModelMap model,HttpServletRequest request) throws Exception {
		
		String cdNm = (String) cmmnService.selectContents(searchVO, PROGRAM_ID + ".cdNmSelectContents");
		model.addAttribute("cdNm", cdNm);
		return new ModelAndView(ajaxView,model);
	}
	
	
	
	
}