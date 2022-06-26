<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<table class="board_col_type01">
	<caption>목록(번호,제목,첨부파일,등록자,작성일)</caption>
	<colgroup>
		<col class="m_hid pc_w10p">
		<col>
		<col class="m_hid pc_w10p">
		<col class="m_w20p pc_w10p">
		<col class="m_w20p pc_w10p">
		<c:if test="${searchVO.eduBoardDivn eq 'ed05'}">
			<col class="m_hid pc_w10p">
			<col class="m_hid pc_w10p">
		</c:if>
	</colgroup>
	<thead>
		<tr>
			<th scope="col" class="m_hid">번호</th>
			<th scope="col">제목</th>
			<th scope="col" class="m_hid">첨부파일</th>
			<th scope="col">등록자</th>
			<th scope="col">작성일</th>
			<c:if test="${searchVO.eduBoardDivn eq 'ed05'}">
				<th scope="col" class="m_hid">담당강사</th>
				<th scope="col" class="m_hid">상태</th>
			</c:if>
		</tr>
	</thead>
	<tbody>
		<c:choose>
			<c:when test="${fn:length(subList) > 0}">
				<c:forEach var="result" items="${subList}" varStatus="status">
					<tr onclick="fncSubAction('subView.do','${result.eduBoardSeq}', '${result.rgstId }')">
						<!-- 제목:왼쪽정렬, 코드:가운데정렬, 숫자:오른쪽 정렬, 정해진형태:가운데정렬 -->
						<td class="m_hid">${paginationInfo.totalRecordCount - ((searchVO.subPageIndex-1) * searchVO.pageUnit + status.index)}</td>
						<td class="subject">
							<c:out value="${util:cutText(result.title,35,'...') }"/>
						</td>
						<td class="m_hid">
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
						<td>${result.rgstNm }</td>
						<td>${result.rgstDt }</td>
						<c:if test="${searchVO.eduBoardDivn eq 'ed05'}">
							<td class="m_hid c">${empty result.tchrNm ? '전체' : result.tchrNm }</td>
							<td class="m_hid c">${result.complete gt 0 ? '답변완료' : '접수' }</td>
						</c:if>
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr><td colspan="${searchVO.eduBoardDivn eq 'ed05' ? '7' : '5' }" class="no_data m_hid">데이터가 없습니다.</td></tr>
				<tr><td colspan="3" class="no_data p_hid">데이터가 없습니다.</td></tr>
			</c:otherwise>
		</c:choose>
	</tbody>
</table>
<%-- paging start --%>
<div class="paging_wrap">
	<div class="paging">
		<ui:pagination paginationInfo="${paginationInfo}" type="sub" jsFunction="fncPageEtc" />
	</div>
	<div class="btn_area">
		<div class="btn_left">
		</div>
		<div class="btn_right">
			<c:choose>
				<c:when test="${searchVO.eduBoardDivn eq 'ed03' }">
					<c:if test="${tchrChk eq 'Y' }">
						<a href="javascript:void(0);" class="btn btn_mdl btn_save" onclick="fncSubAction('insertSubForm.do');">등록</a>
					</c:if>
				</c:when>
				<c:when test="${searchVO.eduBoardDivn eq 'ed04' }">
					<c:if test="${tchrChk eq 'Y' }">
						<a href="javascript:void(0);" class="btn btn_mdl btn_save" onclick="fncSubAction('insertSubForm.do');">등록</a>
					</c:if>
				</c:when>
				<c:when test="${searchVO.eduBoardDivn eq 'ed05' }">
					<c:if test="${tchrChk eq 'N' }">
						<a href="javascript:void(0);" class="btn btn_mdl btn_save" onclick="fncSubAction('insertSubForm.do');">등록</a>
					</c:if>
				</c:when>
				<c:when test="${searchVO.eduBoardDivn eq 'ed06' }">
					<a href="javascript:void(0);" class="btn btn_mdl btn_save" onclick="fncSubAction('insertSubForm.do');">등록</a>
				</c:when>
			</c:choose>
			<a href="javascript:void(0);" class="btn btn_mdl btn_list" onclick="fncPageBoard('list', 'list.do')">목록</a>
		</div>
	</div>
</div>
<%-- //paging end--%>
<script type="text/javaScript">
$(document).ready(function(){
	$("#totCnt").html("${paginationInfo.totalRecordCount}");
});
function fncSubAction(url, seq, id){
	<c:if test="${searchVO.eduBoardDivn eq 'ed05'}">
		if("${tchrChk}" == "N" && url == "subView.do"){
			if("${loginFrt.memberSeq}" != id){
				alert("본인만 열람 할 수 있습니다");
				return false;
			}
		}
	</c:if>
	
	$("#eduBoardSeq").val(seq);
	fncLoadingStart();
	$.ajax({
		method : "POST",
		url : url,
		data : $("#subFrm").serialize(),
		dataType : "HTML",
		success : function(data){
			$(".subList").html(data);		
		},error : function(req, text){
		},complete : function(){
			fncLoadingEnd();
		}
	});
}
</script>