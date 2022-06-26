<%--@elvariable id="payResMap" type="java.util.Map"--%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<form method="post" name="LGD_RETURNINFO" id="LGD_RETURNINFO">
	<c:forEach var="one" items="${payResMap}">
		<c:forEach var="two" items="${one.value}">
			<input type="hidden" name="${one.key}" id="${one.key}" value="${two}"/>
		</c:forEach>
	</c:forEach>
</form>
<script>
	$(document).ready(function () {

	});
</script>