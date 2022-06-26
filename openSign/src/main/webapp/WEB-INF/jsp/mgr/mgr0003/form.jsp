<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<script type="text/javaScript">
$(document).ready(function(){
	fncCodeAdd('${searchVO.schEtc01}','0','1','1');
	
	<c:if test="${not empty searchVO.schEtc01}">
		fncCodeAdd('${searchVO.schEtc02}','${searchVO.schEtc01}','1','2');
	</c:if>
	<c:if test="${not empty searchVO.schEtc02}">
		fncCodeAdd('${searchVO.schEtc03}','${searchVO.schEtc02}','1','3');
	</c:if>
	<c:if test="${not empty searchVO.schEtc03}">
		fncCodeAdd('${searchVO.schEtc04}','${searchVO.schEtc03}','1','4');
	</c:if>
	
});
var list = function(){
	$("#pageIndex").val(1);
	$("#defaultFrm").attr({"action" : "form.do", "method" : "post", "target" : "_self"}).submit();
}
</script>
<%-- search area --%>
<div class="tbl_wrap">
	<%-- search --%>
	<div class="search_box">
		<form:form commandName="searchVO" name="defaultFrm" id="defaultFrm" method="post">
			<form:hidden path="pageIndex" id="pageIndex" />
			<fieldset class="seach_form">
				<legend>검색</legend>
				<div class="search_basic">
					<strong class="tit">검색 타이틀</strong>
					<select name="schEtc01" id="cCode_1" onchange="fncCodeAdd('',this.value,'1','2')">
						<option value="">전체</option>
					</select>
					<select name="schEtc02" id="cCode_2" onchange="fncCodeAdd('',this.value,'1','3')">
						<option value="">전체</option>
					</select>
					<select name="schEtc03" id="cCode_3" onchange="fncCodeAdd('',this.value,'1','4')">
						<option value="">전체</option>
					</select>
					<select name="schEtc04" id="cCode_4">
						<option value="">전체</option>
					</select>
A					<span class="search_btns">
						<button type="button"  class="btn btn_search" onclick="list();">검색</button>
					</span>
				</div>
			</fieldset>
		</form:form>
	</div>
</div>