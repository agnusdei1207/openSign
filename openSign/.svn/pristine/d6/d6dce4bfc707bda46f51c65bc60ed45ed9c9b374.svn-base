<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<script type="text/javaScript">
 var upChk="N";
var fncCdAdd = function(type){
	if(type =="insert"){		
		if($.trim($("#cCd_1").val()) == ""){
			alert("코드를 입력해 주세요.");
			$("#cCd_1").focus();
			return false;
		}		
		if($.trim($("#cCdNm_1").val()) == ""){
			alert("코드명을 입력해 주세요.");
			$("#cCdNm_1").focus();
			return false;
		}		
		$("#cCd").val($("#cCd_1").val());
		$("#cCdNm").val($("#cCdNm_1").val());
		$("#etc").val($("#etc_1").val());		
		formAction('${searchVO.pCd}','1',type);
		
	}else if(type =="update"){
		if($.trim($("#cCdNm_1_up").val()) == ""){
			alert("코드명을 입력해 주세요.");
			$("#cCdNm_1_up").focus();
			return false;
		}
		$("#cCd").val($("#cCd_1_up").val());
		$("#cCdNm").val($("#cCdNm_1_up").val());
		$("#etc").val($("#etc_1_up").val());
		if(confirm("수정하시겠습니까?")){
			formAction('0','1',type);
		}
		
	}else if(type =="delete"){
		$("#cCd").val($("#cCd_1_up").val());
		if(confirm("삭제하시겠습니까?")){
			formAction('0','1',type);
		}
	}
}

var fncCdUpdate= function(cCd,cCdNm,cCdEnm,etc){
	if(upChk == "Y"){
		alert("수정중인 코드를 완료해 주세요.");
		return false;
	}	
	$("[ID^=code_1_]").removeClass("recode");
	$("#code_1_"+cCd).addClass("recode");
		
    var codeHtml = '<div class="code">';
		codeHtml += '<input type="text" class="text w12p"  id="cCd_1_up" placeholder="코드" value="'+cCd+'" readonly="readonly" />';
		codeHtml += '<input type="text" class="text w43p" id="cCdNm_1_up" placeholder="코드명"  value="'+cCdNm+'" maxlength="20" />';
	 	codeHtml += '<input type="text" class="text w43p" id="etc_1_up" placeholder="비고"  value="'+etc+'" maxlength="50" />'; 
		codeHtml += '<span class="btn_code">';
		codeHtml += '<a href="javascript:void(0)"  class="btn btn_sml02 btn_rewrite" onclick="fncCdAdd(\'update\');" >수정</a>  ';
		codeHtml += '<a href="javascript:void(0)"  class="btn btn_sml02 btn_del" onclick="fncCdAdd(\'delete\');" >삭제</a>  ';
		codeHtml += '<a href="javascript:void(0)"  class="btn btn_sml02 btn_cancel" onclick="fncCdSel(\'${searchVO.pCd}\',\'1\');" >취소</a>';
		codeHtml += '</span>'; 
		codeHtml += '</div>';
	$("#code_1_"+cCd).html(codeHtml);
	upChk="Y";
} 
</script>
<ul class="list_code02">
	<c:forEach var="result" items="${cdList}" varStatus="status">
		<li id="code_1_${result.cCd }">
			<a href="javascript:void(0)" onclick="fncCdSel('${result.cCd }','2');" class="codeSel">
				${result.cCd }.${result.cCdNm }<c:if test="${not empty result.etc }">(${result.etc })</c:if>
			</a>			
			<span class="code_btns">
				<c:choose>
					<c:when test="${status.first }">
						 <a href="#" onclick="alert('첫번째 항목입니다.');return false;">▲</a>
					</c:when>
					<c:otherwise>
						 <a href="#" onclick="fncSort('up','${result.pCd }','${result.cCd }','${result.cdNo }','1');">▲</a>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${status.last }">
						 <a href="#" onclick="alert('마지막 항목입니다.');return false;">▼</a>
					</c:when>
					<c:otherwise>
						 <a href="#" onclick="fncSort('down','${result.pCd }','${result.cCd }','${result.cdNo }','1');" >▼</a>
					</c:otherwise>
				</c:choose>
			 	<a href="javascript:void(0)"  class="btn btn_sml btn_rewrite" onclick="fncCdUpdate('${result.cCd }','${result.cCdNm }','${fn:trim(result.cCdEnm)}','${result.etc }')">수정</a>
			 </span>
		</li>	
	</c:forEach>						
</ul> 
<br>
<div class="code_box"> 
	<input type="text" class="text w12p" id="cCd_1" placeholder="코드" style="width:40px;" maxlength="2" />
	<input type="text" class="text w43p" id="cCdNm_1" placeholder="코드명" maxlength="20"/>
	<input type="text" class="text w30p" id="etc_1" placeholder="비고" maxlength="50"/> 
	<a href="#"  class="btn btn_sml02 btn_add" onclick="fncCdAdd('insert');" >추가</a>
</div> 
