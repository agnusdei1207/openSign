<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<c:set var="url" value="${requestScope['javax.servlet.forward.request_uri']}"/>
<script type="text/javascript" src="/publish/frt/js/board.js"></script>
<form id="defaultFrm" name="defaultFrm" method="post" onsubmit="return false;">
	<input type="hidden" id="returnUrl" name="returnUrl" value="${url }"/>
	<input type="hidden" id="ordernumber" name="ordernumber"/>
	<input type="hidden" id="eduPeriodSeq" name="eduPeriodSeq"/>
	<input type="hidden" id="boardSeq" name="boardSeq">
	<input type="hidden" id="boardCd" name="boardCd" value="mgr0018">
	<input type="hidden" id="boardDivn" name="boardDivn" value="cb02">
	<input type="hidden" id="eduBoardSeq" name="eduBoardSeq"/>
</form>
	<div class="mypage_bg">
		<div class="mypage_wrapper">
			<div class="lc">
				<div class="my_info">
					<div class="my_login">
						<span class="pic_img"><img src="/publish/frt/images/sub/img_my_pic.png" alt=""/></span>
						<div class="login_info">
							<strong class="user_login_n">${userVO.name }</strong>
							<span class="login_hello">홈페이지 방문을 환영합니다.</span>
							<div class="btn_area">
								<a href="/mif/mif0091/passwdChk.do" class="btn btn_info_rewrite">정보수정</a>
								<a href="/mbr/mbr0051/logout.do" class="btn btn_logout">로그아웃</a>
							</div>
						</div>
					</div>
					<div class="my_time">
						<span class="days"></span>
						<span class="times"></span>
					</div>
					<ul class="my_detail_list">
						<li>
							<span class="tit">회원구분</span>
							<span class="txt">
								<c:if test="${fn:length(kindList) > 0}">
									<c:forEach var="list" items="${kindList }" varStatus="status">
										<c:if test="${userVO.kind eq list.cCd }">
											${list.cCdNm }
											<c:if test="${userVO.kind eq 'M' and userVO.tchrYn eq 'Y' and userVO.tchrStep eq '2' }">
												(강사)
											</c:if>
										</c:if>
									</c:forEach>
								</c:if>
							</span>
						</li>
						<li><span class="tit">회원ID</span><span class="txt">${userVO.id }</span></li>
						<c:choose>
							<c:when test="${userVO.kind eq 'C' }">
								<li><span class="tit">회사명</span><span class="txt">${userVO.busiName }</span></li>
								<li><span class="tit">담당자명</span><span class="txt">${userVO.name }</span></li>	
							</c:when>
							<c:otherwise>
								<li><span class="tit">성명</span><span class="txt">${userVO.name }</span></li>
								<li><span class="tit">직장명<br/>(학교명)</span><span class="txt">${userVO.busiName }</span></li>
							</c:otherwise>
						</c:choose>
						<li><span class="tit">E-mail</span><span class="txt">${userVO.email }</span></li>
						<li><span class="tit">가입일</span><span class="txt">${userVO.rgstDt }</span></li>
						<li><span class="tit">최근접속</span><span class="txt">${userVO.lastLgnDt }</span></li>
					</ul>
				</div>
				<div class="enroll_info_box">
					<ul class="enroll_list">
						<li>
	           						<strong class="tit">출석인증 QR코드</strong>
	           						<div class="qr_box">
	           							<img src="/publish/frt/images/sub/img_qrcode.png" alt="">
	           						</div>
           						</li>
           						<li>
	           						<strong class="tit">강의별 문의내역</strong>
	           						<div class="enroll_info">
	           							<span class="num_box">
	           								<strong class="sub_tit">총건수</strong>
	           								<span class="sub_txt enroll"><span class="num">${questionCnt.totalCnt }</span></span>
	           								<strong class="sub_tit">접수</strong>
	           								<span class="sub_txt measure"><span class="num">${questionCnt.totalCnt - questionCnt.replyCnt }</span></span>
	           								<strong class="sub_tit">답변완료</strong>
	           								<span class="sub_txt complate"><span class="num">${questionCnt.replyCnt }</span></span>
	           							</span>
	           						</div>
           						</li>
           						<li>
	           						<strong class="tit">증명서발급</strong>
	           						<div class="enroll_info">
	           							<span class="num_box">
	           								<strong class="sub_tit">총건수</strong>
	           								<span class="sub_txt enroll">${totalCertCnt }</span>
	           								<strong class="sub_tit">접수</strong>
	           								<span class="sub_txt measure">${reqCertCnt }</span>
	           								<strong class="sub_tit">발급완료</strong>
	           								<span class="sub_txt complate">${compCertCnt }</span>
	           							</span>
	           						</div>
           						</li>
           					</ul>
           				</div>
           			</div>
           			<!-- //lc -->
						<div class="my_noti_box">
							<div class="lt">
								<!-- 새 공지사항이 있을때 my_tit 옆에 new 클래스 붙일 것 -->
								<h3 class="my_tit ${noticeNewChk eq 'Y' ? 'new' : '' }"><span>공지사항</span></h3>
           						<ul class="my_noti_list">
									<c:choose>
										<c:when test="${fn:length(noticeList) > 0 }">
											<c:forEach var="list" items="${noticeList }">
												<li class="cursor" onclick="fncPageBoard('view','/frt/frt0079/view.do','${list.boardSeq}','boardSeq');">
													<span class="subj">${list.title }</span>
													<span class="day">${list.rgstDt }</span>
												</li>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<li class="no_data">공지사항 내용이 없습니다.</li>
										</c:otherwise>
									</c:choose>
								</ul>
								<a href="/frt/frt0079/list.do" class="more">더보기</a>
							</div>
							<div class="rt">
           					</div>
           				</div>
           			</div>
           			<div id="clnd">
           			</div>
           		<!-- //rc -->
           		</div>
           </div>
        </div>
		<!--// content -->
        <!-- mobile 공유 -->
        <div id="bg_m_share" class="bg_m_share"></div>
        <div id="m_share_pop" class="m_share_pop">
            <div class="shares_head">공유하기</div>
            <div class="shares">
                <a href="#"><img src="/publish/frt/images/sub/i_facebook.png" alt="페이스북"></a>
                <a href="#"><img src="/publish/frt/images/sub/i_twitter.png" alt="트위터"></a>
                <a href="#"><img src="/publish/frt/images/sub/i_kakao.png" alt="카카오"></a>
                <a href="#"><img src="/publish/frt/images/sub/i_kakaostory.png" alt="카카오스토리"></a>
                <a href="#"><img src="/publish/frt/images/sub/i_insta.png" alt="인스타"></a>
            </div>
            <a href="#" class="shares_close">닫기</a>
        </div>
        <!--// mobile 공유 -->
<script type="text/javascript">
var swiper = new Swiper('.mytab_c .swiper-container', {
    scrollbar: {
        el: '.swiper-scrollbar',
        hide: false,
    },
    slidesPerView: 4,
    spaceBetween: 30,
    navigation: {
       nextEl: '.button-next',
       prevEl: '.button-prev',
    },	                                
    breakpoints: {
        360: {
            slidesPerView: 'auto',
            spaceBetween: 5,
        },
        768: {
            slidesPerView: 'auto',
            spaceBetween: 5,
        },
        1024: {
            slidesPerView: 4,
            spaceBetween: 25,
        },
    }
 });
subTab();
///////////////////////////////////////////////////////////////
$(document).ready(function(){
	fncRealTime();
	setInterval(function(){
		fncRealTime();
	},1000)
	$(".num").each(function(){
		numFormat($(this), 'num');
	});
});
var realTime = "${realTime}";
function fncRealTime(){
	var nowDate = new Date(realTime);
	nowDate.setSeconds(Number(nowDate.getSeconds()) + 1);
	realTime = nowDate.format("yyyy/MM/dd(KS) HH:mm") + ":"+(nowDate.getSeconds() < 10 ? "0"+nowDate.getSeconds() : nowDate.getSeconds());
	$(".days").text(realTime.split(" ")[0]);
	$(".times").text(realTime.split(" ")[1]);
}
function fncClndAjax(){
	$.ajax({
		method : "POST",
		url : "clnd.do",
		data : {"clSlctYearMnth":$("#clSlctYearMnth").val()},
		dataType : "HTML",
		success : function(data){
			$("#clnd").html(data);			
		}
	});
}
</script>