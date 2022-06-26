<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<c:set var="url" value="${requestScope['javax.servlet.forward.request_uri']}"/>
<div class="tab_cont tab_content">
	<div class="subList">
		<form id="subFrm" name="subFrm"  method="post" onsubmit="return false;">
			<input type="hidden" id="eduBoardCd" name="eduBoardCd" value="${searchVO.eduBoardCd }"/>
			<input type="hidden" id="eduSubCd" name="eduSubCd" value="${searchVO.eduSubCd }"/>
			<input type="hidden" id="eduBoardDivn" name="eduBoardDivn" value="${searchVO.eduBoardDivn }"/>
			<input type="hidden" id="eduBoardSeq" name="eduBoardSeq" value="${searchVO.eduBoardSeq }"/>
			<jsp:directive.include file="/WEB-INF/jsp/cmmn/inc/subSearchForm.jsp"/>
		</form>
	</div>
</div>
<script type="text/javaScript">
$(document).ready(function(){
	fncSubList();
});
function fncSubList(){
	$.ajax({
		method : "POST",
		url : "subList.do",
		data : $("#subFrm").serialize(),
		dataType : "HTML",
		success : function(data){
			$(".subList").html(data);		
		},error  : function(req, text){
		}
	});
}
</script>