<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<div class="pop_header">
   <h2>메뉴수정</h2>
   <a href="javascript:void(0);" onclick="view_hide(1);return false" class="pop_close"></a>
</div>
<div class="pop_content">
	<div class="pop_scl">
	    <div class="tbl_wrap">
			<form:form commandName="mgr0001VO" name="popFrm" id="popFrm" method="post">
				<form:hidden path="menuSeq" id="menuSeq_up" />
				<form:hidden path="menuCd" id="menuCd_up" />
				<form:hidden path="pMenuCd" id="pMenuCd_up" />
				<form:hidden path="lvl" id="lvl_up" />
				<table class="tbl_row_type02"> 
					<colgroup>
						<col style="width:20%;">
						<col style="width:30%;">
						<col style="width:20%;">
						<col style="width:30%;">
					</colgroup> 
					<tbody>
						<tr>
							<th><strong class="th_tit">메뉴코드</strong></th>
							<td>
								<c:out value="${mgr0001VO.menuCd }" />
							</td>
							<th><strong class="th_tit">부모메뉴코드</strong></th>
							<td>
								<c:out value="${mgr0001VO.pMenuCd }" />
							</td>
						</tr>
						<tr>
							<th><strong class="th_tit">순서</strong></th>
							<td>
								<c:out value="${mgr0001VO.menuNo }" />
							</td>
							<th><strong class="th_tit">메뉴명</strong></th>
							<td>
								<form:input path="menuNm" id="menuNm_up" cssClass="text w100p"  required="true"  maxlength="30" />
							</td>
						</tr>
						<tr>
							<th><strong class="th_tit">레벨</strong></th>
							<td>
								<c:out value="${mgr0001VO.lvl }" />차 메뉴
							</td>
							<th><strong >메뉴URL</strong></th>
							<td>
								<form:input path="menuUrl" id="menuUrl_up" cssClass="text w100p"   maxlength="200" />
							</td>
						</tr>
						<c:if test="${mgr0001VO.lvl gt 1}">
							<c:choose>
								<c:when test="${fn:indexOf(mgr0001VO.menuCd, 'mgr') > -1}">
									<tr>
										<th><strong>유형선택</strong></th>
										<td colspan="">
											<select id="boardDivn_up" name="boardDivn" class="w100p">
												<option value="">선택</option>
												<option value="cb01" ${mgr0001VO.boardDivn eq 'cb01' ? 'selected' : '' }>일반게시판</option>
												<option value="cb02" ${mgr0001VO.boardDivn eq 'cb02' ? 'selected' : '' }>답변게시판</option>
												<option value="cb03" ${mgr0001VO.boardDivn eq 'cb03' ? 'selected' : '' }>댓글게시판</option>
												<option value="cb04" ${mgr0001VO.boardDivn eq 'cb04' ? 'selected' : '' }>공지사항</option>
												<option value="cb05" ${mgr0001VO.boardDivn eq 'cb05' ? 'selected' : '' }>이미지게시판</option>
											</select>
										</td>
										<th><strong>비고</strong></th>
										<td colspan="">
											<form:input path="etc" id="etc_up" cssClass="text w100p"  maxlength="150" />
										</td>
									</tr>
								</c:when>
								<c:otherwise>
									<tr>
										<th><strong>유형선택</strong></th>
										<td>
											<select id="boardDivn_up" name="boardDivn" class="w100p" onchange="fncBrdCd(this.value);">
												<option value="">선택</option>
												<option value="cb01" ${mgr0001VO.boardDivn eq 'cb01' ? 'selected' : '' }>일반게시판</option>
												<option value="cb02" ${mgr0001VO.boardDivn eq 'cb02' ? 'selected' : '' }>답변게시판</option>
												<option value="cb03" ${mgr0001VO.boardDivn eq 'cb03' ? 'selected' : '' }>댓글게시판</option>
												<option value="cb04" ${mgr0001VO.boardDivn eq 'cb04' ? 'selected' : '' }>공지사항</option>
												<option value="cb05" ${mgr0001VO.boardDivn eq 'cb05' ? 'selected' : '' }>이미지게시판</option>
												<option value="cc01" ${mgr0001VO.boardDivn eq 'cc01' ? 'selected' : '' }>컨텐츠관리</option>
											</select>
										</td>
										<th><strong>관리자 게시판 선택</strong></th>
										<td>
											<select id="boardCd_up" name="boardCd" class="w100p" onchange="cdOverLapChk(this.value);">
												<option value="" disabled="disabled">선택</option>
											</select>
										</td>
									</tr>
									<tr>
										<th><strong>사용자 글쓰기</strong></th>
										<td colspan="">
											<input type="radio" id="writeYn_y_up" name="writeYn" class="writeYn cursor" value="Y" ${mgr0001VO.writeYn eq 'Y' ? 'checked' : '' }/><label for="writeYn_y_up" class="cursor">허가</label>
											<input type="radio" id="writeYn_n_up" name="writeYn" class="writeYn cursor" value="N" ${empty mgr0001VO.writeYn ? 'checked' : mgr0001VO.writeYn eq 'N'? 'checked' : '' }/><label for="writeYn_n_up" class="cursor">불가</label>
										</td>
										<th><strong>노출여부</strong></th>
										<td colspan="">
											<input type="radio" id="dsplYn_y_up" name="dsplYn" class="dsplYn cursor" value="Y" ${empty mgr0001VO.dsplYn ? 'checked' : mgr0001VO.dsplYn eq 'Y'? 'checked' : '' }/><label for="dsplYn_y_up" class="cursor">노출</label>
											<input type="radio" id="dsplYn_n_up" name="dsplYn" class="dsplYn cursor" value="N" ${mgr0001VO.dsplYn eq 'N' ? 'checked' : '' }/><label for="dsplYn_n_up" class="cursor">비노출</label>
										</td>
									</tr>
									<tr>
										<th><strong>비고</strong></th>
										<td colspan="3">
											<form:input path="etc" id="etc_up" cssClass="text w100p"  maxlength="150" />
										</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</c:if>
					</tbody>
				</table>
			</form:form>
		</div>
	</div>
</div>
<div class="pop_footer">
    <a href="javascript:void(0);" title="저장" onclick="fncMenuUpDel('update', '${mgr0001VO.menuCd }','${mgr0001VO.boardDivn }')" class="btn btn_mdl btn_add">저장</a>
    <a href="javascript:void(0);" title="삭제" onclick="fncMenuUpDel('delete')" class="btn btn_mdl btn_del">삭제</a>
    <a href="javascript:void(0);" title="닫기" onclick="view_hide(1);return false" class="btn btn_mdl btn_close">닫기</a>
</div>
<script type="text/javascript">
$(document).ready(function(){
	<c:if test="${not empty mgr0001VO.boardDivn}">
		fncBrdCd("${mgr0001VO.boardDivn}");
	</c:if>
});

<%-- 관리자 게시판 선택 select 조회--%>
function fncBrdCd(val){
	if($("#boardDivn_up").val()=="cb04"){
		$("#boardCd_up").html('<option value="" disabled="disabled">선택</option>');
		return false;
	}
	$.ajax({
		method : "POST",
		url : "brdCd.do",
		data : {'boardDivn' : val, 'boardCd' : '${mgr0001VO.boardCd}'},
		dataType : "HTML",
		success : function(data){
			$("#boardCd_up").html(data);
		},error : function(){
			alert("관리자 게시판 리스트 조회에 실패하였습니다");			
		}
	});
}

<%-- 관리자 게시판 중복 확인 --%>
function cdOverLapChk(val){
	
	if("${mgr0001VO.boardCd}" == val){
		return false;
	}else{
		$.ajax({
			method : "POST",
			url : "cdOverLapChk.do",
			data : {'boardCd' : val},
			dataType : "JSON",
			success : function(data){
				if(data.cnt > 0){
					alert("이미 선택된 게시판 입니다");
					$("#boardCd_up").val("").prop("selected", true);
				}
			},error : function(){
				alert("관리자 게시판 중복 확인에 실패하였습니다");			
			}
		});
	}
}
</script>