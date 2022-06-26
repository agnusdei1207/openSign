<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<div class="selector">
    <span class="prev"><a href="javascript:void(0);" onclick="goMnth('${clndVO.clPrevYearMnth}');">prev</a></span>
    <span class="year-month">${fn:substring(clndVO.clSlctYearMnth, 0, 4) }.${fn:substring(clndVO.clSlctYearMnth, 4, 6) }</span>
    <span class="next"><a href="javascript:void(0);" onclick="goMnth('${clndVO.clNextYearMnth}');">>next</a></span>
</div>
<div class="tableWrap_s">
	<table summary="해당 일자를 선택하여 일정을 확인하실 수 있습니다." class="tbl_sch_type01">
	    <caption>
	        일정선택
	    </caption>
	    <thead>
	        <tr>
	            <th>S</th>
	            <th>M</th>
	            <th>T</th>
	            <th>W</th>
	            <th>T</th>
	            <th>F</th>
	            <th>S</th>
	        </tr>
	    </thead>
	    <tbody>
	    	<!-- 강의가 있는날은 td에 class="select-day" -->
	        <tr>
	        	<%-- 일요일이 아닐 경우 빈칸 삽입 --%>
				<c:if test="${clndVO.clFirstDayOfWeek ne 7 }">
					<c:forEach var="headerBlank" begin="1" end="${clndVO.clFirstDayOfWeek}" step="1">
						<td></td>
					</c:forEach>
				</c:if>
				<c:forEach var="clndDay" begin="1" end="${clndVO.clLastDay}" step="1">
					<c:set var="cnt" value="${clndDay + clndVO.clFirstDayOfWeek}" />
					<c:set var="now" value="${clndVO.clSlctYearMnth}${util:lpad(clndDay, 2, '0')}" />
					<c:if test="${cnt % 7 eq 1}">
						<c:if test="${clndDay ne 1 }">
							<tr>
						</c:if>
					</c:if>
					<td>
		                <div>
		                    <a href="#" class="js-click_sch">${clndDay }</a>
		                </div>
		            </td>
		            <c:if test="${cnt % 7 eq 0 }">
						</tr>
					</c:if>	
				</c:forEach>
				<c:if test="${cnt % 7 ne 0 }">
					</tr>
				</c:if>
	    </tbody>
	</table>
</div>
<!-- // table_wrap -->
<script type="text/javascript">
$(".js-click_sch").on("mouseenter focusin",function(e){
	$(this).parents("td").addClass('on');
	$(this).siblings(".sch_tool").show();
});
$(".js-click_sch").on("mouseleave focusout",function(e){
	$(this).siblings(".sch_tool").hide();
	$(this).parents("td").removeClass('on');
});
///////////////////////////////////////////////////
$(document).ready(function(){
});
function goMnth(slctMnth){
	$("#clSlctYearMnth").val(slctMnth);
	fncClndAjax();
}
</script>