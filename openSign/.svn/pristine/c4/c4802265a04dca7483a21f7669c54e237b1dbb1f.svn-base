<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<c:set var="url" value="${requestScope['javax.servlet.forward.request_uri']}"/>
<%
    pageContext.setAttribute("crcn", "\r\n");
    pageContext.setAttribute("br", "<br>");
%> 
<script type="text/javascript" src="/publish/mgr/js/board.js"></script>
<script type="text/javascript" src="/publish/mgr/js/boardEtc.js"></script>
<div class="tab_cont tab_content">
	<form id="subFrm" name="subFrm" method="post" onsubmit="return false;">
		<input type="hidden" id="eduBoardCd" name="eduBoardCd" value="${searchVO.eduBoardCd }"/>
		<input type="hidden" id="eduSubCd" name="eduSubCd" value="${searchVO.eduSubCd }"/>
		<input type="hidden" id="eduBoardDivn" name="eduBoardDivn" value="${searchVO.eduBoardDivn }"/>
		<input type="hidden" id="eduBoardSeq" name="eduBoardSeq" value="${searchVO.eduBoardSeq }"/>
		<input type="hidden" id="contTemp" value="${replyVO.cont }">
		<jsp:directive.include file="/WEB-INF/jsp/cmmn/inc/subSearchForm.jsp"/>
		<div class="tbl_wrap">
			<table class="board_row_type01">
				<caption>내용(제목, 작성자, 작성일 등으로 구성)</caption>
				<colgroup>
					<col class="m_w25p pc_w20p">
					<col>
					<col style="width:20%;">
					<col>
				</colgroup>
				<tbody>
					<tr class="board_row_tit">
						<th scope="row" colspan="4"><strong>${mgr0030VO.title }</strong></th>
					</tr>
					<tr>
						<th scope="row"><strong>등록자</strong></th>
						<td>${mgr0030VO.rgstNm }</td>
						<th scope="row"><strong>작성일</strong></th>
						<td>${mgr0030VO.rgstDt }</td>
					</tr>
					<tr>
						<th scope="row"><strong>첨부파일</strong></th>
						<td colspan="3">
							<c:choose>
								<c:when test="${fn:length(fileList) > 0 }">
									<c:forEach var="result" items="${fileList }">
										<a href="/atch/fileDown.do?atchFileId=${result.atchFileId }&fileSn=${result.fileSn }" target="_blank" class="down_file"><img src="/publish/frt/images/sub/file_${result.fileExtsn }.png" alt="" class="m"> <u>${result.orignFileNm }</u></a>　
									</c:forEach>
								</c:when>
								<c:otherwise>-</c:otherwise>
							</c:choose>
						</td>
					</tr>
					<tr>
						<td colspan="4" class="tbl_text">
							<div class="text_area">
								<pre class="text_pre"><c:out value="${util:unEscape(mgr0030VO.cont) }"/></pre>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	<!--// tbl_wrap -->
		<div class="btn_area">
			<c:if test="${loginFrt.memberSeq eq mgr0030VO.rgstId and empty replyVO }">
				<a href="javascript:void(0);" class="btn btn_mdl btn_rewrite" onclick="fncSubAction('updateSubForm.do');">수정</a> 
				<a href="javascript:void(0);" class="btn btn_mdl btn_del" onclick="fncSubAddList('deleteSubProc.do');">삭제</a>
			</c:if>
			<a href="javascript:void(0);" class="btn btn_mdl btn_list" onclick="fncSubList();">목록</a>
		</div>
		<br/><br/>
		<div class="tbl_wrap">
			<c:choose>
				<c:when test="${empty replyVO and tchrChk eq 'Y' and searchVO.eduBoardDivn eq 'ed05' }">
					<table class="board_row_type01">
						<caption></caption>
						<colgroup>
							<col style="width:15%;">
							<col style="width:35%;">
							<col style="width:15%;">
							<col style="width:35%;">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row"><strong>답변제목</strong></th>
								<td colspan="3">
									<input type="text" id="title" name="title" class="text w100p" maxlength="200" placeholder="답변제목을 입력해주세요"/>
								</td>
							</tr>
							<tr>
								<th scope="row"><strong>답변내용</strong></th>
								<td colspan="3">
									<textarea id="cont" name="cont"  class="text_area" style="resize: none;"></textarea>
								</td>
							</tr>
							<tr>
								<th scope="row"><strong>첨부파일</strong></th>
								<td colspan="3">
									<iframe name="replyFileIdFrame" id="replyFileIdFrame" src="/atch/fileUpload.do?atchFileId=&fileCnt=5&atchFileIdNm=replyFileId&updateType=upload" style="width: 100%;" height="50" frameborder="0" title="파일 업로드 폼"></iframe>
									<input type="hidden" id=replyFileId name="atchFileId"/>
								</td>
							</tr>
						</tbody>
					</table>
					<div class="btn_area">
						<a href="javascript:void(0);" class="btn btn_mdl btn_rewrite" onclick="fncSubAddList('replyInsertSubProc.do');">답변등록</a> 
					</div>
				</c:when>
				<c:when test="${not empty replyVO and searchVO.eduBoardDivn eq 'ed05' }">
					<table class="board_row_type01">
						<caption></caption>
						<colgroup>
							<col style="width:15%;">
							<col style="width:35%;">
							<col style="width:15%;">
							<col style="width:35%;">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row"><strong>답변자</strong></th>
								<td>
									${replyVO.rgstNm}
								</td>
			                    <th scope="row"><strong>답변일</strong></th>
								<td>${replyVO.rgstDt }</td>
							</tr>
							<tr>
								<th scope="row"><strong>답변제목</strong></th>
								<td colspan="3" id="td_title">
									${replyVO.title }
								</td>
							</tr>
							<tr>
								<th scope="row"><strong>답변내용</strong></th>
								<td colspan="3">
									<div class="text_area" id="td_cont">
										<pre class="text_pre">${replyVO.cont }</pre>
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row"><strong>첨부파일<input type="hidden" id=replyFileId name="atchFileId"/></strong></th>
								<td colspan="3" id="td_file">
									<iframe name="replyFileIdFrame" id="replyFileIdFrame" src="/atch/fileUpload.do?atchFileId=${replyVO.atchFileId }&fileCnt=5&atchFileIdNm=replyFileId&updateType=view" style="width: 100%;" height="50" frameborder="0" title="파일 업로드 폼"></iframe>
								</td>
							</tr>
						</tbody>
					</table>
					<c:if test="${tchrChk eq 'Y' }">
						<div class="btn_area">
							<a href="javascript:void(0);" class="btn btn_mdl btn_rewrite" id="btn_reply_modify" onclick="fncReplyModify();">답변수정</a>
							<a href="javascript:void(0);" class="btn btn_mdl btn_rewrite" id="btn_reply_update" onclick="fncSubAddList('replyUpdateSubProc.do');" style="display: none;">수정완료</a> 
							<a href="javascript:void(0);" class="btn btn_mdl btn_del" onclick="fncSubAddList('replyDeleteSubProc.do');">답변삭제</a>
						</div>
					</c:if>
				</c:when>
			</c:choose>
		</div>
	</form>
<!-- prev & next -->
	<table class="tbl_prevNext" >
		<caption></caption>
		<colgroup>
			<col style="width:20%"/>
			<col />
		</colgroup>
		<c:choose>
			<c:when test="${not empty next.eduBoardSeq }">
				<tr class="cursor" onclick="fncSubView(${next.eduBoardSeq });">
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
			<c:when test="${not empty prev.eduBoardSeq }">
				<tr class="cursor" onclick="fncSubView(${prev.eduBoardSeq });">
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
	</table>
<!--// prev & next -->
</div>
<script type="text/javascript">
function fncReplyModify(){
	$("#btn_reply_modify").hide();
	$("#btn_reply_update").show();
	var titleHtml = '<input type="text" id="title" name="title" class="text w100p" maxlength="200" value="${replyVO.title }" placeholder="답변제목을 입력해주세요"/>';
	var contHtml = '<textarea id="cont" name="cont" class="text_area" style="resize: none;">'+$("#contTemp").val()+'</textarea>';
	var fileHtml = '<iframe name="replyFileIdFrame" id="replyFileIdFrame" src="/atch/fileUpload.do?atchFileId=${replyVO.atchFileId }&fileCnt=5&atchFileIdNm=replyFileId&updateType=upload" style="width: 100%;" height="50" frameborder="0" title="파일 업로드 폼"></iframe>';
	$("#td_title").html(titleHtml);
	$("#td_cont").html(contHtml);
	$("#td_file").html(fileHtml);
}
function fncSubAction(url){
	$.ajax({
		method : "POST",
		url : url,
		data : $("#subFrm").serialize(),
		dataType : "HTML",
		success : function(data){
			$(".subList").html(data);		
		},error  : function(req, text){
		}
	});
}
function fncSubView(seq){
	$("#eduBoardSeq").val(seq);
	$.ajax({
		method : "POST",
		url : "subView.do",
		data : $("#subFrm").serialize(),
		dataType : "HTML",
		success : function(data){
			$(".subList").html(data);		
		},error  : function(req, text){
		}
	});
}
</script>