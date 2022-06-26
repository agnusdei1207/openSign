<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<c:set var="url" value="${requestScope['javax.servlet.forward.request_uri']}"/>
<script type="text/javascript" src="/publish/frt/js/board.js"></script>
<script type="text/javascript">
</script>
	<div class="cont_box">
		<form id="defaultFrm" name="defaultFrm" method="post" onsubmit="return false;">
		<input type="hidden" id="kind" name="kind" value="${searchVO.kind }"/>
		<input type="hidden" id="quitStatus" name="quitStatus" value="N"/>
		<input type="hidden" id="tchrYn" name="tchrYn" value="N"/>
		<input type="hidden" id="schEtc01" name="schEtc01" value="${searchVO.schEtc01 }"/>
		<div class="join_step">
			<ul class="clear">
				<li><strong class="step1"><i></i><span><span>STEP1</span>약관동의</span></strong></li>
				<li><strong class="step2"><i></i><span><span>STEP2</span>본인인증</span></strong></li>
				<li class="on"><strong class="step3"><i></i><span><span>STEP3</span>정보입력</span></strong></li>
				<li><strong class="step4"><i></i><span><span>STEP4</span>가입완료</span></strong></li>
			</ul>
		</div>
			<div class="tbl_wrap">
				<div class="tit_area">
		            <div class="left"><h3 class="md_tit">기업회원 등록</h3></div>
		            <div class="right"><span class="essential_txt"><span>*</span>는 필수입력입니다.</span></div>
		        </div>
				<table class="join_tbl">
					<caption>기업회원 등록</caption>
					<colgroup>
						<col style="width:15%;">
						<col style="width:35%;">
						<col style="width:15%;">
						<col style="width:35%;">
					</colgroup> 
					<tbody>
						<tr>
							<th scope="row"><strong class="th_tit">아이디</strong></th>
	                        <td colspan="">
	                            <input type="text" id="id" name="id" class="text pc_w60p m_w70p" maxlength="10" placeholder="3~10자의 영문 대소문자, 숫자"/>
	                            <a href="javascript:void(0)" class="btn btn_sml btn_confirm" onclick="ovrlpCheck('id')">중복확인</a>
	                        </td>
	                        <th scope="row"><strong>회사명</strong></th>
							<td colspan="">
								<input type="hidden" id="busiName" name="busiName" value="${searchVO.busiName }" />
								${searchVO.busiName }
							</td>
						</tr>
						<tr>
							<th scope="row"><strong class="th_tit">비밀번호</strong></th>
	                        <td colspan="">
	                            <input type="password" id="passwd" name="passwd" class="text pc_w60p" maxlength="20" placeholder="4~20자의 영문 대소문자, 숫자, 특수문자"/>
	                        </td>
	                        <th scope="row"><strong class="th_tit">비밀번호 확인</strong></th>
	                        <td colspan="">
	                        	<input type="password" id="passwdRe" name="passwdRe" class="text pc_w60p" maxlength="20" />
	                        </td>
						</tr>
						 <tr>
							<th scope="row"><strong>사업자등록번호</strong></th>
	                        <td colspan="">
	                        	<input type="hidden" id="busiNo" name="busiNo" value="${searchVO.busiNo }" />
	                            <span id="span_busiNo">${searchVO.busiNo }</span>
	                        </td>
							<th scope="row"><strong class="th_tit">대표자명</strong></th>
	                        <td colspan="">
	                            <input type="text" id="owner" name="owner" class="text pc_w60p" maxlength="20" placeholder="대표자명을 입력해주세요"/>
	                        </td>
						</tr>
						<tr>
							<th scope="row"><strong>종목</strong></th>
	                        <td colspan="">
	                            <input type="text" id="item" name="item" class="text pc_w60p" maxlength="100" placeholder="종목을 입력해주세요"/>
	                        </td>
							<th scope="row"><strong>업태</strong></th>
	                        <td colspan="">
	                            <input type="text" id="conditions" name="conditions" class="text pc_w60p" maxlength="100" placeholder="업태를 입력해주세요"/>
	                        </td>
						</tr>
						<tr>
							<th scope="row"><strong class="th_tit">회사 이메일</strong></th>
	                        <td colspan="">
	                            <input type="text" id="email" name="email" class="text pc_w60p m_w70p" maxlength="50" placeholder="회사 이메일을 입력해주세요"/>
	                            <a href="javascript:void(0)" class="btn btn_sml btn_confirm" onclick="ovrlpCheck('eml')" >중복확인</a>
	                        </td>
	                        <th scope="row"><strong>이메일 수신 여부</strong></th>
	                        <td colspan="3">
								<input type="radio" id="mailReceive_y" name="mailReceive" class="cursor" value="Y" /><label for="mailReceive_y" class="cursor">예</label>　
	                        	<input type="radio" id="mailReceive_n" name="mailReceive" class="cursor" value="N" /><label for="mailReceive_n" class="cursor">아니요</label>
	                        </td>
						</tr>
						<tr>
							<th scope="row"><strong>대표전화</strong></th>
	                        <td colspan="">
	                            <input type="text" id="telo" name="telo" class="text pc_w60p numOnly" maxlength="11" placeholder="'-'를 제외한 숫자만 입력해 주세요"/>
	                        </td>
							<th scope="row"><strong>팩스번호</strong></th>
	                        <td colspan="">
	                            <input type="text" id="fax" name="fax" class="text pc_w60p numOnly" maxlength="11" placeholder="'-'를 제외한 숫자만 입력해 주세요"/>
	                        </td>
						</tr>
						<tr>
							<th scope="row"><strong class="th_tit">주소</strong></th>
	                        <td colspan="3">
								<input type="text" id="post" name="post" class="text pc_w10p c m_w18p" maxlength="6" readonly="readonly" placeholder="우편번호" style="margin-right: 0px; padding: 0px;"/>
								<input type="text" id="addr1" name="addr1" class="text pc_w41p m_w60p" maxlength="50" readonly="readonly" placeholder="주소"/>
								<a href="javascript:void(0)" class="btn btn_sml btn_confirm" onclick="daum_post()">주소검색</a><br />
								<input type="text" id="addr2" name="addr2" class="text pc_w59p" maxlength="50" placeholder="상세주소" style="margin-top:5px; margin-left: 0px;"/>
	                        </td>
						</tr>
						<tr>
							<th scope="row"><strong>홈페이지</strong></th>
							<td colspan="">
								<input type="text" id="homepage" name="homepage" class="text pc_w60p" maxlength="50" placeholder="http://"/>
							</td>
							<th scope="row"><strong class="th_tit">담당자명</strong></th>
							<td colspan="">
								<input type="text" id="name" name="name" class="text pc_w60p" maxlength="20" placeholder="담당자명을 입력해주세요"/>
							</td>
						</tr>
						<tr>
							<th scope="row"><strong class="th_tit">담당자 휴대전화</strong></th>
	                        <td colspan="">
	                            <input type="text" id="cell" name="cell" class="text pc_w60p numOnly" maxlength="11" placeholder="'-'를 제외한 숫자만 입력해 주세요"/>
	                        </td>
							<th scope="row"><strong>담당자 전화번호</strong></th>
	                        <td colspan="">
	                            <input type="text" id="tel" name="tel" class="text pc_w60p numOnly" maxlength="11" placeholder="'-'를 제외한 숫자만 입력해 주세요"/>
	                        </td>
						</tr>
						<tr>
							<th scope="row"><strong>부서</strong></th>
							<td colspan="">
								<input type="text" id="takeStation" name="takeStation" class="text pc_w60p" maxlength="50" placeholder="부서명(학부/학과)을 입력해주세요"/>
							</td>
							<th scope="row"><strong>직급</strong></th>
							<td colspan="">
								<input type="text" id="takePosition" name="takePosition" class="text pc_w60p" maxlength="50" placeholder="직급(학년)을 입력해주세요"/>
							</td>
						</tr>
						<tr>
	                        <th scope="row"><strong>회원사여부</strong></th>
	                        <td colspan="3">
								<input type="radio" id="memType_y" name="memType" class="cursor" value="Y" /><label for="memType_y" class="cursor">회원사</label>　
	                        	<input type="radio" id="memType_n" name="memType" class="cursor" value="N" checked="checked"/><label for="memType_n" class="cursor">비회원사</label>
	                        </td>
						</tr>
					</tbody>
				</table>
			</div>
			<br/>
			<div class="btn_area c">
				<a href="javascript:void(0);" class="btn btn_prevstep" onclick="fncPageBoard('list','step02.do');">이전단계</a>
			    <a href="javascript:void(0);" class="btn btn_nextstep" id="btn_submit">다음단계</a>
			</div>
		</form>
	</div>
</div>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
<%-- 아이디 정규표현식. 영문 대소문자, 숫자 입력가능 --%>
var idChk = RegExp(/^[a-zA-Z0-9]{3,10}$/);
<%-- 비밀번호 정규표현식. 영문 대소문자, 숫자, 특수문자 입력가능 --%>
var pwChk = RegExp(/^[a-zA-Z0-9~`!@#$%^&*()-+\\_\\=\\?]{4,20}$/);
<%-- 일반전화 정규표현식 --%>
var telChk = RegExp(/^(02||0[3-6]{1}[1-5]{1})([0-9]{3,4})([0-9]{4})$/);
<%-- 핸드폰번호 정규표현식 --%>
var phnChk = RegExp(/^(01[0|1|6|7|8|9]{1})([0-9]{3,4})([0-9]{4})$/);
<%-- 팩스번호 정규표현식 --%>
var faxChk = RegExp(/^(02||0[0-9]{2})([0-9]{3,4})([0-9]{4})$/);
<%-- 이메일 정규표현식 --%>
var emlChk = RegExp(/^[0-9a-zA-Z-\\_]*@[0-9a-zA-Z-\\_]*\.([a-zA-Z]{2,6}||[a-zA-Z]{2,6}.[a-zA-Z]{2,6})$/);

$(document).ready(function(){
	busiNoFormat($("#span_busiNo"));
});

function busiNoFormat(object){
	var numVal = object.text().trim();
	numVal = numVal.replace(/^([0-9]{3})([0-9]{2})([0-9]{5})$/,"$1-$2-$3");
	object.text(numVal);
}

$("#id").keypress(function(){
	if (window.event.keyCode == 13) {
		ovrlpCheck('id');
	}
});
$("#email").keypress(function(){
	if (window.event.keyCode == 13) {
		ovrlpCheck('eml');
	}
});

<%-- 다음 주소API --%>
function daum_post(){
	new daum.Postcode({
	oncomplete: function(data) {
		var address = data.userSelectedType=='J'
								 ? data.jibunAddress : data.roadAddress;
			if( data.buildingName != '' ) address += '(' + data.buildingName + ')';
			$("#addr1").val( address );
			$("#post").val( data.zonecode );
			alertMsg("addr1");
	}
  }).open();
}

<%-- 아이디 중복확인 검증 --%>
var idPass = false;
$("#id").change(function(){
	idPass = false;
});

<%-- 이메일 검증 --%>
var emlPass = false;
$("#email").change(function(){
	emlPass = false;
});

<%-- 아이디, 이메일 중복체크 --%>
function ovrlpCheck(dvsn){
	var idVal = "";
	var emlVal = "";
	if(dvsn == "id"){
		idVal = $("#id").val();
		
		if(idVal == "" || idVal == null) {
			alertMsg("id", "red", "아이디를 입력해주세요");
			$("#id").focus();
			idPass=false;
			return false;
		}
		if(!idChk.test(idVal)){
			alertMsg("id", "red", "4~20자의 영문 대소문자, 숫자로 입력해주세요");
			$("#id").focus();
			idPass = false;
			return false;
		}
		
	}else if(dvsn == "eml"){
		emlVal = $("#email").val();
		
		if(emlVal == "" || emlVal == null) {
			alertMsg("email", "red", "이메일을 입력해주세요");
			$("#email").focus();
			emlPass = false;
			return false;
		}
		if(!emlChk.test(emlVal)){
			alertMsg("email", "red", "이메일이 적합하지 않습니다");
			$("#email").focus();
			emlPass = false;
			return false;
		}	
	}
	
	$.ajax({
		method : "POST",
		url : "/mbr/mbr0052/ovrlpCheck.do",
		data : {"id" : idVal, "email" : emlVal},
		dataType : "JSON",
		success : function(data){
			if(data.result == "fail"){
				alert(data.msg);
			}else{
				if(data.cnt == 0){
					alertMsg(data.dvsn, "green", data.msg);
					if(data.dvsn == "id"){
						idPass = true;
					}else if(data.dvsn == "email"){
						emlPass = true;
					}
				}else{
					alertMsg(data.dvsn, "red", data.msg);
					if(data.dvsn == "id"){
						idPass = false;
					}else if(data.dvsn == "email"){
						emlPass = false;
					}
				}
			}
		},error : function(req, text){
			alert("중복확인이 실패하였습니다..");			
		}
	});
}

<%-- 유효성 체크 --%>
$("#btn_submit").bind("click", function(){
	
	if($("#id").val() == "" || $("#id").val() == null) {
		alertMsg("id", "red", "아이디를 입력해주세요");
		$("#id").focus();
		idPass=false;
		return false;
	}
	
	if(!idPass){
		alertMsg("id", "red", "아이디 중복검사를 해주세요");
		$("#id").focus();
		idPass=false;
		return false;
	}
	
	if($("#passwd").val() == "" || $("#passwd").val() == null){
		alertMsg("passwd", "red", "비밀번호를 입력해주세요");
		$("#passwd").focus();
		return false;
	}
	if(!pwChk.test($("#passwd").val())){
		alertMsg("passwd", "red", "4~20자의 영문 대소문자, 숫자, 특수문자로 입력해주세요");
		$("#passwd").focus();
		return false;
	}else{
		alertMsg("passwd", "green", "비밀번호가 적합합니다");
	}
	
	if($("#passwdRe").val() == "" || $("#passwdRe").val() == null){
		alertMsg("passwdRe", "red", "비밀번호 확인을 입력해주세요");
		$("#passwdRe").focus();
		return false;
	}
	if($("#passwd").val() != $("#passwdRe").val()){
		alertMsg("passwdRe", "red", "비밀번호가 일치하지 않습니다");
		$("#passwdRe").focus();
		return false;
	}else{
		alertMsg("passwdRe", "green", "비밀번호가 일치합니다");
	}
	
	if($("#owner").val() == "" || $("#owner").val() == null) {
		alertMsg("owner", "red", "대표자명을 입력해주세요");
		$("#owner").focus();
		return false;
	}else{
		alertMsg("owner");
	}
	if($("#email").val() == "" || $("#email").val() == null) {
		alertMsg("email", "red", "회사 이메일을 입력해주세요");
		$("#email").focus();
		emlPass = false;
		return false;
	}
	if(!emlPass){
		alertMsg("email", "red", "이메일 중복검사를 해주세요");
		$("#email").focus();
		emlPass = false;
		return false;
	}
	if($("#telo").val() != "" && $("#telo").val() != null){
		if(!telChk.test($("#telo").val())){
			alertMsg("telo", "red", "대표전화가 적합하지 않습니다");
			$("#telo").focus();
			return false;
		}else{
			alertMsg("telo");
		}	
	}else{
		alertMsg("telo");
	}
	if($("#fax").val() != "" && $("#fax").val() != null){
		if(!faxChk.test($("#fax").val())){
			alertMsg("fax", "red", "팩스번호가 적합하지 않습니다");
			$("#fax").focus();
			return false;
		}else{
			alertMsg("fax");
		}
	}else{
		alertMsg("fax");
	}
	if($("#addr1").val() == "" || $("#addr1").val() == null){
		alertMsg("addr1", "red", "주소를 검색해주세요");
		$("#addr1").focus();
		return false;
	}else{
		alertMsg("addr1");
	}
	
	if($("#addr2").val() == "" || $("#addr2").val() == null){
		alertMsg("addr1", "red", "상세주소를 입력해주세요");
		$("#addr2").focus();
		return false;
	}else{
		alertMsg("addr1");
	}
	
	if($("#name").val() == "" || $("#name").val() == null) {
		alertMsg("name", "red", "담당자명을 입력해주세요");
		$("#name").focus();
		return false;
	}else{
		alertMsg("name");
	}
	
	if($("#cell").val() == "" || $("#cell").val() == null){
		alertMsg("cell", "red", "담당자 휴대전화를 입력해주세요");
		return false;
	}
	
	if(!phnChk.test($("#cell").val())){
		alertMsg("cell", "red", "담당자 휴대전화가 적합하지 않습니다");
		$("#cell").focus();
		return false;
	}else{
		alertMsg("cell");
	}	
	
	if($("#tel").val() != "" && $("#tel").val() != null){
		if(!telChk.test($("#tel").val())){
			alertMsg("tel", "red", "전화번호가 적합하지 않습니다");
			$("#tel").focus();
			return false;
		}else{
			alertMsg("tel");
		}	
	}else{
		alertMsg("tel");
	}
	
	fncPageBoard('submit','joinProcess.do');
	return false;
});
</script>