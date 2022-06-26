package com.open.mgr.mgr0007;

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

import com.open.cmmn.service.CmmnService;
import com.open.cmmn.service.FileMngService;
import com.open.cmmn.util.SessionUtil;
import com.open.cmmn.util.StringUtil;
import com.open.mgr.mgr0001.service.Mgr0001VO;
import com.open.mgr.mgr0007.service.Mgr0007VO;

import egovframework.rte.fdl.property.EgovPropertyService;

/** 공지사항 게시판을 관리하는 컨트롤러 클래스를 정의한다.
 */
@Controller
public class Mgr0007Controller {

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
    private final static String PROGRAM_ID = "Mgr0007";

    /** folderPath **/
    private final static String folderPath = "/mgr/mgr0007/";

	//@Resource(name = "beanValidator")
	//protected DefaultBeanValidator beanValidator;
	
    @Autowired
	private EhCacheCacheManager cacheManager;
    
	Logger log = Logger.getLogger(this.getClass());

	/**
	 * 관리자관리 목록화면
	 * @param searchVO
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(folderPath +"list.do")
	public String list(@ModelAttribute("searchVO") Mgr0007VO searchVO, ModelMap model, HttpServletRequest request) throws Exception {
		
		/* 게시판 목록 리스트 */
		@SuppressWarnings("unchecked")
		List<Mgr0007VO> resultList = (List<Mgr0007VO>) cmmnService.selectList(searchVO, PROGRAM_ID);
		model.addAttribute("resultList", resultList);
		

		return ".mLayout:"+ folderPath + "list";
	}



	/**
	 * 관리자관리 등록화면
	 * @param searchVO
	 * @param model
	 * @param procType
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(folderPath +"{procType}Form.do")
	public String form(@ModelAttribute("searchVO") Mgr0007VO searchVO, Model model,@PathVariable String procType, HttpServletRequest request) throws Exception {
		
		Mgr0007VO mgr0007VO = new Mgr0007VO();
		
		if(procType != null){
			if (procType.equals("update")) {
				mgr0007VO = (Mgr0007VO) cmmnService.selectContents(searchVO, PROGRAM_ID);
				if(!StringUtil.nullString(SessionUtil.getUserDetails().getAuthCode()).equals("1") && !StringUtil.nullString(mgr0007VO.getRgstId()).equals(StringUtil.nullString(SessionUtil.getUserDetails().getLoginSeq()))){
					model.addAttribute("message", "비정상적인 접근입니다.");
					model.addAttribute("cmmnScript", "list.do");
					return "cmmn/execute";
				}
			}
		}
			searchVO.setProcType(procType);
			mgr0007VO.setSearchVO(searchVO);
			model.addAttribute("mgr0007VO", mgr0007VO);
			
			/* 1차메뉴 목록 */
			Mgr0001VO menuVO = new Mgr0001VO();
			menuVO.setLvl("1");
			menuVO.setpMenuCd("mgr");
			menuVO.setAuthCode(mgr0007VO.getAuthCode());
			List<Mgr0001VO> menuList = (List<Mgr0001VO>) cmmnService.selectList(menuVO, "Mgr0001.authViewSelectList");
			menuVO.setMenuList(menuList);
			for (Mgr0001VO menuVO2 : menuVO.getMenuList()) {
				menuVO2.setLvl("2");
				menuVO2.setpMenuCd(menuVO2.getMenuCd());
				menuVO2.setAuthCode(mgr0007VO.getAuthCode());
				List<Mgr0001VO> manu2List = (List<Mgr0001VO>) cmmnService.selectList(menuVO2, "Mgr0001.authViewSelectList");
				menuVO2.setMenuList(manu2List);
				
				for (Mgr0001VO menuVO3 : manu2List) {
					menuVO3.setLvl("3");
					menuVO3.setpMenuCd(menuVO3.getMenuCd());
					menuVO3.setAuthCode(mgr0007VO.getAuthCode());
					List<Mgr0001VO> manu3List = (List<Mgr0001VO>) cmmnService.selectList(menuVO3, "Mgr0001.authViewSelectList");
					menuVO3.setMenuList(manu3List);
				}
				
				
			}
			
			model.addAttribute("menu", menuVO.getMenuList());
		
		return ".mLayout:"+ folderPath + "form";
	}

	/**
	 * 관리자관리 처리
	 * @param searchVO
	 * @param bbsVO
	 * @param model
	 * @param status
	 * @param procType
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = folderPath +"{procType}Proc.do", method = RequestMethod.POST)
	public String proc(@ModelAttribute("searchVO") Mgr0007VO searchVO, Model model, SessionStatus status,@PathVariable String procType, HttpServletRequest request) throws Exception {
		if(procType != null){
			
			if (procType.equals("insert")) {
				cmmnService.insertContents(searchVO, PROGRAM_ID);
				
				/* 권한메뉴 등록 */
				if(searchVO.getArrMenu() != null){
					for (int i = 0; i < searchVO.getArrMenu().length; i++) {
						Mgr0007VO mgr0007VO = new Mgr0007VO();
						mgr0007VO.setAuthCode(searchVO.getAuthCode());
						mgr0007VO.setMenuCd(searchVO.getArrMenu()[i]);
						cmmnService.insertContents(mgr0007VO, PROGRAM_ID+".authInsertContents");
					}
				}
				
			} else if (procType.equals("update") ) {
				
				
				cmmnService.updateContents(searchVO, PROGRAM_ID);
				
				/* 권한메뉴 삭제 */
				cmmnService.deleteContents(searchVO, PROGRAM_ID+".authDeleteContents");
				/* 권한메뉴 재등록 */
				if(searchVO.getArrMenu() != null){
					for (int i = 0; i < searchVO.getArrMenu().length; i++) {
						Mgr0007VO mgr0007VO = new Mgr0007VO();
						mgr0007VO.setAuthCode(searchVO.getAuthCode());
						mgr0007VO.setMenuCd(searchVO.getArrMenu()[i]);
						cmmnService.insertContents(mgr0007VO, PROGRAM_ID+".authInsertContents");
					}
				}
				
				
			} else if (procType.equals("delete")) {
				
				cmmnService.deleteContents(searchVO, PROGRAM_ID);
				
				/* 권한메뉴 삭제 */
				cmmnService.deleteContents(searchVO, PROGRAM_ID+".authDeleteContents");
				
			}
			
			status.setComplete(); // 중복 Submit 방지 : 세션에 저장된 model 을 삭제한다.
			
			if(procType.equals("update")){
				model.addAttribute("message", "수정되었습니다.");
				model.addAttribute("cmmnScript","updateForm.do?seq="+searchVO.getSeq());
				return "cmmn/execute";
	    	}else if(procType.equals("insert")){
				model.addAttribute("message", "등록되었습니다.");
				model.addAttribute("cmmnScript", "list.do");
				return "cmmn/execute";
	    	}else if(procType.equals("delete")){
				model.addAttribute("message", "삭제되었습니다.");
				model.addAttribute("cmmnScript", "list.do");
				return "cmmn/execute";
	    	}else{
	    		return "redirect:list.do";
	    	}
			
		}

		return "redirect:list.do";
	}
	
	
	/**
	 * 아이디 중복체크
	 * @param searchVO
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = folderPath + "codeOverlap.do")
	public ModelAndView menuCodeOverlap(@ModelAttribute("searchVO") Mgr0007VO searchVO, ModelMap model, HttpServletRequest request) throws Exception {
		
		
		int overCnt = cmmnService.selectCount(searchVO, PROGRAM_ID+".overlapSelectCount") ;
		
		model.addAttribute("overCnt", overCnt);
		
		return new ModelAndView(ajaxView,model);
		
	}
	
	
	
	
		

}
