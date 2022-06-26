<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<script type="text/javascript" src="/publish/mgr/js/board.js"></script>
<%-- search --%>
<div class="content_box">
	<ul class="tab js-tab tab_menu">
	    <li class="current"><a href="javascript:void(0)" id="tab_A" onclick="fncSearchTab('A')">전체</a></li>
	    <li><a href="javascript:void(0)" id="tab_T" onclick="fncSearchTab('T')">업무시간 외 접속</a></li>
	    <li><a href="javascript:void(0)" id="tab_O" onclick="fncSearchTab('O')">과다 접속자관리</a></li>
	    <li><a href="javascript:void(0)" id="tab_F" onclick="fncSearchTab('F')">로그인 이상관리</a></li>
	</ul>
	<div class="search_box">
		<form:form commandName="searchVO" name="defaultFrm" id="defaultFrm" method="post" onsubmit="return false;">
			<form:hidden path="pageIndex" id="pageIndex" />
			<input type="hidden" id="searchDivn" name="searchDivn" value="${empty searchVO.searchDivn ? 'A' : searchVO.searchDivn }"/>
			<input type="hidden" id="schEtc15" name="schEtc15" value="${empty searchVO.schEtc15 ? 10 : searchVO.schEtc15 }"/>
			<input type="hidden" id="arrSeq" name="arrSeq"/>
			<fieldset>
				<legend>검색</legend>
				<div class="search_basic">
					<strong class="tit">검색구분</strong>
					<select id="schEtc01" name="schEtc01" class="w100 menuLog">
						<option value="">회원구분</option>
						<option value="mgr" ${searchVO.schEtc01 eq 'mgr' ? 'selected' : '' }>관리자</option>
						<option value="frt" ${searchVO.schEtc01 eq 'frt' ? 'selected' : '' }>사용자</option>
					</select>
					<form:select path="searchCondition" id="searchCondition" title="구분 선택" cssClass="w100"  >  
						<form:option value="0" label="전체"/>
						<form:option value="1" label="아이디"/>
						<form:option value="2" label="이름"/>
						<form:option value="3" label="메뉴명" class="menuLog"/>
						<form:option value="4" label="URL" class="menuLog"/>
						<form:option value="5" label="클라이언트IP"/>
					</form:select>
					<form:input path="searchKeyword" id="searchKeyword" class="text w20p" />
					<span class="search_btns">
						<button type="button" class="btn btn_search" id="btn_search">검색</button>
					</span>
					<strong class="tit">등록일</strong>
					<input type="hidden" name="dateCondition" id="dateCondition" value="0"/>
					<span class="calendar_input type03"><form:input path="searchStartDate" id="searchStartDate" title="시작일" cssClass="text" readonly="true" cssStyle="width:100px;" /></span> ~ 
					<span class="calendar_input type03" ><form:input path="searchEndDate" id="searchEndDate" title="종료일" cssClass="text" readonly="true" cssStyle="width:100px;"/></span>
				</div>
			</fieldset>
		</form:form>
	</div>
	<%-- //search --%>
	<div class="tbl">
	</div>
</div>
<script type="text/javaScript">
$(document).ready(function(){
	fncPageBoard('addList','addList.do',$("#pageIndex").val());
	fncDate('searchStartDate','searchEndDate');
});
$("#schEtc01").change(function(){
	fncPageBoard('addList','addList.do',1);
});
function fncSearchTab(divn){
	$("#searchDivn").val(divn);
	$("[id^=tab_]").removeClass("current");
	$("#tab_"+divn).addClass("current");
	$("#schEtc01").val("");
	$("#schEtc15").val(10);
	$("#searchCondition").val("0");
	$("#searchKeyword").val("");
	
	if(divn == "A"){
		$(".menuLog").show();
	}
	if(divn == "T" || divn == "O" || divn == "F"){
		$(".menuLog").hide();
	}
	
	fncPageBoard('addList','addList.do',1);
}
</script>