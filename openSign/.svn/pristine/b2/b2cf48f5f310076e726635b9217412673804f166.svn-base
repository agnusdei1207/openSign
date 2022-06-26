<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<div class="tbl_top">
	<div class="tbl_left"><i class="i_all"></i><span>전체 : <strong>${paginationInfo.totalRecordCount}</strong> 건(${searchVO.pageIndex}/${paginationInfo.totalPageCount} Page) </span></div>
	<div class="tbl_right">
		<select id="pageCnt" class="w100"> 
			<option value="10" ${searchVO.schEtc15 eq '10' ? 'selected="selected"':''}>10개</option>
			<option value="30" ${searchVO.schEtc15 eq '30' ? 'selected="selected"':''}>30개</option>
			<option value="50" ${searchVO.schEtc15 eq '50' ? 'selected="selected"':''}>50개</option>
			<option value="100" ${searchVO.schEtc15 eq '100' ? 'selected="selected"':''}>100개</option>
		</select>
	</div>
</div>
<div class="tbl_wrap">
	<table class="tbl_col_type01">
		<caption>목록</caption>
		<colgroup> 
			<col style="width:8%">
			<col style="width:8%">
			<col style="width:10%">
			<col style="width:12%">
			<col>
			<col style="width:12%">
			<c:if test="${searchVO.searchDivn eq 'O' }">
				<col style="width:8%">
			</c:if>
		</colgroup>
		<thead>
			<tr>
				<th scope="col">번호</th>
				<th scope="col">구분</th>
				<th scope="col">아이디</th>
				<th scope="col">이름</th>
				<th scope="col">클라이언트IP</th>
				<th scope="col">${searchVO.searchDivn eq 'O' ? '등록일자' : '등록시간' }</th>
				<c:if test="${searchVO.searchDivn eq 'O' }">
					<th scope="col">접속횟수</th>
				</c:if>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${fn:length(resultList) > 0}">
					<c:forEach var="result" items="${resultList}" varStatus="status">
						<tr class="cursor">
							<!-- 제목:왼쪽정렬, 코드:가운데정렬, 숫자:오른쪽 정렬, 정해진형태:가운데정렬 -->
							<td class="c"><span class="num">${paginationInfo.totalRecordCount - ((searchVO.pageIndex-1) * searchVO.pageUnit + status.index)}</span></td>
							<td class="c">관리자</td>
							<td class="c">${empty result.id ? '-' : result.id }</td>
							<td class="c">${empty result.name ? '-' : result.name }</td>
							<td class="c">${empty result.clientIp ? '-' : result.clientIp }</td>
							<td class="c">${empty result.rgstDt ? '-' : result.rgstDt }</td>
							<c:if test="${searchVO.searchDivn eq 'O' }">
								<td class="c"><span class="num">${empty result.cnt ? '-' : result.cnt }${empty result.cnt ? '' : '회' }</span></td>
							</c:if>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr><td colspan="${searchVO.searchDivn eq 'T' ? '6' : 7}" class="no_data">데이터가 없습니다.</td></tr>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
</div>
<%-- //tbl end --%>
<%-- paging start --%>
<div class="paging_wrap">
	<div class="paging">
		<ui:pagination paginationInfo="${paginationInfo}" type="manage" jsFunction="fncPageBoard" />
	</div>
	<div class="btn_right">
	</div>
</div>
<%-- //paging end--%>
<script type="text/javascript">
$(document).ready(function(){
	$(".num").each(function(){
		numFormat($(this),'num');		
	});
});

$("#pageCnt").change(function(){
	$("#schEtc15").val($("#pageCnt").val());
	fncPageBoard('addList','addList.do',1);
});
</script>