package com.open.mgr.mgr0117;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.activation.CommandMap;
import javax.activation.MailcapCommandMap;
import javax.annotation.Resource;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.internet.MimeUtility;
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
import com.open.cmmn.model.FileVO;
import com.open.cmmn.service.CmmnService;
import com.open.cmmn.service.FileMngService;
import com.open.cmmn.util.DateUtils;
import com.open.cmmn.util.StringUtil;
import com.open.mgr.mgr0006.service.Mgr0006VO;
import com.open.mgr.mgr0013.service.Mgr0013VO;
import com.open.mgr.mgr0117.service.Mgr0117VO;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class Mgr0117Controller {
 
	@Resource(name = "cmmnService")  
    protected CmmnService cmmnService;
	
	@Resource(name = "FileMngService")
    private FileMngService fileMngService;
	  
	@Autowired
	ExcelView excelView;
	
	/** Program ID **/ 
    private final static String PROGRAM_ID = "Mgr0117";
 
    /** folderPath **/
    private final static String folderPath = "/mgr/mgr0117/";
      
	@RequestMapping(folderPath + "list.do")
	public String list(@ModelAttribute("searchVO") Mgr0117VO searchVO) throws Exception {
		 
		/* fncDate ?????? ?????? ?????? */
		String time = DateUtils.getCurrentDate("yyyy.MM.01");
		searchVO.setSearchStartDate(time);  
		time = DateUtils.getCurrentDate("yyyy.MM.dd");
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
		
		String time = DateUtils.getCurrentDate("yyyy.MM.dd");
		if("insert".equals(procType)){
			mgr0117VO.setEatDate(time);  
		}    
		  
		if(!"".equals(StringUtil.nullString(searchVO.getElSeq())) && "update".equals(procType)){      
			mgr0117VO = (Mgr0117VO) cmmnService.selectContents(searchVO, PROGRAM_ID);
			
			FileVO fileVO = new FileVO();   
			fileVO.setAtchFileId(mgr0117VO.getAtchFileId());   
			List<FileVO> fileSnList = fileMngService.selectFileInfs(fileVO);
			model.addAttribute("fileSnList", fileSnList);    
			
			/* ?????? ??????  */ 
			if(!"".equals(StringUtil.nullString(mgr0117VO.getUserSeq()))){
				String[] tempArray = mgr0117VO.getUserSeq().split(",");
				for(int i = 0; i < tempArray.length; i++){       
					tempArray[i] = "'" + tempArray[i] + "'"; 
				}  
				  
				String temp = "";
				for(int i = 0; i < tempArray.length; i++){ 
					String comma = ",";	// ????????? ????????? ??? : , ?????? ?????? 
					if(i == tempArray.length - 1){ 
						comma = "";	// ????????? ????????? : ?????? ??????  
					}   
					temp += tempArray[i] + comma;  
				}          
				mgr0117VO.setUserSeq(temp);     
				  
				/* ????????? ?????? ?????? */
				List<Mgr0006VO>	userList = (List<Mgr0006VO>) cmmnService.selectList(mgr0117VO, PROGRAM_ID + ".UserSelectList");
				model.addAttribute("userList", userList); 
			}
		}       
		 
		/* ????????? ?????? ?????? ?????? */     
		List<Mgr0117VO>	cardList = (List<Mgr0117VO>) cmmnService.selectList(searchVO, PROGRAM_ID + ".cardSelectList");
		model.addAttribute("cardList", cardList); 
		/* ????????? ?????? ?????? */
		model.addAttribute("mgr0117VO", mgr0117VO);
		
		return ".mLayout:" + folderPath + "form";
	}  
	 
	@RequestMapping(folderPath + "{procType}Proc.do")
	public String proc(@ModelAttribute("searchVO") Mgr0117VO searchVO, ModelMap model, @PathVariable String procType) throws Exception {
		
		String message = ""; 
		String cmmnScript = "";
		   
		if(procType.equals("insert") ){     
			searchVO.setUserSeq(fncSetPeopleList(searchVO.getUserSeq()));
			cmmnService.insertContents(searchVO, PROGRAM_ID );
			message = "?????????????????????";
			cmmnScript = "list.do";  
		} else if(procType.equals("update")){  
			searchVO.setUserSeq(fncSetPeopleList(searchVO.getUserSeq()));
    		cmmnService.updateContents(searchVO, PROGRAM_ID);
    		message = "?????????????????????";   
    		cmmnScript = "updateForm.do";
		} else if(procType.equals("delete")){
			cmmnService.deleteContents(searchVO, PROGRAM_ID);
			message = "?????????????????????";
			cmmnScript = "list.do";
		} else {
			return "redirect:list.do";   
		}
		   
		model.addAttribute("pName", "elSeq");	
		model.addAttribute("pValue", searchVO.getElSeq());
		model.addAttribute("message", message);
		model.addAttribute("cmmnScript", cmmnScript);
		return "cmmn/execute";
	}   
	
	 
	/* ???????????? ?????? ??? ?????? */
	@ResponseBody   
	@SuppressWarnings("rawtypes") 
	@RequestMapping(folderPath + "addFvrts.do")   
	public Map addFvrts(@ModelAttribute("searchVO") Mgr0117VO searchVO, String chk_state) throws Exception {
		    
		Map<String, String> map = new HashMap<>(); 
		/* ??????????????? ?????? ???????????? ????????? ?????? */  
		int cnt = (Integer) cmmnService.selectCount(searchVO, PROGRAM_ID + ".fvrtsCheckCount");
		if(cnt > 0){     
			/* ???????????? ?????? ?????? */
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
	   
	/* ?????? ???????????? */
	@SuppressWarnings("unchecked") 
	@RequestMapping(folderPath + "excelDown.do")
	public ModelAndView excelDown(@ModelAttribute("searchVO") Mgr0117VO mgr0117VO) throws Exception{
		  
		ModelAndView mav = new ModelAndView(excelView);  
		String tit = "??????";  
		String url = "/eatLog.xlsx";
		          
		List<Mgr0117VO> resultList = (List<Mgr0117VO>) cmmnService.selectList(mgr0117VO, PROGRAM_ID+".excelDownSelectList" );
		
		mav.addObject("target", tit);  
		mav.addObject("source", url);
		        
		if(resultList.size() > 0){
			mav.addObject("result", resultList);
		}      
		
		return mav;
	}
	   
	/* ?????? ?????? */  
	@ResponseBody
	@SuppressWarnings("rawtypes")
	@RequestMapping(folderPath + "stateUpdate.do")
	public Map stateUpdate(@ModelAttribute("searchVO") Mgr0117VO searchVO) throws Exception{
		  
		Map<String, String> map = new HashMap<>();   
		cmmnService.updateContents(searchVO, PROGRAM_ID + ".stateUpdateContents");
		map.put("result", "????????? ?????????????????????.");             
		       
		return map;
	}  
	    
	/* ?????? ?????? ?????? */  
	@RequestMapping(folderPath + "checkedUpdate.do")
	public String checkedUpdate(@ModelAttribute("searchVO") Mgr0117VO searchVO, ModelMap model) throws Exception{
		    
		if(!"".equals(StringUtil.nullString(searchVO.getSchEtc03()))){
			String[] tempArray = searchVO.getSchEtc03().split(",");    
			for(String temp : tempArray){  
				searchVO.setElSeq(temp); 
				searchVO.setState("Y");
				cmmnService.updateContents(searchVO, PROGRAM_ID + ".stateUpdateContents");
			}
		}
		          
		model.addAttribute("message", "????????? ?????????????????????.");
		model.addAttribute("cmmnScript", "list.do");
		return "cmmn/execute";
	} 
	
	/* ?????? ?????? */     
	@RequestMapping(folderPath + "sendMail.do")
	public String sendMailDo(@ModelAttribute("searchVO") Mgr0013VO searchVO, ModelMap model, HttpServletRequest request) throws Exception{
		     
		sendMail("agnusdei1207@naver.com", "??????", "??????");
		      
		model.addAttribute("message", "?????????????????????");
		model.addAttribute("cmmnScript", "list.do");    
		return "cmmn/execute";
	}    
	    
	/* ?????? ?????? */
	public static void sendMail(String mail, String htmlContent, String ttl) throws Exception {

		String host = ""; 
		String useraddr = ""; 
		String userpwd = "";   
		/* IMAP/SMTP ?????? */ 
		Properties props = new Properties(); 
   
		/* ?????????, ?????? ?????? ?????? */
		host = "smtp.gmail.com";	  
		useraddr = "opennote.opensign@gmail.com";
		userpwd = "bvuwxxdqcgkkgsmk";        
		   
		/* Gmail ??? ???????????? : bvuwxxdqcgkkgsmk */
		props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.socketFactory.port", "465");       
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.auth", "true"); 
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.ssl.protocols", "TLSv1.2");
		 
		  
		final String username = useraddr; // ??????
		final String password = userpwd; // ????????????
		// mailForm??? ?????? ?????? ??????

		/* Session ?????? */
		Session session = Session.getInstance(props, new javax.mail.Authenticator() {
			String userId = username;  
			String userPw = password;

			protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
				return new javax.mail.PasswordAuthentication(userId, userPw);
			} 
		});   
		
		/* Message ?????? */ 
		MimeMessage message = new MimeMessage(session);   
		message.setFrom(new InternetAddress(useraddr, MimeUtility.encodeText("????????????", "UTF-8", "B"))); 
		message.setSender(new InternetAddress(useraddr)); // ?????????
		message.setSubject(ttl); // ?????? 
		session.setDebug(true); // ????????? ??????
    
		/* ?????? ?????? */     
		String htmlContents = StringUtil.unEscape(htmlContent); 
            
		/* ??? ?????? ????????????  ?????? */    
		message.setRecipient(Message.RecipientType.TO, new InternetAddress(mail));
   
		Multipart mp = new MimeMultipart();
		MimeBodyPart mbp1 = new MimeBodyPart();
		mbp1.setContent(htmlContents, "text/html;charset=UTF-8"); // ??????
		mp.addBodyPart(mbp1);  
  
		MailcapCommandMap mc = (MailcapCommandMap) CommandMap.getDefaultCommandMap();
		mc.addMailcap("text/html; x-java-content-handler=com.sun.mail.handlers.text_html");
		mc.addMailcap("text/xml; x-java-content-handler=com.sun.mail.handlers.text_xml");
		mc.addMailcap("text/plain; x-java-content-handler=com.sun.mail.handlers.text_plain");
		mc.addMailcap("multipart/*; x-java-content-handler=com.sun.mail.handlers.multipart_mixed");
		mc.addMailcap("message/rfc822; x-java-content-handler=com.sun.mail.handlers.message_rfc822");
		CommandMap.setDefaultCommandMap(mc);

		message.setContent(mp);
		Transport.send(message); 
	}
	
	/* ?????? ?????? ?????? SEQ ?????? ??????*/        
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
