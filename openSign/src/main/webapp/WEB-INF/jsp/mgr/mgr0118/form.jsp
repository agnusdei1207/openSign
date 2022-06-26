<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>

<div class="content_box">
	<form id="defaultFrm" name="defaultFrm" method="post" onsubmit="return false;">
		<input type="hidden" id="otSeq" name="otSeq" value="<c:out value="${mgr0118VO.otSeq }"/>"/>
		<input type="hidden" id="adSeq" name="adSeq" value="<c:out value="${mgr0118VO.adSeq}"/>"/>
		<input type="hidden" id="emplySeq" name="emplySeq" value="<c:out value="${mgr0118VO.emplySeq }"/>"/>
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
						<%-- 	<c:choose>
								<c:when test="${searchVO.procType eq 'insert' }">
									
								</c:when>
								<c:when test="${searchVO.procType eq 'update' }">
									<select id="status" name="status" class="text w50p">
										<option value="A" <c:out value="${mgr0118VO.status eq 'A' ? 'selected=\"selected\"' : '' }"/>>반려</option>
										<option value="B" <c:out value="${mgr0118VO.status eq 'B' ? 'selected=\"selected\"' : '' }"/>>승인</option>
									</select>
								</c:when>
							</c:choose> 
						--%>
							<input type="hidden" id="status" name="status" value="A"/>
							<span class="text">신청</span>
						</td>
						<th scope="row"><strong>등록자</strong></th>
						<td>
							<c:out value="${loginVO.name}"/>
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
		 <h4 class="md_tit">인원추가 <a href="javascript:void(0);" class="btn btn_sml btn_ok" onclick="fncModal();">추가</a></h4> 
			<table class="tbl_col_type01" id="addTbl"> 
				<caption>내용(제목, 작성자, 작성일 등으로 구성)</caption>
				<colgroup>
					<col style="width:10%;">
					<col style="width:15%;">
					<col style="width:15%;">
					<col style="width:50%;"> 
					<col style="width:5%;"> 
				</colgroup>
				<thead>
					<tr>
						<th scope="col">이름</th>
						<th scope="col"><span class="th_tit">근무시작</span></th>
						<th scope="col"><span class="th_tit">근무종료</span></th>
						<th scope="col">작업내용</th>
						<th scope="col"></th>
					</tr>
				</thead>
				<tbody id="add_tbody">
					<c:if test="${fn:length(addResultList) gt 0 }"> 
					<c:forEach var="add" items="${addResultList }" varStatus="status">
					 	<tr id="add_tr_${status.count}">      
							<td class="chkUser" data-info="${add.emplySeq }">
								${add.emplyName } 
							</td>
							<td>
								<span class="pick_input" style="margin-right:11px;">
									<input type="text" name="staDate" id="staDate_${status.count }" class="text w80" maxlength="30" value="<c:out value="${add.staDate}"/>"/>
								</span>
								<select name="staHour" id="staTime_${status.count }" style="width:40px;">
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
										<input type="text" name="endDate" id="endDate_${status.count }" class="text w80" maxlength="30" value="<c:out value="${add.endDate}"/>"/>
								</span>
								<select name="endHour" id="endTime_${status.count }" style="width:40px;">
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
							<td>
								<a href="javascript:void(0)" class="btn btn_sml btn_del" id="btn_add_del_${status.count}" onclick="fncDel(this,'${status.count }','${add.emplySeq}','${add.emplyName}')">삭제</a>
							</td>
						</tr>
						</c:forEach>				
					</c:if>
				</tbody>
			</table>
		</div>
		<div class="btn_area">
			<c:choose>
				<c:when test="${searchVO.procType eq 'update' }">
					<a href="javascript:void(0);" class="btn btn_mdl btn_rewrite" id="btn_submit" onclick="fncUpdate();">수정</a>
				</c:when>
				<c:otherwise>
					<a href="javascript:void(0);" class="btn btn_mdl btn_save" id="btn_submit" onclick="fncSubmit();">등록</a>
				</c:otherwise>
			</c:choose>
				<a href="javascript:void(0);" class="btn btn_mdl btn_del" id="btn_del">삭제</a>	 
				<a href="javascript:void(0);" class="btn btn_mdl btn_cancel" id="btn_list">취소</a>
		</div>
	</form>
</div>

<div id="display_view1" class="layer_popup pop_size710 js-popup">

</div>

<script type="text/javaScript">

<%-- popAddList 체크박스 전역배열 --%>
var chkArray = new Array();
var tempArray = new Array();

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

<%-- 유효성 검사 메세지 --%>
function fncWrn(id, wrnMsg){
	
	
	
}

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

<%-- 직원 리스트 삭제 --%>
function fncStaffDel(name, posi){
	$("#" + name + "-").remove();
	chkArray.splice(chkArray.indexOf(posi), 1);
}

function fncSubmit(){
	$("#emplySeq").val(chkArray);
	fncPageBoard('submit','insertProc.do');
	
}

function fncUpdate(){
	fncPageBoard('update','updateProc.do');
	
}


<%-- 모달창 직원추가 버튼  --%>
var addLength  = '${not empty addResultList ? fn:length(addResultList) : 1}';

function fncStaffAdd(){
	
		var resultArray = [];
		if(chkArray.length > tempArray.length){   // 추가
			resultArray = chkArray.filter(function(item, idx, self){
				 return !tempArray.includes(item);
			 });
		
		 /*    $("[id^='add_tbody']").html("");  */ 
			for(var i = 0; i < chkArray.length; i++){

			 	addLength++;
		     
				var userSeq = chkArray[i].split("_")[0];
				var userName = chkArray[i].split("_")[1];
				
				var html = "";
				    html += '<tr id="add_tr_'+addLength+'"><td class="chkUser" data-info="'+userSeq+'">'+userName+'</td>';
				    html += '<td><span class="pick_input" style="margin-right:11px;"><input type="text" name="staDate" id="staDate_'+addLength+'" class="text w80" maxlength="30"/></span>';
				    html += '<select name="staHour" id="staTime_'+addLength+'" style="width:40px;">';
				    html += '<option value=""></option><c:forEach var="i" begin="0" end="23" step="1">';
				    html += '<option value="<fmt:formatNumber value='${i}' minIntegerDigits='2' type='number'/>"><fmt:formatNumber value='${i}' minIntegerDigits='2' type='number'/></option></c:forEach></select>시 ';
					html += '<select name="staMin" id="staMin_'+addLength+'" style="width:40px; margin-left:9px;">';
					html += '<option value=""></option><c:forEach var="i" begin="0" end="50" step="10">';
					html += '<option value="<fmt:formatNumber value='${i}' minIntegerDigits='2' type='number'/>"><fmt:formatNumber value='${i}' minIntegerDigits='2' type='number'/></option></c:forEach></select>분</td>';
					html += '<td><span class="pick_input" style="margin-right:11px;"><input type="text" name="endDate" id="endDate_'+addLength+'" class="text w80" maxlength="30"/></span>';
					html += '<select name="endHour" id="endTime_'+addLength+'" style="width:40px;">';
					html += '<option value=""></option><c:forEach var="i" begin="0" end="23" step="1">';
					html += '<option value="<fmt:formatNumber value='${i}' minIntegerDigits='2' type='number'/>"><fmt:formatNumber value='${i}' minIntegerDigits='2' type='number'/></option></c:forEach></select>시';
					html += '<select name="endMin" id="endMin_'+addLength+'" style="width:40px; margin-left:9px;">';
					html += '<option value=""></option><c:forEach var="i" begin="0" end="50" step="10">';
					html += '<option value="<fmt:formatNumber value='${i}' minIntegerDigits='2' type='number'/>"><fmt:formatNumber value='${i}' minIntegerDigits='2' type='number'/></option></c:forEach></select>분</td>';
					html += '<td><input type="text" name="cont" id="cont_'+addLength+'" class="text w100p" maxlength="100"></td>';
					html += '<td><a href="javascript:void(0)" class="btn btn_sml btn_del" id="btn_add_del_'+addLength+'" onclick="fncDel(this, \''+addLength+'\', \''+userSeq+'\', \''+userName+'\')">삭제</a></td></tr></tbody>';
					
					$("#add_tbody").append(html);
					fncDate('staDate_'+addLength, 'endDate_'+addLength);
				
				
			}
		
		
	}else{  // 삭제
		resultArray = tempArray.filter(function(item,idx,self){
			return !chkArray.includes(item);
		});
		
		alert("chkArray>>>>>>" + chkArray);
		alert("addLength>>>>>>" + addLength);
	
		$("#add_tr_"+addLength).remove();
			
	}
	
 		 
	tempArray = chkArray;
	$("#popTbl").html("");
	view_hide(1);
			
			 
}
		
<%-- 인원추가 삭제 버튼 --%>
function fncDel(obj, idx, seq, name){
	if(confirm("추가된 인원을 삭제하시겠습니까?")){
		$("#add_tr_"+idx).remove();
		var index = chkArray.indexOf(seq+"_"+name);
		if (index > -1) {
			chkArray.splice(index, 1);
			}
	
	}
	
}

</script>