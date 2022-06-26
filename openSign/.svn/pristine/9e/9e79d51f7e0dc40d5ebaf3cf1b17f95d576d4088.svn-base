<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<c:set var="url" value="${requestScope['javax.servlet.forward.request_uri']}"/>

<c:forEach var="menu" items="${mgrMenu }">
	<c:set var="menuDept" value="${menu.menuCd }-${menu.menuDept1Cd }" />
	<c:if test="${fn:indexOf(menuDept,util:getMenuCd(url).menuCd) > -1 }">
		<c:set var="depth1" value="${menu.menuNm }"/>
		<c:set var="depth1Cd" value="${menu.menuCd }"/>
		<c:set var="menuList" value="${menu.menuList }"/>
		</c:if>
</c:forEach>
  
<script type="text/javaScript">
</script>  
<div id="left_content">  
	<div class="lnb_wrap">            
		<h2><strong>${depth1 }</strong></h2>     
		<div id="lnb"> 
			<ul> 
  				<c:forEach var="menuSub" items="${menuList }">
					<c:if test="${(not empty menuSub.menuDept2Cd &&fn:indexOf(menuSub.menuDept2Cd,util:getMenuCd(url).menuCd) > -1) || menuSub.menuCd eq util:getMenuCd(url).menuCd }">
						<c:set var="depth2" value="${menuSub.menuNm }"/>
						<c:set var="depth2Cd" value="${menuSub.menuCd }"/>
						<c:set var="depth2Url" value="${menuSub.menuUrl }"/>
					</c:if>    
							<li class="${not empty menuSub.menuList ? 'has_sub' : '' } ${fn:indexOf(menuSub.menuDept2Cd,util:getMenuCd(url).menuCd) > -1 ? 'open' : ''}">
								<a href="${not empty menuSub.menuList ? '#' : menuSub.menuCd eq 'mgr0014' ? 'https://analytics.google.com/analytics/web/#/p259336543/reports/defaulthome' : menuSub.menuUrl }" ${menuSub.menuCd eq 'mgr0014' ? 'target="_blank"' : '' }>${menuSub.menuNm }</a>
									<c:if test="${not empty menuSub.menuList }">
										<ul ${fn:indexOf(menuSub.menuDept2Cd,util:getMenuCd(url).menuCd) > -1   ? 'style="display:block;"' : ''}>
											 <c:forEach var="menuSub2" items="${menuSub.menuList }">
													 <li><a href="${menuSub2.menuUrl }" ${util:getMenuCd(url).menuCd eq menuSub2.menuCd ? 'class="on"' : '' }>${menuSub2.menuNm } </a> </li>
													 <c:if test="${util:getMenuCd(url).menuCd eq menuSub2.menuCd }">
														<c:set var="depth3" value="${menuSub2.menuNm }"/>
													 </c:if>
											 </c:forEach>
										</ul>   
								</c:if>     
							</li> 
				</c:forEach>
			</ul>
		</div>    
	</div>	            
</div>                  
 <div id="right_content">                     
	<div class="top_title clear">           
			<h3 class="tit_page">${not empty depth3 ? depth3 : not empty depth2 ? depth2 : depth1 }</h3>
		<div class="location">         
			<i class="home"><span>홈으로 ${depth3}</span></i> <span>&gt; ${depth1 }</span> 
			<c:if test="${not empty depth2 }"><span> &gt; ${depth2 }</span></c:if>
			<c:if test="${not empty depth3 }"><span> &gt; ${depth3 }</span></c:if>
		</div>
	</div>
	