<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
 
<div class="content_box">
	<form name="defaultFrm" id="defaultFrm" method="post">
		<input type="hidden" name="elSeq" id="elSeq" value="${mgr0117VO.elSeq }"/>     
		<input type="hidden" name="atchFileId" id="atchFileId"  value="${mgr0117VO.atchFileId }"/>     
		<input type="hidden" name="userSeq" id="userSeq" value="${mgr0117VO.userSeq }"/>     
		<jsp:directive.include file="/WEB-INF/jsp/cmmn/inc/incSearchForm.jsp"/>
		<div class="tbl_wrap"> 
			<table class="tbl_row_type01">    
				<caption>내용</caption>   
				<colgroup>
					<col style="width:20%;">  
					<col style="width:30%;">     
					<col style="width:20%;">            
					<col style="width:30%;">    
				</colgroup>       
				<tbody>        
					<tr>               
						<th scope="row"><strong>상태 </strong></th>                 
						<td colspan="3">            
							<c:choose>  
								<c:when test="${loginVO.authCode eq '1' }">                
									<select name="state" id="state" style="width:192px;">
										<option value="N" ${mgr0117VO.state eq 'N' ? 'selected="selected"' : '' }>미확인</option>
										<option value="Y" ${mgr0117VO.state eq 'Y' ? 'selected="selected"' : '' }>확인</option> 
									</select>
								</c:when>        
								<c:otherwise>      
									${empty mgr0117VO.state ? '미확인' : mgr0117VO.state eq 'N' ? '미확인' : '확인'}
								</c:otherwise>          
							</c:choose>         
							<c:if test="${loginVO.authCode eq '1' }">       
								<a href="javscript:void(0);" onclick="fncUpdateState();" class="btn btn_mdl btn_save" style="background-color:#308cde;border-color: #308cde;margin-left:3px;">변경</a>
   							</c:if>    
						</td>          
				 	<tr>          
						<th scope="row"><strong class="th_tit">사용일</strong></th>  
						<td>          
							<input type="hidden" name="dateCondition" id="dateCondition" value="0"/> 
							<span class="calendar_input type03">
								<input type="text" name="eatDate" id="eatDate" class="text p100" value="<c:out value="${mgr0117VO.eatDate }"/>" readonly="readonly"/> 
							</span>      
						</td>  
						<th scope="row"><strong class="th_tit">사용 금액</strong></th>   
						<td>      
							<input type="text" name="price" id="price" class="text w100p numOnly" value="<c:out value="${mgr0117VO.price }"/>"  maxlength="20" placeholder="숫자만 입력해주세요."/>
						</td> 
					</tr>       
					<tr>       
						<th scope="row"><strong>상호명</strong></th>        
						<td>           
							<input type="text" name="rstrnName" id="rstrnName" class="text w100p" value="<c:out value="${mgr0117VO.rstrnName }"/>" maxlength="20" placeholder="상호명을 입력해주세요."/>
						</td>   
						<th scope="row"><strong class="th_tit">카드 선택</strong></th>
						<td>     
							<select name="number" id="number"  class="w100p">             
								<option value="">카드 선택</option>               
								<c:if test="${fn:length(cardList) gt 0 }">         
									<c:forEach var="card" items="${cardList }">     
										<option value="${card.number }" ${card.number eq mgr0117VO.number ? 'selected="selected"' : '' }>카드 번호 : ${card.number } | 카드 이름 : ${card.name }</option>
									</c:forEach>      
								</c:if>    
							</select>               
						</td>    
					</tr>              
					<tr>                 
						<th scope="row"><strong>용도</strong></th>      
						<td colspan="3">        
							<input type="text" name="etc" id="etc" class="text w100p" maxlength="70" value="<c:out value="${mgr0117VO.etc }"/>"/>
						</td>  
					</tr>  
					<tr>                                 
						<th scope="row"><strong class="th_tit" style="margin-right: 11px;">식사 인원</strong>
							<c:if test="${searchVO.procType eq 'update' && mgr0117VO.state ne 'Y' }">
								<a href="javascript:void(0);" class="btn btn_sml btn_ok" onclick='fncOpenModal();'>추가</a>
							</c:if>
						</th>       
						<td colspan="3">                 
							<ul id="receiver" class="mail_select_list">                           
								<c:if test="${fn:length(userList) gt 0 }">                     
									<c:forEach var="user" items="${userList }">       
										<li id="${user.seq}-${user.position }-" class="mail_select_obj" data-userInfo="${user.seq}-${user.position }&${user.name }_${user.position }" style="display:inline-block; width:17%;">   
											<c:out value="${user.name }_${user.position }"/>              
											<c:if test="${searchVO.procType eq 'update' && mgr0117VO.state ne 'Y' }">
												<a class="mail_del btn_del cursor" onclick="fncUserDel('${user.seq}-${user.position }', '${user.seq}-${user.position }&${user.name }_${user.position }');" style="display:inline-block;">x</a>
											</c:if>
										</li> 
									</c:forEach>    
								</c:if>     
							</ul>              
						</td>   
					</tr>   
					<tr>     
						<th scope="row"><strong>영수증 첨부 </strong></th> 
						<td colspan="3">
							<iframe name="atchFileIdFrame" id="atchFileIdFrame" src="/atch/fileUpload.do?atchFileId=${mgr0117VO.atchFileId }&fileCnt=5&atchFileIdNm=atchFileId&updateType=upload" style="width: 100%;" height="50" frameborder="0" title="파일 업로드 폼"></iframe>
						</td>    
					</tr>  
				</tbody>         
			</table>                         
		</div>                                                       
		<div class="btn_area">                             
		<c:if test="${searchVO.procType ne 'update'}">     
			<a href="javascript:void(0);" onclick="fncSubmit('insert');" class="btn btn_mdl btn_save">등록</a>
		</c:if>                                   
		<c:if test="${(loginVO.seq eq mgr0117VO.rgstSeq &&  mgr0117VO.state eq 'N') || (loginVO.authCode eq '1' && searchVO.procType eq 'update')}">
			<a href="javascript:void(0);" onclick="fncSubmit('update');" class="btn btn_mdl btn_rewrite">수정</a>
			<a href="javascript:void(0);" onclick="fncPageBoard('del', 'deleteProc.do');" class="btn btn_mdl btn_del">삭제</a>
		</c:if>   
			<a href="javascript:void(0);" onclick="fncPageBoard('list', 'list.do')" class="btn btn_mdl btn_cancel">${searchVO.procType eq  'update' ? '목록' : '취소'}</a>
		</div>  
	</form>          
</div>            
   
<script type="text/javascript">

<%-- 체크 상태 배열 --%> 
var checked = new Array(); 
             
<%-- 페이지 로드 --%>             
$(function(){                  
	        
	$(".mail_select_obj").each(function(){    
		checked.push($(this).attr("data-userInfo")); 
	});              
	
	fncDate('eatDate');    
	return false;  
});      
  
<%-- 등록 --%>
function fncSubmit(proc){   
	    
	if($("#eatDate").val() == null || $("#eatDate").val() == ""){
		alert("사용일을 입력해주세요."); 
		return false;
	} 
	if($("#price").val() == null || $("#price").val() == ""){
		alert("사용 금액을 입력해주세요.");
		$("#price").focus(); 
		return false;  
	}   
	if($("#number").val() == null || $("#number").val() == "") {
		alert("카드를 선택해주세요.");
		$("#number").focus();   
		return false;         
	}
	if($(".mail_select_obj").length == 0){
		alert("식사 인원을 추가해주세요.");    
		return false;
	}  
	if($("#state").val() == null || $("#state").val() == ""){
		$("#state").val("N");
	}
	<%-- 식사 인원 --%>                
	$("#userSeq").val(checked);   
	fncPageBoard("update", proc + 'Proc.do');
	return false;    
}  
                
<%-- 받는 사람 목록 삭제 --%>            
function fncUserDel(pstn, info){   
	$("#" + pstn + "-").remove();             
	checked.splice(checked.indexOf(info), 1); 
	return false;         
}            
                    
<%-- 모달 열기 --%>                         
function fncOpenModal(){   
	fncLoadingStart();           
	$.ajax({                      
	    method: "POST",   
	    url: "modalList.do",	                                                  
	    data : $("#defaultFrm").serialize(),    
	    dataType: "HTML",          
	    success: function(data) {             
	    	$("#display_view1").html(data);     
	    	view_show(1, '30%', '12%');           
	    },complete : function(){     
	    	fncLoadingEnd();
		}     
	});	  
}                   
   
<%-- 상태 변경 --%>
function fncUpdateState(){      
	fncLoadingStart();                 
	$.ajax({                                     
	    method: "POST",               
	    url: "stateUpdate.do",	                                                  
	    data : $("#defaultFrm").serialize(),    
	    dataType: "JSON",              
	    success: function(data) {    
	    	alert(data.result);    
	    },complete : function(){     
	    	fncLoadingEnd();
		}     
	});	
}
   
<%-- 메일 발송 --%>
function fncSendMail(){
	fncLoadingStart();                 
	$.ajax({                                     
	    method: "POST",               
	    url: "sendMail.do",	                                                  
	    data : $("#defaultFrm").serialize(),    
	    dataType: "JSON",              
	    success: function(data) {    
	    	alert(data.result);    
	    },complete : function(){     
	    	fncLoadingEnd();
		}     
	});
	return false;
}

</script>