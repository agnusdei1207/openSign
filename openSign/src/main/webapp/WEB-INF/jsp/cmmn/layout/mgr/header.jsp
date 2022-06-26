<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<c:set var="url" value="${requestScope['javax.servlet.forward.request_uri']}"/>
<header id="header">
	<div class="header_box">
		<div class="header_inner">
			<h1 class="logo">
				<a href="/mgr/main.do"><img src="/publish/mgr/images/logo.png" alt="전파방송통신교육원"/></a>
			</h1>   
			<div class="util_box">                           
				<span class="user_info">            
						<strong>${loginVO.name}</strong>[ <strong>${loginVO.id }</strong> ] 님 
					<a href="/logout.do" class="btn_logout"><strong>로그아웃</strong></a>
				</span>
				<a href="/mgr/main.do" class="go_homepage">메인</a>
			</div>
		</div>
		
		<!-- GNB -->
		<div id="gnb_area">
			<nav id="gnb">
				<ul class="type08 clear">
					<c:forEach var="result" items="${mgrMenu }" varStatus="status" >
						<c:set var="menuDept" value="${result.menuCd }-${result.menuDept1Cd }" />
						<li ${fn:indexOf(menuDept,util:getMenuCd(url).menuCd ) > -1  ? 'class="on"' : '' }>
							<a href="${not empty result.menuUrl ? result.menuUrl : not empty result.menuList[0].menuUrl ? result.menuList[0].menuUrl : result.menuList[0].menuList[0].menuUrl }" ><span>${result.menuNm }</span></a>
						</li>
					</c:forEach>
				</ul>
			</nav>
		</div>
		<!-- //GNB -->
		
	</div>
</header>