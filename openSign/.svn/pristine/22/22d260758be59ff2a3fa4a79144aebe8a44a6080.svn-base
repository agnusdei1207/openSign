<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<c:set var="url" value="${requestScope['javax.servlet.forward.request_uri']}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <meta http-equiv="content-type" content="text/html;charset=utf-8" />
    <meta id="mobileMeta" name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
    <meta name="mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
	<title>오픈노트</title>
	<link rel="stylesheet" href="/publish/frt/css/sub.css"/>
	<script src="/publish/frt/js/jquery-1.11.3.min.js"></script>
	<script src="/publish/frt/js/common.js"></script>
 </head>
<body>
<!-- wrapper
<div class="error_wrap">
	<h1><img src="/publish/frt/images/common/error_logo.png" alt="ì£¼íìê³µëì¬ì©ì§ìì¼í°"></h1>
	<div class="error_box">
		<div class="error_img"></div>
		<p class="error_tit"><strong>404 Error</strong>주소가 잘못 입력되었거나, 변경 혹은 삭제되어<br> 요청하신 페이지를 찾을 수 없습니다.</p>
		<p class="error_txt">입력하신 주소가 정확한지 다시한번 확인해 주세요.<br>문의사항이 있을 경우 관리자에게 문의하시기 바랍니다.</p>
		<div class="error_btns">
			<a href="/frt/main.do" class="btn btn_main">메인페이지로 이동</a> <a href="history.go(-1); return false;" class="btn btn_back">이전페이지로 이동</a>
		</div>
	</div>
</div>
<!-- //wrapper -->
	<div class="error_area">
		<h1><img src="/publish/frt/images/common/logo.png" alt="전파방송통신교육원" /></h1>
		<div class="error_box">
			<div class="error_img">
				<img src="/publish/frt/images/sub/error_500.png" alt="">
			</div>
			<div class="error_info">
				<h2 class="error_tit">404 Error</h2>
				<p class="error_txt">
					주소가 잘못 입력되었거나, 변경 또는 삭제되어 <br> 요청하신 페이지를 찾을 수 없습니다.
					<span>입력하신 주소가 정확한지 다시한번 확인해 주세요.</span>
					<span>문의사항은 관리자에게 문의하시기 바랍니다.</span>
				</p>
			</div>
			<div class="error_btns">
				<c:choose>
					<c:when test="${fn:contains(url,'/mgr/')}">
						<a href="/mgr/main.do" class="btn btn_main">메인페이지로 이동</a>
					</c:when>
					<c:otherwise>
						<a href="/frt/main.do" class="btn btn_main">메인페이지로 이동</a>
					</c:otherwise>
				</c:choose>
				<a href="#" class="btn"  onclick="history.go(-1); return false;">이전페이지로 이동</a>
			</div>
		</div>
		<div class="error_footer">
			Copyright © 2020 by Korea Radio Promotion Association. <span> All Rights Reserved.</span> 
		</div>
	</div>
</body>
</html>
