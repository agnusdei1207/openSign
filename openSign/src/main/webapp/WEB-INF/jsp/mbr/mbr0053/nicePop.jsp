<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<script src="/publish/ft/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="/publish/frt/js/board.js"></script>
<script>
$(document).ready(function(){
	goNice();
});
	
function goNice(){
 document.defaultFrm.action = "https://nice.checkplus.co.kr/CheckPlusSafeModel/checkplus.cb";
 document.defaultFrm.submit();
} 

</script>
<form:form commandName="searchVO" name="defaultFrm" id="defaultFrm" method="post">
	<input type="hidden" name="m" value="checkplusService">						<!-- 필수 데이타로, 누락하시면 안됩니다. -->
	<input type="hidden" id="EncodeData" name="EncodeData" value="${sEncData }">		<!-- 위에서 업체정보를 암호화 한 데이타입니다. -->
	<input type="hidden" name="col1" id="col1">	
	<input type="hidden" name="col2" id="col2">	
	<input type="hidden" name="col3" id="col3">	
	<input type="hidden" name="col4" id="col4">	
</form:form>
