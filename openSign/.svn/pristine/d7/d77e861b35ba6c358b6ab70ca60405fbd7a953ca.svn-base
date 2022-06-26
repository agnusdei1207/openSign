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
			
			$("#returnUrl").val("${searchVO.niceVO.returnUrl}");
			$("#eduCourseSeq").val("${searchVO.niceVO.eduCourseSeq}");
			$("#subDivn").val("${searchVO.niceVO.subDivn}");
			$("#boardSeq").val("${searchVO.niceVO.boardSeq}");
			$("#boardCd").val("${searchVO.niceVO.boardCd}");
			$("#boardDivn").val("${searchVO.niceVO.boardDivn}");
			$("#urlDivn").val("${searchVO.niceVO.urlDivn}");
			$("#memberSeq").val("${searchVO.niceVO.memberSeq}");
			
			$("#searchStartDate").val("${searchVO.niceVO.searchStartDate}");
			$("#searchEndDate").val("${searchVO.niceVO.searchEndDate}");
			$("#searchCondition").val("${searchVO.niceVO.searchCondition}");
			$("#placeCondition").val("${searchVO.niceVO.placeCondition}");
			$("#searchKeyword").val("${searchVO.niceVO.searchKeyword}");
			$("#pageIndex").val("${searchVO.niceVO.pageIndex}");

			$("#schEtc01").val("${searchVO.niceVO.schEtc01}");
			$("#schEtc02").val("${searchVO.niceVO.schEtc02}");
			$("#schEtc03").val("${searchVO.niceVO.schEtc03}");
			$("#schEtc04").val("${searchVO.niceVO.schEtc04}");
			$("#schEtc05").val("${searchVO.niceVO.schEtc05}");
			$("#schEtc06").val("${searchVO.niceVO.schEtc06}");
			$("#schEtc07").val("${searchVO.niceVO.schEtc07}");
			$("#schEtc08").val("${searchVO.niceVO.schEtc08}");
			$("#schEtc09").val("${searchVO.niceVO.schEtc09}");
			$("#schEtc10").val("${searchVO.niceVO.schEtc10}");
			$("#schEtc11").val("${searchVO.niceVO.schEtc11}");
			$("#schEtc12").val("${searchVO.niceVO.schEtc12}");
			$("#schEtc13").val("${searchVO.niceVO.schEtc13}");
			$("#schEtc14").val("${searchVO.niceVO.schEtc14}");
			$("#schEtc15").val("${searchVO.niceVO.schEtc15}");
			
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
			
			opener.$("#returnUrl").val("${searchVO.niceVO.returnUrl}");
			opener.$("#eduCourseSeq").val("${searchVO.niceVO.eduCourseSeq}");
			opener.$("#subDivn").val("${searchVO.niceVO.subDivn}");
			opener.$("#boardSeq").val("${searchVO.niceVO.boardSeq}");
			opener.$("#boardCd").val("${searchVO.niceVO.boardCd}");
			opener.$("#boardDivn").val("${searchVO.niceVO.boardDivn}");
			opener.$("#urlDivn").val("${searchVO.niceVO.urlDivn}");
			opener.$("#memberSeq").val("${searchVO.niceVO.memberSeq}");
			
			opener.$("#searchStartDate").val("${searchVO.niceVO.searchStartDate}");
			opener.$("#searchEndDate").val("${searchVO.niceVO.searchEndDate}");
			opener.$("#searchCondition").val("${searchVO.niceVO.searchCondition}");
			opener.$("#placeCondition").val("${searchVO.niceVO.placeCondition}");
			opener.$("#searchKeyword").val("${searchVO.niceVO.searchKeyword}");
			opener.$("#pageIndex").val("${searchVO.niceVO.pageIndex}");

			opener.$("#schEtc01").val("${searchVO.niceVO.schEtc01}");
			opener.$("#schEtc02").val("${searchVO.niceVO.schEtc02}");
			opener.$("#schEtc03").val("${searchVO.niceVO.schEtc03}");
			opener.$("#schEtc04").val("${searchVO.niceVO.schEtc04}");
			opener.$("#schEtc05").val("${searchVO.niceVO.schEtc05}");
			opener.$("#schEtc06").val("${searchVO.niceVO.schEtc06}");
			opener.$("#schEtc07").val("${searchVO.niceVO.schEtc07}");
			opener.$("#schEtc08").val("${searchVO.niceVO.schEtc08}");
			opener.$("#schEtc09").val("${searchVO.niceVO.schEtc09}");
			opener.$("#schEtc10").val("${searchVO.niceVO.schEtc10}");
			opener.$("#schEtc11").val("${searchVO.niceVO.schEtc11}");
			opener.$("#schEtc12").val("${searchVO.niceVO.schEtc12}");
			opener.$("#schEtc13").val("${searchVO.niceVO.schEtc13}");
			opener.$("#schEtc14").val("${searchVO.niceVO.schEtc14}");
			opener.$("#schEtc15").val("${searchVO.niceVO.schEtc15}");

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
	<input type="hidden" name="col5" id="col5" value="oldNice">		
	
	<input type="hidden" id="returnUrl" name="returnUrl"/>
	<input type="hidden" id="eduCourseSeq" name="eduCourseSeq"/>
	<input type="hidden" id="subDivn" name="subDivn"/>
	<input type="hidden" id="boardSeq" name="boardSeq"/>
	<input type="hidden" id="boardCd" name="boardCd"/>
	<input type="hidden" id="boardDivn" name="boardDivn"/>
	<input type="hidden" id="urlDivn" name="urlDivn"/>
	<input type="hidden" id="memberSeq" name="memberSeq"/>
	
	<input type="hidden" name="searchStartDate" id="searchStartDate"/>
	<input type="hidden" name="searchEndDate" id="searchEndDate"/>
	<input type="hidden" name="searchCondition" id="searchCondition"/>
	<input type="hidden" name="placeCondition" id="placeCondition"/>
	<input type="hidden" name="searchKeyword" id="searchKeyword"/>
	<input type="hidden" name="pageIndex" id="pageIndex"/>
	
	<input type="hidden" name="schEtc01" id="schEtc01"/>
	<input type="hidden" name="schEtc02" id="schEtc02"/>
	<input type="hidden" name="schEtc03" id="schEtc03"/>
	<input type="hidden" name="schEtc04" id="schEtc04"/>
	<input type="hidden" name="schEtc05" id="schEtc05"/>
	<input type="hidden" name="schEtc06" id="schEtc06"/>
	<input type="hidden" name="schEtc07" id="schEtc07"/>
	<input type="hidden" name="schEtc08" id="schEtc08"/>
	<input type="hidden" name="schEtc09" id="schEtc09"/>
	<input type="hidden" name="schEtc10" id="schEtc10"/>
	<input type="hidden" name="schEtc13" id="schEtc13"/>
	<input type="hidden" name="schEtc14" id="schEtc14"/>
	<input type="hidden" name="schEtc15" id="schEtc15"/>

</form:form>