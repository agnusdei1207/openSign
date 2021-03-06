<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>

<%-- content --%>
<div class="content_box">   
	<%-- search  --%> 
	<div class="search_box">  
		<form name="defaultFrm" id="defaultFrm" method="post" onsubmit="return false;">
			<input type="hidden" id="elSeq" name="elSeq"/>
			<input type="hidden" id="schEtc03" name="schEtc03"/>
			<input type="hidden" id="pageIndex" name="pageIndex"/>
			<%-- 확인 & 결재자 --%>          
			<c:if test="${loginVO.authCode eq '3' || loginVO.authCode eq '1' }">       
				<input type="hidden" name="approver" id="approver" value="${loginVO.seq}"/>  
			</c:if>
			<fieldset>   
				<legend>검색</legend>           
				<div class="search_basic"> 
					<strong class="tit">상태</strong>
					<select name="schEtc01" id="schEtc01" class="w100">  
						<option value="">전체</option>
						<option value="Y">확인</option>
						<option value="N">미확인</option>  
					</select>               
					<strong class="tit">영수증 첨부</strong>  
					<select name="schEtc02" id="schEtc02" class="w100">  
						<option value="">전체</option>
						<option value="Y">첨부</option>   
						<option value="N">미첨부</option>   
					</select>       
					<strong class="tit">검색구분</strong>   
					<select name="searchCondition" id="searchCondition" class="w100">    
						<option value="0">전체</option>   
						<option value="1">용도</option>    
						<option value="2">상호명</option>             
					</select>                                                     
					<input name="searchKeyword" id="searchKeyword" class="text w40p" style="width:39% !important" />
					<span class="search_btns">
						<button type="button" class="btn btn_search" id="btn_search">검색</button>
					</span>
					<strong class="tit">등록일</strong>
					<input type="hidden" name="dateCondition" id="dateCondition" value="0"/>
					<span class="calendar_input type03">  
						<input type="text" name="searchStartDate" id="searchStartDate" class="text w100" value="<c:out value="${searchVO.searchStartDate }"/>" readonly="readonly"/> 
					</span>
					<span> ~ </span> 
					<span class="calendar_input type03" >
						<input type="text" name="searchEndDate" id="searchEndDate" class="text w100" value="<c:out value="${searchVO.searchEndDate }"/>" readonly="readonly"/>
					</span>
				</div>  
			</fieldset>
		</form>
	</div>
	<%--// search  --%>
	<div class="tbl">
	</div>  
</div>
     
<script type="text/javaScript">
  
<%-- 체크 상태 저장 --%>
var checkedArray = new Array();  
  
$(function(){  
	<%-- 날짜 값 셋팅 --%>
	fncDate('searchStartDate','searchEndDate');
	fncPageBoard('addList','addList.do','${searchVO.pageIndex}');
	return true;
}); 
 
<%-- 구분 값 변동 시 조회 --%>
$("[id^='schEtc']").on("change", function(){
	fncPageBoard('addList','addList.do','1');
	return true;
});
  

</script>