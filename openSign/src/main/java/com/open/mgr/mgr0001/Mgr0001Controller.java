package com.open.mgr.mgr0001;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import com.open.cmmn.excel.ExcelView;
import com.open.cmmn.service.CmmnService;
import com.open.cmmn.service.FileMngService;
import com.open.cmmn.util.CableUtil;
import com.open.cmmn.util.StringUtil;
import com.open.mgr.mgr0001.service.Mgr0001VO;
import com.open.mgr.mgr0003.service.Mgr0003VO;

import egovframework.rte.fdl.property.EgovPropertyService;

/**
 * @author adcap
 *
 */
@Controller
// @SecdionAttributes(types = BbsVO.clacd)
public class Mgr0001Controller {

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
	private final static String PROGRAM_ID = "Mgr0001";
	


	/** folderPath **/
	private final static String folderPath = "/mgr/mgr0001/";

	Logger log = Logger.getLogger(this.getClass());


	@SuppressWarnings("unchecked")
	@RequestMapping(folderPath +"list.do")
	public String list(@ModelAttribute("searchVO") Mgr0001VO searchVO, ModelMap model, HttpServletRequest request) throws Exception {
		
		CableUtil.cableTest();
		
		Mgr0003VO mgr0003VO = new Mgr0003VO();
		mgr0003VO.setpCd("00");
		List<Mgr0003VO> menuGrpList = (List<Mgr0003VO>) cmmnService.selectList(mgr0003VO, "Mgr0003");
		model.addAttribute("menuGrpList", menuGrpList);
		
		return ".mLayout:"+ folderPath +"list";
	}
    
	@SuppressWarnings("unchecked")
	@RequestMapping(folderPath  +"view.do")
	public String view(@ModelAttribute("searchVO") Mgr0001VO searchVO, Model model, HttpServletRequest request) throws Exception {
		String view = "";
		
		if(StringUtil.nullString(searchVO.getLvl()).equals("1")){
			searchVO.setpMenuCd(searchVO.getUrlPtn());
			view = folderPath + "list_1";
		}else if(StringUtil.nullString(searchVO.getLvl()).equals("2")){
			view = folderPath + "list_2";
		}else if(StringUtil.nullString(searchVO.getLvl()).equals("3")){
			view = folderPath + "list_3";
		}
		
		List<Mgr0001VO> cdList = (List<Mgr0001VO>) cmmnService.selectList(searchVO, PROGRAM_ID);
		model.addAttribute("cdList", cdList);
		
		
		
		return view;
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(folderPath  +"form.do")
	public String form(@ModelAttribute("searchVO") Mgr0001VO searchVO, Model model, HttpServletRequest request) throws Exception {
		
		Mgr0001VO mgr0001VO = (Mgr0001VO) cmmnService.selectContents(searchVO, PROGRAM_ID);
		model.addAttribute("mgr0001VO", mgr0001VO);
		
		
		searchVO.setpMenuCd(searchVO.getUrlPtn());
		List<Mgr0001VO> menuList = (List<Mgr0001VO>) cmmnService.selectList(searchVO, PROGRAM_ID );
		model.addAttribute("menuList", menuList);
		
		return folderPath +"form";
	}
	

	@RequestMapping(value = folderPath  +"{procType}Proc.do", method = RequestMethod.POST)
	public ModelAndView proc(@ModelAttribute("searchVO") Mgr0001VO searchVO, ModelMap model, SessionStatus status,@PathVariable String procType, HttpServletRequest request) throws Exception {
/*		추가,등록,수정 삭제 처리와 위아래 처리*/
		
		/*메뉴갱신로그*/
		Mgr0001VO menuLogChkVO = new Mgr0001VO();
		String menuCdChk = StringUtil.getMenuCd(request.getRequestURI()).get("menuCd");
		menuLogChkVO.setMenuCd(menuCdChk);
		cmmnService.insertContents(menuLogChkVO, "Mgr0001.menuChkLogInsert");
		
		String type="";
    	
    	if(procType.equals("insert")){
    			
			searchVO.setMenuCd(searchVO.getUrlPtn());
			cmmnService.insertContents(searchVO,PROGRAM_ID);
    		type="등록";
    		
    	}else if(procType.equals("update")){
    		cmmnService.updateContents(searchVO,PROGRAM_ID); 
    		if(searchVO.getMenuCd().indexOf("mgr") > -1){
    			cmmnService.updateContents(searchVO, PROGRAM_ID+".boardDivnUpdate");
    			if(StringUtil.nullString(searchVO.getBoardDivn()).equals("") || StringUtil.nullString(searchVO.getSubDivn()).equals("Y"))
    			cmmnService.updateContents(searchVO, PROGRAM_ID+".frtBoardDelete");
    		}
    		type="수정";
    	}else if(procType.equals("delete")){
    		cmmnService.deleteContents(searchVO,PROGRAM_ID);
    		type="삭제";
    	}else if(procType.equals("up")){
    		cmmnService.updateContents(searchVO,PROGRAM_ID + ".OrderUpTagetupdateContents"); 
    		cmmnService.updateContents(searchVO,PROGRAM_ID + ".OrderUpSelfupdateContents"); 
    	}else if(procType.equals("down")){
    		cmmnService.updateContents(searchVO,PROGRAM_ID + ".OrderDownTargetupdateContents"); 
    		cmmnService.updateContents(searchVO,PROGRAM_ID + ".OrderDownSelfupdateContents"); 
    	}else if(procType.equals("detailInsert")){
    		cmmnService.insertContents(searchVO,PROGRAM_ID + ".subinsertContents"); 
    		type="저장";
    	}
    	

    	model.addAttribute("type", type);
		
		
		return new ModelAndView(ajaxView,model);

	}
	
	
	@SuppressWarnings("unchecked")
	@RequestMapping(folderPath  +"menuSel.do")
	public String menuSel(@ModelAttribute("searchVO") Mgr0001VO searchVO, Model model, HttpServletRequest request) throws Exception {
		
		List<Mgr0001VO> menuList = (List<Mgr0001VO>) cmmnService.selectList(searchVO, PROGRAM_ID);
		model.addAttribute("menuList", menuList);
		
		return folderPath +"menuSel";
	}

	//관리자 게시물 리스트 조회
	@SuppressWarnings("unchecked")
	@RequestMapping(value = folderPath + "brdCd.do", method = RequestMethod.POST) 
	public String brdCd(Mgr0001VO mgr0001VO, ModelMap model, HttpServletRequest request) throws Exception {
		
		List<Mgr0001VO> menuList = (List<Mgr0001VO>) cmmnService.selectList(mgr0001VO, PROGRAM_ID+".brdCdSelectList");
		model.addAttribute("menuList", menuList);
		model.addAttribute("boardCd", mgr0001VO.getBoardCd());
		
		return folderPath +"menuSel";
	}
	
	//관리자 게시물 중복확인
	@ResponseBody
	@RequestMapping(value = folderPath + "cdOverLapChk.do", method = RequestMethod.POST) 
	public ModelAndView cdOverLapChk(Mgr0001VO mgr0001VO, ModelMap model, HttpServletRequest request) throws Exception {
		
		int cnt = cmmnService.selectCount(mgr0001VO, PROGRAM_ID+".cdOverLapChk");
		model.addAttribute("cnt", cnt);
		
		return new ModelAndView(ajaxView, model);
	}
	
	//개별컨텐츠 리스트 조회
	@SuppressWarnings("unchecked")
	@RequestMapping(value = folderPath + "menuClcd.do", method = RequestMethod.POST) 
	public String menuClcd(Mgr0001VO mgr0001VO, ModelMap model, HttpServletRequest request) throws Exception {
		
		List<Mgr0001VO> menuList = (List<Mgr0001VO>) cmmnService.selectList(mgr0001VO, PROGRAM_ID+".menuClcdSelectList");
		model.addAttribute("menuList", menuList);
		model.addAttribute("boardCd", mgr0001VO.getBoardCd());
		
		return folderPath +"menuSel";
	}
}