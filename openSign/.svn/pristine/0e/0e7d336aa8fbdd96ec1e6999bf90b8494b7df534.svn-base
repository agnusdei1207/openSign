<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<script type="text/javascript" src="/publish/frt/js/board.js"></script>
	<div class="cont_box">
	<form:form commandName="searchVO" id="defaultFrm" name="defaultFrm" method="post" onsubmit="return false;">
		<form:hidden path="returnUrl" id="returnUrl" />
		<form:hidden path="eduCourseSeq" id="eduCourseSeq" />
		<form:hidden path="subDivn" id="subDivn" />
		<form:hidden path="boardSeq" id="boardSeq" />
		<form:hidden path="boardCd" id="boardCd" />
		<form:hidden path="boardDivn" id="boardDivn" />
		<form:hidden path="urlDivn" id="urlDivn" />
		<jsp:directive.include file="/WEB-INF/jsp/cmmn/inc/incSearchForm.jsp"/>
		<div class="login_box">
			<div class="login_bg">
				<i><img src="/publish/frt/images/sub/i_login.png" alt=""></i>
				<p>서비스 이용을 위한 로그인 페이지입니다.<br>회원이 되시면 다양한 정보를 확인하실 수 있습니다.</p>
			</div>
			<fieldset style="border-top: 1px solid #ddd;">
			     <legend>로그인폼</legend>
			     <div class="login_menu">
				     </div>
				     <div id="choice1_box" class="login_type js-radioBox">
					 <ul class="login_input">
					     <li><input type="text" id="id" name="id" class="text" placeholder="아이디를 입력해주세요." maxlength="10" ></li>
					     <li><input type="password" id="passwd" name="passwd" class="text" placeholder="비밀번호를 입력해주세요." maxlength="20"></li>
					     <li class="id_save">
						     <span class="checkboxs">
								 <input type="checkbox" id="id_save" value="Y">
							     <label for="id_save">아이디 저장</label>
						     </span>
					     </li>
					     <li><button type="button" class="btn_login" id="btn_login">로그인</button></li>
					 </ul>
					 <div class="login_link clear">
					    <a href="javascript:void(0);" class="link" onclick="fncPageBoard('list','/mbr/mbr0053/fd01.do')">아이디 찾기</a>
					    <a href="javascript:void(0);" class="link mdl" onclick="fncPageBoard('list','/mbr/mbr0053/fd01.do')">비밀번호 찾기</a>
					    <a href="javascript:void(0);" class="link" onclick="fncPageBoard('list','/mbr/mbr0052/step00.do')">회원가입</a>
					 </div>
			     </div>
			</fieldset>
		</div>
	</form:form>
	</div>
</div>
<script type="text/javascript">
<%-- 아이디 정규표현식. 영문 대소문자, 숫자 입력가능 --%>
var idChk = RegExp(/^[a-zA-Z0-9]{3,10}$/);
<%-- 비밀번호 정규표현식. 영문 대소문자, 숫자, 특수문자 입력가능 --%>
var pwChk = RegExp(/^[a-zA-Z0-9~`!@#$%^&*()-+\\_\\=\\?]{4,20}$/);
$(document).ready(function(){
	if($.cookie("id_save") != "" && $.cookie("id_save") != null){
		$("#id").val($.cookie("id_save"));
		$("#id_save").prop("checked",true);
	}else{
		$("#id_save").prop("checked",false);
	}
});

<%-- 로그인 엔터 이벤트 --%>
$("#id").keypress(function(){
	if (window.event.keyCode == 13) {
		$("#passwd").focus();
 	}
});
$("#passwd").keypress(function(){
	if (window.event.keyCode == 13) {
		$("#btn_login").click();
 	}
});

$("#btn_login").click(function(){
	if($("#id").val() == "" || $("#id").val() == null){
		alert("아이디를 입력해 주세요");
		$("#id").focus();
		return false;
	}
	if($("#passwd").val() == "" || $("#passwd").val() == null){
		alert("비밀번호를 입력해 주세요");
		$("#passwd").focus();
		return false;
	}
	if(!idChk.test($("#id").val()) || !pwChk.test($("#passwd").val())){
		alert("로그인정보가 정확하지 않습니다");
		window.location.replace("login.do");
		return false;
	}
	if($("#id_save").prop("checked") == true){
		$.cookie("id_save", $("#id").val(), 30);
	}else{
		$.cookie("id_save", "");
	}
	fncPageBoard('submit','/mbr/mbr0051/loginProcess.do');
});
</script>