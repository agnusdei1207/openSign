<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<script type="text/javascript" src="/publish/frt/js/board.js"></script>
	<div class="cont_box">
	<form:form commandName="searchVO" id="defaultFrm" name="defaultFrm" method="post">
		<input type="hidden" id="findDivn" name="findDivn"/>
		<input type="hidden" id="id" name="id" class="userVal"/>
		<input type="hidden" id="name" name="name" class="userVal"/>
		<input type="hidden" id="cell" name="cell" class="userVal"/>
		<input type="hidden" id="email" name="email" class="userVal"/>
		<form:hidden path="returnUrl" id="returnUrl" />
		<form:hidden path="eduCourseSeq" id="eduCourseSeq" />
		<form:hidden path="subDivn" id="subDivn" />
		<form:hidden path="boardSeq" id="boardSeq" />
		<form:hidden path="boardCd" id="boardCd" />
		<form:hidden path="boardDivn" id="boardDivn" />
		<form:hidden path="urlDivn" id="urlDivn" />
		<jsp:directive.include file="/WEB-INF/jsp/cmmn/inc/incSearchForm.jsp"/>
		<div class="find_box clear">
	        <div class="find_id">
	            <h3 class="find_tit">아이디찾기</h3>
	            <ul class="find">
	                <li><span class="i_name">이름</span><input type="text" id="nameText_2" class="text" maxlength="20" placeholder="이름"/></li>
	                <li><span class="i_phone">휴대폰번호</span><input type="text" id="cellText_2" class="text numOnly" maxlength="11" placeholder="'-'를 제외한 숫자만 입력해 주세요(휴대전화)"/></li>
	                <li><span class="i_name">이메일</span><input type="text" id="emailText_2" class="text" maxlength="50" placeholder="이메일"/></li>
	                <li class="last"><button type="button" class="btn_find" onclick="fncFindUser('2')">찾기</button></li>
	            </ul>
	        </div>
	        <div class="find_pdw">
	            <h3 class="find_tit">비밀번호 찾기</h3>
	            <ul class="find">
	                <li><span class="i_mail">아이디</span><input type="text" id="idText_3" class="text" maxlength="10" placeholder="아이디"/></li>
	                <li><span class="i_name">이름</span><input type="text" id="nameText_3" class="text" maxlength="20" placeholder="이름"/></li>
	                <li><span class="i_phone">휴대폰번호</span><input type="text" id="cellText_3" class="text numOnly" maxlength="11" placeholder="'-'를 제외한 숫자만 입력해 주세요(휴대전화)"/></li>
	                <li><span class="i_name">이메일</span><input type="text" id="emailText_3" class="text" maxlength="50" placeholder="이메일"/></li>
	                <li class="last"><button type="button" class="btn_find"  onclick="fncFindUser('3')">찾기</button></li>
	            </ul>
	        </div>
	    </div>
	</form:form>
	</div>
</div>
<script type="text/javascript">
<%-- 아이디 정규표현식. 영문 대소문자, 숫자 입력가능 --%>
var idChk = RegExp(/^[a-zA-Z0-9]{3,10}$/);
<%-- 핸드폰번호 정규표현식 --%>
var phnChk = RegExp(/^(01[0|1|6|7|8|9]{1})([0-9]{3,4})([0-9]{4})$/);
<%-- 이메일 정규표현식 --%>
var emlChk = RegExp(/^[0-9a-zA-Z-\\_]*@[0-9a-zA-Z-\\_]*\.([a-zA-Z]{2,6}||[a-zA-Z]{2,6}.[a-zA-Z]{2,6})$/);

<%-- 엔터 이벤트 --%>
$("#nameText_2").keypress(function(){
	if (window.event.keyCode == 13) {
		$("#cellText_2").focus();
 	}
});
$("#cellText_2").keypress(function(){
	if (window.event.keyCode == 13) {
		$("#emailText_2").focus();
 	}
});
$("#emailText_2").keypress(function(){
	if (window.event.keyCode == 13) {
		fncFindUser("2");
 	}
});

$("#idText_3").keypress(function(){
	if (window.event.keyCode == 13) {
		$("#nameText_3").focus();
 	}
});
$("#nameText_3").keypress(function(){
	if (window.event.keyCode == 13) {
		$("#cellText_3").focus();
 	}
});
$("#cellText_3").keypress(function(){
	if (window.event.keyCode == 13) {
		$("#emailText_3").focus();
 	}
});
$("#emailText_3").keypress(function(){
	if (window.event.keyCode == 13) {
		fncFindUser("3");
 	}
});

<%-- 아이디/비밀번호찾기 액션 --%>
function fncFindUser(divn){
	$(".userVal").val("");
	$("#findDivn").val(divn);
	
	if(divn == 3){
		if($("#idText_"+divn).val() == ''){
			alert("아이디를 입력해주세요.");
			$("#idText_"+divn).focus();
			return false;
		}
	}
	
	if($("#nameText_"+divn).val() == ''){
		alert("이름을 입력해주세요.");
		$("#nameText_"+divn).focus();
		return false;
	}

	if($("#cellText_"+divn).val() == ''){
		alert("휴대폰번호를 입력해주세요.");
		$("#cellText_"+divn).focus();
		return false;
	}
	
	if($("#emailText_"+divn).val() == ''){
		alert("이메일 주소를 입력해주세요.");
		$("#emailText_"+divn).focus();
		return false;
	}
	
	if(divn == 3){
		if(!idChk.test($("#idText_"+divn).val())){
			alert("회원정보가 정확하지 않습니다");
			window.location.replace("fd01.do");
			return false;
		}
	}
	if(!phnChk.test($("#cellText_"+divn).val()) || !emlChk.test($("#emailText_"+divn).val())){
		alert("회원정보가 정확하지 않습니다");
		window.location.replace("fd01.do");
		return false;
	}
	
	$("#id").val($("#idText_"+divn).val());
	$("#name").val($("#nameText_"+divn).val());
	$("#cell").val($("#cellText_"+divn).val());
	$("#email").val($("#emailText_"+divn).val());
	
	fncPageBoard('submit','findChk.do');
}
</script>