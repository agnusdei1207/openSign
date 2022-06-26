<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<c:set var="url" value="${requestScope['javax.servlet.forward.request_uri']}"/>
<script type="text/javascript" src="/publish/frt/js/board.js"></script>
<script type="text/javascript">
</script>
	<div class="cont_box">
		<form id="defaultFrm" name="defaultFrm" method="post" onsubmit="return false;">
		<input type="hidden" id="kind" name="kind" value="C"/>
		<input type="hidden" id="quitStatus" name="quitStatus" value="N"/>
		<input type="hidden" id="tchrYn" name="tchrYn" value="N"/>
		<div class="tbl_wrap">
			<div class="tit_area">
	            <div class="left"><h3 class="md_tit">기업회원 정보</h3></div>
	            <div class="right"><span class="essential_txt"><span>*</span>는 필수입력입니다.</span></div>
	        </div>
			<table class="join_tbl">
				<caption>기업회원 정보</caption>
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
		                    <input type="hidden" id="id" name="id" maxlength="10" value="${userVO.id }" />
                            <span style="font-weight: bold;">[ ${userVO.id } ]</span>
                        </td>
                        <th scope="row"><strong>회사명</strong></th>
						<td colspan="">
							<input type="hidden" id="busiName" name="busiName" value="${userVO.busiName }" />
							${userVO.busiName }
						</td>
					</tr>
					<tr>
					<tr>
                        <th scope="row"><strong class="pwnoTh">비밀번호</strong></th>
                        <td colspan="">
                            <input type="password" id="passwd" name="passwd" class="text pc_w60p m_w50p" maxlength="20" placeholder="4~20자의 영문 대소문자, 숫자, 특수문자"/>
                          　<input type="checkbox" id="passwdUpdate" class="mar_t5 cursor"><label for="passwdUpdate" class="cursor"><span class="text">변경하기</span></label>
                        </td>
                        <th scope="row"><strong class="pwnoTh">비밀번호 확인</strong></th>
                        <td colspan="">
                        	<input type="password" id="passwdRe" name="passwdRe" class="text pc_w60p" maxlength="20" />
                        </td>
                    </tr>
					<tr>
						<th scope="row"><strong>사업자등록번호</strong></th>
                        <td colspan="">
                        	<input type="hidden" id="busiNo" name="busiNo" value="${userVO.busiNo }" />
                            <span id="span_busiNo">${userVO.busiNo }</span>
                        </td>
						<th scope="row"><strong class="th_tit">대표자명</strong></th>
                        <td colspan="">
                            <input type="text" id="owner" name="owner" class="text pc_w60p" value="${userVO.owner }" maxlength="20" placeholder="대표자명을 입력해주세요"/>
                        </td>
					</tr>
					<tr>
						<th scope="row"><strong class="th_tit">종목</strong></th>
                        <td colspan="">
                            <input type="text" id="item" name="item" class="text pc_w60p" value="${userVO.item }" maxlength="100" placeholder="종목을 입력해주세요"/>
                        </td>
						<th scope="row"><strong class="th_tit">업태</strong></th>
                        <td colspan="">
                            <input type="text" id="conditions" name="conditions" class="text pc_w60p" value="${userVO.conditions }" maxlength="100" placeholder="업태를 입력해주세요"/>
                        </td>
					</tr>
					<tr>
						<th scope="row"><strong class="th_tit">회사 이메일</strong></th>
                        <td colspan="">
                            <input type="text" id="email" name="email" class="text pc_w60p" maxlength="50" value="${userVO.email }" placeholder="회사 이메일을 입력해주세요"/>
                            <a href="javascript:void(0)" class="btn btn_sml btn_confirm" onclick="ovrlpCheck('eml')" >중복확인</a>
                        </td>
                        <th scope="row"><strong>이메일 수신 여부</strong></th>
                        <td colspan="3">
							<input type="radio" id="mailReceive_y" name="mailReceive" class="cursor" value="Y" ${userVO.mailReceive eq 'Y' ? 'checked' : ''} /><label for="mailReceive_y" class="cursor">예</label>　
                        	<input type="radio" id="mailReceive_n" name="mailReceive" class="cursor" value="N" ${userVO.mailReceive eq 'N' ? 'checked' :	 empty userVO.mailReceive ? 'checked' : ''} /><label for="mailReceive_n" class="cursor">아니요</label>
                        </td>
					</tr>
					<tr>
						<th scope="row"><strong>대표전화</strong></th>
                        <td colspan="">
                            <input type="text" id="telo" name="telo" class="text pc_w60p numOnly" maxlength="11" value="${userVO.telo }" placeholder="'-'를 제외한 숫자만 입력해 주세요"/>
                        </td>
						<th scope="row"><strong>팩스번호</strong></th>
                        <td colspan="">
                            <input type="text" id="fax" name="fax" class="text pc_w60p numOnly" maxlength="11" value="${userVO.fax }" placeholder="'-'를 제외한 숫자만 입력해 주세요"/>
                        </td>
					</tr>
					<tr>
						<th scope="row"><strong class="th_tit">주소</strong></th>
                        <td colspan="3">
							<input type="text" id="post" name="post" class="text w100 c" maxlength="6" value="${userVO.post }" readonly="readonly" placeholder="우편번호" style="margin-right: 0px; padding: 0px;"/>
							<input type="text" id="addr1" name="addr1" class="text pc_w41p" maxlength="50" value="${userVO.addr1 }" readonly="readonly" placeholder="주소"/>
							<a href="javascript:void(0)" class="btn btn_sml btn_confirm" onclick="daum_post()">주소검색</a><br />
							<input type="text" id="addr2" name="addr2" class="text pc_w59p" maxlength="50"value="${userVO.addr2 }" placeholder="상세주소" style="margin-top:5px; margin-left: 0px;"/>
                        </td>
					</tr>
					<tr>
						<th scope="row"><strong>홈페이지</strong></th>
						<td colspan="">
							<input type="text" id="homepage" name="homepage" class="text pc_w60p" maxlength="50" value="${userVO.homepage }" placeholder="http://"/>
						</td>
						<th scope="row"><strong>담당자명</strong></th>
						<td colspan="">
							<input type="text" id="name" name="name" class="text pc_w60p" maxlength="20" value="${userVO.name }" placeholder="담당자명을 입력해주세요"/>
						</td>
					</tr>
					<tr>
						<th scope="row"><strong class="th_tit">담당자 휴대전화</strong></th>
                        <td colspan="">
                            <input type="text" id="cell" name="cell" class="text pc_w60p numOnly" maxlength="11" value="${userVO.cell }" placeholder="'-'를 제외한 숫자만 입력해 주세요"/>
                        </td>
                    	<th scope="row"><strong>담당자 전화번호</strong></th>
                        <td colspan="">
                            <input type="text" id="tel" name="tel" class="text pc_w60p numOnly" maxlength="11" value="${userVO.tel }" placeholder="'-'를 제외한 숫자만 입력해 주세요"/>
                        </td>
					</tr>
					<tr>
						<th scope="row"><strong>부서</strong></th>
						<td colspan="">
							<input type="text" id="takeStation" name="takeStation" class="text pc_w60p" maxlength="50" value="${userVO.takeStation }" placeholder="부서명(학부/학과)을 입력해주세요"/>
						</td>
						<th scope="row"><strong>직급</strong></th>
						<td colspan="">
							<input type="text" id="takePosition" name="takePosition" class="text pc_w60p" maxlength="50" value="${userVO.takePosition }" placeholder="직급(학년)을 입력해주세요"/>
						</td>
					</tr>
					<tr>
                        <th scope="row"><strong>회원사여부</strong></th>
                        <td colspan="3">
							<input type="radio" id="memType_y" name="memType" class="cursor" value="Y" ${userVO.memType eq 'Y' ? 'checked' : ''} /><label for="memType_y" class="cursor">회원사</label>　
                        	<input type="radio" id="memType_n" name="memType" class="cursor" value="N" ${userVO.memType eq 'N' ? 'checked' : empty userVO.memType ? 'checked' : ''} /><label for="memType_n" class="cursor">비회원사</label>
                        </td>
					</tr>
					<!-- <tr><td colspan="4" style="border-left: 0px;"></td></tr> -->
					<tr>
						<th scope="row" colspan=""><strong>탈퇴 사유</strong></th>
						<td colspan="3"><input type="text" id="quitContent" class="pc_w100p" placeholder="탈퇴시 입력해 주세요"/></td>
					</tr>
				</tbody>
			</table>
		</div>
		
		<div class="btn_area03">
			<a href="/mif/mif0090/main.do" class="btn btn_big btn_list">취소</a>
		    <a href="javascript:void(0);" class="btn btn_big btn_rewrite" id="btn_submit">수정</a>
		    <a href="javascript:void(0);" class="btn btn_big btn_del" onclick="fncQuitStatusN();">탈퇴</a>
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

$("#email").keypress(function(){
	if (window.event.keyCode == 13) {
		ovrlpCheck('eml');
	}
});

<%-- 탈퇴하기 --%>
function fncQuitStatusN(){
	if($("#quitContent").val() == null || $("#quitContent").val() == ""){
		alert("탈퇴 사유를 입력해주세요");
		$("#quitContent").focus();
		return false;
	}
	if(!confirm("탈퇴하시겠습니까?")){
		return false;
	}
	
	$.ajax({
		method : "POST",
		url : "quitStatusN.do",
		data : {"quitContent" : $("#quitContent").val()},
		dataType : "JSON",
		success : function(data){
			alert("탈퇴 되었습니다");
			window.location.replace("/frt/main.do");
		},error : function(req, text){
			alert("탈퇴 신청이 실패하였습니다..");			
		}
	});
}

<%-- 아이디, 색상, 메시지 입력하면 해당 input 옆에 유효성 메시지 표시 --%>
function alertMsg(mId, color, msg){
	$("#msg_"+mId).remove();
	if(color!=""&&color!=null&&msg!=""&&msg!=null){
		var msgHtml = '<span class="text" id="msg_'+mId+'" style="color:'+color+'">'+msg+'</span>';
		$("#"+mId).parent().append(msgHtml);
	}
}

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

<%-- 이메일 검증 --%>
var emlPass = true;
$("#email").change(function(){
	emlPass = false;
});
<%-- 비밀번호 변경 체크 --%>
var pwPass = false;
$("#passwdUpdate").click(function(){
	if($("#passwdUpdate").prop("checked")){
		pwPass = true;
		$(".pwnoTh").addClass("th_tit");
	}else{
		pwPass = false;
		$(".pwnoTh").removeClass("th_tit");
		alertMsg("passwd");
		alertMsg("passwdRe");
	}
});

<%-- 이메일 중복체크 --%>
function ovrlpCheck(dvsn){
	var emlVal = "";
	if(dvsn == "eml"){
		emlVal = $("#email").val();
		
		if(emlVal == "" || emlVal == null) {
			alertMsg("email", "red", "이메일을 입력해주세요");
			$("#email").focus();
			emlPass = false;
			return false;
		}
		if("${userVO.email}" == emlVal && "${userVO.email}" != "" && "${userVO.email}" != null){
			alertMsg("email", "green", "기존 이메일 입니다");
			emlPass = true;
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
		data : {"email" : emlVal},
		dataType : "JSON",
		success : function(data){
			if(data.result == "fail"){
				alert(data.msg);
			}else{
				if(data.cnt == 0){
					alertMsg(data.dvsn, "green", data.msg);
					if(data.dvsn == "email"){
						emlPass = true;
					}
				}else{
					alertMsg(data.dvsn, "red", data.msg);
					if(data.dvsn == "email"){
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
	
	if(pwPass){
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
	}
	
	if($("#owner").val() == "" || $("#owner").val() == null) {
		alertMsg("owner", "red", "대표자명을 입력해주세요");
		$("#owner").focus();
		return false;
	}else{
		alertMsg("owner");
	}
	if($("#item").val() == "" || $("#item").val() == null) {
		alertMsg("item", "red", "종목을 입력해주세요");
		$("#item").focus();
		return false;
	}else{
		alertMsg("item");
	}
	if($("#conditions").val() == "" || $("#conditions").val() == null) {
		alertMsg("conditions", "red", "업태를 입력해주세요");
		$("#conditions").focus();
		return false;
	}else{
		alertMsg("conditions");
	}
	if($("#email").val() == "" || $("#email").val() == null) {
		alertMsg("email", "red", "회사 이메일을 입력해주세요");
		$("#email").focus();
		emlPass = false;
		return false;
	}
	if(!emlPass){
		if("${userVO.email}" == $("#email").val() && "${userVO.email}" != "" && "${userVO.email}" != null){
			alertMsg("email", "green", "기존 이메일 입니다");
			emlPass = true;
		}else{
			alertMsg("email", "red", "이메일 중복검사를 해주세요");
			$("#email").focus();
			emlPass = false;
			return false;
		}
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
	
	if(pwPass == false){
		$("#passwd").val("");
		$("#passwdRe").val("");
	}
	
	fncPageBoard('submit','userInfoSubmit.do');
	return false;
});
</script>