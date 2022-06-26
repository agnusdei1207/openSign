package com.open.mgr.mgr0018;

import java.util.List;
import java.util.Properties;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import com.open.cmmn.service.CmmnService;
import com.open.cmmn.service.FileMngService;
import com.open.cmmn.util.StringUtil;
import com.open.mgr.mgr0001.service.Mgr0001VO;
import com.open.mgr.mgr0003.service.Mgr0003VO;
import com.open.mgr.mgr0018.service.Mgr0018VO;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

/** 공지사항 게시판을 관리하는 컨트롤러 클래스를 정의한다.
 */
@Controller
public class Mgr0018Controller {

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
    private final static String PROGRAM_ID = "Mgr0018";

    /** folderPath **/
    private final static String folderPath = "/mgr/mgr0018/";

	//@Resource(name = "beanValidator")
	//protected DefaultBeanValidator beanValidator;
	
	Logger log = Logger.getLogger(this.getClass());
	
	@SuppressWarnings("unchecked")
	@RequestMapping(folderPath + "list.do")
	public String list(@ModelAttribute("searchVO") Mgr0018VO searchVO, ModelMap model, HttpServletRequest request) throws Exception {
		
		Mgr0003VO mgr0003VO = new Mgr0003VO();
		mgr0003VO.setpCd("00");
		List<Mgr0003VO> menuGrpList = (List<Mgr0003VO>) cmmnService.selectList(mgr0003VO, "Mgr0003");
		model.addAttribute("menuGrpList", menuGrpList);
		
		return ".mLayout:" + folderPath + "list";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(folderPath + "addList.do")
	public String addList(@ModelAttribute("searchVO") Mgr0018VO searchVO, ModelMap model, HttpServletRequest request) throws Exception {
			
		int pageSize = propertiesService.getInt("pageSize");
		searchVO.setPageSize(pageSize);
		
		/** pageing setting */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());
		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		int totCnt = cmmnService.selectCount(searchVO, PROGRAM_ID);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);

		List<Mgr0018VO> resultList = (List<Mgr0018VO>) cmmnService.selectList(searchVO, PROGRAM_ID);
		model.addAttribute("resultList", resultList);
		
		return folderPath + "addList";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(folderPath + "view.do")
	public String view(@ModelAttribute("searchVO") Mgr0018VO searchVO, ModelMap model, HttpServletRequest request) throws Exception {
			
		//게시물 정보 조회
		Mgr0018VO mgr0018VO = new Mgr0018VO();
		mgr0018VO = (Mgr0018VO) cmmnService.selectContents(searchVO, PROGRAM_ID);
		model.addAttribute("mgr0018VO", mgr0018VO);
		
		//다음글 이전글
		Mgr0018VO next = (Mgr0018VO) cmmnService.selectContents(searchVO, PROGRAM_ID + ".nextSelectContents");
		model.addAttribute("next", next);
		Mgr0018VO prev = (Mgr0018VO) cmmnService.selectContents(searchVO, PROGRAM_ID + ".prevSelectContents");
		model.addAttribute("prev", prev);
		
		Mgr0003VO mgr0003VO = new Mgr0003VO();
		mgr0003VO.setpCd("00");
		List<Mgr0003VO> menuGrpList = (List<Mgr0003VO>) cmmnService.selectList(mgr0003VO, "Mgr0003");
		model.addAttribute("menuGrpList", menuGrpList);
		
		return ".mLayout:" + folderPath + "view";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(folderPath + "{procType}Form.do")
	public String form(@ModelAttribute("searchVO") Mgr0018VO searchVO, ModelMap model, HttpServletRequest request, @PathVariable String procType) throws Exception {
			
		Mgr0018VO mgr0018VO = new Mgr0018VO();
		if(procType.equals("update")){
			//게시물 정보 조회
			mgr0018VO = (Mgr0018VO) cmmnService.selectContents(searchVO, PROGRAM_ID);
		}
		model.addAttribute("mgr0018VO", mgr0018VO);
		
		Mgr0003VO mgr0003VO = new Mgr0003VO();
		mgr0003VO.setpCd("00");
		List<Mgr0003VO> menuGrpList = (List<Mgr0003VO>) cmmnService.selectList(mgr0003VO, "Mgr0003");
		model.addAttribute("menuGrpList", menuGrpList);
		
		return ".mLayout:" + folderPath + "form";
	}
	
	@RequestMapping(folderPath + "{procType}Proc.do")
	public String proc(@ModelAttribute("searchVO") Mgr0018VO searchVO, ModelMap model, HttpServletRequest request, @PathVariable String procType) throws Exception {
		
		String message = "";
		String cmmnScript = "";
		
		if(procType.equals("insert") ){
			cmmnService.insertContents(searchVO, PROGRAM_ID );
			message = "등록되었습니다";
			cmmnScript = "list.do";
		} else if(procType.equals("update")){
    		cmmnService.updateContents(searchVO, PROGRAM_ID);
    		message = "수정되었습니다";
    		cmmnScript = "view.do";
		} else if(procType.equals("delete")){
			cmmnService.deleteContents(searchVO, PROGRAM_ID);
			message = "삭제되었습니다";
			cmmnScript = "list.do";
		} else{
			return "redirect:list.do";
		}
		
		String requestBoardSeq = (StringUtil.nullString(searchVO.getRequestBoardSeq()).equals("")) ? " " : searchVO.getRequestBoardSeq();
		
		model.addAttribute("pName", "requestBoardSeq");	
		model.addAttribute("pValue", requestBoardSeq);
		model.addAttribute("message", message);
		model.addAttribute("cmmnScript", cmmnScript);
		return "cmmn/execute";
	}
	
	@RequestMapping(folderPath + "changeRequest.do")
	public ModelAndView changeRequest(Mgr0018VO mgr0018VO,ModelMap model, HttpServletRequest request) throws Exception{
		String msg = "변경이 실패하였습니다";
		if(!StringUtil.nullString(mgr0018VO.getRequestBoardSeq()).equals("")){
			cmmnService.updateContents(mgr0018VO, PROGRAM_ID+".changeRequest");
			msg = "변경하였습니다";
		}
		model.addAttribute("msg", msg);
		return new ModelAndView(ajaxView, model);
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(folderPath + "replyList.do")
	public String replyList(@ModelAttribute("searchVO") Mgr0018VO searchVO, ModelMap model, HttpServletRequest request) throws Exception{

		List<Mgr0018VO> replyList = (List<Mgr0018VO>) cmmnService.selectList(searchVO, PROGRAM_ID+".replyList");
		model.addAttribute("replyList", replyList);
		
		return folderPath + "replyList";
	}
	
	@RequestMapping(folderPath + "{procType}ReplyProc.do")
	public ModelAndView ReplyProc(Mgr0018VO mgr0018VO, ModelMap model, HttpServletRequest request, @PathVariable String procType) throws Exception{
		String msg = "";
		String result = "";
		if(!StringUtil.nullString(mgr0018VO.getRequestBoardSeq()).equals("")){
			if(procType.equals("insert")){
				cmmnService.insertContents(mgr0018VO, PROGRAM_ID+".replyInsert");
				msg = "댓글이 등록되었습니다";
			}else if(procType.equals("update")){
				cmmnService.updateContents(mgr0018VO, PROGRAM_ID+".replyUpdate");
				msg = "댓글이 수정되었습니다";
			}else if(procType.equals("delete")){
				cmmnService.deleteContents(mgr0018VO, PROGRAM_ID+".replyDelete");
				msg = "댓글이 삭제되었습니다";
			}
			result = "success";
		}else{
			msg = "실패하였습니다";
			result = "fail";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("result", result);
		return new ModelAndView(ajaxView, model);
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(folderPath + "selectMenu.do")
	public String selectMenu(Mgr0018VO mgr0018VO, ModelMap model, HttpServletRequest request) throws Exception{
		
		String menuCd = StringUtil.nullString(mgr0018VO.getMenuCd());
		String target = StringUtil.nullString(mgr0018VO.getTarget());
		target = target.replace("menuCd","");
		target = target + "차메뉴";
		
		Mgr0001VO mgr0001VO = new Mgr0001VO();
		mgr0001VO.setpMenuCd(mgr0018VO.getpMenuCd());
		List<Mgr0001VO> menuList = (List<Mgr0001VO>) cmmnService.selectList(mgr0001VO, "Mgr0001");
		
		model.addAttribute("menuList", menuList);
		model.addAttribute("target", target);
		model.addAttribute("menuCd", menuCd);

		return folderPath + "menuSel";
	}
}
