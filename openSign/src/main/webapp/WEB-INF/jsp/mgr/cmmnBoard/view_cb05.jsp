<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<c:set var="url" value="${requestScope['javax.servlet.forward.request_uri']}"/>
<%
    pageContext.setAttribute("crcn", "\r\n"); 
    pageContext.setAttribute("br", "<br>");
%> 
<script type="text/javascript" src="/publish/mgr/js/board.js"></script>
<div class="content_box">
	<form:form commandName="searchVO" name="defaultFrm" id="defaultFrm" method="post" onsubmit="return false;">
		<form:hidden path="boardSeq" id="boardSeq" />
		<form:hidden path="boardDivn" id="boardDivn" />
		<form:hidden path="boardCd" id="boardCd" />
		<input type="hidden" id="atchFileId" name="atchFileId"/>
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
						<th scope="row"><strong>등록자</strong></th>
						<td>
							${cmmnBoardVO.name }
						</td>
	                    <th scope="row"><strong>등록일</strong></th>
						<td>${cmmnBoardVO.rgstDt }</td>
					</tr>
					<tr>
						<th scope="row"><strong>제목</strong></th>
						<td colspan="3">
							${cmmnBoardVO.title }
						</td>
					</tr>
					<tr>
						<th scope="row"><strong>내용</strong></th>
						<td colspan="3">
							<div class="text_area">
								<c:out value="${util:unEscape(cmmnBoardVO.cont) }" escapeXml="false"/>
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row"><strong>첨부파일</strong></th>
						<td colspan="3">
							<iframe name="atchFileIdFrame" id="atchFileIdFrame" src="/atch/fileUpload.do?atchFileId=${cmmnBoardVO.atchFileId }&fileCnt=5&atchFileIdNm=atchFileId&updateType=view" style="width: 100%;" height="50" frameborder="0" title="파일 업로드 폼"></iframe>
						</td>
					</tr>
					<tr>
						<th scope="row"><strong>유튜브 영상</strong></th>
						<td colspan="3">
							<c:if test="${not empty cmmnBoardVO.link }">
								<iframe width="560" height="315" src="${cmmnBoardVO.link }" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
							</c:if>
						</td>
					</tr>
					<tr>
						<th scope="row"><strong>이미지</strong></th>
						<td colspan="3">
							<ul>
								<c:if test="${fn:length(imageList) > 0 }">
									<c:forEach var="result" items="${imageList }" varStatus="status">
										<li><img src="/atch/getImage.do?atchFileId=${result.atchFileId}&fileSn=${result.fileSn}" style="border:1px solid gray; border-radius:5px;"/><br><br></li>
									</c:forEach>
								</c:if>
							</ul>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		
	<div class="btn_area">
		<a href="#" id="btn_update" class="btn btn_mdl btn_rewrite" >수정</a> 
		<a href="#" id="btn_del" class="btn btn_mdl btn_del" >삭제</a>
		<a href="#" id="btn_list" class="btn btn_mdl btn_list" >목록</a>
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
						<tr class="cursor" onclick="fncPageBoard('view','view.do','${next.boardSeq }','boardSeq')">
							<th scope="row">다음글</th>
							<td>${next.title }</td>
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
						<tr class="cursor" onclick="fncPageBoard('view','view.do','${prev.boardSeq }','boardSeq')">
							<th scope="row">이전글</th>
							<td>${prev.title }</td>
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
	</form:form>
</div>
