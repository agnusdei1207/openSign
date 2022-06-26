<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<script type="text/javascript" src="/publish/frt/js/board.js"></script>
<form id="defaultFrm" name="defaultFrm" method="post" onsubmit="return false;">
	<input type="hidden" id="returnUrl" name="returnUrl" value="${searchVO.returnUrl }"/>
	<input type="hidden" id="eduCourseSeq" name="eduCourseSeq" value="${searchVO.eduCourseSeq }"/>
	<input type="hidden" id="subDivn" name="subDivn" value="${searchVO.subDivn }"/>
	<input type="hidden" id="boardSeq" name="boardSeq" value="${searchVO.boardSeq }"/>
	<input type="hidden" id="boardCd" name="boardCd" value="${searchVO.boardCd }"/>
	<input type="hidden" id="boardDivn" name="boardDivn" value="${searchVO.boardDivn }"/>
	<input type="hidden" id="urlDivn" name="urlDivn" value="${searchVO.urlDivn }"/>
	<jsp:directive.include file="/WEB-INF/jsp/cmmn/inc/incSearchForm.jsp"/>
	<input type="hidden" name="col1" id="col1">	
	<input type="hidden" name="col2" id="col2">	
	<input type="hidden" name="col3" id="col3">	
	<input type="hidden" name="col4" id="col4"> 
</form>
	<div class="cont_box">
		<h3 class="md_tit"><span>본인인증</span></h3>
		<div class="auth_box">
			<div class="ico"><img src="/publish/frt/images/sub/i_auth.png" alt=""></div>
			<h3 class="tit">휴대폰 인증하기</h3>
			<p class="txt">공인된 인증기관을 통해<br>휴대폰 인증을 받을 수 있습니다.</p>
			<div class="step_btnarea">
				<a href="javascript:void(0);" class="btn btn_prevstep" onclick="fncPageBoard('list','/mbr/mbr0051/login.do');">이전단계</a>
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