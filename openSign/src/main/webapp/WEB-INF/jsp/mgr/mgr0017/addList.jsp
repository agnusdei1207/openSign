<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<script>
	<%--$("#fixTable").tableHeadFixer();--%>
</script>
<%-- tbl --%>
<div class="tbl_top">
	<div class="tbl_left"><i class="i_all"></i> <span> 전체 : <strong>${paginationInfo.totalRecordCount}</strong> 건(${searchVO.pageIndex}/${paginationInfo.totalPageCount} Page) </span></div>
	<div class="tbl_right"></div>
</div>
<div class="tbl_wrap">
	<table class="tbl_col_type01" id="fixTable">
		<caption>목록(번호,제목,첨부,작성자,작성일,조회 로 구성)</caption>
		<colgroup>
			<col style="width:8%;">
			<col />
            <col style="width:15%;">
            <col style="width:15%;">
            <col style="width:15%;">
            <col style="width:20%;">
		</colgroup>
		<thead>
			<tr>
				<th scope="col">번호</th>
				<th scope="col">에러타입</th>
                <th scope="col">URL</th>
                <th scope="col">메뉴명</th>
                <th scope="col">발생아이디</th>
				<th scope="col">발생일시</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${fn:length(resultList) > 0}">
					<c:forEach var="result" items="${resultList}" varStatus="status">
						<tr class="cursor">
							<td onclick="fncPageBoard('view','view.do','${result.seq}','seq')">${paginationInfo.totalRecordCount+1 - ((searchVO.pageIndex-1) * searchVO.pageSize + status.count)}<!-- <span class="tag_notice">공지</span> --></td>
							<td onclick="fncPageBoard('view','view.do','${result.seq}','seq')" class="subject">${result.errType }</td>
							<td onclick="fncPageBoard('view','view.do','${result.seq}','seq')" class="subject">${result.errPage }</td>
							<td onclick="fncPageBoard('view','view.do','${result.seq}','seq')">${result.menuNm }</td>
							<td onclick="fncPageBoard('view','view.do','${result.seq}','seq')">${result.rgstId }</td>
							<td onclick="fncPageBoard('view','view.do','${result.seq}','seq')">${result.rgstDt }</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="6" class="no_data">데이터가 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
</div>
<%-- //tbl --%>
<%-- paging --%>
<div class="paging_wrap">
   <div class="paging">
        <div class="paging"><ui:pagination paginationInfo="${paginationInfo}" type="manage" jsFunction="fncPageBoard" /></div>
    </div>
</div>
<%-- //paging --%>

