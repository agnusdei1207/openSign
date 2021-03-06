<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>

<%-- content --%>
<div class="content_box">
	<%-- search  --%>
	<div class="search_box">
		<form id="defaultFrm" name="defaultFrm" method="post" onsubmit="return false;">
			<input type="hidden" id="otSeq" name="otSeq" value="<c:out value="${searchVO.otSeq }"/>"/>
			<input type="hidden" id="pageIndex" name="pageIndex" value="<c:out value="${searchVO.pageIndex }"/>"/>
			<fieldset>
				<legend>검색</legend>  
				<div class="search_basic">
					<strong class="tit">상태</strong>
					<select id="schEtc01" name="schEtc01" class="w100">
						<option value="">전체</option>
						<option value="A" <c:out value="${searchVO.schEtc01 eq 'A' ? 'selected=\"selected\"' : '' }"/>>신청</option>
						<option value="B" <c:out value="${searchVO.schEtc01 eq 'B' ? 'selected=\"selected\"' : '' }"/>>반려</option>
						<option value="C" <c:out value="${searchVO.schEtc01 eq 'C' ? 'selected=\"selected\"' : '' }"/>>재신청</option>
						<option value="D" <c:out value="${searchVO.schEtc01 eq 'D' ? 'selected=\"selected\"' : '' }"/>>승인</option>
					</select>
					<strong class="tit">첨부파일</strong>
					<select id="schEtc02" name="schEtc02" class="w100">
						<option value="">전체</option>
						<option value="Y">첨부</option>
						<option value="N">미첨부</option>
					</select>
					<strong class="tit">검색구분</strong>
					<select name="searchCondition" id="searchCondition" class="w100">  
						<option value="0">전체</option>  
						<option value="1">프로젝트명</option>
						<option value="2">등록자</option>
					</select>   
					<input name="searchKeyword" id="searchKeyword" class="text w40p" />
					<span class="search_btns">
						<button type="button" class="btn btn_search" id="btn_search">검색</button>
					</span>
					<strong class="tit">등록일</strong>
					<input type="hidden" name="dateCondition" id="dateCondition" value="0"/>
					<span class="calendar_input type03">
						<input type="text" id="searchStartDate" name="searchStartDate" class="text w100" value="<c:out value="${searchVO.searchStartDate }"/>" readonly="readonly"/> 
					</span>
					<span> ~ </span>
					<span class="calendar_input type03" >
						<input type="text" id="searchEndDate" name="searchEndDate" class="text w100" value="<c:out value="${searchVO.searchEndDate }"/>" readonly="readonly"/>
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
$(document).ready(function(){
	fncPageBoard('addList','addList.do',$("#pageIndex").val());
	fncDate('searchStartDate','searchEndDate');
});
$("#schEtc01").change(function(){
	fncPageBoard('addList','addList.do',1);
});
$("#schEtc02").change(function(){
	fncPageBoard('addList','addList.do',1);
});

</script>