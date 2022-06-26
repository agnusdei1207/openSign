<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<%
    pageContext.setAttribute("crcn", "\r\n"); 
    pageContext.setAttribute("br", "<br>");
%> 
<script type="text/javaScript">
var upChk="N";
var fncCdAdd3 = function(type){
	if(type =="insert"){		
		if($.trim($("#cCd_3").val()) == ""){
			alert("코드를 입력해 주세요.");
			$("#cCd_3").focus();
			return false;
		}		
		if($.trim($("#cCdNm_3").val()) == ""){
			alert("코드명을 입력해 주세요.");
			$("#cCdNm_3").focus();
			return false;
		}		
		$("#cCd").val($("#cCd_3").val());
		$("#cCdNm").val($("#cCdNm_3").val());
		$("#etc").val($("#etc_3").val());		
		formAction('${searchVO.pCd}','3',type);
		
	}else if(type =="update"){
		if($.trim($("#cCdNm_3_up").val()) == ""){
			alert("코드명을 입력해 주세요.");
			$("#cCdNm_3_up").focus();
			return false;
		}
		$("#cCd").val($("#cCd_3_up").val());
		$("#cCdNm").val($("#cCdNm_3_up").val());
		$("#inOutYn").val("N");
		$("#etc").val($("#etc_3_up").val());
		if($("#inOutYn_3_up").is(":checked")){
			$("#inOutYn").val("Y");
		}else{
			$("#inOutYn").val("N");
		}
		if(confirm("수정하시겠습니까?")){
			formAction('${searchVO.pCd}','3',type);
		}
	}else if(type =="delete"){
		$("#cCd").val($("#cCd_3_up").val());
		if(confirm("삭제하시겠습니까?")){
			formAction('${searchVO.pCd}','3',type);
		}
	}
}

var fncCdUpdate3= function(cCd,cCdNm,cCdEnm,etc,inOutYn){
	if(upChk == "Y"){
		alert("수정중인 코드를 완료해 주세요.");
		return false;
	}
	
	$("[ID^=code_3_]").removeClass("recode");
	$("#code_3_"+cCd).addClass("recode");
	
	var codeHtml = '<div class="code">';
		codeHtml += '<input type="text" class="text w12p"  id="cCd_3_up" placeholder="코드"value="'+cCd+'" readonly="readonly" />';
		codeHtml += '<input type="text" class="text w43p" id="cCdNm_3_up" placeholder="코드명" value="'+cCdNm+'" maxlength="20" />';	
		codeHtml += '<input type="text" class="text w43p" id="etc_3_up" placeholder="비고"  value="'+etc+'" maxlength="50" />';
		codeHtml += '<span class="btn_code">';
		codeHtml += '<a href="javascript:void(0)"  class="btn btn_sml btn_rewrite" onclick="fncCdAdd3(\'update\');" >수정</a>  ';
		codeHtml += '<a href="javascript:void(0)"  class="btn btn_sml btn_del" onclick="fncCdAdd3(\'delete\');" >삭제</a>  ';
		codeHtml += '<a href="javascript:void(0)"  class="btn btn_sml btn_cancel" onclick="fncCdSel(\'${searchVO.pCd}\',\'3\');" >취소</a>';
		codeHtml += '</span>'; 
		codeHtml += '</div>';
	$("#code_3_"+cCd).html(codeHtml);
	upChk="Y";
}

</script>
<ul class="list_code02 last">
	<c:forEach var="result" items="${cdList }" varStatus="status">
		<li id="code_3_${result.cCd }">
			<a href="javascript:void(0)" onclick="fncCdSel('${result.cCd }','4');" class="codeSel">
				${result.cCd }.${result.cCdNm }<c:if test="${not empty result.etc }">(${result.etc })</c:if>
			</a>
			<span class="code_btns">
				<c:choose>
					<c:when test="${status.first }">
						 <a href="#" onclick="alert('첫번째 항목입니다.');return false;">▲</a>
					</c:when>
					<c:otherwise>
						 <a href="#" onclick="fncSort('up','${result.pCd }','${result.cCd }','${result.cdNo }','3');">▲</a>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${status.last }">
						 <a href="#" onclick="alert('마지막 항목입니다.');return false;">▼</a>
					</c:when>
					<c:otherwise>
						 <a href="#" onclick="fncSort('down','${result.pCd }','${result.cCd }','${result.cdNo }','3');" >▼</a>
					</c:otherwise>
				</c:choose>
			 	<a href="javascript:void(0)"  class="btn btn_sml btn_rewrite" onclick="fncCdUpdate3('${result.cCd }','${result.cCdNm }','${fn:trim(result.cCdEnm)}','${result.etc }')">수정</a>
			 </span>
		</li>	 
	</c:forEach>
</ul>
<br>
<div class="code_box">
	<input type="text" class="text w12p" id="cCd_3" placeholder="코드" style="width:40px;" maxlength="6" />
	<input type="text" class="text w43p" id="cCdNm_3" placeholder="코드명" maxlength="20"/>
	<input type="text" class="text w30p" id="etc_3" placeholder="비고" maxlength="50"/>  
	<a href="#"  class="btn btn_sml02 btn_add" onclick="fncCdAdd3('insert');" >추가</a>
</div>
