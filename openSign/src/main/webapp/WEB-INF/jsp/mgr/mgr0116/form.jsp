<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>

<div class="content_box">
	<form name="defaultFrm" id="defaultFrm" method="post">   
		<input type="hidden" name="clSeq" id="clSeq" value="${mgr0116VO.clSeq }"/>  
		<%-- 확인 & 결재자 --%>     
		<c:if test="${loginVO.authCode eq '3' }">  
			<input type="hidden" name="approver" id="approver" value="${loginVO.seq}"/>  
		</c:if>
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
						<th scope="row"><strong class="th_tit">카드 선택 </strong></th>   
						<td>                           
							<c:choose>  
								<c:when test="${empty mgr0116VO.number }">
									<select name="number" id="number" style="width:100%;" onclick="selectCard();"> 
										<option value="">카드 선택</option>       
										<c:if test="${fn:length(cardList) gt 0 }">            
											<c:forEach var="card" items="${cardList }" varStatus="status">       
												<option value="${card.number }" ${card.number eq mgr0116VO.number ? 'selected="selected"' : '' }>카드 번호 : ${card.number } | 카드 이름 : ${card.name }</option>
											</c:forEach>     
										</c:if>                 
									</select>                  
								</c:when>      
								<c:otherwise>  
									<input type="hidden" name="number" id="number" value="${mgr0116VO.number }">  
									<c:out value="카드 번호 : ${mgr0116VO.number } : ${mgr0116VO.name }"/>
								</c:otherwise>
							</c:choose>
						</td>                                                 
						<th scope="row"><strong class="th_tit">상태</strong></th>                               
						<td>                          
							<c:choose>                
								<c:when test="${loginVO.authCode eq '1' || (loginVO.authCode eq '3' && mgr0116VO.state eq 'B')}">                 
									<select name="state" id="state" style="width:192px;">
										<option value="B" ${mgr0116VO.state eq 'B' ? 'selected="selected"' : '' }>대여</option>
										<option value="R" ${mgr0116VO.state eq 'R' ? 'selected="selected"' : '' }>반납</option> 
									</select>  
								</c:when>                 
								<c:otherwise>     
									${empty mgr0116VO.state ? '대여' : mgr0116VO.state eq 'B' ? '대여' : '반납'}
								</c:otherwise>               
							</c:choose>         
						</td>                      
					</tr>        
					<tr>        
						<th scope="row"><strong class="th_tit">대여일</strong></th> 
						<td>   
							<c:choose>    
								<c:when test="${empty mgr0116VO.rentalDate }">
									-
								</c:when>    
								<c:when test="${(searchVO.procType eq 'update' && mgr0116VO.state eq 'B' && loginVO.seq eq mgr0116VO.rgstSeq) || (searchVO.procType eq 'insert') || (loginVO.authCode eq '1')}">
									<input type="hidden" name="dateCondition" id="dateCondition" value="0"/>   
									<span class="calendar_input type03"> 
										<input type="text" name="rentalDate" id="rentalDate" class="text p50" value="<c:out value="${mgr0116VO.rentalDate }"/>" readonly="readonly"/> 
									</span>   
								</c:when>   
								<c:otherwise>   
									<input type="hidden" name="rentalDate" value="${mgr0116VO.rentalDate }">
									<c:out value="${mgr0116VO.rentalDate }"/>
								</c:otherwise>
							</c:choose>         
						</td>      
						<th scope="row"><strong class="th_tit">반납일</strong></th>       
						<td>                        
							<c:choose>       
								<c:when test="${(searchVO.procType eq 'update' && mgr0116VO.state eq 'B' && loginVO.authCode eq '3') || (loginVO.authCode eq '1')}">
									<span class="calendar_input type03"> 
										<input type="text" name="returnDate" id="returnDate" class="text p50" value="<c:out value="${mgr0116VO.returnDate }"/>" readonly="readonly"/> 
									</span>
								</c:when>       
								<c:when test="${empty mgr0116VO.returnDate }"> 
									-
								</c:when>
								<c:otherwise>           
									<input type="hidden" name="returnDate" value="${mgr0116VO.returnDate }">
										<c:out value="${mgr0116VO.returnDate }"/> 
								</c:otherwise>
							</c:choose>       
						</td>
					</tr>        
				</tbody>           
			</table>                   
		</div>                             
		<div class="btn_area">                            
			<c:if test="${searchVO.procType eq 'insert'}">
				<a href="javascript:void(0);" onclick="fncSubmit('insert');" class="btn btn_mdl btn_save">등록</a>
			</c:if>                                             
			<c:if test="${(loginVO.authCode eq '1') || (loginVO.authCode eq '3' && mgr0116VO.state eq 'B')&& searchVO.procType eq 'update'}">
				<a href="javascript:void(0);" onclick="fncSubmit('update');" class="btn btn_mdl btn_rewrite">수정</a>
				<a href="javascript:void(0);" onclick="fncPageBoard('del', 'deleteProc.do');" class="btn btn_mdl btn_del">삭제</a>
			</c:if>
			<a href="javascript:void(0);" onclick="fncPageBoard('list', 'list.do')" class="btn btn_mdl btn_cancel">${searchVO.procType eq  'update' ? '목록' : '취소'}</a>
		</div>
	</form>         
</div>         
     
<script type="text/javascript"> 
     
$(function(){                      
	<%-- 날짜 셋팅 --%>     
	fncDate('rentalDate','returnDate');  
	if("${mgr0116VO.state }" == null || "${mgr0116VO.state }" == ""){    
		$("#state_B").prop("checked", true);
	}     
	return true; 
});    
     
<%-- 등록 버튼 --%>     
function fncSubmit(proc){  

	if(proc == "insert"){
		if($("#number").val() == null || $("#number").val() == "") {
			alert("카드를 선택해주세요.");
			$("#number").focus();    
			return false;           
		}         
		if(($("#rentalDate").val() == null || $("#rentalDate").val() == "") && ($("#returnDate").val() == null || $("#returnDate").val() == "")){
			alert("날짜를 입력해주세요.")
			return false; 
		}     
		if($("#state").val() == null || $("#state").val() == ""){
			$("#state").val("B");  
		}   
	}  
	<%-- insert || update 구분 --%>
	fncPageBoard('update', proc + 'Proc.do');
	return false;
}        
    
  
</script>