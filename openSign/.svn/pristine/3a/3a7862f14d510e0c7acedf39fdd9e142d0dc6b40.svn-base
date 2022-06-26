<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<c:set var="url" value="${requestScope['javax.servlet.forward.request_uri']}"/>
<script type="text/javascript" src="/publish/mgr/js/board.js"></script>
<%-- content --%>
<div class="content_box">
	<%-- search  --%>
	<div class="search_box">
		<form:form commandName="searchVO" name="defaultFrm" id="defaultFrm" method="post" onsubmit="return false;">
			<form:hidden path="boardSeq" id="boardSeq" />
			<form:hidden path="pageIndex" id="pageIndex" />
			<form:hidden path="boardDivn" id="boardDivn" />
			<form:hidden path="boardCd" id="boardCd" />
			<fieldset>
				<legend>검색</legend>
				<div class="search_basic">
					<strong class="tit">검색구분</strong>
					<form:select path="searchCondition" id="searchCondition" title="구분 선택" cssClass="w100"  >  
						<form:option value="0" label="전체"/>
						<form:option value="1" label="제목"/>
						<form:option value="2" label="내용"/>
					</form:select>
					<form:input path="searchKeyword" id="searchKeyword" class="text w20p" />
					<span class="search_btns">
						<button type="button" class="btn btn_search" id="btn_search">검색</button>
					</span>
					<c:if test="${searchVO.boardDivn eq 'cb01' || searchVO.boardDivn eq 'cb02'}">
						<strong class="tit">등록일</strong>
						<input type="hidden" name="dateCondition" id="dateCondition" value="0"/>
						<span class="calendar_input type03"><form:input path="searchStartDate" id="searchStartDate" title="시작일" cssClass="text" readonly="true" cssStyle="width:100px;" /></span> ~ 
						<span class="calendar_input type03" ><form:input path="searchEndDate" id="searchEndDate" title="종료일" cssClass="text" readonly="true" cssStyle="width:100px;"/></span>
					</c:if>
				</div>
			</fieldset>
		</form:form>
	</div>
	<%--// search  --%>
	<div class="tbl">
	</div>
</div>
<script type="text/javaScript">
$(document).ready(function(){
	<c:if test="${not empty searchVO.boardCd}">
		fncPageBoard('addList','addList.do',$("#pageIndex").val());
	</c:if>
	fncDate('searchStartDate','searchEndDate');
});
</script>