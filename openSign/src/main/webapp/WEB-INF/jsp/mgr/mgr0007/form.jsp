<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<script type="text/javascript">
var overChk=false;
$(document).ready(function(){	
	
	$("#btn_submit").bind("click", function(){		
		if($("#id").val() == ""){
			alert("아이디를 입력해 주세요.");
			$("#id").focus();
			return false;			
		}		
		<c:if test="${searchVO.procType ne 'update'}">
			if(overChk == false){
				alert("아이디 중복확인을 해 주세요.");
				return false;
			}
		</c:if>
				
		if($("#name").val() == ""){
			alert("이름을 입력해 주세요.");
			$("#name").focus();
			return false;			
		}		
		board.submit();
		return false;
	});
	
	$("#btn_list").bind("click", function(){
		board.list();
		return false;
	});	
	$("#btn_del").bind("click", function(){
		board.del();
		return false;
	});	
	$("#btn_view").bind("click", function(){
		board.view();
		return false;
	});	
	$("#btn_view2").bind("click", function(){
		$("#sea").val($("#groupSeq").val());
		board.view();
		return false;
	});	
	
	<c:forEach var="menu" items="${menu }" varStatus="status">
		fncMenuAllChk('${menu.menuSeq}','','2');
	</c:forEach>

});

var process = "N";
var board = {
	submit : function() {
		if(process == "Y"){
			alert("처리중입니다. 잠시만 기다려주세요."); return false;    
		}
	     if(wrestSubmit(document.defaultFrm)){ 
			$("#defaultFrm").removeAttr("enctype");
			$("#defaultFrm").attr({"action" : "${searchVO.procType}Proc.do", "method" : "post", "target" : "_self"}).submit();
	    } 
	}, list : function(){
		$("#defaultFrm").attr({"action" : "list.do", "method" : "post", "target" : "_self"}).submit();
	}, del : function(){
		if(confirm("정말로 게시물을 삭제하시겠습니까?")){
			$("#defaultFrm").attr({"action" : "deleteProc.do", "method" : "post", "target" : "_self"}).submit();
		}
	}
  }
  

<%-- 권한그룹코드 중복확인 AJAX --%>
var fncCodeOverlap = function(){
	$.ajax({
	    method: "POST",
	    url: "codeOverlap.do",
	    data: {authCode : $("#authCode").val()},  
	    dataType: "json",   
	    success: function(data) { 	        
	    	var overCnt = data.overCnt;
	    	if(overCnt < 1){
	    		alert("사용가능한 코드입니다.");
	    		overChk=true;
	    		return false;
	    	}else{
	    		alert("중복된 코드입니다.");
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

<%-- 권한관련 체크여부  --%>
var fncMenuAllChk = function(seq,subSeq,chk){
	if(subSeq == ''){
		if($("#arrDepth1Menu_"+seq).prop("checked")){
			$("INPUT:CHECKBOX[ID^=arrDepth2Menu_"+seq+"_]").prop("disabled",false);			
			if(chk == '1'){
				$("INPUT:CHECKBOX[ID^=arrDepth2Menu_"+seq+"_]").each(function(){
					$(this).prop("checked",true);
				}) 
				$("INPUT:CHECKBOX[ID^=arrDepth3Menu_"+seq+"_]").each(function(){
					$(this).prop("checked",true);
				}) 
			}
			$("INPUT:CHECKBOX[ID^=arrDepth2Menu_"+seq+"_]").each(function(){
				if($("#arrDepth2Menu_"+seq+"_"+$(this).attr("data-menuSeq")).prop("checked")){
					$("INPUT:CHECKBOX[ID^=arrDepth3Menu_"+seq+"_"+$(this).attr("data-menuSeq")+"]").prop("disabled",false);
				}
			});
		}else{
			$("INPUT:CHECKBOX[ID^=arrDepth2Menu_"+seq+"_]").prop("disabled",true);
			$("INPUT:CHECKBOX[ID^=arrDepth2Menu_"+seq+"_]").prop("checked",false);
			$("INPUT:CHECKBOX[ID^=arrDepth3Menu_"+seq+"_]").prop("disabled",true);
			$("INPUT:CHECKBOX[ID^=arrDepth3Menu_"+seq+"_]").prop("checked",false);
		}
	}else{
		if($("#arrDepth2Menu_"+seq+"_"+subSeq).prop("checked")){
			$("INPUT:CHECKBOX[ID^=arrDepth3Menu_"+seq+"_"+subSeq+"]").prop("disabled",false);
			if(chk == '1'){
				$("INPUT:CHECKBOX[ID^=arrDepth3Menu_"+seq+"_"+subSeq+"]").each(function(){
					$(this).prop("checked",true);
				}) 
			}
		}else{
			$("INPUT:CHECKBOX[ID^=arrDepth3Menu_"+seq+"_"+subSeq+"]").prop("disabled",true);
			$("INPUT:CHECKBOX[ID^=arrDepth3Menu_"+seq+"_"+subSeq+"]").prop("checked",false);
		}
	}
}
</script>
<div class="content_box">
	<form:form commandName="mgr0007VO" name="defaultFrm" id="defaultFrm" method="post">
		<form:hidden path="seq" id="seq"/>
		<form:hidden path="pageIndex" id="pageIndex"/> 
		<jsp:directive.include file="/WEB-INF/jsp/cmmn/inc/incSearchForm.jsp"/>
		<%-- tbl --%>
		<div class="tbl_wrap">
			<table class="tbl_row_type01">
				<caption>내용(제목, 작성자, 작성일 등으로 구성)</caption>
				<colgroup>
					<col style="width:20%;">
					<col style="width:30%;">
					<col style="width:20%;">
					<col style="width:30%;">
				</colgroup>
				<tbody>
					<tr>
						<th scope="row"><strong class="th_tit">권한그룹코드</strong></th>
						<td><form:input path="authCode" id="authCode" cssClass="text w50p" /> <a href="javascript:void(0);" class="btn btn_sml btn_overlap" onclick="fncCodeOverlap();">중복확인</a></td>
						<th scope="row"><strong class="th_tit">권한그룹명</strong></th>
						<td><form:input path="authCodeNm" id="authCodeNm" cssClass="text w90p" /> </td>
					</tr>
					<tr>
						<th scope="row"><strong class="th_tit">사용구분</strong></th>
						<td colspan="3">
							<label><form:radiobutton path="useYn" id="useYn_Y" cssClass="radio" value="Y" /> 사용</label>
							<label><form:radiobutton path="useYn" id="useYn_N" cssClass="radio" value="N" /> 미사용</label>
						</td>
					</tr>
					<tr>
						<th scope="row" colspan="4" class="c">권한그룹설명</th>
					</tr>
					<tr>
						<td colspan="4" class="tbl_text">
							<form:textarea path="ctt" id="ctt" cssClass="txt_area" />
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		
		<div class="tbl_wrap mar_t20">
			<%-- <table class="tbl_row_type">
				<caption>내용(제목, 작성자, 작성일 등으로 구성)</caption>
				<colgroup>
					<col style="width:20%;">
					<col style="width:80%;">
					</colgroup>       
				<tbody>
					<c:forEach var="menu" items="${menu }" varStatus="status">
					 	<tr>
							<th scope="row"><strong ><input type="checkbox" class="checkbox" name="arrMenu" id="arrDepth1Menu_${menu.menuSeq }" value="${menu.menuSeq }" ${menu.menuChk eq 'Y' ? 'checked="checked"' : '' } onchange="javascript:fncMenuAllChk('${menu.menuSeq }','1');" /><label for="arrDepth1Menu_${menu.menuSeq }">${menu.menuNm }</label></strong></th>
							<td>
								<c:forEach var="subMenu" items="${menu.menuList }" varStatus="status">
									<label for="arrDepth2Menu_${menu.menuSeq }_${subMenu.menuSeq }"><input type="checkbox" class="checkbox" name="arrMenu" id="arrDepth2Menu_${menu.menuSeq }_${subMenu.menuSeq }" value="${subMenu.menuSeq }" ${subMenu.menuChk eq 'Y' ? 'checked="checked"' : '' } disabled="disabled" /> ${subMenu.menuNm }</label>
								</c:forEach>
							</td>
						</tr> 
					</c:forEach>
				</tbody>
			</table>   --%>
			
			<%-- 수정본 --%>	
			<table class="tbl_row_type01">
				<caption>내용(</caption>
				<colgroup>
					<col style="width:15%;">
					<col style="width:85%;">
				</colgroup>       
				<tbody>
					<c:forEach var="menu" items="${menu }" varStatus="status">
						<tr>
							<th scope="row" colspan="4"><strong class="authority_area"><input type="checkbox" class="checkbox" name="arrMenu" id="arrDepth1Menu_${menu.menuSeq }" value="${menu.menuCd }" ${menu.menuChk eq 'Y' ? 'checked="checked"' : '' } onchange="javascript:fncMenuAllChk('${menu.menuSeq }','','1');" /><label for="arrDepth1Menu_${menu.menuSeq }">${menu.menuNm }</label></strong></th>					
						</tr> 
						<c:forEach var="subMenu" items="${menu.menuList }" varStatus="status">
								<tr>					
									<td class="bg">
										<label for="arrDepth2Menu_${menu.menuSeq }_${subMenu.menuSeq }"><input type="checkbox" class="check checkbox" name="arrMenu" id="arrDepth2Menu_${menu.menuSeq }_${subMenu.menuSeq }" data-menuSeq = "${subMenu.menuSeq }" value="${subMenu.menuCd }" ${subMenu.menuChk eq 'Y' ? 'checked="checked"' : '' } disabled="disabled" onchange="javascript:fncMenuAllChk('${menu.menuSeq }','${subMenu.menuSeq }','1');" /> ${subMenu.menuNm }</label>
									</td>
									<td>
										<ul class="s_menu clear">
											<c:forEach var="subMenu2" items="${subMenu.menuList }" varStatus="status">
												<li><label for="arrDepth3Menu_${menu.menuSeq }_${subMenu.menuSeq }_${subMenu2.menuSeq}"><input type="checkbox" class="check checkbox" name="arrMenu" id="arrDepth3Menu_${menu.menuSeq }_${subMenu.menuSeq }_${subMenu2.menuSeq}" value="${subMenu2.menuCd }" ${subMenu2.menuChk eq 'Y' ? 'checked="checked"' : '' } disabled="disabled" /> ${subMenu2.menuNm }</label></li>
											</c:forEach>
										</ul>
									</td>
								</tr> 
						</c:forEach>
					</c:forEach>
				</tbody>
			</table>      
		</div>
		<%-- //tbl --%>   
		<div class="btn_area">
			<a href="javascript:void(0);" id="btn_submit" class="btn btn_mdl btn_${searchVO.procType eq 'update'? 'rewrite':'save' }" >${searchVO.procType eq 'update' ? '수정' : '저장' }</a> 
			<c:if test="${searchVO.procType eq 'update' }">
				<a href="javascript:void(0);" id="btn_del" class="btn btn btn_mdl btn_del" >삭제</a>
			</c:if>
			<a href="javascript:void(0);" id="btn_list" class="btn btn btn_mdl btn_cancel" >취소</a>
		</div>	
	</form:form>
</div>

