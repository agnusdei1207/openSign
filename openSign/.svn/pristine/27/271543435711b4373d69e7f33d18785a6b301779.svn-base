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
		</form:form>
	    <div class="pw_box">
	        <div class="pw_bg">
	            <i><img src="/publish/frt/images/sub/bg_pw.png" alt=""></i>
	        </div>
	        <!-- 아이디 정보확인 -->
	        <div class="id_info">
	        	<p class="id_txt">고객님의 정보와 일치하는 아이디는 다음과 같습니다.</p>
	            <ul class="id_set">
	            </ul>
	            <div class="btn_area c">
	            	<a href="javascript:void(0);" class="btn go_login" onclick="fncPageBoard('list','/mbr/mbr00051/login.do')">로그인 하기</a>
	            	<a href="javascript:void(0);" class="btn go_pdw" onclick="fncPageBoard('list','fd01.do')">비밀번호 찾기</a>                 
	            </div>
	        </div>
	    </div>
	</div>
</div>