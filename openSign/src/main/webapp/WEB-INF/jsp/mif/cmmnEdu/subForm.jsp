<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<c:set var="url" value="${requestScope['javax.servlet.forward.request_uri']}"/>
<script type="text/javascript" src="/publish/mgr/js/board.js"></script>
<script type="text/javascript" src="/publish/mgr/js/boardEtc.js"></script>
<script type="text/javascript" src="/resource/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
<div class="tab_cont tab_content">
	<form id="subFrm" name="subFrm" method="post" onsubmit="return false;">
		<input type="hidden" id="eduBoardCd" name="eduBoardCd" value="${searchVO.eduBoardCd }"/>
		<input type="hidden" id="eduSubCd" name="eduSubCd" value="${searchVO.eduSubCd }"/>
		<input type="hidden" id="eduBoardDivn" name="eduBoardDivn" value="${searchVO.eduBoardDivn }"/>
		<input type="hidden" id="eduBoardSeq" name="eduBoardSeq" value="${searchVO.eduBoardSeq }"/>
		<jsp:directive.include file="/WEB-INF/jsp/cmmn/inc/subSearchForm.jsp"/>
		<div class="tbl_wrap">
			<table class="board_row_type01"> 
				<caption></caption>
				<colgroup>
					<col style="width:15%;">
					<col style="width:35%;">
					<col style="width:15%;">
					<col style="width:35%;">
				</colgroup> 
				<tbody>
					<c:if test="${searchVO.eduBoardDivn eq 'ed05' }">
						<tr>
							<th scope="row"><strong>분류</strong></th>
							<td colspan="">
								<input type="radio" id="category_1" name="category" class="cursor" value="수강신청" ${empty mgr0030VO.category ? 'checked' : mgr0030VO.category eq '수강신청' ? 'checked' : '' }/>
								<label for="category_1" class="cursor">수강신청</label>　
								<input type="radio" id="category_2" name="category" class="cursor" value="강의내용" ${mgr0030VO.category eq '강의내용' ? 'checked' : ''}/>
								<label for="category_2" class="cursor">강의내용</label>　
								<input type="radio" id="category_3" name="category" class="cursor" value="기타" ${mgr0030VO.category eq '기타' ? 'checked' : ''}/>
								<label for="category_3" class="cursor">기타</label>
							</td>
							<th scope="row"><strong>담당강사</strong></th>
							<td colspan="">
								<select id="tchrSeq" name="tchrSeq" class="w150">
									<option value="">전체</option>
									<c:if test="${fn:length(tchrList) > 0 }">
										<c:forEach var="list" items="${tchrList }" varStatus="status">
											<option value="${list.memberSeq }" ${mgr0030VO.tchrSeq eq list.memberSeq ? 'selected' : '' }>${list.name }</option>
										</c:forEach>
									</c:if>
								</select>
							</td>
						</tr>
					</c:if>
					<tr>
						<th scope="row"><strong class="th_tit">${searchVO.eduBoardDivn eq 'ed05' ? '문의' : '' }제목</strong></th>
						<td colspan="3">
							<input type="text" id="title" name="title" class="text w100p" maxlength="200" value="${mgr0030VO.title }" />
						</td>
					</tr>
					<tr>
						<th scope="row"><strong>${searchVO.eduBoardDivn eq 'ed05' ? '문의' : '' }내용</strong></th>
						<td colspan="3">
							<div class="text_area">
								<textarea id="cont" name="cont" class="text_area" style="resize: none;">${mgr0030VO.cont }</textarea>
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row"><strong>첨부파일</strong></th>
						<td colspan="3">
							<iframe name="atchFileIdFrame" id="atchFileIdFrame" src="/atch/fileUpload.do?atchFileId=${mgr0030VO.atchFileId }&fileCnt=5&atchFileIdNm=atchFileId&updateType=upload" style="width: 100%;" height="50" frameborder="0" title="파일 업로드 폼"></iframe>
							<input type="hidden" id="atchFileId" name="atchFileId"/>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="btn_area">
			<a href="#" class="btn btn_mdl btn_${searchVO.procType eq 'update'? 'rewrite':'save'}" id="btn_submit">${searchVO.procType eq  'update' ? '수정' : '등록'}</a>
			<c:choose>
				<c:when test="${searchVO.procType eq 'update'}">
					<a href="javascript:void(0);" class="btn btn_mdl btn_cancel" onclick="fncSubAction('subView.do');">취소</a>
				</c:when>
				<c:otherwise>
					<a href="javascript:void(0);" class="btn btn_mdl btn_cancel" onclick="fncSubList();">취소</a>
				</c:otherwise>
			</c:choose>
		</div>
	</form>
</div>
<script type="text/javascript">
$(document).ready(function(){	
});
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

$("#btn_submit").on("click", function(){
	
	if($("#title").val() == "" || $("#title").val() == null) {
		alert("제목을 입력해주세요");
		$("#title").focus();
		return false;
	} 
	
	if($("#cont").val() == "" || $("#cont").val() == null) {
		alert("내용을 입력해주세요");
		$("#cont").focus();
		return false;
	}
	
	fncSubAddList('${searchVO.procType}SubProc.do');
	return false;
});
</script>