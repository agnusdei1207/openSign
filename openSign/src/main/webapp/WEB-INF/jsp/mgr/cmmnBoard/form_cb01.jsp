<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<c:set var="url" value="${requestScope['javax.servlet.forward.request_uri']}"/>
<script type="text/javascript" src="/publish/mgr/js/board.js"></script>
<script type="text/javascript" src="/resource/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
<div class="content_box">
	<form id="defaultFrm" name="defaultFrm" method="post" onsubmit="return false;">
		<input type="hidden" id="boardSeq" name="boardSeq" value="<c:out value="${searchVO.boardSeq }"/>"/>
		<input type="hidden" id="boardGrpSeq" name="boardGrpSeq" value="<c:out value="${searchVO.boardGrpSeq }"/>"/>
		<input type="hidden" id="boardGrpNo" name="boardGrpNo" value="<c:out value="${searchVO.boardGrpNo }"/>"/>
		<input type="hidden" id="lvl" name="lvl" value="<c:out value="${searchVO.lvl }"/>"/>
		<input type="hidden" id="contType" name="contType" value="<c:out value="${empty searchVO.contType ? 'E' : searchVO.contType }"/>"/>
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
							<input type="text" id="title" name="title" class="text w100p" value="<c:out value="${cmmnBoardVO.title }"/>" maxlength="200" />
						</td>
					</tr>
					<tr>
						<th scope="row"><strong class="th_tit">내용</strong></th>
						<td colspan="3">
							<div class="text_area">
								<textarea name="cont" id="cont" class="txt_area w100p text_pre">
									<c:out value="${util:unEscape(cmmnBoardVO.cont)}" escapeXml="false"/>
								</textarea>
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row"><strong>첨부파일</strong></th>
						<td colspan="3">
							<iframe name="atchFileIdFrame" id="atchFileIdFrame" src="/atch/fileUpload.do?atchFileId=<c:out value="${cmmnBoardVO.atchFileId }"/>&fileCnt=5&atchFileIdNm=atchFileId&updateType=upload" style="width: 100%;" height="50" frameborder="0" title="파일 업로드 폼"></iframe>
							<input type="hidden" id="atchFileId" name="atchFileId"/>
						</td>
					</tr>
					<tr>
						<th scope="row"><strong>이미지파일</strong></th>
						<td colspan="3">
							<iframe name="imageFileIdFrame" id="imageFileIdFrame" src="/atch/fileUpload.do?atchFileId=<c:out value="${cmmnBoardVO.imageFileId }"/>&fileCnt=5&atchFileIdNm=imageFileId&updateType=imageUpload" style="width: 100%;" height="50" frameborder="0" title="파일 업로드 폼"></iframe>
							<input type="hidden" id="imageFileId" name="imageFileId"/>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="btn_area">
			<c:choose>
				<c:when test="${searchVO.procType eq 'update' }">
					<a href="#" class="btn btn_mdl btn_rewrite" id="btn_submit">수정</a>
				</c:when>
				<c:when test="${searchVO.procType eq 'insert' or searchVO.procType eq 'grpInsert' }">
					<a href="#" class="btn btn_mdl btn_save" id="btn_submit">등록</a>
				</c:when>
			</c:choose>	 
			<c:choose>
				<c:when test="${searchVO.procType eq 'update' or searchVO.procType eq 'grpInsert' }">
					<a href="#" class="btn btn_mdl btn_cancel" id="btn_view">취소</a>
				</c:when>
				<c:when test="${searchVO.procType eq 'insert' }">
					<a href="#" class="btn btn_mdl btn_cancel" id="btn_list">취소</a>
				</c:when>
			</c:choose>
		</div>
	</form>
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

$("#btn_submit").on("click", function(){
	
	var submitChk = true;
	var focusId = "";
	
	if($("#title").val() == null || $("#title").val() == "") {
		alertMsg("title", "red", "제목을 입력해주세요");
		submitChk = false;
		if(focusId == ""){focusId = "title"};
	}else{
		alertMsg("title");
	}
	
	oEditors.getById["cont"].exec("UPDATE_CONTENTS_FIELD", []);/* 에디터 */
	if($("#cont").val() == null || $("#cont").val() == '<p>&nbsp;</p>' || $("#cont").val() == '') {
		alertMsg("cont", "red", "내용을 입력해주세요");
		submitChk = false;
		if(focusId == ""){focusId = "cont"};
	}else{
		alertMsg("cont");
	}
	
	if(submitChk){
		fncPageBoard('submit','${searchVO.procType}Proc.do');
		return false;
	}else{
		if(focusId == "cont"){
			oEditors.getById["cont"].exec("FOCUS");
		}else{
			$("#"+focusId).focus();
		}
		return false;
	}
	return false;
});
</script>