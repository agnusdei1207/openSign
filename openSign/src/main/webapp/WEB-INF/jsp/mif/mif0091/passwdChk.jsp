<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<script type="text/javascript" src="/publish/frt/js/board.js"></script>
	<form id="defaultFrm" name="defaultFrm" method="post" onsubmit="return false;">
		<div class="cont_box">
			<h3 class="md_tit"><span>비밀번호 확인</span></h3>
			<div class="pw_box">
		        <div class="pw_bg">
		            <i><img src="/publish/frt/images/sub/bg_pw.png" alt=""></i>
		        </div>
		        <div class="pw_info">
		            <ul class="pw_set">
		                <li><strong>아이디</strong> <span class="text">${loginFrt.id }</span></li>
		                <li><strong>비밀번호</strong> 
		                	<input type="password" id="passwd" name="passwd" class="text pc_w65p numOnly" maxlength="20" placeholder="비밀번호를 입력해주세요."/>
		                </li>
		            </ul>
		            <div class="step_btnarea">
						<a href="/mif/mif0090/main.do" class="btn btn_prevstep">취소</a>
						<a href="javascript:void(0);" class="btn btn_nextstep" onclick="fncPasswdChk()">다음단계</a>
					</div>
		        </div>
		    </div>
		</div>
	</form>
</div>
<script type="text/javascript">
<%-- 비밀번호 정규표현식. 영문 대소문자, 숫자, 특수문자 입력가능 --%>
var pwChk = RegExp(/^[a-zA-Z0-9~`!@#$%^&*()-+\\_\\=\\?]{4,20}$/);
$(document).ready(function(){
});

$("#passwd").keypress(function(){
	if (window.event.keyCode == 13) {
		fncPasswdChk();
 	}
});

function fncPasswdChk(){
	if($("#passwd").val() == "" || $("#passwd").val() == null){
		alert("비밀번호를 입력해 주세요");
		$("#passwd").focus();
		return false;
	}
	if(!pwChk.test($("#passwd").val())){
		alert("로그인정보가 정확하지 않습니다");
		window.location.replace("passwdChk.do");
		return false;
	}
	fncPageBoard('submit','passwdChkProcess.do');
}
</script>