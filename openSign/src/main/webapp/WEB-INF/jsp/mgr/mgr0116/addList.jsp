<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
  
<div class="tbl_top">
	<div class="tbl_left"><i class="i_all"></i><span>전체 : <strong>${paginationInfo.totalRecordCount}</strong> 건(${searchVO.pageIndex}/${paginationInfo.totalPageCount} Page) </span></div>
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
			<col style="width:10%">     
			<col style="width:10%">
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
				<th scope="col" class="subject">카드 번호</th>
				<th scope="col">카드 이름</th>
				<th scope="col">작성자</th>  
				<th scope="col">대여일</th>
				<th scope="col">반납일</th>
			</tr>    
		</thead> 
		<tbody>       
			<c:choose>
				<c:when test="${fn:length(resultList) gt 0}"> 
					<c:forEach var="result" items="${resultList}" varStatus="status">
						<tr class="cursor">
							<c:if test="${loginVO.authCode eq '3' || loginVO.authCode eq '1' }">
								<td>                        
									<input type="checkbox" id="${result.clSeq }" class="checkbox" onclick="fncOneCheck(this);">
								</td> 
							</c:if>
							<td onclick="fncPageBoard('update','updateForm.do','${result.clSeq}','clSeq')">
								${paginationInfo.totalRecordCount+1 - ((searchVO.pageIndex-1) * searchVO.pageUnit + status.count)}
							</td> 
							<td onclick="fncPageBoard('update','updateForm.do','${result.clSeq}','clSeq')"> 
								<c:choose>   
									<c:when test="${result.state eq 'B' }">
										<c:out value="대여"/>
									</c:when>  
									<c:when test="${result.state eq 'R' }">
										<c:out value="반납"/>
									</c:when>   
									<c:otherwise>          
										<c:out value="-"/> 
									</c:otherwise>       
								</c:choose> 
							</td>     
							<td onclick="fncPageBoard('update','updateForm.do','${result.clSeq}','clSeq')">
								<c:out value="${result.number }"/>
							</td>
							<td onclick="fncPageBoard('update','updateForm.do','${result.clSeq}','clSeq')"> 
								<c:out value="${result.name }"/>
							</td>    
							<td onclick="fncPageBoard('update','updateForm.do','${result.clSeq}','clSeq')">
								<c:out value="${result.rgstId }"/>
							</td>
							<td onclick="fncPageBoard('update','updateForm.do','${result.clSeq}','clSeq')">
								<c:out value="${empty result.rentalDate ? '-' :  result.rentalDate }"/>
							</td>
							<td onclick="fncPageBoard('update','updateForm.do','${result.clSeq}','clSeq')">   
								<c:out value="${empty result.returnDate ? '-' :  result.returnDate }"/>
							</td>
						</tr> 
					</c:forEach>
				</c:when>
				<c:otherwise>  
					<td colspan="${loginVO.authCode eq '3' ? '8' : loginVO.authCode eq '1' ? '8' : '7' }" class="no_data">데이터가 없습니다.</td>
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
			<a href="javascript:void(0);" class="btn btn_mdl btn_save" onclick="checkedUpdate();"style="background-color: #308cde;border-color: #308cde;">일괄 반납</a>
		</c:if>  
	</div>
	<div class="btn_right">
		<a href="javascript:void(0);" class="btn btn_mdl btn_save" onclick="fncPageBoard('write','insertForm.do');">반출대장작성</a>
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
    
<%-- 일괄 반납 --%>
function checkedUpdate(){ 
	$("#schEtc03").val(checkedArray);
	fncPageBoard("view", "checkedUpdate.do");
}

<%-- 엑셀 다운로드 --%>
function excelDown(arr){
	fncPageBoard('list','excelDown.do');
	fncLoadingEnd();
}  


</script>	
	
	
