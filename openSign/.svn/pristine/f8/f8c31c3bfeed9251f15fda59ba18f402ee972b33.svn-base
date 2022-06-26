<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<title>전파방송통신교육원</title>
<!-- <link rel="stylesheet" type="text/css" href="/publish/frt/css/reset.css">
<link rel="stylesheet" type="text/css" href="/publish/frt/css/style.css"> -->
<link rel="stylesheet" type="text/css" href="/publish/frt/css/print2.css">
<c:set var="url" value="${requestScope['javax.servlet.forward.request_uri']}"/>
<script type="text/javascript" src="/publish/frt/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="/publish/frt/js/board.js"></script>
</head>
<body>
	<div id="content">
		<div class="cont_box">
			<div class="tbl">
				<div class="tbl_wrap receipt_box">
				<!-- board -->
					<table class="tbl_receipt">
						<caption></caption>						
						<tbody>								
							<tr>
								<td style="border-bottom:0;padding:0;position:relative;">
								
									<table class="tbl_receipt">															
										<tbody>
											<tr>
												<th scope="row" colspan="6" class="title">영 수 증 <span class="sm_txt">(공급받는자용)</span></th>
											</tr>
											<tr>
												<td colspan="2">No. </td>
												<td colspan="4" class="to">${mgr0030VO.kind eq 'M' ? mgr0030VO.name : mgr0030VO.mngName } <span class="sm_txt">귀하</span></td>
											</tr>
											<tr>
												<th scope="col" rowspan="4" style="padding: 0 3px">공<br/><br/>급<br/><br/>자</th>
												<th scope="col">사업자등록번호</th>
												<td colspan="4">201-82-30821</td>
											</tr>
											<tr>
												<th scope="col">상호</th>
												<td colspan="2">한국전파진흥협회</td>
												<th scope="col">성명</th>
												<td>신종균</td>
											</tr>
											<tr>
												<th scope="col">사업장 소재지</th>
												<td colspan="4">서울특별시 양천구 목동중앙로13 나길 3</td>
											</tr>
											<tr>
												<th scope="col">업 태</th>
												<td colspan="2">서비스</td>
												<th scope="col">종목</th>
												<td>전파산업기술육성</td>
											</tr>
										</tbody>
									</table>	
									<span style="position:absolute;right:10px;top:80px;"><img src="/publish/frt/images/sub/r_stamp.png"></span>							
								</td>
							</tr>
							<tr>
								<td style="border-top:0;padding:0;">
									<table class="tbl_receipt">
										<caption></caption>						
										<tbody>
											<tr>
												<th scope="row" colspan="2" style="border-top:0">작성년월일</th>
												<th scope="row" colspan="4" style="border-top:0">공급대가총액</th>
												<th scope="row" style="border-top:0;wdith:15%;">비　고</th>
											</tr>
											<tr>
												<td colspan="2">${mgr0030VO.payDate }</td>
												<td colspan="4"><span class="color">₩</span>　<strong><span class="num">${mgr0030VO.amount }</span></strong></td>
												<td></td>
											</tr>
											<tr>
												<th scope="row" style="width:15%;">월일</th>
												<th scope="row" colspan="2">품 목</th>
												<th scope="row" style="width:15%;">수　량</th>
												<th scope="row" style="width:25%;">단　가</th>
												<th scope="row" colspan="2">공급대가(금액)</th>
											</tr>
											<tr>
												<td>${mgr0030VO.payDateMD }</td>
												<td colspan="2">[${mgr0030VO.menuNm }-${mgr0030VO.cdNm }]${mgr0030VO.title }</td>
												<td>${mgr0030VO.joinCnt }</td>
												<td><span class="num">${mgr0030VO.eduCost }원</span></td>
												<td colspan="2"><span class="num">${mgr0030VO.amount }원</span></td>
											</tr>
											<tr>
												<td colspan="7">
													<div class="in_txt"><span class="tit">내   용 :</span><span> 내용이 들어오는 자리</span></div>
													<div class="in_txt"><span class="tit">과정명 :</span><span> [${mgr0030VO.menuNm }-${mgr0030VO.cdNm }]${mgr0030VO.title }</span></div>
													<div class="in_txt"><span class="tit">기   간 :</span><span> ${mgr0030VO.periodS } ~ ${mgr0030VO.periodE }<br/>${mgr0030VO.hourCon }<br/>총 ${mgr0030VO.week }주, 총 ${mgr0030VO.day }일, 총 ${mgr0030VO.hour }시간</span></div>
												</td>
											</tr>
											<tr>
												<td colspan="7" class="color c">
													부가가치세법시행규칙 제 25조의 규정에 의한 (영수증)으로 개정
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							<tr>
						</tbody>
					</table>
										
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
$(document).ready(function(){
	$(".num").each(function(){
		numFormat($(this), 'num');
	});
	window.print();
});
</script>
</html>