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
						<tr class="cursor"  onclick="fncPageBoard('update','updateForm.do','${result.clSeq}','clSeq')">
							<td>
								${paginationInfo.totalRecordCount+1 - ((searchVO.pageIndex-1) * searchVO.pageUnit + status.count)}
							</td> 
							<td> 
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
							<td>
								<c:out value="${result.number }"/>
							</td>
							<td>
								<c:out value="${result.name }"/>
							</td>    
							<td>
								<c:out value="${result.rgstId }"/>
							</td>
							<td>
								<c:out value="${empty result.rentalDate ? '-' :  result.rentalDate }"/>
							</td>
							<td>   
								<c:out value="${empty result.returnDate ? '-' :  result.returnDate }"/>
							</td>
						</tr> 
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr><td colspan="7" class="no_data">데이터가 없습니다.</td></tr>
				</c:otherwise>   
			</c:choose>
		</tbody>   
	</table> 
</div>  

<div class="paging_wrap">    
	<div class="paging">
		<ui:pagination paginationInfo="${paginationInfo}" type="manage" jsFunction="fncPageBoard" />
	</div>  
	<div class="btn_right">
		<a href="javascript:void(0);" class="btn btn_mdl btn_save" onclick="fncPageBoard('write','insertForm.do');">반출대장작성</a>
	</div> 
</div>  
   
<script type="text/javascript">
	<%-- 엑셀 다운로드 --%>
	function excelDown(arr){
		fncPageBoard('list','excelDown.do');
		fncLoadingEnd();
	}  
</script>	
	
	
