<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<c:set var="url" value="${requestScope['javax.servlet.forward.request_uri']}"/>
<%
    pageContext.setAttribute("crcn", "\r\n"); 
    pageContext.setAttribute("br", "<br>");
%> 
<script type="text/javascript" src="/publish/mgr/js/board.js"></script>
<div class="content_box">
	<form id="defaultFrm" name="defaultFrm" method="post" onsubmit="return false;">
		<input type="hidden" id="boardSeq" name="boardSeq" value="<c:out value="${searchVO.boardSeq }"/>"/>
		<input type="hidden" id="boardGrpSeq" name="boardGrpSeq" value="<c:out value="${cmmnBoardVO.boardGrpSeq }"/>"/>
		<input type="hidden" id="boardGrpNo" name="boardGrpNo" value="<c:out value="${cmmnBoardVO.boardGrpNo }"/>"/>
		<input type="hidden" id="lvl" name="lvl" value="<c:out value="${cmmnBoardVO.lvl }"/>"/>
		<jsp:directive.include file="/WEB-INF/jsp/cmmn/inc/incSearchForm.jsp"/>
		<!-- tbl -->
		<div class="tbl_wrap">
			<table class="tbl_row_type01">
				<caption>내용(제목, 작성자, 작성일 등으로 구성)</caption>
				<colgroup>
					<col style="width:15%;">
					<col style="width:35%;">
					<col style="width:15%;">
					<col style="width:35%;">
				</colgroup>
				<tbody>
					<tr>
						<th scope="row"><strong>작성자</strong></th>
						<td colspan=""><c:out value="${cmmnBoardVO.name }"/></td>
	                    <th scope="row"><strong>등록일</strong></th>
						<td><c:out value="${cmmnBoardVO.rgstDt }"/></td>
					</tr>
					<tr>
						<th scope="row"><strong>제목</strong></th>
						<td colspan="3"><c:out value="${cmmnBoardVO.title }"/></td>
					</tr>
					<tr>
						<th scope="row"><strong>내용</strong></th>
						<td colspan="3">
							<div class="text_area">
								<c:choose>
									<c:when test="${cmmnBoardVO.contType eq 'T' }">
										<pre class="text_pre"><c:out value="${cmmnBoardVO.cont }" escapeXml="false"/></pre>
									</c:when>
									<c:when test="${cmmnBoardVO.contType eq 'E' }">
										<c:out value="${util:unEscape(cmmnBoardVO.cont)}" escapeXml="false"/>
									</c:when>
								</c:choose>
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row"><strong>첨부파일</strong></th>
						<td colspan="3">
							<iframe name="atchFileIdFrame" id="atchFileIdFrame" src="/atch/fileUpload.do?atchFileId=<c:out value="${cmmnBoardVO.atchFileId }"/>&fileCnt=5&atchFileIdNm=atchFileId&updateType=view" style="width: 100%;" height="50" frameborder="0" title="파일 업로드 폼"></iframe>
						</td>
					</tr>
					<tr>
						<th scope="row"><strong>이미지파일</strong></th>
						<td colspan="3">
							<iframe name="imageFileIdFrame" id="imageFileIdFrame" src="/atch/fileUpload.do?atchFileId=<c:out value="${cmmnBoardVO.imageFileId }"/>&fileCnt=5&atchFileIdNm=imageFileId&updateType=view" style="width: 100%;" height="50" frameborder="0" title="파일 업로드 폼"></iframe>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="btn_area">
			<a href="javascript:void(0);" class="btn btn_mdl btn_save" onclick="fncPageBoard('write','grpInsertForm.do');">답글등록</a>		
			<a href="javascript:void(0);" id="btn_update" class="btn btn_mdl btn_rewrite">수정</a>
			<c:if test="${cmmnBoardVO.useYn eq 'Y' }">
				<a href="javascript:void(0);" id="btn_del" class="btn btn_mdl btn_del">삭제</a>
			</c:if>
			<a href="javascript:void(0);" id="btn_list" class="btn btn_mdl btn_list">목록</a>
		</div>
		<div class="tbl_wrap">
		<!-- prev & next -->
			<table class="tbl_prevNext" >
				<caption></caption>
				<colgroup>
					<col style="width:15%;">
					<col />
				</colgroup>
				<tbody>
					<c:choose>
						<c:when test="${not empty next.boardSeq }">
							<c:choose>
								<c:when test="${next.useYn eq 'Y' }">
									<tr class="cursor" onclick="fncPageBoard('view','view.do','<c:out value="${next.boardSeq }"/>','boardSeq')">
								</c:when>
								<c:when test="${next.useYn eq 'N' }">
									<tr class="select_none">
								</c:when>
							</c:choose>
								<th scope="row">다음글</th>
								<td class="text_break"><c:out value="${next.title }"/></td>
							</tr>
						</c:when>
						<c:otherwise>
							<tr>
								<th scope="row">다음글</th>
								<td>다음글이 없습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${not empty prev.boardSeq }">
							<c:choose>
								<c:when test="${prev.useYn eq 'Y' }">
									<tr class="cursor" onclick="fncPageBoard('view','view.do','<c:out value="${prev.boardSeq }"/>','boardSeq')">
								</c:when>
								<c:when test="${prev.useYn eq 'N' }">
									<tr class="select_none">
								</c:when>
							</c:choose>
								<th scope="row">이전글</th>
								<td class="text_break"><c:out value="${prev.title }"/></td>
							</tr>
						</c:when>
						<c:otherwise>
							<tr>
								<th scope="row">이전글</th>
								<td>이전글이 없습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		<!--// prev & next -->
		</div>	
	</form>
</div>