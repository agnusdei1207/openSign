<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<c:set var="url" value="${requestScope['javax.servlet.forward.request_uri']}"/>
  
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="0"/>
<meta http-equiv="Pragma" content="no-cache"/>
<meta http-equiv="Pragma" content="no-store"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<title>전파방송통신교육원</title> 
<link rel="stylesheet" type="text/css" href="/publish/mgr/css/style.css">
<link rel="stylesheet" type="text/css" href="/publish/mgr/css/jquery-ui-1.12.1.custom.css"/>
<script type="text/javascript" src="/publish/mgr/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="/publish/mgr/js/jquery-ui-1.12.1.custom.js"></script>
<script type="text/javascript" src="/publish/mgr/js/common.js"></script>
<script type="text/javascript" src="/resource/js/cm.validate.js" charset="utf-8"></script>
<script type="text/javascript" src="/publish/mgr/js/highcharts.js"></script>
<script type="text/javascript" src="/publish/mgr/js/exporting.js"></script>
<script type="text/javascript" src="/publish/mgr/js/board.js"></script>
<script type="text/javascript" src="/publish/mgr/js/boardEtc.js"></script>
</head>  
  
<body> 
	<div id="skipnavi">
	   <a href="#container">▶본문 바로가기</a> 
	   <a href="#gnb_area">▶주메뉴 바로가기</a>   
	</div>
	<div id="wrapper">
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
								<li>
									<a href="${not empty result.menuUrl ? result.menuUrl : not empty result.menuList[0].menuUrl ? result.menuList[0].menuUrl : result.menuList[0].menuList[0].menuUrl }" ><span>${result.menuNm }</span></a>
								</li>
							</c:forEach>
						</ul>
					</nav>
				</div>
				<!-- //GNB -->
			</div>
		</header>
		<div id="main_container">
			<!-- main -->	
			<section class="main">     
				<form id="defaultFrm" name="defaultFrm" method="post" onsubmit="return false;">
					<!-- main -->	       
					<input type="hidden" name="elSeq" id="elSeq"> 
					<input type="hidden" name="otSeq" id="otSeq">         
					<input type="hidden" name="schEtc05" id="schEtc05">   
						<!-- top_area -->     
					<div class="top_area" style="width: 99%; margin-left: 18px;">   
						<div class="state01 m_box" style="width: 634px;">   
							<h2 class="m_title" style="margin-bottom: 17px;">행정 현황</h2> 
								<div class="search_basic" style="padding:0px 0px 0px;"> 
									<strong class="tit">연도</strong> 
									<select name="excelYear" id="excelYear">
										<c:forEach var="year" items="${yearList }">   
											<option value="${year.schEtc01 }" ${thisYear eq year.schEtc01 ? 'selected="selected"' : '' }>${year.schEtc01 }</option>						    
										</c:forEach>  
									</select>         
									<strong class="tit" style="margin-left:10px">월</strong>   
									<select name="excelMonth" id="excelMonth">  
										<c:forEach begin="1" end="12" varStatus="status" >
											<option value=${status.count } ${thisMonth eq status.count ? 'selected="selected"' : '' }>${status.count }</option>
										</c:forEach>						     
									</select>                  
									<a href="javascript:void(0)" class="btn btn_excel btn_sml03" onclick="excelDown();" style="margin-left:282px;"><span>엑셀 다운로드</span></a>
								</div>
							<table class="state_tbl">              
								<colgroup>                   
									<col style="width:15%">   
									<col style="width:20%"> 
									<col style="width:20%">
								</colgroup>           
								<thead>       
									<tr>            
										<th scope="col">구분</th> 
										<th scope="col">식대 총계</th>      
										<th scope="col">초과근무 총계</th>
									</tr>                         
								</thead>                                     
								<tbody>            
									<tr>                               
										<th scope="row">${eatTotal.rgstDt.replace('0', '') }월</th>        
										<td class="point01"><fmt:formatNumber value="${empty eatTotal.price ? '0' : eatTotal.price }" pattern="#,###"/>원</td>
										<td class="point02"><fmt:formatNumber value="${empty overTimeTotal.col1 ? '0' : overTimeTotal.col1 }" pattern="#,###"/>시간</td>
									</tr> 
								</tbody> 
							</table>    
						</div>         
						  <div class="mid_area1">  
						</div>            
					</div><!-- //top_area --> 
			    </form>
			</section><!--// main -->
		</div>      
	</div>
	
	<footer id="footer">
		Copyright © 2020 by Korea Radio Promotion Association.  All Rights Reserved.
	</footer>
	<div class="loading_wrap" style="display: none;">
		<span class="loading_img"><img src="/publish/frt/images/common/loading.gif" alt="로딩중" /></span>
		<div class="load_dimmed"></div>
	</div>                  
	<div id="display_view1" class="layer_popup pop_size800 js-popup"></div>
	<div class="popup_bg" id="js-popup-bg"></div>  
	
	   
<script type="text/javascript"> 

$(function(){      
	fncMidArea(); 
	return false;  
});    
            
<%-- 중간 영역 요청 --%>
function fncMidArea(){
	 $.ajax({         
		 method: "POST",  
		 url: "/mgr/statistics/midArea.do",
		 data : $("#defaultFrm").serialize(),
		 dataType: "html", 
		 success: function(data) {    
			 $(".mid_area1").html(data);
			 fncLoadingEnd(); 
			 }
	   });             
	return false;  
}
 
<%-- 엑셀 다운로드 버튼 --%> 
function excelDown(arr){
	fncPageBoard('list','/mgr/statistics/excelDown.do');
	fncLoadingEnd();
	return false;
}   

$("[id^=excel]").change(function(){
	fncMidArea();
	return false;
})


</script>
</body>
</html>		