<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<c:set var="url" value="${requestScope['javax.servlet.forward.request_uri']}"/>
<script type="text/javascript" src="/publish/mgr/js/board.js"></script>
<%-- content --%>
<div class="content_box">
	<%-- search  --%>
	<div class="search_box">
		<form id="defaultFrm" name="defaultFrm" method="post" onsubmit="return false;">
			<input type="hidden" id="boardSeq" name="boardSeq" value="<c:out value="${searchVO.boardSeq }"/>" />
			<input type="hidden" id="boardDivn" name="boardDivn" value="<c:out value="${searchVO.boardDivn }"/>"/>
			<input type="hidden" id="boardCd" name="boardCd" value="<c:out value="${searchVO.boardCd }"/>"/>
			<input type="hidden" id="pageIndex" name="pageIndex" value="<c:out value="${searchVO.pageIndex }"/>"/>
			<input type="hidden" id="pageUnit" name="pageUnit" value="<c:out value="${searchVO.pageUnit lt 10 ? 10 : searchVO.pageUnit }"/>"/>
			<fieldset>
				<legend>검색</legend>
				<div class="search_basic">
					<strong class="tit">검색구분</strong>
					<select id="searchCondition" name="searchCondition" class="w100">  
						<option value="0" <c:out value="${searchVO.searchCondition eq '0' ? 'selected=\"selected\"' : '' }"/>>전체</option>
						<option value="1" <c:out value="${searchVO.searchCondition eq '1' ? 'selected=\"selected\"' : '' }"/>>제목</option>
						<option value="2" <c:out value="${searchVO.searchCondition eq '2' ? 'selected=\"selected\"' : '' }"/>>내용</option>
						<option value="3" <c:out value="${searchVO.searchCondition eq '3' ? 'selected=\"selected\"' : '' }"/>>작성자</option>
					</select>
					<input type="text" id="searchKeyword" name="searchKeyword" class="text w20p" value="<c:out value="${searchVO.searchKeyword }"/>"/>
					<span class="search_btns">
						<button type="button" class="btn btn_search" id="btn_search">검색</button>
					</span>
					<strong class="tit">등록일</strong>
					<input type="hidden" name="dateCondition" id="dateCondition" value="0"/>
					<span class="calendar_input type03">
						<input type="text" id="searchStartDate" name="searchStartDate" class="text w100" value="<c:out value="${searchVO.searchStartDate }"/>" readonly="readonly"/> 
					</span>
					<span> ~ </span>
					<span class="calendar_input type03" >
						<input type="text" id="searchEndDate" name="searchEndDate" class="text w100" value="<c:out value="${searchVO.searchEndDate }"/>" readonly="readonly"/>
					</span>
				</div>
			</fieldset>
		</form>
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