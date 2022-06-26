<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<script type="text/javascript" src="/publish/frt/js/board.js"></script>
<form id="defaultFrm" name="defaultFrm" method="post" onsubmit="return false;">
</form>

	<div class="cont_box">
		<div class="join_step">
				<ul class="clear">
					<li><strong class="step1"><i></i><span><span>STEP1</span>약관동의</span></strong></li>
					<li><strong class="step2"><i></i><span><span>STEP2</span>본인인증</span></strong></li>
					<li><strong class="step3"><i></i><span><span>STEP3</span>정보입력</span></strong></li>
					<li class="on"><strong class="step4"><i></i><span><span>STEP4</span>가입완료</span></strong></li>
				</ul>
			</div>
		<h3 class="md_tit"><span>가입완료</span></h3>
		<div class="auth_box">
			<div class="ico"><img src="/publish/frt/images/sub/i_joininfo.png" alt=""></div>
			<c:choose>
				<c:when test="${searchVO.kind eq 'C' }">
					<h3 class="tit">기업회원 회원가입이 완료 되었습니다.</h3>
				</c:when>
				<c:otherwise>
					<h3 class="tit">개인회원 회원가입이 완료되었습니다.</h3>
				</c:otherwise>
			</c:choose>
			<p class="txt">로그인하시면 다양한 서비스를 이용하실 수 있습니다.</p>
		    <div class="infos">
			<ul>
			    <li><strong>아이디　:　</strong>${searchVO.id }</li>
			    <li><strong>가입일　:　</strong>${searchVO.rgstDt }</li>
			</ul>
		    </div>
			<div class="step_btnarea">
				<a href="/frt/main.do" class="btn btn_prevstep">메인</a>
				<a href="/mbr/mbr0051/login.do" class="btn btn_nextstep">로그인</a>
			</div>
		</div>
	</div>
</div>