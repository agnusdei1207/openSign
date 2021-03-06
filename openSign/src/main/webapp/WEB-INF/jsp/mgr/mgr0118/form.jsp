<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>

<div class="content_box">
	<form id="defaultFrm" name="defaultFrm" method="post" onsubmit="return false;">
		<input type="hidden" id="otSeq" name="otSeq" value="<c:out value="${mgr0118VO.otSeq }"/>"/>
		<input type="hidden" id="emplySeq" name="emplySeq" value="<c:out value="${mgr0118VO.emplySeq }"/>"/> 
		<input type="hidden" id="teamMail" name="teamMail" value="<c:out value="${mgr0118VO.teamMail }"/>"/> 
		<input type="hidden" id="name" name="name" value="<c:out value="${mgr0118VO.name }"/>"/> 
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
						<th scope="row"><strong>결재상태</strong></th>
						<td>
							<c:choose>
								<c:when test="${loginVO.authCode eq '2' }">
									<select id="status" name="status" class="text w50p">
										<option value="A" <c:out value="${mgr0118VO.status eq 'A' ? 'selected=\"selected\"' : '' }"/>>신청</option>
										<option value="B" <c:out value="${mgr0118VO.status eq 'B' ? 'selected=\"selected\"' : '' }"/>>반려</option>
										<option value="C" <c:out value="${mgr0118VO.status eq 'C' ? 'selected=\"selected\"' : '' }"/>>재신청</option>
										<option value="D" <c:out value="${mgr0118VO.status eq 'D' ? 'selected=\"selected\"' : '' }"/>>승인</option>
									</select>
									<a href="javascript:void(0);" onclick="fncUpdateState();" class="btn btn_mdl btn_save" style="background-color:#308cde;border-color:#308cde;margin-left:3px;">변경</a>
								</c:when>
								<c:otherwise>
									<input type="hidden" id="status" name="status" value="A"/>
									<c:choose>
										<c:when test="${mgr0118VO.status eq 'B' }">
											반려 : 결재자 (${mgr0118VO.approver } 이사)
										</c:when>
										<c:when test="${mgr0118VO.status eq 'C' }">
											재신청
										</c:when>
										<c:when test="${mgr0118VO.status eq 'D' }">
											승인 : 결재자 (${mgr0118VO.approver } 이사)
										</c:when>
										<c:otherwise>
											신청
										</c:otherwise>
									</c:choose>
								</c:otherwise>
							</c:choose>
						</td>
						<th scope="row"><strong>등록자</strong></th>
						<td>
							<c:choose>
								<c:when test="${loginVO.authCode eq '4' }">
									<c:out value="${loginVO.name}"/>
								</c:when>
								<c:otherwise>
									<c:out value="${mgr0118VO.name }"/>
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
					<tr>
						<th scope="row"><strong class="th_tit">프로젝트명</strong></th>
						<td colspan="3">
							<input type="text" id="prjctNm" name="prjctNm" class="text w100p" value="<c:out value="${mgr0118VO.prjctNm }"/>" maxlength="150" />
						</td>
					</tr>
					<tr> 
						<th scope="row"><strong>비고</strong></th>
						<td colspan="3">
							<input type="text" id="etc" name="etc" class="text w100p" value="<c:out value="${mgr0118VO.etc }"/>" maxlength="150" />
						</td>
					</tr>
					<tr>
						<th scope="row"><strong>첨부파일</strong></th>
						<td colspan="3">
							<iframe name="atchFileIdFrame" id="atchFileIdFrame" src="/atch/fileUpload.do?atchFileId=<c:out value="${mgr0118VO.atchFileId }"/>&fileCnt=5&atchFileIdNm=atchFileId&updateType=upload" style="width: 100%;" frameborder="0" title="파일 업로드 폼"></iframe>
							<input type="hidden" id="atchFileId" name="atchFileId"/>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="tbl_wrap">
		 <h4 class="md_tit">인원 추가
		 <c:if test="${loginVO.authCode eq '1' || loginVO.authCode eq '4'}">
		 	<a href="javascript:void(0);" class="btn btn_sml btn_ok" onclick="fncModal();">추가</a>
		 </c:if>
		 </h4> 
			<table class="tbl_col_type01" id="addTbl"> 
				<caption>내용(제목, 작성자, 작성일 등으로 구성)</caption>
				<colgroup>
					<col style="width:10%;">
					<col style="width:18%;">
					<col style="width:18%;">
					<col style="width:50%;">
					<c:if test="${loginVO.authCode eq '1' || loginVO.authCode eq '4' }">
						<col style="width:5%;"> 
					</c:if> 
				</colgroup>
				<thead>
					<tr>
						<th scope="col">이름</th>
						<th scope="col"><span class="th_tit">근무시작</span></th>
						<th scope="col"><span class="th_tit">근무종료</span></th>
						<th scope="col"><span class="th_tit">작업내용</span></th>
						<c:if test="${loginVO.authCode eq '1' || loginVO.authCode eq '4' }">
							<th scope="col"></th>
						</c:if>
					</tr>
				</thead>
				<tbody id="add_tbody">
					<c:choose>
						<c:when test="${fn:length(addResultList) gt 0 }"> 
						<c:forEach var="add" items="${addResultList }" varStatus="status">
						 	<tr id="tr_add_${status.count}">      
								<td id="chkUser_${status.count}" data-info="${add.emplySeq }" data-name="${add.emplyName }">
								<input type="hidden" id="adSeq_${status.count }" name="adSeq" value="${add.adSeq }"/>
									${add.emplyName } 
								</td>
								<td>
									<span class="pick_input" style="margin-right:11px;">
										<input type="text" name="staDate" id="staDate_${status.count }" class="text w80" maxlength="30" readonly value="<c:out value="${add.staDate}"/>"/>
									</span>
									<select name="staHour" id="staHour_${status.count }" style="width:40px;">
										<option value=""></option>
										<c:forEach var="i" begin="0" end="23" step="1">
											<option value="<fmt:formatNumber value='${i}' minIntegerDigits='2' type='number'/>" ${i eq add.staHour ? 'selected="selected"' : ''}> 
												<fmt:formatNumber value='${i}' minIntegerDigits='2' type='number'/>
											</option>
										</c:forEach>
									</select>시 
									<select name="staMin" id="staMin_${status.count }" style="width:40px; margin-left:9px;">
										<option value=""></option>
										<c:forEach var="i" begin="0" end="50" step="10">
											<option value="<fmt:formatNumber value='${i}' minIntegerDigits='2' type='number'/>" ${i eq add.staMin ? 'selected="selected"' : ''}>
												<fmt:formatNumber value='${i}' minIntegerDigits='2' type='number'/>
											</option>
										</c:forEach>
									</select>분
								</td>
								<td>
									<span class="pick_input" style="margin-right:11px;">
										<input type="text" name="endDate" id="endDate_${status.count }" class="text w80" maxlength="30" readonly value="<c:out value="${add.endDate}"/>"/>
									</span>
									<select name="endHour" id="endHour_${status.count }" style="width:40px;">
										<option value=""></option>
										<c:forEach var="i" begin="0" end="23" step="1">
											<option value="<fmt:formatNumber value='${i}' minIntegerDigits='2' type='number'/>" ${i eq add.endHour ? 'selected="selected"' : ''}>
												<fmt:formatNumber value='${i}' minIntegerDigits='2' type='number'/>
											</option>
										</c:forEach>
									</select>시
									<select name="endMin" id="endMin_${status.count }" style="width:40px; margin-left:9px;">
										<option value=""></option>
										<c:forEach var="i" begin="0" end="50" step="10">
											<option value="<fmt:formatNumber value='${i}' minIntegerDigits='2' type='number'/>" ${i eq add.endMin ? 'selected="selected"' : ''}>
												<fmt:formatNumber value='${i}' minIntegerDigits='2' type='number'/>
											</option>
										</c:forEach>
									</select>분  
								</td>
								<td>
									<input type="text" name="cont" id="cont_${status.count }" class="text w100p" maxlength="100" value="<c:out value="${add.cont }"/>" />
								</td>
								<c:if test="${loginVO.authCode eq '1' || loginVO.authCode eq '4' }">
									<td>
										<a href="javascript:void(0)" class="btn btn_sml btn_del" id="btn_add_del_${status.count}" onclick="fncDel(this,'${status.count }','${add.emplySeq}','${add.emplyName}')">삭제</a>
									</td>
								</c:if>
							</tr>
							</c:forEach>				
						</c:when>
						<c:otherwise>
							<tr id="tr_no_data"><td colspan="4" class="no_data">데이터가 없습니다.<td></tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>
		<div class="btn_area">
			<c:if test="${(loginVO.seq eq mgr0118VO.rgstId && mgr0118VO.status ne 'D' && mgr0118VO.status ne 'B' && loginVO.authCode eq '4' && searchVO.procType eq 'update') || (loginVO.authCode eq '1' && searchVO.procType eq 'update') }">
				<a href="javascript:void(0);" class="btn btn_mdl btn_rewrite" onclick="fncSubmit();">수정</a>
				<a href="javascript:void(0);" class="btn btn_mdl btn_del" id="btn_del">삭제</a>	 
			</c:if>
		<%-- 	<c:if test="${(mgr0118VO.status eq 'B' && searchVO.procType eq 'update' && loginVO.authCode eq '4') }">
				<a href="javascript:void(0);" class="btn btn_mdl btn_rewrite" onclick="fncSubmit();">재신청</a>
				<a href="javascript:void(0);" class="btn btn_mdl btn_del" id="btn_del">삭제</a>
			</c:if> --%>
			<c:if test="${searchVO.procType eq 'insert' }">
				<a href="javascript:void(0);" class="btn btn_mdl btn_save" onclick="fncSubmit();">등록</a>
			</c:if>
				<a href="javascript:void(0);" class="btn btn_mdl btn_cancel" id="btn_list">${searchVO.procType eq 'update' ? '목록' : '취소'}</a>
		</div>
	</form>
</div>

<div id="display_view1" class="layer_popup pop_size710 js-popup">

</div>

<script type="text/javaScript">

<%-- popAddList 체크박스 전역배열 --%>
var chkArray = new Array();

$(document).ready(function(){
	fncPageBoard('addList','addList.do',$("#pageIndex").val());
	
	$("[id^='staDate_']").each(function(){
		var idx = $(this).attr("id").split("_")[1];
		fncDate('staDate_'+idx, 'endDate_'+idx);
	});
	
	<c:forEach var="add" items="${addResultList }" varStatus="status">
		chkArray.push("${add.emplySeq}"+"_"+"${add.emplyName}");
	</c:forEach>	
	fncChkReady();
	$(this).attr("data-name");
	
});

$("#schEtc01").change(function(){
	fncPageBoard('addList','addList.do',1);
});

<%-- 페이지 이동 후 체크 값 유지 --%>
function fncChkReady(){
	// 개별
	$(".chk").each(function(){
	  var a = chkArray.indexOf(this.value);
		if(chkArray.indexOf(this.value) > -1){
			$(this).prop('checked',true);
		}
	});
	// 전체
	fncAllAction();
}

<%-- 전체 체크 여부 확인 --%>
function fncAllAction(){
	var total = $('input[id^=one_chk]').length;
	var chkLeng = $('input[id^=one_chk]:checked').length;
	
	if(total == chkLeng){
		$("#all_chk").prop('checked', true);
	}else{
		$("#all_chk").prop('checked', false);
	}

}

<%-- 모달창 열기 --%>
function fncModal(){   
	
	fncLoadingStart();
	$.ajax({
		method : "POST",
		url : "modal.do",
		data : $("#defaultFrm").serialize(),
		dataType : "HTML",
		success : function(data){
			$("#display_view1").html(data);
			view_show(1,'30%','12%','30%');
		},
		complete : function(){
			fncLoadingEnd();
		}
	});
}

<%-- 결재상태 변경 --%>
function fncUpdateState(){      
	fncLoadingStart();                 
	$.ajax({                                     
	    method : "POST",               
	    url : "statusUpdate.do",	                                                  
	    data : $("#defaultFrm").serialize(),    
	    dataType : "json",              
	    success : function(data) {    
	    	alert(data.result);    
	    },complete : function(){     
	    	fncLoadingEnd();
		}     
	});	
}

<%-- 모달창 직원추가 버튼  --%>
var addLength  = '${not empty addResultList ? fn:length(addResultList) : 1}';

function fncStaffAdd(){
	
	var tempArray = [];  // 기존에 체크된 인원 
	var addArray = [];   // 추가로 체크된 인원
	var delArray = [];   // 체크해제된 인원 
	
	$("[id^='chkUser_']").each(function(){
		var seqVal = $(this).attr("data-info");
		var nameVal = $(this).attr("data-name");
		if(seqVal){
			var tempData = seqVal+"_"+nameVal 
			tempArray.push(tempData);
		}
	});
	
	addArray = chkArray.filter(function(item, idx, self){
		return !tempArray.includes(item);
	});
	
	delArray = tempArray.filter(function(item, idx, self){
		return !chkArray.includes(item);
	});
	
	$("#tr_no_data").remove();
	
	if(addArray != null && addArray.length > 0){
		
		for(var i = 0; i < addArray.length; i++){

		 	addLength++;
	     
			var userSeq = addArray[i].split("_")[0];
			var userName = addArray[i].split("_")[1];
			
			var html = "";
			    html += '<tr id="tr_add_'+addLength+'"><td id="chkUser_'+addLength+'" data-info="'+userSeq+'" data-name="'+userName+'">'+userName+'</td>';
			    html += '<input type="hidden" id="adSeq_'+addLength+'" name="adSeq" value=" " />';
			    html += '<td style="text-align:left;"><span class="pick_input" style="margin-right:11px; margin-left:17px;"><input type="text" name="staDate" id="staDate_'+addLength+'" class="text w80" maxlength="30" readonly/></span>';
			    html += '<select name="staHour" id="staHour_'+addLength+'" style="width:40px; margin-left:3px;">';
			    html += '<option value=""></option><c:forEach var="i" begin="0" end="23" step="1">';
			    html += '<option value="<fmt:formatNumber value='${i}' minIntegerDigits='2' type='number'/>"><fmt:formatNumber value='${i}' minIntegerDigits='2' type='number'/></option></c:forEach></select>시 ';
				html += '<select name="staMin" id="staMin_'+addLength+'" style="width:40px; margin-left:9px;">';
				html += '<option value=""></option><c:forEach var="i" begin="0" end="50" step="10">';
				html += '<option value="<fmt:formatNumber value='${i}' minIntegerDigits='2' type='number'/>"><fmt:formatNumber value='${i}' minIntegerDigits='2' type='number'/></option></c:forEach></select>분</td>';
				html += '<td style="text-align:left;"><span class="pick_input" style="margin-right:11px; margin-left:17px;"><input type="text" name="endDate" id="endDate_'+addLength+'" class="text w80" maxlength="30" readonly/></span>';
				html += '<select name="endHour" id="endHour_'+addLength+'" style="width:40px; margin-left:3px;">';
				html += '<option value=""></option><c:forEach var="i" begin="0" end="23" step="1">';
				html += '<option value="<fmt:formatNumber value='${i}' minIntegerDigits='2' type='number'/>"><fmt:formatNumber value='${i}' minIntegerDigits='2' type='number'/></option></c:forEach></select>시';
				html += '<select name="endMin" id="endMin_'+addLength+'" style="width:40px; margin-left:15px;">';
				html += '<option value=""></option><c:forEach var="i" begin="0" end="50" step="10">';
				html += '<option value="<fmt:formatNumber value='${i}' minIntegerDigits='2' type='number'/>"><fmt:formatNumber value='${i}' minIntegerDigits='2' type='number'/></option></c:forEach></select>분</td>';
				html += '<td><input type="text" name="cont" id="cont_'+addLength+'" class="text w100p" maxlength="100"></td>';
				html += '<td><a href="javascript:void(0)" class="btn btn_sml btn_del" id="btn_add_del_'+addLength+'" onclick="fncDel(this, \''+addLength+'\', \''+userSeq+'\', \''+userName+'\')">삭제</a></td></tr></tbody>';
				
				$("#add_tbody").append(html);
				fncDate('staDate_'+addLength, 'endDate_'+addLength);
		}
	}
	
	if(delArray != null && delArray.length > 0){
		for(var i = 0; i < delArray.length; i++){
			var userSeq = delArray[i].split("_")[0];
			$("[id^='chkUser_']").each(function(){
				if($(this).attr("data-info") == userSeq){
					$(this).parent("tr").remove();
				}
			});
		}
	}
	
	if($("#add_tbody tr").length == 0){
		$("#add_tbody").html('<tr id="tr_no_data"><td colspan="5" class="no_data">데이터가 없습니다.<td></tr>');
	}
	
	$("#popTbl").html("");
	view_hide(1);
}
	
<%-- 인원추가 삭제 버튼 --%>
function fncDel(obj, idx, seq, name){
	if(confirm("추가된 인원을 삭제하시겠습니까?")){
		$("#tr_add_"+idx).remove();
		var index = chkArray.indexOf(seq+"_"+name);
		if (index > -1) {
			chkArray.splice(index, 1);
			}
		
		fncLoadingStart();
		$.ajax({
			method : "POST",
			url : "addDelete.do",
			data : $("#defaultFrm").serialize(),
			success : function(data){
				alert(data.result);
			}, complete : function(){
				fncLoadingEnd();
			}
		});
	
	}
	
}

<%-- submit +  유효성 검사  --%>
function fncSubmit(seq){
	
	$("#emplySeq").val(chkArray);
	
	var submitChk = true;
	var focusId = "";
	
	if(!$.trim($("#prjctNm").val())){
		alertMsg("prjctNm", "red", "프로젝트명을 입력해주세요.");
		$("#prjctNm").focus();
		return false;
	}
	
	if($("[id^='tr_add_']").length == 0){
		alert("인원을 추가해주세요.");
		return false;
	} 
	       
	
	$("[id^='tr_add_']").each(function(idx){
		
		var addIdx = $(this).attr("id").split("_")[2];
	
		if(!$("#staDate_"+addIdx).val() || !$("#staHour_"+addIdx).val() || !$("#staMin_"+addIdx).val()){
			alertMsg("staMin_"+addIdx, "red", "근무시작 시간을 선택해주세요.", "B");
			submitChk = false;
			if(focusId == ""){focusId = "staMin_"+addIdx };
		}else{
			alertMsg("staMin_"+addIdx);
		}
		
		if(!$("#endDate_"+addIdx).val() || !$("#endHour_"+addIdx).val() || !$("#endMin_"+addIdx).val()){
			alertMsg("endMin_"+addIdx, "red", "근무종료 시간을 선택해주세요.", "B");
			submitChk = false;
			if(focusId == ""){focusId = "endMin_"+addIdx };
		}else{
			alertMsg("endMin_"+addIdx);
		}
		
		if(!$.trim($("#cont_"+addIdx).val())){
			alertMsg("cont_"+addIdx, "red", "내용을 입력해주세요.", "B");
			submitChk = false;
			if(focusId == ""){focusId = "cont_"+addIdx };
		}else{
			alertMsg("cont_"+addIdx);
		}
		
	});
	
	if(!submitChk){
		$("#"+focusId).focus();
	}
	
	if(submitChk == true) {
		fncPageBoard('submit','${searchVO.procType}Proc.do');
		return false;
	}
	
}

</script>
