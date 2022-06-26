<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<div class="tbl_top">
	<div class="tbl_left"><i class="i_all"></i><span>전체 : <strong>${paginationInfo.totalRecordCount}</strong> 건(${searchVO.pageIndex}/${paginationInfo.totalPageCount} Page) </span></div>
	<div class="tbl_right">
		<select id="pageCnt" class="w100"> 
			<option value="10" ${searchVO.schEtc15 eq '10' ? 'selected="selected"':''}>10개</option>
			<option value="30" ${searchVO.schEtc15 eq '30' ? 'selected="selected"':''}>30개</option>
			<option value="50" ${searchVO.schEtc15 eq '50' ? 'selected="selected"':''}>50개</option>
			<option value="100" ${searchVO.schEtc15 eq '100' ? 'selected="selected"':''}>100개</option>
		</select>
	</div>
</div>
<div class="tbl_wrap">
	<table class="tbl_col_type01">
		<caption>목록</caption>
		<colgroup> 
			<col style="width:5%">
			<col style="width:8%">
			<col style="width:8%">
			<col style="width:10%">
			<col style="width:12%">
			<col>
			<col style="width:12%">
			<col style="width:8%">
			<col style="width:8%">
		</colgroup>
		<thead>
			<tr>
				<th scope="col"><input type="checkbox" id="chk_all" class="cursor" onclick="chkAll_event(this, 'arrSeq')"/></th>
				<th scope="col">번호</th>
				<th scope="col">구분</th>
				<th scope="col">아이디</th>
				<th scope="col">이름</th>
				<th scope="col">클라이언트IP</th>
				<th scope="col">등록시간</th>
				<th scope="col">로그인 실패횟수</th>
				<th scope="col">처리</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${fn:length(resultList) > 0}">
					<c:forEach var="result" items="${resultList}" varStatus="status">
						<tr class="cursor">
							<!-- 제목:왼쪽정렬, 코드:가운데정렬, 숫자:오른쪽 정렬, 정해진형태:가운데정렬 -->
							<td class="c"><input type="checkbox" class="chk_box cursor" value="${result.seq}" onclick="chk_arr(this, 'arrSeq');"/></td>
							<td class="c"><span class="num">${paginationInfo.totalRecordCount - ((searchVO.pageIndex-1) * searchVO.pageUnit + status.index)}</span></td>
							<td class="c">관리자</td>
							<td class="c">${empty result.id ? '-' : result.id }</td>
							<td class="c">${empty result.name ? '-' : result.name }</td>
							<td class="c">${empty result.clientIp ? '-' : result.clientIp }</td>
							<td class="c">${empty result.rgstDt ? '-' : result.rgstDt }</td>
							<td class="c"><span class="num">${empty result.failCnt ? '-' : result.failCnt }${empty result.failCnt ? '' : '회' }</span></td>
							<td class="c"><a href="#" class="btn btn_sml btn_del" onclick="fncResetFailCnt('${result.seq }')">계정잠금해제</a></td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr><td colspan="9" class="no_data">데이터가 없습니다.</td></tr>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
</div>
<%-- //tbl end --%>
<%-- paging start --%>
<div class="paging_wrap">
	<div class="paging">
		<ui:pagination paginationInfo="${paginationInfo}" type="manage" jsFunction="fncPageBoard" />
	</div>
	<div class="btn_left">
		<a href="#" class="btn btn_mdl btn_save" onclick="fncResetArrFailCnt('arrSeq');">일괄잠금해제</a>
	</div>
	<div class="btn_right">
	</div>
</div>
<%-- //paging end--%>
<script type="text/javascript">
$(document).ready(function(){
	$(".num").each(function(){
		numFormat($(this),'num');		
	});
	chk_ready('arrSeq');
});

$("#pageCnt").change(function(){
	$("#schEtc15").val($("#pageCnt").val());
	fncPageBoard('addList','addList.do',1);
});

function fncResetFailCnt(seq){
	if(!confirm("계정잠금해제 하시겠습니까?")){
		return false;
	}
	fncLoadingStart();
	$.ajax({
		method : "POST",
		url : "resetFailCnt.do",
		data : {"seq":seq},
		dataType : "JSON",
		success : function(data){
			alert("잠금해제 되었습니다");
			fncPageBoard('addList','addList.do',1);
		},error : function(req, text){
		},complete : function(){
			fncLoadingEnd();
		}
	});
}

<%-- 전체체크 id는 chk_all, 체크박스 class는 chk_box, arr은 checkbox 값을 담을 input hidden의 id --%>
<%-- 체크박스 값 arr 담기 --%>
function chk_arr(obj, arr){
	var arrVal = $("#"+arr).val();
	
	if($(obj).prop("checked")){
		
		if(arrVal.indexOf('/['+$(obj).val()+']') > -1){
			arrVal = arrVal.replace('/['+$(obj).val()+']', '');
		}
		arrVal += '/['+$(obj).val()+']';
		$("#"+arr).val(arrVal);
		
 	}else{
 		$("#"+arr).val(arrVal.replace('/['+$(obj).val()+']', ''));
	}

	chkAll_confirm(arr);
}

<%-- 전체 체크 검증 --%>
function chkAll_confirm(arr){
	var arrVal = $("#"+arr).val();
	var allChk = true;
	
	$(".chk_box").each(function(){
		if(arrVal.indexOf('/['+$(this).val()+']') == -1){
			allChk = false;			
		}
	});
	
	if(allChk){
		$("#chk_all").prop("checked",true);	
	}else{
		$("#chk_all").prop("checked",false);
	}
}

<%-- 전체 체크 이벤트 --%>
function chkAll_event(obj, arr){
	
	if($(obj).prop("checked")){
		$(".chk_box").each(function(){
			$(this).prop("checked",true);
			chk_arr($(this), arr);
		});
	}else{
		$(".chk_box").each(function(){
			$(this).prop("checked",false);
			chk_arr($(this), arr);
		});
	}
}

<%-- addlist 체크박스 자동 체크 --%>
function chk_ready(arr){
	var arrVal = $("#"+arr).val();
	var allChk = true;
	
	if(arrVal == "" || arrVal == null){
		allChk = false;
	}else if($(".chk_box").length == 0){
		allChk = false;
	}else{
		$(".chk_box").each(function(){
			if(arrVal.indexOf('/['+$(this).val()+']') > -1){
				$(this).prop("checked",true);		
			}else{
				allChk = false;
			}
		});
	}
	
	if(allChk){
		$("#chk_all").prop("checked",true);	
	}else{
		$("#chk_all").prop("checked",false);	
	}
}

<%-- 삭제처리 일괄 ajax --%>
function fncResetArrFailCnt(arr){
	var arrVal = $("#"+arr).val();
	if(arrVal == "" || arrVal == null){
		alert("하나이상 체크해주세요");
		return false;
 	}
	
	if(!confirm("일괄 잠금해제 하시겠습니까?")){
		return false;
	}
	
	if(arrVal.indexOf("/") == 0){
		arrVal = arrVal.substring("1");
	}
	arrVal = arrVal.replace(/[\[\]]/g,"");
	arrVal = arrVal.replace(/[\/]/g,",");
	
	fncLoadingStart();
	$.ajax({
		method : "POST",
		url : "resetArrFailCnt.do",
		data : {'arrTemp':arrVal},
		dataType : "JSON",
		success : function(data){
			alert(data.msg);
			if(data.result == "success"){
				$("#"+arr).val("");
				fncPageBoard('addList','addList.do',1);
			}
		},error : function(req, text){
			alert("처리가 실패하였습니다");
		},complete : function(){
			fncLoadingEnd();
		}
	});
}
</script>