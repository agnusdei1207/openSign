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
						<tr class="cursor"  onclick="fncPageBoard('update','updateForm.do','${result.elSeq}','elSeq')">
							<td>
								${paginationInfo.totalRecordCount+1 - ((searchVO.pageIndex-1) * searchVO.pageUnit + status.count)}
							</td>  
							<td>    
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
							<td>    
								<c:out value="${empty result.rstrnName ? '-' : util:cutText(result.rstrnName,20,'...')  }"/>
							</td>      
							<td class="r">     
								<fmt:formatNumber value="${result.price }" pattern="#,###"/>₩
							<td>
								<c:out value="${empty result.etc ? '-' : result.etc }"/>
							</td>                  
							<td>
								<c:out value="${empty result.atchFileId ? '-' : '📌' }"/>
							</td>        
							<td>
								<c:out value="${result.rgstId }"/>     
							</td>  
							<td>
								<c:out value="${empty result.eatDate ? '-' : result.eatDate }"/>
							</td>    
						</tr> 
					</c:forEach> 
				</c:when>             
				<c:otherwise>  
					<tr><td colspan="8" class="no_data">데이터가 없습니다.</td></tr>
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
		<a href="javascript:void(0);" class="btn btn_mdl btn_save" onclick="fncPageBoard('write','insertForm.do');">식대 신청</a>
	</div>
</div> 
      
<script type="text/javascript">
	<%-- 엑셀 다운로드 버튼 --%> 
	function excelDown(arr){
		fncPageBoard('list','excelDown.do');
		fncLoadingEnd();
	}  
</script>	
	
