<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<script type="text/javascript" src="/publish/mgr/js/board.js"></script>
<script type="text/javaScript">

$(document).ready(function(){
	$("#btn_write").click(function(){
		board.write();
	});
	$("#btn_search").click(function(){
		board.list();
	});
	<%--검색 엔터 체크--%>
	$("#searchKeyword").keydown(function(e){
		 if (e.keyCode == 13) { 
			board.list();
		 }
	});
});
<%--$("#fixTable").tableHeadFixer();--%>
</script>
<div class="content_box">
	<%-- search area --%>
	<div class="search_box">
		<form:form commandName="searchVO" name="defaultFrm" id="defaultFrm" method="post" onsubmit="return false;">
			<form:hidden path="pageIndex" id="pageIndex" />
			<input type="hidden" id="seq" name="seq" />
			<input type="hidden" id="groupSeq" name="groupSeq" />
			<input type="hidden" id="lvl" name="lvl" value="1">
			<fieldset class="seach_form">
				<legend>검색</legend>				
				<div class="search_basic type02">
					<form:select path="searchCondition" id="searchCondition" cssClass="w100">  
						<form:option value="0" label="전체"/>
						<form:option value="1" label="권한그룹코드"/>
						<form:option value="2" label="권한그룹명"/>
					</form:select>
					<form:input id="searchKeyword" path="searchKeyword" cssClass="text w85p" placeholder="검색어를 입력해 주세요" type="text"/>
					<span class="search_btns">
						<button type="button" class="btn btn_search" id="btn_search">검색</button>
					</span>
				</div>
			</fieldset>
		</form:form>
	</div> 
	<%-- //search --%>
	<%-- tbl --%>
	<div class="tbl_top">
		<div class="tbl_left"><i class="i_all"></i> <span> 전체 : <strong>${fn:length(resultList)}</strong> 건</span></div>
		<div class="tbl_right"></div>
	</div>
	<div class="tbl">
		<div class="tbl_wrap">
			<table class="tbl_col_type01" id="fixTable">
				<caption>목록(번호,제목,첨부,작성자,작성일,조회 로 구성)</caption>
				<colgroup>
					<col style="width:5%;">
					<col style="width:10%;">
					<col style="width:*">
					<col style="width:10%;">
					<col style="width:13%;">
				</colgroup>
				<thead>
					<tr>
						<th scope="col">번호</th>
						<th scope="col">권한그룹코드</th>
						<th scope="col">권한그룹명</th>
						<th scope="col">사용구분</th>
						<th scope="col">등록일</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${fn:length(resultList) > 0}">
							<c:forEach var="result" items="${resultList}" varStatus="status">
								<tr class="cursor" onclick="fncPageBoard('update','updateForm.do','${result.seq}','seq')">
									<td>${status.count}</td>
									<td>${result.authCode }</td>
									<td>${result.authCodeNm }</td>
									<td>${result.useYn }</td>
									<td>${result.rgstDt }</td>
								</tr>
							</c:forEach>
						</c:when>  
						<c:otherwise>
							<tr>
								<td colspan="5" class="no_data">데이터가 없습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>
		<%-- //tbl --%>
		<%-- paging --%>
		<div class="paging_wrap">
		    <div class="btn_right">  
		    	<c:if test="${loginVO.authCode eq '1'}">
					<a href="javascript:void(0);" class="btn btn_mdl btn_save" id="btn_write">등록</a>
				</c:if>
			</div>
		</div>
	</div>
</div>
	
