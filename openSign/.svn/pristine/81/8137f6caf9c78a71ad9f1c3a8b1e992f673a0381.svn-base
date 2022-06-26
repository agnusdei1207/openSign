<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<c:set var="url" value="${requestScope['javax.servlet.forward.request_uri']}"/>
<script type="text/javascript" src="/publish/mgr/js/board.js"></script>
<script type="text/javascript" src="/resource/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
<div class="content_box">
	<form:form commandName="cmmnBoardVO" name="defaultFrm" id="defaultFrm" method="post" onsubmit="return false;">
		<form:hidden path="boardSeq" id="boardSeq"/>
		<form:hidden path="boardDivn" id="boardDivn"/>
		<form:hidden path="boardCd" id="boardCd" />
		<form:hidden path="atchFileId" id="atchFileId"/>
		<input type="hidden" id="imageFileId" name="imageFileId">
		<jsp:directive.include file="/WEB-INF/jsp/cmmn/inc/incSearchForm.jsp"/>
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
						<th scope="row"><strong class="th_tit">제목</strong></th>
						<td colspan="3">
							<input type="text" id="title" name="title" class="text w100p" maxlength="200" value="${util:unEscape(cmmnBoardVO.title) }" />
						</td>
					</tr>
					<tr>
						<th scope="row"><strong>유튜브 주소</strong></th>
						<td colspan="3">
							<input type="text" id="link" name="link" class="text w100p" maxlength="200" value="${cmmnBoardVO.link }" />
						</td>
					</tr>
					<tr>
						<th scope="row"><strong>내용</strong></th>
						<td colspan="3">
							<div class="text_area">
								<textarea name="cont" id="cont" class="txt_area w_100p" >${util:unEscape(cmmnBoardVO.cont)}</textarea>
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row"><strong>첨부파일</strong></th>
						<td colspan="3">
							<iframe name="atchFileIdFrame" id="atchFileIdFrame" src="/atch/fileUpload.do?atchFileId=${cmmnBoardVO.atchFileId }&fileCnt=5&atchFileIdNm=atchFileId&updateType=upload" style="width: 100%;" height="50" frameborder="0" title="파일 업로드 폼"></iframe>
						</td>
					</tr>
					<tr>
						<th scope="row"><strong>이미지파일</strong></th>
						<td colspan="3">
							<iframe name="imageFileIdFrame" id="imageFileIdFrame" src="/atch/fileUpload.do?atchFileId=${cmmnBoardVO.imageFileId }&fileCnt=5&atchFileIdNm=imageFileId&updateType=imageUpload" style="width: 100%;" height="50" frameborder="0" title="파일 업로드 폼"></iframe>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="btn_area">
			<a href="#" class="btn btn_mdl btn_${searchVO.procType eq 'update'? 'rewrite':'save'}" id="btn_submit">${searchVO.procType eq  'update' ? '수정' : '등록'}</a>
			<c:choose>
				<c:when test="${searchVO.procType eq 'update'}">
					<a href="#" class="btn btn_mdl btn_cancel" id="btn_returnView">취소</a>
				</c:when>
				<c:otherwise>
					<a href="#" class="btn btn_mdl btn_cancel" id="btn_list">취소</a>
				</c:otherwise>
			</c:choose>
		</div>
	</form:form>
</div>
<script type="text/javascript">
var oEditors = [];
$(document).ready(function(){	
	
	<%-- 에디터 --%>
	nhn.husky.EZCreator.createInIFrame({
	    oAppRef: oEditors,
	    elPlaceHolder: "cont",
	    sSkinURI: "/resource/editor/SmartEditor2Skin.html",
	    fCreator: "createSEditor2"
	}); 
});

<%-- iframe load 이벤트 --%> 
$('iframe').load(function(){
	if($("#imageFileId").val() != "" && $("#imageFileId").val() != null){
		alertMsg("imageFileId");			
	}
});

$("#btn_submit").bind("click", function(){
	
	if($("#title").val() == "" || $("#title").val() == null) {
		alert("제목을 입력해주세요");
		$("#title").focus();
		return false;
	}
	
		
	if($("#imageFileId").val() == "" || $("#imageFileId").val() == null) {
		alertMsg("imageFileId", "red", "이미지파일을 첨부해주세요");
		return false;
	}
	
	oEditors.getById["cont"].exec("UPDATE_CONTENTS_FIELD", []);/* 에디터 */
	
	fncPageBoard('submit','${searchVO.procType}Proc.do');
	return false;
});

$("#btn_returnView").click(function(){
	fncPageBoard('view','view.do');
});
</script>