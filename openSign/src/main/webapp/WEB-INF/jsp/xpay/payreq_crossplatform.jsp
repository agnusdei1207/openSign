<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<%--TODO xpay.--%>
<!-- test일 경우 -->
<script src="https://pretest.tosspayments.com:9443/xpay/js/xpay_crossplatform.js" type="text/javascript"></script>
<!--
service일 경우 아래 URL을 사용
<script src="https://xpayvvip.tosspayments.com/xpay/js/xpay_crossplatform.js" type="text/javascript"></script>
-->
<script type="text/javascript">
	/*
	* 수정불가.
	*/
	var LGD_window_type = '${payReqMap["LGD_WINDOW_TYPE"]}';

	/*
	* 수정불가
	*/
	var lgdwin;
	function launchCrossPlatform() {
		lgdwin = openXpay(document.getElementById('LGD_PAYINFO'), '${payReqMap["CST_PLATFORM"]}', LGD_window_type, null, "", "");
	}

	/*
	* FORM 명만  수정 가능
	*/
	function getFormObject() {
		return document.getElementById("LGD_PAYINFO");
	}

	/*
	 * 인증결과 처리
	 */
	function payment_return() {
		// var fDoc;

		// fDoc = lgdwin.contentWindow || lgdwin.contentDocument;


		// if (fDoc.document.getElementById('LGD_RESPCODE').value == "0000") {
		if (lgdwin.document.getElementById("LGD_RESPCODE").value == "0000") {
			document.getElementById("LGD_PAYKEY").value = lgdwin.document.getElementById('LGD_PAYKEY').value;
			document.getElementById("LGD_PAYINFO").target = "_self";
			document.getElementById("LGD_PAYINFO").action = "step4.do";
			document.getElementById("LGD_PAYINFO").submit();
		} else {
			alert("LGD_RESPCODE (결과코드) : " + fDoc.document.getElementById('LGD_RESPCODE').value + "\n" + "LGD_RESPMSG (결과메시지): " + fDoc.document.getElementById('LGD_RESPMSG').value);
			closeIframe();
		}
	}
</script>
<form method="post" name="LGD_PAYINFO" id="LGD_PAYINFO" action="step3.do">
	<table>
		<tr>
			<td>구매자 이름 </td>
			<td>${payReqMap["LGD_BUYER"]}</td>
		</tr>
		<tr>
			<td>상품정보 </td>
			<td>${payReqMap["LGD_PRODUCTINFO"]}</td>
		</tr>
		<tr>
			<td>결제금액 </td>
			<td>${payReqMap["LGD_AMOUNT"]}</td>
		</tr>
		<tr>
			<td>구매자 이메일 </td>
			<td>${payReqMap["LGD_BUYEREMAIL"]}</td>
		</tr>
		<tr>
			<td>주문번호 </td>
			<td>${payReqMap["LGD_OID"]}</td>
		</tr>
		<tr>
			<td colspan="2">* 추가 상세 결제요청 파라미터는 메뉴얼을 참조하시기 바랍니다.</td>
		</tr>
		<tr>
			<td colspan="2"></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="button" value="인증요청" onclick="launchCrossPlatform();"/>
			</td>
		</tr>
	</table>
	<c:forEach var="one" items="${payReqMap}">
		<input type="hidden" name="${one.key}" id="${one.key}" value="${one.value}"/>
	</c:forEach>
	<input type="hidden" name="LGD_ENCODING" value="UTF-8">
	<input type="hidden" name="LGD_ENCODING_NOTEURL" value="UTF-8">
	<input type="hidden" name="LGD_ENCODING_RETURNURL" value="UTF-8">
</form>