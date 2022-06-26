<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<script type="text/javascript">
	$(document).ready(function () {
		setLGDResult();
	});

	function setLGDResult() {
		if (opener) {
			opener.payment_return();
		} else {
			parent.payment_return();
		}
		try {
		} catch (e) {
			alert(e.message);
		}
	}
</script>
<h1>RETURN_URL (인증결과)</h1>
<p>LGD_RESPCODE (결과코드) : ${LGD_RESPCODE}</p>
<p>LGD_RESPMSG (결과메시지): ${LGD_RESPMSG}</p>
<form method="post" name="LGD_RETURNINFO" id="LGD_RETURNINFO">
	<c:forEach var="one" items="${payReqMap}">
		<c:forEach var="two" items="${one.value}">
			<input type="hidden" name="${one.key}" id="${one.key}" value="${two}"/>
		</c:forEach>
	</c:forEach>
	<%--<%
		for (Iterator i = payReqMap.keySet().iterator(); i.hasNext();) {
			Object key = i.next();
			if (payReqMap.get(key) instanceof String[]) {
				String[] valueArr = (String[])payReqMap.get(key);
				for(int k = 0; k < valueArr.length; k++)
					out.println("<input type='hidden' name='" + key + "' id='"+key+"'value='" + valueArr[k] + "'/>");
			} else {
				String value = payReqMap.get(key) == null ? "" : (String) payReqMap.get(key);
				out.println("<input type='hidden' name='" + key + "' id='"+key+"'value='" + value + "'/>");
			}
		}
	%>--%>
</form>