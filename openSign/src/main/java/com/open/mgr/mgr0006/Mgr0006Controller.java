package com.open.mgr.mgr0006;

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

import com.open.cmmn.model.FileVO;
import com.open.cmmn.service.CmmnService;
import com.open.cmmn.service.FileMngService;
import com.open.cmmn.util.EncryptUtil;
import com.open.cmmn.util.SessionUtil;
import com.open.cmmn.util.StringUtil;
import com.open.mgr.mgr0003.service.Mgr0003VO;
import com.open.mgr.mgr0006.service.Mgr0006VO;
import com.open.mgr.mgr0007.service.Mgr0007VO;

import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import net.sf.ehcache.Ehcache;
import net.sf.ehcache.Element;

/** 공지사항 게시판을 관리하는 컨트롤러 클래스를 정의한다.
 */
@Controller
public class Mgr0006Controller {

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
	
	@Resource(name = "mgrIdGnrService")
	private EgovIdGnrService mgrIdGnrService;
	
	@Resource
	private MappingJackson2JsonView ajaxView;
	
    /** Program ID **/
    private final static String PROGRAM_ID = "Mgr0006";

    /** folderPath **/
    private final static String folderPath = "/mgr/mgr0006/";

	Logger log = Logger.getLogger(this.getClass());

	@SuppressWarnings("unchecked")
	@RequestMapping(folderPath +"list.do")
	public String list(@ModelAttribute("searchVO") Mgr0006VO searchVO, ModelMap model, HttpServletRequest request) throws Exception {
		
		Mgr0007VO authVO = new Mgr0007VO();
		List<Mgr0007VO> authList = (List<Mgr0007VO>) cmmnService.selectList(authVO, "Mgr0007.selectAuthList");
		model.addAttribute("authList", authList);
		
		return ".mLayout:"+ folderPath + "list";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(folderPath +"addList.do")
	public String addList(@ModelAttribute("searchVO") Mgr0006VO searchVO, ModelMap model, HttpServletRequest request) throws Exception {
		
		searchVO.setPageUnit(10);
		searchVO.setPageSize(11);

		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());
		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex()); 
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		int totCnt = cmmnService.selectCount(searchVO, PROGRAM_ID );
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		
		List<Mgr0006VO> resultList = (List<Mgr0006VO>) cmmnService.selectList(searchVO, PROGRAM_ID);
		model.addAttribute("resultList", resultList);
		
		return  folderPath + "addList";
	}
   
	@SuppressWarnings("unchecked")
	@RequestMapping(folderPath +"{procType}Form.do")
	public String form(@ModelAttribute("searchVO") Mgr0006VO searchVO, Model model,@PathVariable String procType, HttpServletRequest request) throws Exception {
		
		Mgr0006VO mgr0006VO = new Mgr0006VO();
		
		if(procType != null){
			if (procType.equals("update")) {
				mgr0006VO = (Mgr0006VO) cmmnService.selectContents(searchVO, PROGRAM_ID);
				if(!StringUtil.nullString(SessionUtil.getUserDetails().getAuthCode()).equals("1") && !StringUtil.nullString(mgr0006VO.getSeq()).equals(StringUtil.nullString(SessionUtil.getUserDetails().getLoginSeq()))){
					model.addAttribute("message", "비정상적인 접근입니다.");
					model.addAttribute("cmmnScript", "list.do");
					return "cmmn/execute";
				}
			}
		}
			searchVO.setProcType(procType);
			mgr0006VO.setSearchVO(searchVO);
			model.addAttribute("mgr0006VO", mgr0006VO);
			
			searchVO.setSchEtc01("2");
			  
			Mgr0007VO authVO = new Mgr0007VO();
			if(SessionUtil.getUserDetails() != null ){
				authVO.setSchEtc01(StringUtil.nullString(SessionUtil.getUserDetails().getAuthCode()));
			}
			List<Mgr0007VO> authList = (List<Mgr0007VO>) cmmnService.selectList(authVO, "Mgr0007.selectAuthList");
			Mgr0003VO cdVO = new Mgr0003VO();
			cdVO.setpCd("01"); 
			List<Mgr0003VO> codeList = (List<Mgr0003VO>) cmmnService.selectList(cdVO, "Mgr0003.selectList");
			cdVO.setpCd("03");
			List<Mgr0003VO> positionList = (List<Mgr0003VO>) cmmnService.selectList(cdVO, "Mgr0003.selectList");
			cdVO.setpCd("04");
			List<Mgr0003VO> partList = (List<Mgr0003VO>) cmmnService.selectList(cdVO, "Mgr0003.selectList");
			   
			
			model.addAttribute("positionList", positionList);
			model.addAttribute("partList", partList);
			model.addAttribute("codeList", codeList);
			model.addAttribute("authList", authList);
			
		
		return ".mLayout:"+ folderPath + "form";
	}

	@RequestMapping(value = folderPath +"{procType}Proc.do", method = RequestMethod.POST)
	public String proc(@ModelAttribute("searchVO") Mgr0006VO searchVO, Model model, SessionStatus status,@PathVariable String procType, HttpServletRequest request) throws Exception {
		if(procType != null){
			
			if (procType.equals("insert")) {
				String mgrSeq = mgrIdGnrService.getNextStringId();
				searchVO.setSeq(mgrSeq);
				searchVO.setPwd(EncryptUtil.getString(EncryptUtil.Sha256EncryptB(searchVO.getPwd().getBytes("UTF-8"))));
				cmmnService.insertContents(searchVO, PROGRAM_ID);
				
				
			} else if (procType.equals("update") ) {
				
				if(StringUtil.nullString(searchVO.getPwdChk()).equals("CHK")){
					searchVO.setPwd(EncryptUtil.getString(EncryptUtil.Sha256EncryptB(searchVO.getPwd().getBytes("UTF-8"))));
				}
				
				cmmnService.updateContents(searchVO, PROGRAM_ID);
				
				
				
			} else if (procType.equals("delete")) {
				
				cmmnService.deleteContents(searchVO, PROGRAM_ID);
				/*첨부파일 삭제*/
				FileVO fvo = new FileVO();
				if(!StringUtil.nullConvert(searchVO.getAtchFileId()).equals("")){
					fvo.setAtchFileId(searchVO.getAtchFileId());
					fileMngService.deleteFileDel(fvo);
				}
				
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
	@RequestMapping(value = folderPath + "userIdOverlap.do")
	public ModelAndView menuCodeOverlap(@ModelAttribute("searchVO") Mgr0006VO searchVO, ModelMap model, HttpServletRequest request) throws Exception {
		
		
		int overCnt = cmmnService.selectCount(searchVO, PROGRAM_ID+".overlapSelectCount") ;
		
		model.addAttribute("overCnt", overCnt);
		
		return new ModelAndView(ajaxView,model);
		
	}
	
	
	
	@SuppressWarnings("unchecked")
	@RequestMapping(folderPath +"mypage.do")
	public String mypage(@ModelAttribute("searchVO") Mgr0006VO searchVO, Model model, HttpServletRequest request) throws Exception {
		
		Mgr0006VO mgr0006VO = new Mgr0006VO();
		mgr0006VO = (Mgr0006VO) cmmnService.selectContents(searchVO, PROGRAM_ID+".myPageSelectContents");
		mgr0006VO.setSearchVO(searchVO);
		model.addAttribute("mgr0006VO", mgr0006VO);
			
		return ".mLayout:" + folderPath +"mypage";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(folderPath +"oldPwdChk.do")
	public ModelAndView oldPwdChk(@ModelAttribute("searchVO") Mgr0006VO searchVO, ModelMap model, HttpServletRequest request) throws Exception {
		
		searchVO.setPwd(EncryptUtil.getString(EncryptUtil.Sha256EncryptB(searchVO.getPwd().getBytes("UTF-8"))));
		int overCnt = cmmnService.selectCount(searchVO, PROGRAM_ID + ".overlapSelectCount");
		Boolean overChk = false;
		if(overCnt < 1 ){
			overChk = false;
		}else{
			overChk = true;
		}
		model.addAttribute("overChk", overChk);
		return new ModelAndView(ajaxView,model);
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(folderPath +"selDprt.do")
	public ModelAndView selDprt(@ModelAttribute("searchVO") Mgr0006VO searchVO,Mgr0003VO cdVO, ModelMap model, HttpServletRequest request) throws Exception {
		
		List<Mgr0003VO> resultList = (List<Mgr0003VO>)cmmnService.selectList(cdVO, "Mgr0003.selectList");
		
		model.addAttribute("resultList", resultList);
		
		return new ModelAndView(ajaxView,model);
	}

	
		

}
