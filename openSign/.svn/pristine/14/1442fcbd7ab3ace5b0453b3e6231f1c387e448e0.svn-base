<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<script type="text/javascript" src="/publish/mgr/js/board.js"></script>
<script type="text/javaScript">
$(document).ready(function(){
	fncCdSel('${searchVO.pCd}','1');
});
<%-- 처음 소분류와 중분류 값들 보여지게하는것  --%>
var fncCdSel = function(code,num){
	$("#cdCl").val(num);
	$("#pCd").val(code);
	
	$("[ID^=code_"+(Number(num)-1)+"_]").removeClass("on");
	$("#code_"+(Number(num)-1)+"_"+code).addClass("on");
	$.ajax({
	    method: "POST",
	    url: "view.do",	    
	    data : $("#defaultFrm").serialize(),
	    dataType: "html",  
	    success: function(data) { 
	    	var numChk = Number($("#cdCl").val());
	    	$("#codeList_"+numChk).html(data);
	    	if(num == '1'){
	    		$("#codeList_2").html('');
	    		$("#codeList_3").html('');
	    		$("#codeList_4").html('');
	    	}else if(num == '2'){
	    		$("#codeList_3").html('');
	    		$("#codeList_4").html('');
	   		}else if(num == '3'){
	    		$("#codeList_4").html('');
	   		}
	    }
	});	
}

<%-- 등록 ,수정, 삭제 처리  --%>
var formAction = function(code,num,type){
	$("#cdCl").val(num);
	$("#pCd").val(code);
	$.ajax({
	    method: "POST",
	    url: type+"Proc.do",	    
	    data : $("#defaultFrm").serialize(),
	    dataType: "json",  
	    success: function(data) { 
	    	var callType= data.type;
	    	if(callType == "OVER"){
	    		alert("중복된 코드가 있습니다.");
	    		return false;
	    	}else{
				alert(callType+"되었습니다.");
				fncCdSel(data.searchVO.pCd,data.searchVO.cdCl);
	    	}
	    }
	});
}

<%-- 위아래 처리 --%>
var fncSort = function(type,pCd,cCd,cdNo,cdCl){
	$("#cdCl").val(cdCl);
	$("#pCd").val(pCd);
	$("#cCd").val(cCd);
	$("#cdNo").val(cdNo);
	$.ajax({
	    method: "POST",
	    url: type+"Proc.do",
	    
	    data : $("#defaultFrm").serialize(),
	    dataType: "json",  
	    success: function(data) { 
			fncCdSel(data.searchVO.pCd,data.searchVO.cdCl);
	    }
	});
}
</script>
<div class = "content_box">
	<form:form commandName="searchVO" name="defaultFrm" id="defaultFrm" method="post" onsubmit="return false;">
		<input type="hidden" name="pCd" id="pCd" />
		<input type="hidden" name="cCd" id="cCd" />
		<input type="hidden" name="cCdNm" id="cCdNm" />
		<input type="hidden" name="cCdEnm" id="cCdEnm" />
		<input type="hidden" name="cdCl" id="cdCl" />
		<input type="hidden" name="cdNo" id="cdNo" /> 
		<input type="hidden" name="inOutYn" id="inOutYn" /> 
		<input type="hidden" name="etc" id="etc" /> 
		<%-- tbl --%>
		<div class="tbl_wrap">
			<table class="tbl_col_type01 no_hover">
				<caption>목록(번호,제목,첨부,작성자,작성일,조회 로 구성)</caption>
				<colgroup>
					<col style="width:33%;">
					<col style="width:33%;">
				</colgroup>
				<thead>
					<tr>
						<th scope="col">1차코드</th>
						<th scope="col">2차코드</th>	
						<th scope="col">3차코드</th>				
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="code" id="codeList_1">
						</td>
						<td class="code" id="codeList_2">
						</td>
						<td class="code" id="codeList_3">
						</td>						
					</tr>
				</tbody>
			</table>
		</div>		
		<div class="tbl_wrap mar_t30">
			<table class="tbl_col_type01 no_hover">
				<caption>목록(번호,제목,첨부,작성자,작성일,조회 로 구성)</caption>
				<colgroup>
					<col style="width:100%;">
				</colgroup>
				<thead>
					<tr>
						<th scope="col">4차코드</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="code" id="codeList_4">
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</form:form>
</div>
