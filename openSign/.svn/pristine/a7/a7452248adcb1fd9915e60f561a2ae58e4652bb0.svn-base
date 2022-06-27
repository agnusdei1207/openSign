package com.open.mgr.login;

import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.open.cmmn.model.CmmnDefaultVO;
import com.open.cmmn.service.CmmnService;
import com.open.cmmn.service.FileMngService;
import com.open.cmmn.util.EncryptUtil;
import com.open.cmmn.util.SessionUtil;
import com.open.cmmn.util.StringUtil;
import com.open.mgr.login.service.LoginVO;
import com.open.mgr.mgr0001.service.Mgr0001VO;
import com.open.mgr.mgr0016.service.Mgr0016VO;

import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.fdl.property.EgovPropertyService;

/** 공지사항 게시판을 관리하는 컨트롤러 클래스를 정의한다. 
 */
@Controller  
public class LoginController {
	
	/**
	 * globalProperties.
	 */
	@Resource(name = "globalProperties")
	private Properties globalProperties;
	
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
	
	@Resource(name = "userIdGnrService")
	private EgovIdGnrService idgenService; 
	
    /** Program ID **/
    private final static String PROGRAM_ID = "Login";
 
	Logger log = Logger.getLogger(this.getClass());
	   
	
	@RequestMapping(value = "/login.do")
	public String maLogin(@ModelAttribute("searchVO") CmmnDefaultVO searchVO, ModelMap model, HttpServletRequest request) throws Exception {
		LoginVO loginVO = new LoginVO();
		String returnUrl = StringUtil.nullString(request.getParameter("returnUrl"));	
		loginVO.setReturnUrl(URLDecoder.decode(returnUrl, "UTF-8"));	
		model.addAttribute("loginVO", loginVO);
		 
		return  "/mgr/login/login"; 
	}
	 
	 
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/loginProcess.do", method = RequestMethod.POST)
	public String loginProcess(@ModelAttribute("loginVO") LoginVO loginVO	, HttpServletRequest request	, ModelMap model) throws Exception {
		
		String message = "";
		String clientIp = StringUtil.getClientIp(request);
		
		if(loginVO.getId() != null && loginVO.getPwd() != null && !"".equals(loginVO.getId()) && !"".equals(loginVO.getPwd())){
			loginVO.setPwd(EncryptUtil.getString(EncryptUtil.Sha256EncryptB(loginVO.getPwd().getBytes("UTF-8"))));
			
			LoginVO userLoginVO  = (LoginVO)cmmnService.selectContents(loginVO, PROGRAM_ID);
			   
	    	if(userLoginVO == null || userLoginVO.getId() == null || "".equals(userLoginVO.getId())){
	    		//로그인 실패횟수 증가
	    		cmmnService.updateContents(loginVO, PROGRAM_ID+".failCntUpdate");
	    		int failCnt = Integer.parseInt(loginVO.getFailCnt());
	    		message = "아이디 또는 패스워드를 확인하시기 바랍니다.";
	    		if(failCnt >= 5){ 
					message = "5회 이상 로그인 실패로 계정이 잠겼습니다.\\n관리자에게 문의 바랍니다.";
				}else if(failCnt >= 1 && failCnt < 5){
					message = "5회 이상 로그인 실패시 계정이 잠깁니다.\\n" + failCnt + "회 로그인 실패하셨습니다.";
				} 
	    		model.addAttribute("message", message);
	    		
	    		//로그인 실패로그 등록   
				Mgr0016VO mgr0016VO = new Mgr0016VO();
				mgr0016VO.setClientIp(clientIp);
				mgr0016VO.setRgstId(loginVO.getId());    
				mgr0016VO.setLogDivn("mgrFail");
				cmmnService.insertContents(mgr0016VO, "Mgr0016.logInsertContents");
	    		return  "/mgr/login/login";  
	    	}else{
	    			
		    		int failCnt = Integer.parseInt(userLoginVO.getFailCnt());
					if(failCnt >= 5){
						model.addAttribute("message", "5회 이상 로그인 실패로 회원님의 계정이 잠겼습니다.\\n관리자에게 문의 바랍니다.");
			    		return  "/mgr/login/login";
					} 
		    		/*최근 접속일*/ 
					cmmnService.updateContents(userLoginVO, PROGRAM_ID);
					/*로그인 실패 초기화*/
					cmmnService.updateContents(userLoginVO, PROGRAM_ID+".failCntReset");
					/** 세션 정보 입력 */
					HttpSession session = request.getSession();					
					session.setAttribute(SessionUtil.SESSION_MANAGE_KEY, userLoginVO);   
					session.setAttribute("loginVO", userLoginVO);		
					session.setAttribute("loginMgrNowDate", userLoginVO.getNowDate()); //접속시간 
					session.setAttribute("loginMgrLastDate", userLoginVO.getLastDate()); //이전접속
					     
					//로그인로그 등록   
					Mgr0016VO mgr0016VO = new Mgr0016VO(); 
					mgr0016VO.setClientIp(clientIp);
					mgr0016VO.setRgstId(userLoginVO.getSeq());
					mgr0016VO.setLogDivn("mgr");
					cmmnService.insertContents(mgr0016VO, "Mgr0016.logInsertContents");
					
					Mgr0001VO auth = new Mgr0001VO();
    				auth.setAuthCode(userLoginVO.getAuthCode());
    				List<String> authList = (List<String>) cmmnService.selectList(auth, "Mgr0001.menuAuthSelectList");
					
					/* 메뉴 목록 */
					Mgr0001VO menuVO = new Mgr0001VO();
					menuVO.setLvl("1");
					menuVO.setpMenuCd("mgr");
					menuVO.setAuthCode(userLoginVO.getAuthCode());
					menuVO.setSchEtc03("LAYOUT");
					List<Mgr0001VO> menuList = (List<Mgr0001VO>) cmmnService.selectList(menuVO, "Mgr0001.menuSelectList");
					menuVO.setMenuList(menuList);  
					
					for (Mgr0001VO menuVO2 : menuVO.getMenuList()) {
						menuVO2.setLvl("2");
						menuVO2.setpMenuCd(menuVO2.getMenuCd());
						menuVO2.setAuthCode(userLoginVO.getAuthCode());
						menuVO.setSchEtc03("LAYOUT");
						List<Mgr0001VO> manu2List = (List<Mgr0001VO>) cmmnService.selectList(menuVO2, "Mgr0001.menuSelectList");
						menuVO2.setMenuList(manu2List);
						
						for (Mgr0001VO menuVO3 : manu2List) {
							menuVO3.setLvl("3"); 
							menuVO3.setpMenuCd(menuVO3.getMenuCd());  
							menuVO3.setAuthCode(userLoginVO.getAuthCode());
							menuVO.setSchEtc03("LAYOUT");
							List<Mgr0001VO> manu3List = (List<Mgr0001VO>) cmmnService.selectList(menuVO3, "Mgr0001.menuSelectList");
							menuVO3.setMenuList(manu3List);
						} 
					}
					/** 세션 정보 입력 */         
					session.setAttribute(SessionUtil.SESSION_MANAGE_MENU_KEY, menuVO.getMenuList());//메뉴목록
					session.setAttribute("mgrMenu", menuVO.getMenuList());	//메뉴목록
    				session.setAttribute(SessionUtil.SESSION_MANAGE_MENU_AUTH_KEY, authList);//메뉴권한
					session.setMaxInactiveInterval(Integer.parseInt(globalProperties.getProperty("Globals.sessionTime")));	
		    		  
			        if (loginVO.getReturnUrl() == null || loginVO.getReturnUrl().equals("")) {	
		        		return "redirect:/mgr/main.do";
			        } else { 
						String returnUrl = URLDecoder.decode(loginVO.getReturnUrl(), "UTF-8");
						returnUrl = returnUrl.replaceAll("&amp;", "&");
						returnUrl = returnUrl.replaceAll("amp;", "");
						return "redirect:" + returnUrl;
			        } 
		    }    	
		}else{ 
			model.addAttribute("message", "로그인정보가 넘어오지 않았습니다.");
			model.addAttribute("cmmnScript", "login");
			return "cmmn/execute";
		}
	}

	@RequestMapping(value = "/logout.do")
	public String adminLogout(@ModelAttribute("loginVO") LoginVO loginVO, HttpServletRequest request, ModelMap model) throws Exception {

		HttpSession session = request.getSession();
		session.invalidate();
		
		return "/mgr/login/login";
	}	
	
	
	@RequestMapping(value = "/cmmn/fail.do")
	public String fail(@ModelAttribute("searchVO") CmmnDefaultVO searchVO ,ModelMap model) throws Exception {
		
		model.addAttribute("message", "비정상적인 접근입니다.");
		model.addAttribute("cmmnScript", "/logout.do");
		
		return "cmmn/execute";
	}	
	 
	@RequestMapping(value = "/cmmn/main.do")
	public String main(@ModelAttribute("searchVO") CmmnDefaultVO searchVO ,ModelMap model) throws Exception {
		
		model.addAttribute("message", "비정상적인 접근입니다.");
		model.addAttribute("cmmnScript", "/mgr/main.do");
		
		return "cmmn/execute";
	}	 
	    
	@RequestMapping(value = "/modalForm.do")
	public String modalForm(@ModelAttribute("searchVO") CmmnDefaultVO searchVO) throws Exception {
		   
		return "/mgr/login/form"; 
	}	
	  
	/* 비밀번호 변경 ajax */
	@ResponseBody 
	@SuppressWarnings("rawtypes") 
	@RequestMapping(value = "/updatePwd.do")
	public Map updatePwd(@ModelAttribute("searchVO") LoginVO searchVO, ModelMap model ) throws Exception {
		   
		Map<String, Boolean> map = new HashMap<>(); 
		  
		if(searchVO.getId() != null && searchVO.getPwd() != null && !"".equals(searchVO.getId()) && !"".equals(searchVO.getPwd())){
			searchVO.setPwd(EncryptUtil.getString(EncryptUtil.Sha256EncryptB(searchVO.getPwd().getBytes("UTF-8"))));
			 
			LoginVO userLoginVO  = (LoginVO)cmmnService.selectContents(searchVO, PROGRAM_ID);
			   
	    	if(userLoginVO == null || userLoginVO.getId() == null || "".equals(userLoginVO.getId())){
	    		map.put("result", false);  
	    	}else{         
	    		searchVO.setSchEtc01(EncryptUtil.getString(EncryptUtil.Sha256EncryptB(searchVO.getSchEtc01().getBytes("UTF-8"))));
	    		cmmnService.updateContents(searchVO, PROGRAM_ID + ".updateContentsPwd");
	    		map.put("result", true);
	    	}
		}	 
		return map;
	}
	
}
