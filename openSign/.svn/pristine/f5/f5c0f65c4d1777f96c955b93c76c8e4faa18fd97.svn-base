<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<!-- <meta http-equiv="Cache-Control" content="no-cache"/> 
<meta http-equiv="Expires" content="0"/>
<meta http-equiv="Pragma" content="no-cache"/>
<meta http-equiv="Pragma" content="no-store"/>-->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<title>오픈노트</title>
<link rel="stylesheet" type="text/css" href="/publish/frt/css/reset.css">
<link rel="stylesheet" type="text/css" href="/publish/frt/css/print.css"> 
<script type="text/javascript" src="/publish/frt/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
var myAOS;
$(document).ready(function(){
	pagePrintPreview();
});
function pagePrintPreview(){
	 
    var browser = navigator.userAgent.toLowerCase();
    if ( -1 != browser.indexOf('chrome') ){
    	var openContHtml = opener.$("#content").html();
    	var newText = openContHtml.replace(/<script\b[^<]*(?:(?!<\/script>)<[^<]*)*<\/script>/gi,"");
    	console.log(newText);
    	$("#content").html(newText);
        window.print();
    }else if ( -1 != browser.indexOf('trident') ){
    	var openContHtml = opener.$("#content").html();
     	var newText = openContHtml.replace(/<script\b[^<]*(?:(?!<\/script>)<[^<]*)*<\/script>/gi,"");
     	console.log(newText);
     	$("#content").html(newText);
    	
	    try{
             //참고로 IE 5.5 이상에서만 동작함
             //웹 브라우저 컨트롤 생성
             var webBrowser = '<OBJECT ID="previewWeb" WIDTH=0 HEIGHT=0 CLASSID="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2"></OBJECT>';
             //웹 페이지에 객체 삽입
             document.body.insertAdjacentHTML('beforeEnd', webBrowser);
             document.body.insertAdjacentHTML('afterbegin', newText);
             //ExexWB 메쏘드 실행 (7 : 미리보기 , 8 : 페이지 설정 , 6 : 인쇄하기(대화상자))
             previewWeb.ExecWB(7, 1);
             //객체 해제
             previewWeb.outerHTML = "";
	    }catch (e) {
             alert("- 도구 > 인터넷 옵션 > 보안 탭 > 신뢰할 수 있는 사이트 선택\n   1. 사이트 버튼 클릭 > 사이트 추가\n   2. 사용자 지정 수준 클릭 > 스크립팅하기 안전하지 않은 것으로 표시된 ActiveX 컨트롤 (사용)으로 체크\n\n※ 위 설정은 프린트 기능을 사용하기 위함임");
	    }
	    
    }
}

</script>
</head>

<body>
	<div id="content" class="page">
	</div>
</body>
</html>
