<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<option value="">${gubun eq '1' ? '선택' : '전체' }</option>
<c:forEach var="result" items="${cdList }">
	<option value="${result.cCd }" ${result.cCd eq selVal ? 'selected="selected"' : '' }>${result.cCdNm }</option>
</c:forEach>