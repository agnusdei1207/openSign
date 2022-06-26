<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<c:choose>
	<c:when test="${fn:length(menuList) > 0 }">
		<option value="">선택</option>
		<c:forEach var="result" items="${menuList }" varStatus="status">
			<c:choose>
				<c:when test="${result.lvl gt 2}">
					<option value="${result.menuCd }" ${result.menuCd eq boardCd ? 'selected' : '' }>${result.pMenuNm } - ${result.menuNm }</option>
				</c:when>
				<c:otherwise>
					<option value="${result.menuCd }" ${result.menuCd eq boardCd ? 'selected' : '' }>${result.menuNm }</option>
				</c:otherwise>
			</c:choose>
		</c:forEach>	
	</c:when>
	<c:otherwise>
		<option value="" disabled="disabled">선택</option>
	</c:otherwise>
</c:choose>
