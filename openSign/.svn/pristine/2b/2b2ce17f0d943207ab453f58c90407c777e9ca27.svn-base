package com.open.xpay;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.exception.ExceptionUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.open.cmmn.service.CmmnService;
import com.open.xpay.service.XpayVO;

import lgdacom.XPayClient.XPayClient;

@Controller
public class XpayController {

	@Autowired
	private CmmnService cmmnService;
	
	// xpay 설정 파일 경로.
	private static final String CONFIG_PATH = "/www/atic2021_gabia_io/www/WEB-INF/classes/xpay";
	
	// xpay 서비스 구분 (개발 : test, 운영 : service).
	private static final String CLS_PLATFORM = "test";
	
	// xpay returnUrl
	private static final String RETURN_URL = "http://atic2021.gabia.io/xpay/payres.do";

	private static final Logger LOGGER = LoggerFactory.getLogger(XpayController.class);

	/**
	 * 결제에 필요한 데이터 셋팅.
	 * @param usablepay     String
	 * @return HashMap
	 * @throws Exception Exception
	 */
	@ResponseBody
	@RequestMapping("/xpay/payreq.do")
	public HashMap<String, Object> payreq(@RequestParam final String ordernumber, @RequestParam final String typeChk) throws Exception {

		
		HashMap<String, Object> returnMap = new HashMap<>();
		
		/*boolean stop = false;
		String payKey = "";
		if(!payKey.equals("")){
			stop = true;
			returnMap.put("stop", stop);
			returnMap.put("msg", "이미 결제되었습니다");
			return returnMap;
		}*/

		String timestamp = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		XpayVO vo = new XpayVO();
		vo.setCST_PLATFORM(CLS_PLATFORM);
		vo.setCST_MID("storeId");
		vo.setLGD_MID(("test".equals(vo.getCST_PLATFORM()) ? "t" : "") + vo.getCST_MID());
		// TODO xpay 유니크한 값을 위해 뒤에 결제하는 강의의 키값 같은거 추가로 붙여주세요.
		vo.setLGD_OID("xpay_" + ordernumber + "_" + timestamp);
		// TODO xpay 디비 조회 필요.
		vo.setLGD_AMOUNT("금액");
		// TODO xpay 세션 로그인 정보 필요.
		vo.setLGD_BUYER("결제자 이름");
		// TODO xpay 디비 조회 필요.
		vo.setLGD_PRODUCTINFO("상품명");
		vo.setLGD_TIMESTAMP(timestamp);
		vo.setLGD_CUSTOM_USABLEPAY("SC0010"); //SC0010 : 신용카드, SC0030 : 계좌이체
		vo.setLGD_CUSTOM_SKIN("red");
		vo.setLGD_CUSTOM_PROCESSTYPE("TWOTR");
		vo.setLGD_CUSTOM_SWITCHINGTYPE("IFRAME");
		vo.setLGD_WINDOW_VER("2.5");
		vo.setLGD_WINDOW_TYPE("SUBMIT");
		vo.setLGD_OSTYPE_CHECK(typeChk);
		// TODO xpay 가상계좌 사용할 경우 바꿔줘야함.
		vo.setLGD_CASNOTEURL("https://상점URL/cas_noteurl.jsp");
		// TODO xpay 리턴 페이지 주소.
		vo.setLGD_RETURNURL(RETURN_URL);
		vo.setLGD_ENCODING("UTF-8");
		vo.setLGD_VERSION("JSP_Non-ActiveX_Standard");
		vo.setLGD_DOMAIN_URL("xpayvvip");
		vo.setLGD_RESPCODE("");
		vo.setLGD_RESPMSG("");
		vo.setLGD_PAYKEY("");
		vo.setLGD_BUYEREMAIL("");
		vo.setLGD_BUYERID(ordernumber);

		XPayClient xpay = null;
		try {

			xpay = new XPayClient();
			xpay.Init(CONFIG_PATH, vo.getCST_PLATFORM());

			if (StringUtils.isEmpty(vo.getLGD_TIMESTAMP())) {
				vo.setLGD_TIMESTAMP(xpay.GetTimeStamp());
			}

			vo.setLGD_HASHDATA(xpay.GetHashData(vo.getLGD_MID(), vo.getLGD_OID(), vo.getLGD_AMOUNT(), vo.getLGD_TIMESTAMP()));

		} catch(Exception e) {
			LOGGER.info("토스페이먼츠 제공 API를 사용할 수 없습니다. 환경파일 설정을 확인해 주시기 바랍니다. ");
			LOGGER.info(ExceptionUtils.getStackTrace(e));
			returnMap.put("result", false);
			return returnMap;
		} finally {
			xpay = null;
		}

		//returnMap.put("stop", stop);
		returnMap.put("result", true);
		returnMap.put("xpayVO", vo);
		returnMap.put("ordernumber", ordernumber);
		return returnMap;
	}

	/**
	 * 결제 결과 수신 후 디비 처리.
	 * @param vo        XpayVO
	 * @param response  HttpServletResponse
	 * @throws Exception Exception
	 */
	@RequestMapping("/xpay/payres.do")
	public void payres(XpayVO vo, HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		
		vo.setCST_PLATFORM(CLS_PLATFORM);
		vo.setCST_MID(vo.getCST_MID());

		XPayClient xpay = new XPayClient();
		boolean isInitOK = xpay.Init(CONFIG_PATH, vo.getCST_PLATFORM());
		if( !isInitOK ) {
			//API 초기화 실패 화면처리
			LOGGER.info("===========================================");
			LOGGER.info( "결제요청을 초기화 하는데 실패하였습니다.");
			LOGGER.info( "토스페이먼츠에서 제공한 환경파일이 정상적으로 설치 되었는지 확인하시기 바랍니다.");
			LOGGER.info( "mall.conf에는 Mert ID = Mert Key 가 반드시 등록되어 있어야 합니다.");
			LOGGER.info( "문의전화 토스페이먼츠 1544-7772");
			LOGGER.info("===========================================");

		}else{
			try{
				xpay.Init_TX(vo.getLGD_MID());
				xpay.Set("LGD_TXNAME", "PaymentByKey");
				xpay.Set("LGD_PAYKEY", vo.getLGD_PAYKEY());
			}catch(Exception e) {
				LOGGER.info("===========================================");
				LOGGER.info("토스페이먼츠 제공 API를 사용할 수 없습니다. 환경파일 설정을 확인해 주시기 바랍니다.");
				LOGGER.info(ExceptionUtils.getStackTrace(e));
				LOGGER.info("===========================================");
			}
		}

		if ( xpay.TX() ) {
			
			//결제결과 업데이트 처리부분
			
			//1)결제결과 화면처리(성공,실패 결과 처리를 하시기 바랍니다.)
			LOGGER.info("===========================================");
			LOGGER.info( "결제요청이 완료되었습니다.");
			LOGGER.info( "TX 결제요청 통신 응답코드 = " + xpay.m_szResCode);					//통신 응답코드("0000" 일 때 통신 성공)
			LOGGER.info( "TX 결제요청 통신 응답메시지 = " + xpay.m_szResMsg);					//통신 응답메시지

			LOGGER.info("거래번호 : " + xpay.Response("LGD_TID",0));
			LOGGER.info("상점아이디 : " + xpay.Response("LGD_MID",0));
			LOGGER.info("상점주문번호 : " + xpay.Response("LGD_OID",0));
			LOGGER.info("결제금액 : " + xpay.Response("LGD_AMOUNT",0));
			LOGGER.info("결과코드 : " + xpay.Response("LGD_RESPCODE",0));						//LGD_RESPCODE 가 반드시 "0000" 일때만 결제 성공, 그 외는 모두 실패
			LOGGER.info("결과메세지 : " + xpay.Response("LGD_RESPMSG",0));

			String tmp;
			for (int i = 0; i < xpay.ResponseNameCount(); i++) {
				tmp = xpay.ResponseName(i) + " = ";
				for (int j = 0; j < xpay.ResponseCount(); j++) {
					LOGGER.info(tmp + xpay.Response(xpay.ResponseName(i), j));
				}
			}

			LOGGER.info("===========================================");

			// (5) DB에 인증요청 결과 처리
			if( "0000".equals( xpay.m_szResCode ) ) {
				// 통신상의 문제가 없을시
				// 최종결제요청 결과 성공 DB처리(LGD_RESPCODE 값에 따라 결제가 성공인지, 실패인지 DB처리)
				// TODO xpay 결제 결과 디비 처리.
				// cmmnService.insertContents("", "xpay.insertContents");

				//최종결제요청 결과를 DB처리합니다. (결제성공 또는 실패 모두 DB처리 가능)
				//상점내 DB에 어떠한 이유로 처리를 하지 못한경우 false로 변경해 주세요.
				boolean isDBOK = true;
				if( !isDBOK ) {

					xpay.Rollback("상점 DB처리 실패로 인하여 Rollback 처리 [TID:" +xpay.Response("LGD_TID",0)+",MID:" + xpay.Response("LGD_MID",0)+",OID:"+xpay.Response("LGD_OID",0)+"]");

					LOGGER.info( "TX Rollback Response_code = " + xpay.Response("LGD_RESPCODE",0));
					LOGGER.info( "TX Rollback Response_msg = " + xpay.Response("LGD_RESPMSG",0));

					if( "0000".equals( xpay.m_szResCode ) ) {
						LOGGER.info("자동취소가 정상적으로 완료 되었습니다.");
					}else{
						LOGGER.info("자동취소가 정상적으로 처리되지 않았습니다.");
					}
				} else {
					out.println("<script>");
					out.println("alert('정상 처리되었습니다.');");
					// TODO xpay 결제 완료 화면 필요하면 넣어야함.
					out.println("opener.fncPageBoard('list','viewList.do');");
					out.println("self.close();");
					out.println("</script>");
				}

			}else{
				//통신상의 문제 발생(최종결제요청 결과 실패 DB처리)
				LOGGER.info("최종결제요청 결과 실패, DB처리하시기 바랍니다.<br>");
				// TODO xpay 결제 결과 디비 처리.
			}
		}else {
			//2)API 요청실패 화면처리
			LOGGER.info( "결제요청이 실패하였습니다.");
			LOGGER.info( "TX 결제요청 Response_code = " + xpay.m_szResCode);
			LOGGER.info( "TX 결제요청 Response_msg = " + xpay.m_szResMsg);

			//최종결제요청 결과 실패 DB처리
			LOGGER.info("최종결제요청 결과 실패 DB처리하시기 바랍니다.<br>");
			// TODO xpay 결제 결과 디비 처리.
		}
	}
}