<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<c:set var="urlCon" value="${requestScope['javax.servlet.forward.request_uri']}"/>
<c:forEach var="menuCon" items="${menuList1 }">
	<c:if test="${util:getMenuCd(urlCon).depth1 eq menuCon.menuCd }">
		<c:set var="depth1Con" value="${menuCon.menuNm }"/>
		<c:set var="depth1CdCon" value="${menuCon.menuCd }"/>
		<c:set var="groupSeqCon" value="${menuCon.seq }"/>
		<c:set var="noCon" value="${menuCon.no }"/>
	</c:if>
</c:forEach>
<c:forEach var="menuCon2" items="${menuList2 }">
	<c:if test="${util:getMenuCd(urlCon).depth2 eq menuCon2.menuCd }">
		<c:set var="depth2Con" value="${menuCon2.menuNm }"/>
		<c:set var="depth2CdCon" value="${menuCon2.menuCd }"/>
		<c:set var="groupSeq2Con" value="${menuCon2.seq }"/>
	</c:if>
</c:forEach>
<c:forEach var="menuCon3" items="${menuList3 }">
	<c:if test="${util:getMenuCd(urlCon).depth3 eq menuCon3.menuCd }">
		<c:set var="depth3Con" value="${menuCon3.menuNm }"/>
		<c:set var="depth3CdCon" value="${menuCon3.menuCd }"/>
	</c:if>
</c:forEach>