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
		<select id="pageCnt" class="w100"> 
			<option value="10" <c:out value="${searchVO.pageUnit eq '10' ? 'selected=\"selected\"':''}"/>>10개</option>
			<option value="30" <c:out value="${searchVO.pageUnit eq '30' ? 'selected=\"selected\"':''}"/>>30개</option>
			<option value="50" <c:out value="${searchVO.pageUnit eq '50' ? 'selected=\"selected\"':''}"/>>50개</option>
			<option value="100" <c:out value="${searchVO.pageUnit eq '100' ? 'selected=\"selected\"':''}"/>>100개</option>
		</select>
	</div>
</div>
<div class="tbl_wrap">
	<table class="tbl_col_type01">
		<caption>목록</caption>
		<colgroup> 
			<col style="width:5%">
			<col>
			<col style="width:5%">
			<col style="width:10%">
			<col style="width:8%">
			<col style="width:5%">
		</colgroup>
		<thead>
			<tr>
				<th scope="col">번호</th>
				<th scope="col" class="subject">제목</th>
				<th scope="col">첨부파일</th>
				<th scope="col">작성자</th>
				<th scope="col">등록일</th>
				<th scope="col">조회수</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${fn:length(resultList) > 0}">
					<c:forEach var="result" items="${resultList}" varStatus="status">
						<c:choose>
							<c:when test="${result.useYn eq 'N' }">
								<tr class="cursor" onclick="fncViewYn('<c:out value="${result.boardSeq }"/>');">
							</c:when>
							<c:otherwise>
								<tr class="cursor" onclick="fncPageBoard('view','view.do','<c:out value="${result.boardSeq }"/>','boardSeq')">
							</c:otherwise>
						</c:choose>
							<!-- 제목:왼쪽정렬, 코드:가운데정렬, 숫자:오른쪽 정렬, 정해진형태:가운데정렬 -->
							<td class="c"><fmt:formatNumber value="${paginationInfo.totalRecordCount - ((searchVO.pageIndex-1) * searchVO.pageUnit + status.index) }" pattern="#,###"/></td>
							<td class="${empty result.title ? 'c' : 'l' }">
								<span class="text_over">
									<c:if test="${result.lvl ge 1}">
										<c:forEach var="i" begin="1" end="${result.lvl}">
											${i eq result.lvl ? '<img src="/publish/mgr/images/reply_arrow.png" alt="">' : '　　' }
										</c:forEach>
									</c:if>
									<c:out value="${empty result.title ? '-' : result.title }"/>
								</span>
							</td>
							<td class="c">
								<c:choose>
									<c:when test="${not empty result.fileExtsn }">
										<span class="pdf_down">
											<img src="/publish/frt/images/sub/file_${result.fileExtsn }.png" alt="">
										</span>
									</c:when>
									<c:otherwise>Χ</c:otherwise>
								</c:choose>
							</td>
							<td class="c"><c:out value="${empty result.name ? '-' : result.name }"/></td>
							<td class="c"><c:out value="${empty result.rgstDt ? '-' : result.rgstDt }"/></td>
							<td class="c"><fmt:formatNumber value="${empty result.viewNum ? '0' : result.viewNum }" pattern="#,###"/></td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr><td colspan="" class="no_data">데이터가 없습니다.</td></tr>
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
		<a href="#" class="btn btn_mdl btn_save" onclick="fncPageBoard('write','insertForm.do');">등록</a>		
	</div>
</div>
<%-- //paging end--%>
<script type="text/javascript">
$(document).ready(function(){
	fncColLength();
});
$("#pageCnt").change(function(){
	$("#pageUnit").val($("#pageCnt").val());
	fncPageBoard('addList','addList.do',1);
});
function fncViewYn(boardSeq){
	if(!confirm("게시글을 숨김처리 하시겠습니까?")){
		return false;
	}else{
		$("#boardSeq").val(boardSeq);
		fncLoadingStart();$("#defaultFrm").attr({"action" : "viewYnProc.do", "method" : "post", "target" : "_self", "onsubmit" : ""}).submit();
		return false;
	}
}
</script>