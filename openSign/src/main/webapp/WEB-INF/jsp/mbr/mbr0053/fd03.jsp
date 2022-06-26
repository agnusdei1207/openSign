<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<script type="text/javascript" src="/publish/frt/js/board.js"></script>
	<div class="cont_box">
		<form:form commandName="searchVO" id="defaultFrm" name="defaultFrm" method="post" onsubmit="return false;">
			<form:hidden path="returnUrl" id="returnUrl"/>
			<form:hidden path="eduCourseSeq" id="eduCourseSeq"/>
			<form:hidden path="subDivn" id="subDivn"/>
			<form:hidden path="boardSeq" id="boardSeq"/>
			<form:hidden path="boardCd" id="boardCd" />
			<form:hidden path="boardDivn" id="boardDivn"/>
			<form:hidden path="urlDivn" id="urlDivn" />
			<input type="hidden" id="niceOverCode" name="niceOverCode" value="${searchVO.col1 }"/>
			<jsp:directive.include file="/WEB-INF/jsp/cmmn/inc/incSearchForm.jsp"/>
	    <div class="pw_box">
	        <div class="pw_bg">
	            <i><img src="/publish/frt/images/sub/bg_pw.png" alt=""></i>
	        </div>
	       <div class="pw_info">
	             <p class="pw_txt">비밀번호를 변경하여 <span class="color_blue">다시 설정</span>해 주세요.</p>
	            <ul class="pw_set">
	                <li><strong>새 비밀번호</strong> <input type="password" id="passwd"  name="passwd" class="text" maxlength="20" title="새 비밀번호 입력">
	                    <div class="refer">비밀번호는 4~20자의 영문 대소문자, 숫자, 특수문자로<br>설정해 주세요.</div>
	                </li>
	                <li>
	                    <strong>새 비밀번호 확인</strong>
	                    <input type="password" id="passwdRe" class="text" maxlength="20" title="새 비밀번호 확인 입력">
	                </li>
	            </ul>
	            <div class="btn_area">
	            	<a href="#" class="btn btn_prevstep" onclick="fncPageBoard('list', '/mbr/mbr0051/login.do')">취소</a>
	            	<a href="#" id="btn_passwdUpdate" class="btn btn_confirm">확인</a>
	            </div> 
	        </div>
	    </div>
		</form:form>
	</div>
</div>
<script type="text/javascript">
<%-- 비밀번호 정규표현식. 영문 대소문자, 숫자, 특수문자 입력가능 --%>
var pwChk = RegExp(/^[a-zA-Z0-9~`!@#$%^&*()-+\\_\\=\\?]{4,20}$/);

$("#passwd").keypress(function(){
	if (window.event.keyCode == 13) {
		$("#passwdRe").focus();
 	}
});
$("#passwdRe").keypress(function(){
	if (window.event.keyCode == 13) {
		$("#btn_passwdUpdate").click();
 	}
});

$("#btn_passwdUpdate").click(function(){
	
	if($("#passwd").val() == "" || $("#passwd").val() == null){
		alert("비밀번호를 입력해주세요");
		$("#passwd").focus();
		return false;
	}
	
	if(!pwChk.test($("#passwd").val())){
		alert("비밀번호는 4~20자의 영문 대소문자, 숫자, 특수문자로 입력해주세요");
		$("#passwd").focus();
		return false;
	}
	
	if($("#passwdRe").val() == "" || $("#passwdRe").val() == null){
		alert("새 비밀번호 확인을 입력해주세요");
		$("#passwdRe").focus();
		return false;
	}
	
	if($("#passwd").val() != $("#passwdRe").val()){
		alert("비밀번호가 일치하지 않습니다");
		$("#passwdRe").focus();
		return false;
	}
	
	fncPageBoard('submit','passwdUpdate.do');
});
</script>