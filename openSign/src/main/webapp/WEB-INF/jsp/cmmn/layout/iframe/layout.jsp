<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<!doctype html>
<html lang="ko">
<head>
    <meta http-equiv="content-type" content="text/html;charset=utf-8" />
    <meta id="mobileMeta" name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
    <meta name="mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <meta name="theme-color" content="#0a699a">
	<title>오픈노트</title>
	<link rel="shortcut icon" href="/publish/frt/images/common/favicon.ico" type="image/x-icon" />
	<link rel="stylesheet" href="/publish/frt/css/style.css"/>
	<link rel="stylesheet" href="/publish/frt/css/rapa.css"/>
	<link rel="stylesheet" type="text/css" href="/publish/mgr/css/jquery-ui-1.12.1.custom.css"/>
    <link rel="stylesheet" href="/publish/frt/css/aos.css"/>
	<script src="/publish/frt/js/jquery-1.11.3.min.js"></script>
	<script src="/publish/frt/js/common.js"></script>
	<script src="/publish/frt/js/jquery.cookie.js"></script>
	<script type="text/javascript" src="/publish/mgr/js/jquery-ui-1.12.1.custom.js"></script>
	<script type="text/javascript" src="/resource/js/cm.validate.js" charset="utf-8"></script>
	<script type="text/javascript" src="/publish/mgr/js/highcharts.js"></script>
	<script type="text/javascript" src="/publish/mgr/js/exporting.js"></script>
	<!-- 페이지 스크롤시 페이드인 효과 하위 위치 필수  -->
    <script type="text/javascript" src="/publish/frt/js/aos.js"></script>
	<script type="text/javascript">
	var myAOS;
		$(document).ready(function() {    	 
	        
	        myAOS = function() {
        		AOS.init({
        		   once: false,
        		   easing: 'ease-in'
        		});
        	}
        	myAOS();
	    });
	</script>
 </head>
 <body style="min-width: 1200px;">
    <div id="skipnavi">
 		<a href="#content">▶본문 바로가기</a>
 		<a href="#gnb_area">▶주메뉴 바로가기</a>
 	</div>
        
           <!-- container -->
      <div id="container">
		<tiles:insertAttribute name="body"/>
	  </div>
 </body>
</html>
			
		 