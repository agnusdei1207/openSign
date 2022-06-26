<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<script type="text/javascript" src="/publish/mgr/js/board.js"></script>
<script type="text/javaScript">
$(document).ready(function(){
	fncMenuCdSel('${searchVO.urlPtn}','1');
	
	$("#urlPtn").change(function(){
		fncMenuCdSel($('#urlPtn').val(),'1');
	});
});
<%-- 처음 소분류와 중분류 값들 보여지게하는것  --%>
var fncMenuCdSel = function(code,num){
	if(code == "frt0045"){
		if(confirm("교육과정 관리로 이동하시겠습니까?")){
			window.location.href="/mgr/mgr0029/list.do";
		}
		return false;
	}
	$("#lvl").val(num);
	$("#pMenuCd").val(code);
	
	$("[ID^=menu_"+(Number(num)-1)+"_]").removeClass("on");
	$("#menu_"+(Number(num)-1)+"_"+code).addClass("on");
	$.ajax({
	    method: "POST",
	    url: "view.do",	    
	    data : $("#defaultFrm").serialize(),
	    dataType: "html",  
	    success: function(data) { 
	    	var numChk = Number($("#lvl").val());
	    	$("#menuList_"+numChk).html(data);
	    	if(num == '1'){
	    		$("#menuDept1Cd").val("");
	   			$("#menuDept2Cd").val("");
	    		$("#menuList_2").html('');
	    		$("#menuList_3").html('');
	    	}else if(num == '2'){
	    		$("#menuDept1Cd").val(code);
	   			$("#menuDept2Cd").val("");
	    		$("#menuList_3").html('');
	   		}else{
	   			$("#menuDept2Cd").val(code);
	   		}
	    }
	});	
}

<%-- 등록 ,수정, 삭제 처리  --%>
var formAction = function(code,num,type){
	$("#lvl").val(num);
	$("#pMenuCd").val(code);
	$.ajax({
	    method: "POST",
	    url: type+"Proc.do",	    
	    data : $("#defaultFrm").serialize(),
	    dataType: "json",  
	    success: function(data) { 
	    	var callType= data.type;
			alert(callType+"되었습니다.");
			fncMenuCdSel(data.searchVO.pMenuCd,data.searchVO.lvl);
			if(type == "update" || type == "delete"){
				view_hide(1);
			}
	    }
	});
}

<%-- 위아래 처리 --%>
var fncSort = function(type,pMenuCd,menuCd,menuNo,lvl){
	$("#lvl").val(lvl);
	$("#pMenuCd").val(pMenuCd);
	$("#menuCd").val(menuCd);
	$("#menuNo").val(menuNo);  
	$.ajax({
	    method: "POST",
	    url: type+"Proc.do",
	    
	    data : $("#defaultFrm").serialize(),
	    dataType: "json",  
	    success: function(data) { 
			fncMenuCdSel(data.searchVO.pMenuCd,data.searchVO.lvl);
	    }
	});
}

function fncMenuUpDel(type, divn, boardDivn){
	if(type =="update"){
		if($.trim($("#menuNm_up").val()) == ""){
			alert("메뉴명을 입력해 주세요.");
			$("#menuNm_up").focus();
			return false;
		}
		 
		if(divn.indexOf("frt") > -1 && $("#boardDivn_up").val() != "cb04"){
			if($("#boardDivn_up").val() != "" && $("#boardDivn_up").val() != null){
				if($("#boardCd_up").val() == "" || $("#boardCd_up").val() == null){
					alert("관리자 게시판을 선택해주세요");
					return false;
				}
			}
		}
		
		$("#menuSeq").val($("#menuSeq_up").val());
		$("#menuCd").val($("#menuCd_up").val());
		$("#menuNm").val($("#menuNm_up").val());
		$("#menuUrl").val($("#menuUrl_up").val());
		$("#boardDivn").val($("#boardDivn_up").val());
		$("#boardCd").val($("#boardCd_up").val());
		$("#etc").val($("#etc_up").val());
		$(".writeYn").each(function(){
			if($(this).prop("checked")){
				$("#writeYn").val($(this).val());		
			}	
		});
		$(".dsplYn").each(function(){
			if($(this).prop("checked")){
				$("#dsplYn").val($(this).val());		
			}	
		});
		
		var subDivn = "N";
		if($("#urlPtn").val() == "mgr"){
			if(boardDivn != null && boardDivn != ""){
				if(boardDivn != $("#boardDivn_up").val()){
					subDivn = "Y";
				}
			}
		}
		$("#subDivn").val(subDivn);		
		
		if(confirm("수정하시겠습니까?")){
			formAction($("#pMenuCd_up").val(),$("#lvl_up").val(),type);
		}
		
	}else if(type =="delete"){
		$("#menuSeq").val($("#menuSeq_up").val());
		if(confirm("삭제하시겠습니까?")){
			formAction($("#pMenuCd_up").val(),$("#lvl_up").val(),type);
		}
	}
}


var fncMenuCdUpdate= function(menuSeq){
	$("#menuSeq").val(menuSeq);
	$.ajax({
	    method: "POST",
	    url: "form.do",	    
	    data : $("#defaultFrm").serialize(),
	    dataType: "html",  
	    success: function(data) { 
	    	$("#display_view1").html(data);
	    	view_show(1);
	    }
	});	
}

var fncMenuCdAdd = function(num,pMenuCd){
	if($.trim($("#menuNm_"+num).val()) == ""){
		alert("메뉴명을 입력해 주세요.");
		$("#menuNm_"+num).focus();
		return false;
	}		
	$("#menuNm").val($("#menuNm_"+num).val());
	$("#addUrl").val($("#addUrl_"+num).val());	
	if(num == "1"){
		$("#menuDept1Cd").val("");
		$("#menuDept2Cd").val("");
	}else if(num == "2"){
		$("#menuDept2Cd").val("");
	}
	formAction(pMenuCd,num,'insert');
}

</script>
<div class = "content_box">
	
	<form:form commandName="searchVO" name="defaultFrm" id="defaultFrm" method="post" onsubmit="return false;">
		<input type="hidden" name="menuSeq" id="menuSeq" />
		<input type="hidden" name="pMenuCd" id="pMenuCd" />
		<input type="hidden" name="menuCd" id="menuCd" />
		<input type="hidden" name="menuNm" id="menuNm" />
		<input type="hidden" name="lvl" id="lvl" />
		<input type="hidden" name="menuNo" id="menuNo" /> 
		<input type="hidden" name="etc" id="etc" /> 
		<input type="hidden" name="menuUrl" id="menuUrl" /> 
		<input type="hidden" name="addUrl" id="addUrl" /> 
		<input type="hidden" name="menuDept1Cd" id="menuDept1Cd" /> 
		<input type="hidden" name="menuDept2Cd" id="menuDept2Cd" /> 
		<input type="hidden" name="boardDivn" id="boardDivn" /> 
		<input type="hidden" name="boardCd" id="boardCd" /> 
		<input type="hidden" name="writeYn" id="writeYn" />
		<input type="hidden" name="dsplYn" id="dsplYn" />
		<input type="hidden" name="subDivn" id="subDivn" /> 
		<div class="search_box">
		<fieldset>
				<legend>검색</legend>
				<div class="search_basic">
					<table class="type02">
						<colgroup>
							<col>
							<col>
						</colgroup>
						<tbody>
							<tr>
								<td>
									<strong class="tit">구분</strong>						
									<form:select path="urlPtn" id="urlPtn" title="구분 선택" cssClass="selec" cssStyle="width:132px;">
										<c:if test="${fn:length(menuGrpList) gt 0 }">
											<c:forEach var="list" items="${menuGrpList }">
												<form:option value="${list.cCd }" label="${list.cCdNm }"/>
											</c:forEach>
										</c:if>
									</form:select>
								</td>
								<td>
								</td>
							</tr>		
						</tbody>
					</table>
					<span class="search_btns">
						<button type="button" class="btn btn_search" onclick="fncMenuCdSel($('#urlPtn').val(),'1');">검색</button>
					</span>
				</div>
			</fieldset>
		</div>
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
						<th scope="col">1차메뉴</th>
						<th scope="col">2차메뉴</th>	
						<th scope="col">3차메뉴</th>				
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="code" id="menuList_1">
						</td>
						<td class="code" id="menuList_2">
						</td>
						<td class="code" id="menuList_3">
						</td>						
					</tr>
				</tbody>
			</table>
		</div>		
	</form:form>
</div>
