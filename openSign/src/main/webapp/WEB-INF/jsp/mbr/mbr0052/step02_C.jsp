<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<script type="text/javascript" src="/publish/frt/js/board.js"></script>
<form id="defaultFrm" name="defaultFrm" method="post" onsubmit="return false;">
	<input type="hidden" id="kind" name="kind" value="${searchVO.kind }"/>
	<input type="hidden" id="schEtc01" name="schEtc01" value="${searchVO.schEtc01 }"/>
	<input type="hidden" id="schEtc02" name="schEtc02"/>
	<div class="cont_box">
		<div class="join_step">
			<ul class="clear">
				<li><strong class="step1"><i></i><span><span>STEP1</span>약관동의</span></strong></li>
				<li class="on"><strong class="step2"><i></i><span><span>STEP2</span>본인인증</span></strong></li>
				<li><strong class="step3"><i></i><span><span>STEP3</span>정보입력</span></strong></li>
				<li><strong class="step4"><i></i><span><span>STEP4</span>가입완료</span></strong></li>
			</ul>
		</div>
		<h3 class="md_tit"><span>기업회원 확인</span></h3>
		<div class="auth_box">
			<div class="ico"><img src="/publish/frt/images/sub/i_auth.png" alt=""></div>
			<h3 class="tit">사업자등록번호 입력하기</h3>
			<div class="tbl_wrap">
				<table class="auth_tbl">
					<caption></caption>
					<colgroup>
						<col style="width:30%;">
						<col>
					</colgroup> 
					<tbody>
						<tr>
							<th scope="row" class="r"><strong class="th_subj">회사명</strong></th>
							<td colspan="" class="l" style="padding-bottom: 10px;">
							    <input type="text" id="busiName" name="busiName" class="text pc_w80p" maxlength="50" placeholder="회사명을 입력해주세요"/>
							</td>
						</tr>
						<tr>
							<th scope="row" class="r"><strong class="th_subj">사업자등록번호</strong></th>
							<td colspan="" class="l">
							    <input type="text" id="busiNo" name="busiNo" class="text pc_w80p numOnly" maxlength="10" placeholder="'-'를 제외한 숫자만 입력해 주세요"/>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="step_btnarea">
				<a href="javascript:void(0);" class="btn btn_prevstep" onclick="fncPageBoard('list','step01.do');">이전단계</a>
				<a href="javascript:void(0);" class="btn btn_nextstep" onclick="ovrlpCheck()">중복확인</a>
			</div>
		</div>
	</div>
</form>
</div>
<script type="text/javascript">
<%-- 사업자등록번호 정규표현식 --%>
function busiChk(val){
	var chkVal = "137137135"; //인증키값
	var arrChk = chkVal.split("");
	var arrVal = val.split("");
	var sumVal = 0;
	var chk = false;
	if(val.length != 10){
		return false;
	}
	for(var i=0; i < 9; i++){
		sumVal += Number(arrChk[i])*Number(arrVal[i]);
		if(i==8){
			sumVal += Number(arrChk[i])*Number(arrVal[i])/10
			sumVal = Math.floor(sumVal);
		}
	}
	if(arrVal[9] == (10-sumVal%10)){
		return true;
	}else{
		return false;
	}
}
<%-- 아이디, 이메일, 사업자번호 중복체크 --%>
function ovrlpCheck(){
	var busiVal = "";
	busiVal = $("#busiNo").val();
	
	if($("#busiName").val() == "" || $("#busiName").val() == null) {
		alert("회사명을 입력해주세요");
		$("#busiName").focus();
		return false;
	}
	if(busiVal == "" || busiVal == null) {
		alert("사업자등록번호를 입력해주세요");
		$("#busiNo").focus();
		return false;
	}
	var busiNochk = busiChk(busiVal);
	if(!busiNochk){
		alert("사업자등록번호가 적합하지 않습니다");
		$("#busiNo").focus();
		return false;
	}	
	
	$.ajax({
		method : "POST",
		url : "/mbr/mbr0052/ovrlpCheck.do",
		data : {"busiNo" : busiVal},
		dataType : "JSON",
		success : function(data){
			if(data.cnt == 0){
				alert("사업자등록번호가 확인되었습니다\n가입을 진행합니다");
				fncPageBoard('list','step03.do','Y','schEtc02');
			}else if(data.cnt > 0){
				alert("이미 가입된 사업자등록번호입니다");
				$("#busiNo").focus();
			}
		},error : function(req, text){
			alert("중복확인이 실패하였습니다..");			
		}
	});
}
</script>