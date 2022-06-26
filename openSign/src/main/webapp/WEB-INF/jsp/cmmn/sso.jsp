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
		var strCommonScript = "<c:out value="${cmmnScript}" escapeXml="false"/>";
		
		if (strMessage.length > 0) {
			alert(strMessage);
		}
		$("#defaultFrm").attr({"action" : strCommonScript, "method" : "post", "target" : "_self"}).submit();
	});
	

	
</script>
<form:form commandName="searchVO" name="defaultFrm" id="defaultFrm" method="post">
	<input type="hidden" name="mbrsId" value="" />
</form:form>
<c:if test="${not empty login }">
<iframe src="/ssoLogin.do" title="" id="testLogin" name="testLogin" style="display: none;"></iframe>
</c:if>
<c:if test="${not empty logout }">
<iframe src="/ssoLogout.do?" title="" id="testLogout" name="testLogout"  style="display: none;"></iframe>
</c:if>
</body>
</html>