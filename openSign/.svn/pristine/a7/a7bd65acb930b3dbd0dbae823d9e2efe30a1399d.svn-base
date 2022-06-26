<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<script type="text/javascript" src="/publish/frt/js/board.js"></script>
<form id="defaultFrm" name="defaultFrm" method="post" onsubmit="return false;">
	<input type="hidden" id="kind" name="kind" value="${searchVO.kind }"/>
	<input type="hidden" id="schEtc01" name="schEtc01" value="${searchVO.schEtc01 }"/>
	<input type="hidden" name="col1" id="col1">	
	<input type="hidden" name="col2" id="col2">	
	<input type="hidden" name="col3" id="col3">	
	<input type="hidden" name="col4" id="col4">
</form>
	<div class="cont_box">
		<div class="join_step">
			<ul class="clear">
				<li><strong class="step1"><i></i><span><span>STEP1</span>약관동의</span></strong></li>
				<li class="on"><strong class="step2"><i></i><span><span>STEP2</span>본인인증</span></strong></li>
				<li><strong class="step3"><i></i><span><span>STEP3</span>정보입력</span></strong></li>
				<li><strong class="step4"><i></i><span><span>STEP4</span>가입완료</span></strong></li>
			</ul>
		</div>
		<h3 class="md_tit"><span>본인인증</span></h3>
		<div class="auth_box">
			<div class="ico"><img src="/publish/frt/images/sub/i_auth.png" alt=""></div>
			<h3 class="tit">휴대폰 인증하기</h3>
			<p class="txt">공인된 인증기관을 통해<br>휴대폰 인증을 받을 수 있습니다.</p>
			<div class="step_btnarea">
				<a href="javascript:void(0);" class="btn btn_prevstep" onclick="fncPageBoard('list','step01.do');">이전단계</a>
				<a href="javascript:void(0);" class="btn btn_nextstep" onclick="fncNicePop();">본인인증</a>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
function fncNicePop(){
	fncPageBoard('pop','nicePop.do','','','500','550');
} 
</script>