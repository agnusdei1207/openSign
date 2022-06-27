package com.open.mgr.mgr0013;

import java.util.List;
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
import org.springframework.cache.ehcache.EhCacheCacheManager;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import com.open.cmmn.service.CmmnService;
import com.open.cmmn.service.FileMngService;
import com.open.cmmn.util.StringUtil;
import com.open.mgr.mgr0003.service.Mgr0003VO;
import com.open.mgr.mgr0013.service.Mgr0013VO;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

/** 공지사항 게시판을 관리하는 컨트롤러 클래스를 정의한다.
 */
@Controller
public class Mgr0013Controller {

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
    private final static String PROGRAM_ID = "Mgr0013";

    /** folderPath **/
    private final static String folderPath = "/mgr/mgr0013/";

	//@Resource(name = "beanValidator")
	//protected DefaultBeanValidator beanValidator;
	
    @Autowired
	private EhCacheCacheManager cacheManager;
    
	Logger log = Logger.getLogger(this.getClass());

	/**
	 * 메뉴권한 목록화면
	 * @param searchVO
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(folderPath + "list.do")
	public String list(@ModelAttribute("searchVO") Mgr0013VO searchVO, ModelMap model, HttpServletRequest request) throws Exception {

		return ".mLayout:"+ folderPath + "list";
	}
	
	/**
	 * 메뉴권한 목록화면
	 * @param searchVO
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(folderPath + "addList.do")
	public String addList(@ModelAttribute("searchVO") Mgr0013VO searchVO, ModelMap model, HttpServletRequest request) throws Exception {
		

		searchVO.setPageUnit(Integer.parseInt(searchVO.getSchEtc15()));
		searchVO.setPageSize(10);

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
		
		List<Mgr0013VO> resultList = (List<Mgr0013VO>) cmmnService.selectList(searchVO, PROGRAM_ID );
		model.addAttribute("resultList", resultList);
		
		return folderPath + "addList";
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
	@RequestMapping(folderPath +"view.do")
	public String view(@ModelAttribute("searchVO") Mgr0013VO searchVO, Model model, HttpServletRequest request) throws Exception {
		
		/* 게시판 상세정보 */
		Mgr0013VO mgr0013VO = new Mgr0013VO();
		mgr0013VO = (Mgr0013VO) cmmnService.selectContents(searchVO, PROGRAM_ID );
		model.addAttribute("mgr0013VO", mgr0013VO);
		
		List<Mgr0013VO> userList = (List<Mgr0013VO>) cmmnService.selectList(searchVO, PROGRAM_ID+".userSelectList");
		model.addAttribute("userList", userList);
		
		//이전글 다음글
		Mgr0013VO prev = (Mgr0013VO) cmmnService.selectContents(searchVO, PROGRAM_ID + ".prevSelectContents");
		model.addAttribute("prev", prev);
		Mgr0013VO next = (Mgr0013VO) cmmnService.selectContents(searchVO, PROGRAM_ID + ".nextSelectContents");
		model.addAttribute("next", next);
		
		return ".mLayout:"+ folderPath + "view";
	}

	@RequestMapping(folderPath + "insertForm.do")
	public String form(@ModelAttribute("searchVO") Mgr0013VO searchVO, ModelMap model, HttpServletRequest request) throws Exception {
		
		return ".mLayout:"+ folderPath + "form";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(folderPath + "popList.do")
	public String popList(@ModelAttribute("searchVO") Mgr0013VO searchVO, ModelMap model, HttpServletRequest request) throws Exception {
		
		Mgr0003VO mgr0003VO = new Mgr0003VO(); 
		mgr0003VO.setpCd("01");
		List<Mgr0003VO> authList = (List<Mgr0003VO>) cmmnService.selectList(mgr0003VO, "Mgr0003.selectList" );
		model.addAttribute("authList", authList);
		
		return ".mPopLayout:" + folderPath + "popList";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(folderPath + "popAddList.do")
	public String popFindAddList(@ModelAttribute("searchVO") Mgr0013VO searchVO, ModelMap model, HttpServletRequest request) throws Exception {
		
		searchVO.setPageUnit(Integer.parseInt(searchVO.getSchEtc14()));
		searchVO.setPageSize(10);

		/** pageing setting */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());
		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		int totCnt = cmmnService.selectCount(searchVO, PROGRAM_ID+".popSelectCount" );
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		
		List<Mgr0013VO> resultList = (List<Mgr0013VO>) cmmnService.selectList(searchVO, PROGRAM_ID+".popSelectList");
		model.addAttribute("resultList", resultList);
		
		return folderPath + "popAddList";
	}
	
	@RequestMapping(value = folderPath + "insertProc.do", method = RequestMethod.POST) 
	public String proc(@ModelAttribute("searchVO") Mgr0013VO searchVO, Mgr0013VO mgr0013VO, ModelMap model, HttpServletRequest request) throws Exception {
		
		Mgr0013VO arrData = new Mgr0013VO();
		if(mgr0013VO.getArrayUserSeq().length > 0){
			String menuGrp = StringUtil.getMenuCd(request.getRequestURI()).get("menuGrp");
			arrData.setMenuGrp(menuGrp);
			arrData.setTtl(mgr0013VO.getTtl());
			arrData.setCont(mgr0013VO.getCont());
			arrData.setDvsn("mail");
			cmmnService.insertContents(arrData, PROGRAM_ID+".sendInsertContents");
			
			for(int i=0; i<mgr0013VO.getArrayUserSeq().length; i++){
				
				arrData.setUserSeq(mgr0013VO.getArrayUserSeq()[i]);
				arrData.setUserAddr(mgr0013VO.getArrayUserMail()[i]);
				
				if(arrData.getUserSeq().contains("USER")){
					arrData.setUserDvsn("user");
				}else if(arrData.getUserSeq().contains("MGR")){
					arrData.setUserDvsn("admin");
				}
				cmmnService.insertContents(arrData, PROGRAM_ID+".sendDetailInsertContents");
				sendMail(arrData.getUserAddr(), arrData.getCont(), arrData.getTtl());
			}
		}
		
		model.addAttribute("message", "전송되었습니다");
		model.addAttribute("cmmnScript", "list.do");
		return "cmmn/execute";
	}
	
	//이메일 전송
	public static void sendMail(String mail, String htmlContent, String ttl) throws Exception {

		String host = "";
		String useraddr = "";
		String userpwd = "";
		/* IMAP/SMTP 설정 */
		Properties props = new Properties();

		// 호스트, 계정 비번 설정

		host = "smtp.gmail.com";
		useraddr = "opennote.atic@gmail.com";
		userpwd = "open1010!";

		//props.setProperty("mail.smtp.localhost", "localhost");
		//props.setProperty("mail.transport.protocol", "mail1"); // protocol 설정
		props.setProperty("mail.host", host); // 이메일 발송 처리해줄 SMTP 서버 설정(네이버 or 구글)
		//props.setProperty("mail.smtp.quitwait", "false");
		props.put("mail.smtp.auth", "true"); // 사용자 인증
		props.put("mail.smtp.port", "465"); // SMTP 서버와 통신할 포트 설정.
		//props.put("mail.smtp.socketFactory.prot", "25");
		//props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		//props.put("mail.smtp.socketFactory.fallback", "false");
		props.put("mail.smtp.ssl.enable", "true"); // ssl 설정
		props.put("mail.smtp.ssl.trust", host); // ssl 설정

		final String username = useraddr; // 계정
		final String password = userpwd; // 비밀번호

		// mailForm에 따른 메일 설정

		/* Session 생성 */
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			String un = username;
			String pw = password;

			protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
				return new javax.mail.PasswordAuthentication(un, pw);
			}
		});
		/* Message 설정 */
		MimeMessage message = new MimeMessage(session);
		message.setFrom(new InternetAddress(useraddr, MimeUtility.encodeText("전파방송통신교육원", "UTF-8", "B")));
		message.setSender(new InternetAddress(useraddr));
		message.setSubject(ttl);

		session.setDebug(true); // for debug

		String htmlContents = StringUtil.unEscape(htmlContent);
		// 메일 주소 변수 :: mail

		// 한명에게 전달할 경우
		message.setRecipient(Message.RecipientType.TO, new InternetAddress(mail));

		Multipart mp = new MimeMultipart();
		MimeBodyPart mbp1 = new MimeBodyPart(); // 내용
		mbp1.setContent(htmlContents, "text/html;charset=UTF-8");

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
