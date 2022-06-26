<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<script type="text/javascript" src="/publish/mgr/js/board.js"></script>
<script type="text/javascript">
var overChk=false;
$(document).ready(function(){	
	  
	fileFrm.action="/atch/fileUpload.do";
	fileFrm.target="atchFileIdFrame";
	fileFrm.submit();
	
	$("#btn_submit").on("click", function(){
		
		<c:if test="${searchVO.procType ne 'update'}">
			if(overChk == false){
				alert("아이디 중복확인을 해 주세요.");
				return false;
			}
			if($("#pwd_1").val() != $("#pwd_2").val()){
				alert("패스워드가 동일하지 않습니다.");
				$("#pwd_1").focus();
				return false;			
			}
		</c:if>
		
		<c:if test="${searchVO.procType eq 'update'}">
			if($("#pwdChk").prop("checked")){
				if($("#pwd_1").val() == ""){
					alert("패스워드를 입력해 주세요.");
					$("#pwd_1").focus();
					return false;			
				}
				
				if($("#pwd_1").val() != $("#pwd_2").val()){
					alert("패스워드가 동일하지 않습니다.");
					$("#pwd_1").focus();
					return false;			
				}
			}
		</c:if>
		
		if($("#name").val() == "" || $("#name").val() == null){
			alert('성명을 입력해 주세요.');
			$("#name").focus();
			return false;
		}
		if($("#authCode").val() == "" || $("#authCode").val() == null){
			alert('권한을 선택해 주세요.');
			return false;
		}
		if($("#part").val() == "" || $("#part").val() == null){
			alert('부서를 선택해주세요.');
			$("#part").focus();
			return false;  
		}
		if($("#position").val() == "" || $("#position").val() == null){
			alert('직급을 선택해 주세요.');
			return false;
		} 
		
	
		fncPageBoard('submit','${searchVO.procType}Proc.do');
		return false;
	});
	
});  

  
<%-- 패스워드 변경시 disabled 해제 처리  --%>
var fncPwdChk = function(){
	if($("#pwdChk").prop("checked")){
		$(".th_pw").addClass("th_tit");
		$("INPUT[ID^=pwd_]").attr("disabled" , false);
	}else{
		$(".th_pw").removeClass("th_tit");
		$("INPUT[ID^=pwd_]").attr("disabled" , true);
	}
}

<%-- 아이디 중복확인 AJAX --%>
var fncUserIdOverlap = function(){
	if($("#id").val() == null || $("#id").val() == ''){
		alert('아이디를 입력해주세요');
		$("#id").focus();
		return false;
	}
	$.ajax({
	    method: "POST",
	    url: "userIdOverlap.do",
	    data: {id : $("#id").val()},  
	    dataType: "json",  
	    success: function(data) { 
	        
	    	var overCnt = data.overCnt;
	    	if(overCnt < 1){
	    		alert("가입가능한 아이디입니다.");
	    		overChk=true;
	    		return false;
	    	}else{
	    		alert("중복된 아이디가 있습니다.");
	    		overChk=false;
	    		return false;
	    	}
	    	
            
	    },
	    error: function(jqXHR, textStatus, errorThrown) {
	        alert("에러");
	    }
	});
}

<%-- 아이디 재입력시 중복확인 false --%>
var fncUserIdKeyUp = function(){
	overChk=false;
} 
</script>
<div class="content_box">
	<form id="fileFrm" name="fileFrm" method="post">
		<input type="hidden" id=boradFileId name="atchFileId" value="${mgr0006VO.atchFileId }" />
		<input type="hidden" id="fileCnt" name="fileCnt" value="5"/>
		<input type="hidden" id="atchFileIdNm" name="atchFileIdNm" value="atchFileId"/>
		<input type="hidden" id="updateType" name="updateType" value="upload"/>
		<input type="hidden" id="parentSeq" name="parentSeq" value="${mgr0006VO.seq }"/>
	</form>
	<form:form commandName="mgr0006VO" name="defaultFrm" id="defaultFrm" method="post">
		<form:hidden path="seq" id="seq"/>
		<form:hidden path="atchFileId" id="atchFileId"/> 
		<form:hidden path="atchFileId2" id="atchFileId2"/> 
		<jsp:directive.include file="/WEB-INF/jsp/cmmn/inc/incSearchForm.jsp"/>
		<%-- tbl --%>
		<div class="tbl_wrap">
			<table class="tbl_row_type01">
				<caption>내용(제목, 작성자, 작성일 등으로 구성)</caption>
				<colgroup>
					<col style="width:20%;">
					<col style="width:30%;">
					<col style="width:20%;">
					<col >
				</colgroup>       
				<tbody>
					<tr>
						<th scope="row"><strong class="th_tit">ID</strong></th>
						<td>
							<c:choose> 
								<c:when test="${searchVO.procType eq 'update' }">
									${mgr0006VO.id } <form:hidden path="id" id="id" />
								</c:when>
								<c:otherwise>       
									<form:input path="id" id="id" title="아이디"  cssClass="text w80p"  maxlength="10" onkeyup="javascript:fncUserIdKeyUp();" required="true"/>
									<a href="javascript:void(0);" class="btn btn_sml btn_overlap" onclick="javascript:fncUserIdOverlap();">중복확인</a>
								</c:otherwise>  
							</c:choose>
						</td>     
						<th scope="row"><strong class="th_tit">성명</strong></th>
						<td>
							<c:choose>
								<c:when test="${searchVO.procType eq 'update' }">  
									${mgr0006VO.name }<form:hidden path="name" id="name"/>
								</c:when> 
								<c:otherwise>
									<form:input path="name" id="name"  cssClass="text w100p"  maxlength="50" title="성명" required="true" />
								</c:otherwise>     
							</c:choose>
						</td>  
					</tr> 
					<tr>
						<th scope="row"><strong class="${searchVO.procType eq 'insert' ? 'th_tit' : '' } th_pw">패스워드</strong></th>
						<td>
							<input type="password" name="pwd" id="pwd_1" title="패스워드" class="text w100p"  maxlength="50" ${searchVO.procType eq 'insert' ? 'required="required"' : 'disabled="disabled"' }>
							<c:if test="${searchVO.procType eq 'update'}">
								<label for="pwdChk" class="pwd_label"><input type="checkbox" class="checkbox" name="pwdChk" id="pwdChk" value="CHK" onchange="fncPwdChk();"/><span class="pwd_tit">※ 패스워드 변경시 체크</span></label>
							</c:if>
						</td>
						<th scope="row"><strong class="${searchVO.procType eq 'insert' ? 'th_tit' : '' } th_pw">패스워드 확인</strong></th>
						<td>
							<input type="password" id="pwd_2" title="패스워드" class="text w100p"  maxlength="50" ${searchVO.procType eq 'insert' ? 'required="required"' : 'disabled="disabled"' }>
						</td>
					</tr>				 
					<tr>
						<th scope="row"><strong class="th_tit th_tit">권한</strong></th>
						<td>
							<c:choose> 
								<c:when test="${loginVO.authCode eq '1' }">
									<form:select path="authCode" id="authCode" title="권한" cssClass="w50p" required="true">  
									<form:option value="" label="선택"/>
									<c:forEach var="result" items="${authList }">  
										<form:option value="${result.authCode }" label="${result.authCode }"/>
									</c:forEach>
								</form:select>
								</c:when>
								<c:otherwise>
									<input type="hidden" name="authCode" id="authCode" title="권한" value="${mgr0006VO.authCode }"/>
									${mgr0006VO.authCodeNm }
								</c:otherwise>
							</c:choose>
						</td>
						<th scope="row"><strong class="th_tit">부서</strong></th>
						<td>    
							<select  name="part" id="part" class="w50p">  
								<option value="">부서 선택</option>    
								<c:if test="${fn:length(partList) gt 0}">    
									<c:forEach var="part" items="${partList }">
										<option value="${part.cCd }">${part.cCdNm }</option>
									</c:forEach>
								</c:if>
							</select>
						</td> 
					</tr>       
					<tr>
						<th scope="row"><strong class="th_tit">직급</strong></th>
						<td>     
							<select  name="position" id="position" class="w50p">  
								<option value="">직급 선택</option>    
								<c:if test="${fn:length(positionList) gt 0}">    
									<c:forEach var="position" items="${positionList }">
										<option value="${position.cCd }">${position.cCdNm }</option>
									</c:forEach>
								</c:if>
							</select>
						</td>
						<th scope="row"><strong>메일주소</strong></th>
						<td>
							<c:choose>
								<c:when test="${searchVO.procType eq 'update' && mgr0006VO.autoYn eq 'Y' }">
									${mgr0006VO.email }
									<form:hidden path="email" id="email" />
								</c:when>
								<c:otherwise>
									<form:input path="email" id="email"  cssClass="text w100p" title="메일주소" maxlength="100" />
								</c:otherwise>
							</c:choose>
						</td>
						
					</tr>
					<tr>
						<th scope="row"><strong>전화번호</strong></th>
						<td>
							<c:choose>
								<c:when test="${searchVO.procType eq 'update' && mgr0006VO.autoYn eq 'Y' }">
									${mgr0006VO.tel }
									<form:hidden path="tel" id="tel" />
								</c:when>
								<c:otherwise>
									<form:input path="tel" id="tel" cssClass="text w100p numOnly" maxlength="11" placeholder="-를 빼고 입력해주세요."/>
								</c:otherwise> 
							</c:choose>
						</td>
						<th scope="row"><strong class="th_tit">휴대폰번호</strong></th>
						<td>
							<c:choose>
								<c:when test="${searchVO.procType eq 'update' && mgr0006VO.autoYn eq 'Y' }">
									${mgr0006VO.hp }
									<form:hidden path="hp" id="hp" />
								</c:when>
								<c:otherwise>
									<form:input path="hp" id="hp" cssClass="text w100p numOnly" maxlength="11" required="true" placeholder="-를 빼고 입력해주세요."/>
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
					<tr>
						<th scope="row"><strong>사진 이미지</strong></th>
						<td colspan="3">
							<iframe name="atchFileIdFrame" id="atchFileIdFrame" src="/atch/fileUpload.do?atchFileId=${mgr0006VO.atchFileId}&fileCnt=1&atchFileIdNm=atchFileId&updateType=imageUpload" style="width: 100%;" height="50" frameborder="0" title="파일 업로드 폼"></iframe>
						</td>
					</tr>
				</tbody>
			</table>      
		</div>
		<%-- //tbl --%>   
		<div class="btn_area">
			<a href="javascript:void(0);" id="btn_submit" class="btn btn_mdl btn_save" >저장</a> 
			<c:if test="${searchVO.procType eq 'update'}">
				<a href="javascript:void(0);" id="btn_del" class="btn btn btn_mdl btn_del" >삭제</a>  
			</c:if>
			<a href="javascript:void(0);" id="btn_list" class="btn btn_mdl btn_cancel" >취소</a>
		</div>						
	</form:form>
</div>

