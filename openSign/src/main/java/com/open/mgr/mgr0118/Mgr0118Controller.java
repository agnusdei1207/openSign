package com.open.mgr.mgr0118;

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

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import com.open.cmmn.excel.ExcelView;
import com.open.cmmn.service.CmmnService;
import com.open.cmmn.service.FileMngService;
import com.open.cmmn.util.DateUtils;
import com.open.cmmn.util.StringUtil;
import com.open.mgr.mgr0003.service.Mgr0003VO;
import com.open.mgr.mgr0006.service.Mgr0006VO;
import com.open.mgr.mgr0118.service.Mgr0118VO;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class Mgr0118Controller {

	@Resource(name = "cmmnService")
    protected CmmnService cmmnService;
	
	@Autowired
	ExcelView excelView;
	
	/** Program ID **/
    private final static String PROGRAM_ID = "Mgr0118";

    /** folderPath **/
    private final static String folderPath = "/mgr/mgr0118/";

	@RequestMapping(folderPath + "list.do")
	public String list(@ModelAttribute("searchVO") Mgr0118VO searchVO, ModelMap model, HttpServletRequest request) throws Exception {
		
		/* fncDate ?????? ????????? ??????  */
		String time = DateUtils.getCurrentDate("yyyy.MM.01");
		searchVO.setSearchStartDate(time);
		time = DateUtils.getCurrentDate("yyyy.MM.dd");
		searchVO.setSearchEndDate(time);
		
		return ".mLayout:" + folderPath + "list";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(folderPath + "addList.do")
	public String addList(@ModelAttribute("searchVO") Mgr0118VO searchVO, ModelMap model, HttpServletRequest request) throws Exception {
		
		searchVO.setPageUnit(6);
		searchVO.setPageSize(7);
		
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

		List<Mgr0118VO> resultList = (List<Mgr0118VO>) cmmnService.selectList(searchVO, PROGRAM_ID);
		model.addAttribute("resultList", resultList);
		
		return folderPath + "addList";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(folderPath + "{procType}Form.do")
	public String form(@ModelAttribute("searchVO") Mgr0118VO searchVO, ModelMap model, HttpServletRequest request, @PathVariable String procType) throws Exception {
			
		Mgr0118VO mgr0118VO = new Mgr0118VO();
		
		if(procType.equals("update")){
			
			mgr0118VO = (Mgr0118VO) cmmnService.selectContents(searchVO, PROGRAM_ID);
			model.addAttribute("mgr0118VO", mgr0118VO);

			List<Mgr0118VO> addResultList = (List<Mgr0118VO>) cmmnService.selectList(searchVO, PROGRAM_ID + ".addSelectList");
			model.addAttribute("addResultList", addResultList);
			
		}
		List<Mgr0118VO> addResultList = (List<Mgr0118VO>) cmmnService.selectList(searchVO, PROGRAM_ID + ".addSelectList");
		model.addAttribute("addResultList", addResultList);
		
		List<Mgr0006VO> emplyList = (List<Mgr0006VO>) cmmnService.selectList(mgr0118VO, PROGRAM_ID + ".emplySelectList");
		model.addAttribute("emplyList", emplyList);
		
		return ".mLayout:" + folderPath + "form";
	}
	

	@SuppressWarnings("unchecked")
	@RequestMapping(folderPath + "{procType}Proc.do")
	public String proc(@ModelAttribute("searchVO") Mgr0118VO searchVO, ModelMap model,@PathVariable String procType, HttpServletRequest request) throws Exception{
		
		List<Mgr0006VO> adminList = (List<Mgr0006VO>)cmmnService.selectList(searchVO, "Mgr0006.authCodeSelectList"); // ?????????
		
		String status = "";
		if(searchVO.getStatus().equals("A")){ 
			status = "[?????? ??????]";
		}else if(searchVO.getStatus().equals("B")){
			status = "[?????? ??????]";
		}else if(searchVO.getStatus().equals("C")){
			status = "[?????? ?????????]";
		}else if(searchVO.getStatus().equals("D")){
			status = "[?????? ??????]";
		}
		
		String cont = "???????????? ????????? " + status.replace("[??????","").replace("]","") +"???????????????. ??????????????????.";
		String title = status + searchVO.getName() + "?????? ???????????? '????????????-????????????'??? "+ status.replace("[??????","").replace("]", "") +"???????????????.";
		
		if(procType != null){
			
			String[] arrAdSeq = searchVO.getAdSeq().split(",");
			String[] arrEmply = searchVO.getEmplySeq().split(",");
			String[] arrStaDate = searchVO.getStaDate().split(",");
			String[] arrStaHour = searchVO.getStaHour().split(",");
			String[] arrStaMin = searchVO.getStaMin().split(",");
			String[] arrEndDate = searchVO.getEndDate().split(",");
			String[] arrEndHour = searchVO.getEndHour().split(",");
			String[] arrEndMin = searchVO.getEndMin().split(",");
			String[] arrCont = searchVO.getCont().split(",");
			
			if(procType.equals("insert")){
				
				String newSeq =(String)cmmnService.selectContents(searchVO, PROGRAM_ID + ".selectSeq"); 
				searchVO.setOtSeq( newSeq );
				cmmnService.insertContents(searchVO, PROGRAM_ID);
				
				if(arrEmply.length > 0){
					for(int i = 0; i < arrEmply.length; i++){
						
						searchVO.setEmplySeq(arrEmply[i].split("_")[0]);
						searchVO.setStaDate(arrStaDate[i]);
						searchVO.setStaHour(arrStaHour[i]);
						searchVO.setStaMin(arrStaMin[i]);
						searchVO.setEndDate(arrEndDate[i]);
						searchVO.setEndHour(arrEndHour[i]);
						searchVO.setEndMin(arrEndMin[i]);
						searchVO.setCont(arrCont[i]);
						
						cmmnService.insertContents(searchVO, PROGRAM_ID + ".addInsertContents");
					} 
				}
				
				for (Mgr0006VO mgr0006VO : adminList) {
					sendMail(mgr0006VO.getEmail(), cont, title);
				}
				
				model.addAttribute("message","?????????????????????.");
				model.addAttribute("cmmnScript","list.do");
				return "cmmn/execute";
				
				
			}else if(procType.equals("update")){  
				
				if("B".equals(searchVO.getStatus()) || "D".equals(searchVO.getStatus())){
					sendMail(searchVO.getTeamMail(), cont, title);
				}else if("C".equals(searchVO.getStatus())){
					for (Mgr0006VO mgr0006VO : adminList) {
						sendMail(mgr0006VO.getEmail(), cont, title);
					}
				} 
				
				cmmnService.updateContents(searchVO, PROGRAM_ID);
				
				if(arrAdSeq.length > 0){
					for(int i = 0; i < arrAdSeq.length; i++){
						
						searchVO.setAdSeq(arrAdSeq[i]);
						searchVO.setEmplySeq(arrEmply[i].split("_")[0]);
						searchVO.setStaDate(arrStaDate[i]);
						searchVO.setStaHour(arrStaHour[i]);
						searchVO.setStaMin(arrStaMin[i]);
						searchVO.setEndDate(arrEndDate[i]);
						searchVO.setEndHour(arrEndHour[i]);
						searchVO.setEndMin(arrEndMin[i]);
						searchVO.setCont(arrCont[i]);

						if(arrAdSeq[i].equals(" ")){
							cmmnService.insertContents(searchVO, PROGRAM_ID + ".addInsertContents");
						}else{
							cmmnService.updateContents(searchVO, PROGRAM_ID + ".addUpdateContents");
						}
					}
				}
				model.addAttribute("message","?????????????????????.");
				model.addAttribute("pName", "otSeq");
				model.addAttribute("pValue", searchVO.getOtSeq());
				model.addAttribute("cmmnScript","updateForm.do");
				return "cmmn/execute";
			}else if(procType.equals("delete")){
				cmmnService.deleteContents(searchVO, PROGRAM_ID);
				cmmnService.deleteContents(searchVO, PROGRAM_ID + ".addDeleteContents");
				model.addAttribute("message", "?????????????????????.");
				model.addAttribute("cmmnScript", "list.do");
				return "cmmn/execute";
			}else if(procType.equals("addDelete")){
				cmmnService.deleteContents(searchVO, PROGRAM_ID + ".addDeleteContents");
				return folderPath + "list";
			}
		}
		return "redirect/list.do";
	}
	
	/*?????? List */
	@RequestMapping(folderPath + "modal.do")
	public String modal(@ModelAttribute("searchVO") Mgr0118VO searchVO, ModelMap model, HttpServletRequest request) throws Exception{
		
		return folderPath + "popList";
	}
	
	/* ?????? addList */
	@SuppressWarnings("unchecked")
	@RequestMapping(folderPath + "popAddList.do")
	public String popAddList(@ModelAttribute("searchVO") Mgr0118VO searchVO, ModelMap model, HttpServletRequest request) throws Exception {
		   
		searchVO.setPageUnit(10);
		searchVO.setPageSize(5);
		
		/** pageing setting */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPopPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());
		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		int totCnt = cmmnService.selectCount(searchVO, PROGRAM_ID + ".popSelectCount");
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);

		List<Mgr0118VO> resultList = (List<Mgr0118VO>) cmmnService.selectList(searchVO, PROGRAM_ID + ".popSelectList");
		model.addAttribute("resultList", resultList);
		
		return folderPath + "popAddList";
	}
	
	/* ????????? ???????????? ?????? + ????????? ??????  */
	@ResponseBody
	@SuppressWarnings("rawtypes")
	@RequestMapping(folderPath + "statusUpdate.do")
	public Map stateUpdate(@ModelAttribute("searchVO") Mgr0118VO searchVO) throws Exception{
		
		Map<String, String>map = new HashMap<>();
		cmmnService.updateContents(searchVO, PROGRAM_ID + ".statusUpdateContents");
		
		@SuppressWarnings("unchecked")
		List<Mgr0006VO> adminList = (List<Mgr0006VO>)cmmnService.selectList(searchVO, "Mgr0006.authCodeSelectList"); // ?????????
		
		String status = "";
		if(searchVO.getStatus().equals("A")){ 
			status = "[?????? ??????]";
		}else if(searchVO.getStatus().equals("B")){
			status = "[?????? ??????]";
		}else if(searchVO.getStatus().equals("C")){
			status = "[?????? ?????????]";
		}else if(searchVO.getStatus().equals("D")){
			status = "[?????? ??????]";
		}
		
		String cont = "???????????? ????????? " + status.replace("[??????","").replace("]","") +"???????????????. ??????????????????.";
		String title = status + searchVO.getName() + "?????? ???????????? '????????????-????????????'??? "+ status.replace("[??????","").replace("]", "") +"???????????????.";
		
		if("B".equals(searchVO.getStatus()) || "D".equals(searchVO.getStatus())){
			sendMail(searchVO.getTeamMail(), cont, title);
		}else if("C".equals(searchVO.getStatus())){
			for (Mgr0006VO mgr0006VO : adminList) {
				sendMail(mgr0006VO.getEmail(), cont, title);
			}
		} 
		
		map.put("result", "????????? ?????????????????????.");
		
		return map;
	}
	
	/* ???????????? ?????? */
	@ResponseBody
	@SuppressWarnings("rawtypes")
	@RequestMapping(folderPath + "addDelete.do")
	public Map addDelete(@ModelAttribute("searchVO") Mgr0118VO searchVO) throws Exception{
		
		Map<String, String>map = new HashMap<>();
		cmmnService.updateContents(searchVO, PROGRAM_ID + ".addDeleteContents");
		map.put("result", "?????????????????????." );
		
		return map;
	}
	
	/* ?????? ???????????? */
	@SuppressWarnings("unchecked")
	@RequestMapping(folderPath + "excelDown.do")
	public ModelAndView excelDown(@ModelAttribute("searchVO") Mgr0118VO mgr0118VO, ModelMap model, HttpServletRequest request) throws Exception{
		
		ModelAndView mav = new ModelAndView(excelView);
		String tit = "????????????";
		String url = "/overTime.xlsx";
		
		List<Mgr0118VO> resultList = (List<Mgr0118VO>) cmmnService.selectList(mgr0118VO, PROGRAM_ID + ".excelDownSelectList");
		
		mav.addObject("target", tit);
		mav.addObject("source", url);
		
		if(resultList.size() > 0 ){
			mav.addObject("result", resultList);
		}
		
		return mav;
	}
	
	/* ????????? ?????? */
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


}
