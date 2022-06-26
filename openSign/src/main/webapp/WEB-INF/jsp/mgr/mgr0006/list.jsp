<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>

<div class="content_box"> 
	<%-- search  --%>  
	<div class="search_box">
		<form:form commandName="searchVO" name="defaultFrm" id="defaultFrm" method="post">
			<form:hidden path="pageIndex" id="pageIndex" />
			<input type="hidden" id="seq" name="seq" />
			<fieldset> 
				<legend>검색</legend>
				<div class="search_basic">
					<strong class="tit">권한</strong>							
					<form:select path="schEtc03" id="schEtc03" title="권한 선택" cssClass="selec" cssStyle="width:132px;">
						<form:option value="" label="전체"/>
						<c:forEach var="result" items="${authList }">
							<form:option value="${result.authCode }" label="${result.authCodeNm }"/>
						</c:forEach>
					</form:select>	 
					<strong class="tit">상태</strong>			
					<form:select path="schEtc04" id="schEtc04" title="상태 선택" cssClass="selec" cssStyle="width:132px;">
						<form:option value="" label="전체"/>
						<form:option value="Y" label="사용"/>
						<form:option value="N" label="미사용"/>
					</form:select>	
					<strong class="tit">구분</strong>						
					<form:select path="searchCondition" id="searchCondition" title="구분 선택" cssClass="selec" cssStyle="width:132px;">  
						<form:option value="0" label="전체"/>
						<form:option value="1" label="ID"/>
						<form:option value="2" label="성명"/>
					</form:select>
				
					<form:input path="searchKeyword" id="searchKeyword" class="text w60p" /> 
					<span class="search_btns">
						<button type="button" class="btn btn_search" id="btn_search">검색</button>
					</span>
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
});

$("[id^='schEtc']").on("change", function(){
	fncPageBoard('addList','addList.do', '1');
}); 


</script>