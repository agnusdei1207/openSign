<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<div class="tbl_top">
	<div class="tbl_left">
		<i class="i_all"></i>
		<span>
			전체 : <strong><c:out value="${paginationInfo.totalRecordCount}"/></strong> 건(<c:out value="${searchVO.popPageIndex}/${paginationInfo.totalPageCount}"/> Page)
		</span>
	</div>
</div>  
<div class="tbl_wrap">
	<table class="tbl_col_type01">
		<caption>목록</caption>
		<colgroup>
			<col style="width:2%;">
			<col style="width:4%;">
			<col style="width:10%;">
			<col style="width:10%;">
		</colgroup> 
		<thead>
			<tr>
				<th scope="col"><input type="checkbox" id="all_chk" class="cursor" onclick="fncAllChk(this);"></th>
				<th scope="col">번호</th>
				<th scope="col">이름</th>
				<th scope="col">직급</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${fn:length(resultList) gt 0}"> 
					<c:forEach var="result" items="${resultList}" varStatus="status">
						<tr class="cursor">
							<td><input type="checkbox" class="chk cursor" id="one_chk_${result.seq }" value="${result.seq }_${result.name}" data-name="${result.name }" data-position="${result.position }" onclick="fncOneChk(this);"></td>
							<td><fmt:formatNumber value="${paginationInfo.totalRecordCount - ((searchVO.popPageIndex-1) * searchVO.pageUnit + status.index) }" pattern="#,###"/></td>
							<td>${result.name }</td> 
							<td>${result.position }</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr><td colspan="4" class="no_data">데이터가 없습니다.</td></tr>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
</div>
<%-- //tbl end --%>
<%-- paging start --%> 
<div class="paging_wrap">
	<div class="paging">
		<ui:pagination paginationInfo="${paginationInfo}" type="pop" jsFunction="fncPageEtc" />
	</div>
</div>
<div class="pop_footer" style="margin-left:530px;">
	<a href="javascript:void(0);" class="btn btn_mdl btn_save" onclick="fncStaffAdd();">선택</a>  <!-- 선택 함수는 form js에 존재  -->		
	<a href="javascript:void(0);" class="btn btn_mdl btn_cancel" onclick="view_hide(1);">취소</a>		
</div>

<%-- //paging end--%>

<script type="text/javascript">

$(document).ready(function(){
	fncChkReady();
	$(this).attr("data-name");

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

<%-- 전체 체크 --%>
function fncAllChk(obj){
	var objChk = $(obj).prop('checked');
	if(objChk){
		$('.chk:not(:checked)').each(function(){
			$(this).prop('checked', true);
			fncOneChk(this);
		});		
	}else{
		$('.chk:checked').each(function(){
			$(this).prop('checked', false);
			fncOneChk(this);
		});
	}
}

<%-- 개별 체크 --%>
function fncOneChk(obj){
	// 배열 중복 값 제거 
	 var removeArr = chkArray.filter(function(item, idx, self){
		 return item != $(obj).val();
	 });
	  
	 if($(obj).prop('checked')){      
		 removeArr.push($(obj).val());
	 }
	 
	 chkArray = removeArr;
	 
	 $("#pageMove").val(chkArray);
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






</script>