<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<div class="tbl_top">
	<div class="tbl_left">
		<i class="i_all"></i>
		<span>
			전체 : <strong><c:out value="${paginationInfo.totalRecordCount}"/></strong> 건(<c:out value="${searchVO.pageIndex}/${paginationInfo.totalPageCount}"/> Page)
		</span>
	</div>
	<div class="tbl_right"> 
		<a href="javascript:void(0)" class="btn btn_excel btn_sml03" onclick="excelDown();"><span>엑셀 다운로드</span></a>
	</div>
</div>
<div class="tbl_wrap">
	<table class="tbl_col_type01">
		<caption>목록</caption>
		<colgroup> 
			<col style="width:3%">
			<col style="width:6%">
			<col>
			<col style="width:10%">
			<col style="width:10%">
			<col style="width:10%">
		</colgroup>
		<thead>
			<tr>
				<th scope="col">번호</th>
				<th scope="col">결재상태</th>
				<th scope="col">프로젝트명</th>
				<th scope="col">첨부파일</th>
				<th scope="col">등록자</th>
				<th scope="col">등록일</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${fn:length(resultList) > 0}">
					<c:forEach var="result" items="${resultList}" varStatus="status">
						<tr class="cursor" onclick="fncPageBoard('update','updateForm.do','<c:out value="${result.otSeq }"/>','otSeq')">
							<td><fmt:formatNumber value="${paginationInfo.totalRecordCount - ((searchVO.pageIndex-1) * searchVO.pageUnit + status.index) }" pattern="#,###"/></td>
							<td>
								<c:choose>
									<c:when test="${result.status eq 'A' }">
										<span class="text">신청</span>
									</c:when>
									<c:when test="${result.status eq 'B' }">
										<span class="text">대기</span>
									</c:when>
									<c:when test="${result.status eq 'C' }">
										<span class="text">완료</span>
									</c:when>
									<c:otherwise><span class="text">-</span></c:otherwise>
								</c:choose>
							</td>
							<td class="length_cut">${result.prjctNm }</td>
							<td>${empty result.atchFileId ? '-' : '💾' }</td>
							<td>${result.name }</td>
							<td>${result.rgstDt }</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr><td colspan="6" class="no_data">데이터가 없습니다.</td></tr>
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
		<a href="javascript:void(0);" class="btn btn_mdl btn_save" onclick="fncPageBoard('write','insertForm.do');">등록</a>		
	</div>
</div>
<%-- //paging end--%>

<script type="text/javascript">
function excelDown(arr){
	fncPageBoard('list','excelDown.do');
	fncLoadingEnd();
}
</script>