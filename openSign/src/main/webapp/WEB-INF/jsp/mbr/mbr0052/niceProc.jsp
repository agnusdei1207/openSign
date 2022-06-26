<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<script src="/publish/ft/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="/publish/frt/js/board.js"></script>
<script type="text/javascript">
function isMobile(){
	return /(iphone|ipod|ipad|android|blackberry|windows ce|palm|symbian)/i.test(navigator.userAgent);
}
$(document).ready(function(){
	
	if(isMobile()){
		if("${msg}" == "SUCCESS"){
			$("#col1").val('${searchVO.col1}');
			$("#col2").val('${searchVO.col2}');//이름
			$("#col3").val('${searchVO.col3}');//핸드폰번호
			$("#col4").val('${searchVO.col4}');
			$("#col5").val('${searchVO.col5}');
			$("#col6").val('${searchVO.col6}');
			fncNcNtPg('${returnUrl}');
		}else if("${msg}" == "OVER"){
			alert("이미 가입된 회원입니다.");
			window.close();
		}else{
			alert("${msg}");
			window.close();
		}
		
	}else{
		if("${msg}" == "SUCCESS"){
			opener.$("#col1").val('${searchVO.col1}');
			opener.$("#col2").val('${searchVO.col2}');//이름
			opener.$("#col3").val('${searchVO.col3}');//핸드폰번호
			opener.$("#col4").val('${searchVO.col4}');
			opener.$("#col5").val('${searchVO.col5}');
			opener.$("#col6").val('${searchVO.col6}');
			opener.fncNcNtPg('${returnUrl}');
		}else if("${msg}" == "OVER"){
			opener.alert("이미 가입된 회원입니다.");
		}else{
			opener.alert("${msg}");
		}
		window.close();
	}
});
</script>
<form:form commandName="searchVO" name="defaultFrm" id="defaultFrm" method="post">
	<input type="hidden" name="m" value="checkplusService">						<!-- 필수 데이타로, 누락하시면 안됩니다. -->
	<input type="hidden" id="EncodeData" name="EncodeData" value="${sEncData }">		<!-- 위에서 업체정보를 암호화 한 데이타입니다. -->
	<input type="hidden" name="col1" id="col1">	
	<input type="hidden" name="col2" id="col2">	
	<input type="hidden" name="col3" id="col3">	
	<input type="hidden" name="col4" id="col4">	
	<input type="hidden" name="kind" id="col5">	
	<input type="hidden" name="schEtc01" id="col6">	
</form:form>
