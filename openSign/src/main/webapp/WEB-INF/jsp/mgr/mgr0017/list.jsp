<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<script type="text/javascript" src="/publish/mgr/js/board.js"></script>
<script type="text/javaScript">
$(document).ready(function(){
	fncPageBoard('addList','addList.do',$("#pageIndex").val());
	fncDate('searchStartDate','searchEndDate');
});
</script>
<%-- search --%>
<div class="content_box">
	<div class="search_box">
		<form:form commandName="searchVO" name="defaultFrm" id="defaultFrm" method="post">
			<form:hidden path="pageIndex" id="pageIndex" />
			<input type="hidden" id="seq" name="seq" />
			<fieldset>
				<legend>검색</legend>
				<div class="search_basic">
					<table class="type03">
						<colgroup>
							<col style="width:550px">
							<col>
						</colgroup>
						<tbody>
							<tr>
								<td>
									<strong class="tit">기간</strong>
									<span class="calendar_input w150" >
										<form:input path="searchStartDate" id="searchStartDate" cssClass="text w80p" readonly="true"/>
									</span>
									<span class="input_wave">~</span>
									<span class="calendar_input w150" >
										<form:input path="searchEndDate" id="searchEndDate" cssClass="text w80p" readonly="true"/>
									</span>
								</td>
							</tr>		
						</tbody>
					</table>
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
	
