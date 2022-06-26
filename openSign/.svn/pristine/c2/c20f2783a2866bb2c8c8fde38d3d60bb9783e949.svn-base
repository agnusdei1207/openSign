<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>처리</title>
<script type="text/javascript" src="/publish/mgr/js/jquery-1.11.3.min.js"></script>
</head>
<body>
<script type="text/javascript">
	$(window).load(function () {
		var strMessage = "<c:out value="${message}"/>";
		var strError= "<c:out value="${error}"/>";
		var strScript = "<c:out value="${script}" />";
		var strCommonScript = "<c:out value="${cmmnScript}" escapeXml="false"/>";
		var returnUrl = "<c:out value="${returnUrl}"/>";
		var strType = "<c:out value="${Type}"/>";
		var strName = "<c:out value="${pName}"/>";
		var strValue = "<c:out value="${pValue}"/>";
		
		if (strMessage.length > 0) {
			alert(strMessage);
		}
		if (strError.length > 0) {
			alert(strError);
			history.back();
		}
		if (strScript.length > 0) {
			eval(strScript);
		}
		var fncCommonScript = function (strCommonScript) {
			if (strCommonScript == "login") {
				location.href="/ad/adminLogin/login";
			}else if(strCommonScript == "close"){//Popup창 닫기
				opener.fncPageBoard('addList','addList.do','1');
				self.close();
			}else if(strCommonScript == "close2"){//Popup창 닫기
				 opener.location.reload();
				self.close();
			}else if(strCommonScript == "list"){
				parent.board.list();
			}else if(strCommonScript == "back"){
				history.back();
			}else if(strCommonScript == "pop"){
				parent.board.pop();
			}else{
				$("#defaultFrm").attr({"action" : strCommonScript, "method" : "post", "target" : "_self"}).submit();
			}
		};
		if (strCommonScript.length > 0) {
			fncCommonScript(strCommonScript);
		}
		
	});

</script>
<form:form commandName="searchVO" name="defaultFrm" id="defaultFrm" method="post">
	<form:hidden path="boardDivn" id="boardDivn"/> 
	<form:hidden path="boardCd" id="boardCd"/> 
	<jsp:directive.include file="/WEB-INF/jsp/cmmn/inc/incSearchForm.jsp"/>
	<jsp:directive.include file="/WEB-INF/jsp/cmmn/inc/subSearchForm.jsp"/>
	<c:set var="arrName" value="${fn:split(pName,',')}" />
	<c:set var="arrValue" value="${fn:split(pValue,',')}" />
	<c:forEach var="result" items="${arrName }" varStatus="status">
		<input type="hidden" name="${result }" value="${arrValue[status.index] }" />
	</c:forEach>
</form:form>
</body>
</html>