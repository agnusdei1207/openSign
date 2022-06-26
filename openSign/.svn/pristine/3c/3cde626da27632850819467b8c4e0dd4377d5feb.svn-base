<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<div class="tbl_top">
	<div class="tbl_left"><i class="i_all"></i><span>전체 : <strong>${paginationInfo.totalRecordCount}</strong> 건(${searchVO.pageIndex}/${paginationInfo.totalPageCount} Page) </span></div>
	<div class="tbl_right"></div>
</div>
<div class="tbl_wrap">
	<table class="tbl_col_type01">
		<caption>목록</caption>
		<colgroup> 
			<col style="width:5%">
			<col>
			<col style="width:5%">
			<col style="width:5%">
			<col style="width:10%">
			<col style="width:5%">
		</colgroup>
		<thead>
			<tr>
				<th scope="col">번호</th>
				<th scope="col" class="subject">제목</th>
				<th scope="col">첨부파일</th>
				<th scope="col">이미지파일</th>
				<th scope="col">등록일</th>
				<th scope="col">조회수</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${fn:length(resultList) > 0}">
					<c:forEach var="result" items="${resultList}" varStatus="status">
						<tr class="cursor" onclick="fncPageBoard('view','view.do','${result.boardSeq}','boardSeq')">
							<!-- 제목:왼쪽정렬, 코드:가운데정렬, 숫자:오른쪽 정렬, 정해진형태:가운데정렬 -->
							<td class="c">${paginationInfo.totalRecordCount - ((searchVO.pageIndex-1) * searchVO.pageUnit + status.index)}</td>
							<td class="l"><c:out value="${empty result.title ? '-' : util:cutText(result.title,100,'...') }"/></td>
							<td class="c">
								<c:choose>
									<c:when test="${not empty result.fileExtsn }">
										<span class="pdf_down">
											<img src="/publish/frt/images/sub/file_${result.fileExtsn }.png" alt="">
										</span>
									</c:when>
									<c:otherwise>
										Χ
									</c:otherwise>
								</c:choose>
							</td>
							<td class="c">
								<c:choose>
									<c:when test="${not empty result.imageFileExtsn }">
										<span class="pdf_down">
											<img src="/publish/frt/images/sub/file_${result.imageFileExtsn }.png" alt="">
										</span>
									</c:when>
									<c:otherwise>
										Χ
									</c:otherwise>
								</c:choose>
							</td>
							<td class="c">${result.rgstDt }</td>
							<td class="c">${result.viewNum }</td>
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