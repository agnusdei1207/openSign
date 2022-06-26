<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<script type="text/javascript" src="/publish/frt/js/board.js"></script>
<form id="defaultFrm" name="defaultFrm" method="post" onsubmit="return false;">
	<input type="hidden" id="kind" name="kind"/>
</form>
	<div class="cont_box">
		<ul class="identify clear">
			<li>
				<i class="icon_img"><img src="/publish/frt/images/sub/icon_confirm01.png" alt=""></i>
				<h3 class="identify_tit"><strong>개인</strong>회원가입</h3>
				<p class="txt_type01">
					본인 명의의 휴대폰번호로
					<span class="block m-block">인증 후 가입이 가능하며,</span><br class="m_hid">
					<span class="block m-block">추후 서비스 이용 시</span>
					추가 정보 입력이 <span class="m-block">필요합니다.</span>
				</p>
				<div class="join_btns">
					<a href="#" onclick="fncPageBoard('list','step01.do','M','kind')"><span>회원가입</span></a>
				</div>
			</li>
			<li>
				<i class="icon_img"><img src="/publish/frt/images/sub/icon_confirm02.png" alt=""></i>
				<h3 class="identify_tit"><strong>기업</strong>회원가입</h3>
				<p class="txt_type02">
					한국전파진흥협회의 <span class="m-block">회원사가 되기 위해서는</span><br class="m_hid"><span class="block">회원 가입 및 신청서 <span class="m-block">제출이 필요합니다.</span></span> <span class="block">신청서 및 관련 서류들은 회원사 가입안내 페이지에서</span> 확인 하실 수 <span class="m-block">있습니다.</span>
				</p>
				<div class="join_btns">
					<a href="javascript:void(0);" onclick="fncPageBoard('list','step01.do','C','kind')"><span>회원가입</span></a>
				</div>
			</li>
		</ul>
	</div>
</div>