package com.open.mgr.cmmnBoard;

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
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import com.open.cmmn.model.FileVO;
import com.open.cmmn.service.CmmnService;
import com.open.cmmn.service.FileMngService;
import com.open.cmmn.util.StringUtil;
import com.open.mgr.cmmnBoard.service.CmmnBoardVO;
import com.open.mgr.mgr0001.service.Mgr0001VO;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

/** 공지사항 게시판을 관리하는 컨트롤러 클래스를 정의한다.
 */
@Controller
public class CmmnBoardController {

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
    private final static String PROGRAM_ID = "CmmnBoard";

    /** folderPath **/
    private final static String folderPath = "/mgr/";

	//@Resource(name = "beanValidator")
	//protected DefaultBeanValidator beanValidator;
	
	Logger log = Logger.getLogger(this.getClass());
	
	@RequestMapping(folderPath + "{step}/list.do")
	public String list(@ModelAttribute("searchVO") CmmnBoardVO searchVO, ModelMap model, HttpServletRequest request, @PathVariable String step) throws Exception {
		//cb01=일반, cb02=답변, cb03=댓글, cb04=공지, cb05=이미지
		String boardDivn = "";
		Mgr0001VO mgr0001VO = new Mgr0001VO();
		mgr0001VO.setMenuCd(step);
		int cnt = cmmnService.selectCount(mgr0001VO, "Mgr0001");
		if(cnt == 1){
			mgr0001VO.setMenuSeq(null);
			mgr0001VO = (Mgr0001VO) cmmnService.selectContents(mgr0001VO, "Mgr0001");
			
			if(StringUtil.nullString(mgr0001VO.getBoardDivn()).contains("cb") && !StringUtil.nullString(mgr0001VO.getBoardCd()).equals("")){
				boardDivn = mgr0001VO.getBoardDivn();
				searchVO.setBoardDivn(boardDivn);
				searchVO.setBoardCd(mgr0001VO.getBoardCd());
				model.addAttribute("searchVO", searchVO);
			}
		}
		return ".mLayout:" + folderPath + "cmmnBoard/list_" + (boardDivn.equals("") ? "cb01" : boardDivn);
	}
	
	@RequestMapping(folderPath + "{step}/addList.do")
	public String addList(@ModelAttribute("searchVO") CmmnBoardVO searchVO, ModelMap model, HttpServletRequest request, @PathVariable String step) throws Exception {
		//cb01=일반, cb02=답변, cb03=댓글, cb04=공지, cb05=이미지
		String boardDivn = "";
		if(StringUtil.nullString(searchVO.getBoardDivn()).contains("cb") && !StringUtil.nullString(searchVO.getBoardCd()).equals("")){
			boardDivn = StringUtil.nullString(searchVO.getBoardDivn());
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
			
			int totCnt = cmmnService.selectCount(searchVO, PROGRAM_ID );
			paginationInfo.setTotalRecordCount(totCnt);
			model.addAttribute("paginationInfo", paginationInfo);

			@SuppressWarnings("unchecked")
			List<CmmnBoardVO> boardList = (List<CmmnBoardVO>) cmmnService.selectList(searchVO, PROGRAM_ID);
			model.addAttribute("resultList", boardList);
		}
		return folderPath + "cmmnBoard/addList_" + (boardDivn.equals("") ? "cb01" : boardDivn);
	}
	
	@RequestMapping(folderPath + "{step}/view.do")
	public String view(@ModelAttribute("searchVO") CmmnBoardVO searchVO, ModelMap model, HttpServletRequest request, @PathVariable String step) throws Exception {
		//cb01=일반, cb02=답변, cb03=댓글, cb04=공지, cb05=이미지
		String boardDivn = "";
		Mgr0001VO mgr0001VO = new Mgr0001VO();
		mgr0001VO.setMenuCd(step);
		int cnt = cmmnService.selectCount(mgr0001VO, "Mgr0001");
		if(cnt == 1){
			mgr0001VO.setMenuSeq(null);
			mgr0001VO = (Mgr0001VO) cmmnService.selectContents(mgr0001VO, "Mgr0001");
			
			if(StringUtil.nullString(mgr0001VO.getBoardDivn()).contains("cb") && !StringUtil.nullString(mgr0001VO.getBoardCd()).equals("")){
				boardDivn = mgr0001VO.getBoardDivn();
				searchVO.setBoardDivn(boardDivn);
				searchVO.setBoardCd(mgr0001VO.getBoardCd());
				model.addAttribute("searchVO", searchVO);

				//게시물 정보 조회
				CmmnBoardVO cmmnBoardVO = new CmmnBoardVO();
				cmmnBoardVO = (CmmnBoardVO) cmmnService.selectContents(searchVO, PROGRAM_ID);
				model.addAttribute("cmmnBoardVO", cmmnBoardVO);
				
				//다음글 이전글
				CmmnBoardVO next = (CmmnBoardVO) cmmnService.selectContents(searchVO, PROGRAM_ID + ".nextSelectContents");
				model.addAttribute("next", next);
				CmmnBoardVO prev = (CmmnBoardVO) cmmnService.selectContents(searchVO, PROGRAM_ID + ".prevSelectContents");
				model.addAttribute("prev", prev);
				
				//이미지파일
				if(boardDivn.equals("cb05")){
					if(cmmnBoardVO != null){
						if(!StringUtil.nullConvert(cmmnBoardVO.getImageFileId()).equals("")){
							FileVO fileVO = new FileVO();
							fileVO.setAtchFileId(cmmnBoardVO.getImageFileId());
							List<FileVO> imageList = fileMngService.selectFileInfs(fileVO);
							model.addAttribute("imageList", imageList);
						}
					}
				}
				
				return ".mLayout:" + folderPath + "cmmnBoard/view_" + boardDivn;
			}
		}return "/error/error404.do";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(folderPath + "{step}/{procType}Form.do")
	public String form(@ModelAttribute("searchVO") CmmnBoardVO searchVO, ModelMap model, HttpServletRequest request, @PathVariable String step, @PathVariable String procType) throws Exception {
		//cb01=일반, cb02=답변, cb03=댓글, cb04=공지, cb05=이미지
		String boardDivn = "";
		Mgr0001VO mgr0001VO = new Mgr0001VO();
		mgr0001VO.setMenuCd(step);
		int cnt = cmmnService.selectCount(mgr0001VO, "Mgr0001");
		if(cnt == 1){
			mgr0001VO.setMenuSeq(null);
			mgr0001VO = (Mgr0001VO) cmmnService.selectContents(mgr0001VO, "Mgr0001");
			
			if(StringUtil.nullString(mgr0001VO.getBoardDivn()).contains("cb") && !StringUtil.nullString(mgr0001VO.getBoardCd()).equals("")){
				boardDivn = mgr0001VO.getBoardDivn();
				searchVO.setBoardDivn(boardDivn);
				searchVO.setBoardCd(mgr0001VO.getBoardCd());
				model.addAttribute("searchVO", searchVO);
				
				CmmnBoardVO cmmnBoardVO = new CmmnBoardVO();
				if(procType.equals("update")){
					//게시물 정보 조회
					cmmnBoardVO = (CmmnBoardVO) cmmnService.selectContents(searchVO, PROGRAM_ID);
				}
				model.addAttribute("cmmnBoardVO", cmmnBoardVO);
				
				return ".mLayout:" + folderPath + "cmmnBoard/form_" + boardDivn;
			}
		}return "/error/error404.do";
	}
	
	@RequestMapping(folderPath + "{step}/{procType}Proc.do")
	public String proc(@ModelAttribute("searchVO") CmmnBoardVO searchVO, ModelMap model, HttpServletRequest request, @PathVariable String step, @PathVariable String procType) throws Exception {
		//cb01=일반, cb02=답변, cb03=댓글, cb04=공지, cb05=이미지
		String boardDivn = "";
		Mgr0001VO mgr0001VO = new Mgr0001VO();
		mgr0001VO.setMenuCd(step);
		int cnt = cmmnService.selectCount(mgr0001VO, "Mgr0001");
		if(cnt == 1){
			mgr0001VO.setMenuSeq(null);
			mgr0001VO = (Mgr0001VO) cmmnService.selectContents(mgr0001VO, "Mgr0001");
			
			if(StringUtil.nullString(mgr0001VO.getBoardDivn()).contains("cb") && !StringUtil.nullString(mgr0001VO.getBoardCd()).equals("")){
				boardDivn = mgr0001VO.getBoardDivn();
				searchVO.setBoardDivn(boardDivn);
				searchVO.setBoardCd(mgr0001VO.getBoardCd());
				model.addAttribute("searchVO", searchVO);
				
				String menuGrp = StringUtil.getMenuCd(request.getRequestURI()).get("menuGrp");
				searchVO.setMenuGrp(menuGrp);
				
				String message = "";
				String cmmnScript = "view.do";
				String boardSeq = (StringUtil.nullString(searchVO.getBoardSeq()).equals("")) ? " " : searchVO.getBoardSeq();
				
				if(procType.equals("insert")){
					searchVO.setDelHtmlCont(StringUtil.removeHtml(StringUtil.unEscape(searchVO.getCont())));
					cmmnService.insertContents(searchVO, PROGRAM_ID );
					message = "등록되었습니다";
					cmmnScript = "list.do";
				}else if(procType.equals("update")){
					searchVO.setDelHtmlCont(StringUtil.removeHtml(StringUtil.unEscape(searchVO.getCont())));
		    		cmmnService.updateContents(searchVO, PROGRAM_ID);
		    		message = "수정되었습니다";
				}else if(procType.equals("delete")){
					cmmnService.deleteContents(searchVO, PROGRAM_ID);
					message = "삭제되었습니다";
					cmmnScript = "list.do";
				}else if(procType.equals("grpInsert")){
					searchVO.setDelHtmlCont(StringUtil.removeHtml(StringUtil.unEscape(searchVO.getCont())));
					int grpNoChk = (int) cmmnService.selectContents(searchVO, PROGRAM_ID+".grpNoChk");
					searchVO.setLvl(""+(Integer.parseInt(searchVO.getLvl())+1));
					
					if(grpNoChk == 0){
						searchVO.setBoardGrpNo("-1");
					}else if(grpNoChk > 0){
						searchVO.setBoardGrpNo(""+grpNoChk);
						cmmnService.updateContents(searchVO, PROGRAM_ID+".grpNoPlus");
					}else{
						return "/error/error404.do";
					}
					cmmnService.insertContents(searchVO, PROGRAM_ID );
					message = "등록되었습니다";
					boardSeq = searchVO.getBoardSeq();
				}else if(procType.equals("viewYn")){
					cmmnService.updateContents(searchVO, PROGRAM_ID+".viewYn");
					message = "게시글이 숨김처리 되었습니다";
					cmmnScript = "list.do";
				}else{
					return "/error/error404.do";
				}
				
				model.addAttribute("pName", "boardSeq");	
    			model.addAttribute("pValue", boardSeq);
				model.addAttribute("message", message);
				model.addAttribute("cmmnScript", cmmnScript);
				return "cmmn/execute";
			}
		}return "/error/error404.do";
	}
}
