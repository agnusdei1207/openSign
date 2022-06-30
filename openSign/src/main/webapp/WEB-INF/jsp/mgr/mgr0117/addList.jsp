<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>

<div class="tbl_top">  
	<div class="tbl_left"><i class="i_all">
		</i><span>전체 : <strong>${paginationInfo.totalRecordCount}</strong> 건(${searchVO.pageIndex}/${paginationInfo.totalPageCount} Page) </span>
	</div>
	<div class="tbl_right"> 
		<a href="javascript:void(0)" class="btn btn_excel btn_sml03" onclick="excelDown();"><span>엑셀 다운로드</span></a>
	</div>
</div> 
        
<div class="tbl_wrap">
	<table class="tbl_col_type01">
		<caption>목록</caption>
		<colgroup>               
			<c:if test="${loginVO.authCode eq '3' || loginVO.authCode eq '1' }">
				<col style="width:3%"> 
			</c:if>
			<col style="width:7%"> 
			<col style="width:10%"> 
			<col>          
			<col style="width:15%">
			<col style="width:10%"> 
			<col style="width:7%"> 
			<col style="width:10%">  
			<col style="width:10%">
		</colgroup>      
		<thead>         
			<tr>      
				<c:if test="${loginVO.authCode eq '3' || loginVO.authCode eq '1' }">
					<th scope="col"><input type="checkbox" onclick="fncAllCheck(this);" id="all_check"></th>   
				</c:if>
				<th scope="col">번호</th>   
				<th scope="col">상태</th>
				<th scope="col">상호명</th> 
				<th scope="col" class="subject">사용 금액</th>
				<th scope="col">용도</th>
				<th scope="col">영수증 첨부</th> 
				<th scope="col">작성자</th>    
				<th scope="col">사용일</th>     
			</tr>        
		</thead>    
		<tbody>    
			<c:choose>     
				<c:when test="${fn:length(resultList) gt 0}">
					<c:forEach var="result" items="${resultList}" varStatus="status">
						<tr class="cursor">    
							<c:if test="${loginVO.authCode eq '3' || loginVO.authCode eq '1' }">
								<td>                      
									<input type="checkbox" id="${result.elSeq }" class="checkbox" onclick="fncOneCheck(this);">
								</td> 
							</c:if>
							<td  onclick="fncPageBoard('update','updateForm.do','${result.elSeq}','elSeq')">
								${paginationInfo.totalRecordCount+1 - ((searchVO.pageIndex-1) * searchVO.pageUnit + status.count)}
							</td>  
							<td  onclick="fncPageBoard('update','updateForm.do','${result.elSeq}','elSeq')">     
								<c:choose>        
									<c:when test="${result.state eq 'N' }">
										<c:out value="미확인"/>  
									</c:when>
									<c:when test="${result.state eq 'Y' }"> 
										<c:out value="확인"/>                                 
									</c:when>               
									<c:otherwise>     
										<c:out value="-"/>                
									</c:otherwise>              
								</c:choose>                    
							</td>                                    
							<td  onclick="fncPageBoard('update','updateForm.do','${result.elSeq}','elSeq')">    
								<c:out value="${empty result.rstrnName ? '-' : util:cutText(result.rstrnName,20,'...')  }"/>
							</td>      
							<td class="r">     
								<fmt:formatNumber value="${result.price }" pattern="#,###"/>₩
							<td  onclick="fncPageBoard('update','updateForm.do','${result.elSeq}','elSeq')">
								<c:out value="${empty result.etc ? '-' : result.etc }"/>
							</td>                  
							<td  onclick="fncPageBoard('update','updateForm.do','${result.elSeq}','elSeq')">
								<c:out value="${empty result.atchFileId ? '-' : '📌' }"/>
							</td>        
							<td  onclick="fncPageBoard('update','updateForm.do','${result.elSeq}','elSeq')">
								<c:out value="${result.rgstId }"/>     
							</td>  
							<td  onclick="fncPageBoard('update','updateForm.do','${result.elSeq}','elSeq')">
								<c:out value="${empty result.eatDate ? '-' : result.eatDate }"/>
							</td>    
						</tr> 
					</c:forEach>  
				</c:when>             
				<c:otherwise>     
					<tr>        
						<td colspan="${loginVO.authCode eq '3' ? '9' : loginVO.authCode eq '1' ? '9' : '8' }" class="no_data">데이터가 없습니다.</td>
					</tr>
				</c:otherwise>   
			</c:choose>  
		</tbody>      
	</table>  
</div>         
     
<div class="paging_wrap">       
	<div class="paging">
		<ui:pagination paginationInfo="${paginationInfo}" type="manage" jsFunction="fncPageBoard" />
	</div>      
	<div class="btn_left">         
		<c:if test="${loginVO.authCode eq '3' || loginVO.authCode eq '1' }">
			<a href="javascript:void(0);" class="btn btn_mdl btn_save" onclick="checkedUpdate();"style="background-color: #308cde;border-color: #308cde;">일괄 확인</a>
		</c:if>
	</div>    
	<div class="btn_right">     
		<a href="javascript:void(0);" class="btn btn_mdl btn_save" onclick="fncPageBoard('write','insertForm.do');">식대 신청</a>
	</div>
</div> 
       
<script type="text/javascript">
  
$(function(){
	$(function(){       
		/* 체크 박스 */
		for(var i = 0; i < checkedArray.length; i++){   
			var id = checkedArray[i];     
			$("#" + id).prop("checked", true); 
		}           
		fncCheckLength(); 
		return false;     
	})      
})  


<%-- 엑셀 다운로드 버튼 --%> 
function excelDown(arr){
	fncPageBoard('list','excelDown.do');
	fncLoadingEnd();
}  
	  
<%-- 전체 체크 --%>    
function fncAllCheck(obj){      
	/* 체크 상태 확인 */   
	if(obj["checked"]){ 
		$(".checkbox").each(function(){ 
			if($("#" + this.id).prop("checked")){  
				checkedArray.splice(checkedArray.indexOf(this.id), 1); // 중복 제거 
			}   
			$("#" + this.id).prop("checked", true);
			checkedArray.push(this.id);   
		});        
	}else if(!obj["checked"]){
		$(".checkbox").each(function(){       
			$("#" + this.id).prop("checked",false);  
			checkedArray.splice(checkedArray.indexOf(this.id), 1); // 중복 제거
		});    
	}    
	fncCheckLength();
	return false;
}   
 
<%-- 개별 체크 --%> 
function fncOneCheck(obj){
	/* 체크 상태 확인 */
	if(obj["checked"]){ 
		checkedArray.push(obj.value);
	}else{         
		$("#" + obj.id).prop("checked", false);
		checkedArray.splice(checkedArray.indexOf(obj.id), 1); // 중복 제거
	}
	fncCheckLength();
	return false;  
}  
  
<%-- 체크 상태 길이 체크 --%>    
function fncCheckLength(){
	var total = $(".checkbox").length;
	var check = $(".checkbox:checked").length;
	 
	if(total==check){
		$("#all_check").prop("checked", true);
	}else{   
		$("#all_check").prop("checked", false);
	}
	return false;
}

<%-- 일괄 확인 --%>
function checkedUpdate(){ 
	$("#schEtc03").val(checkedArray);
	fncPageBoard("view", "checkedUpdate.do");
}
</script>	
	
