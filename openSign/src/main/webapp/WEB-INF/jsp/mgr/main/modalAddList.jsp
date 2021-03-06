<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
 
<div class="tbl_top">  
	<div class="tbl_left"><i class="i_all"></i><span>전체 : <strong>${paginationInfo.totalRecordCount}</strong> 건(${searchVO.popPageIndex}/${paginationInfo.totalPageCount} Page) </span></div>
	<div class="tbl_right"></div>      
</div>     
 
<div class="tbl_wrap">  
	<table class="tbl_col_type01">
		<caption>목록</caption>     
		<colgroup>     
			<col style="width:5%">   
			<col style="width:10%">        
			<col style="width:10%">  
			<c:if test="${searchVO.popDivn ne 'fvrts' }">    
				<col style="width:5%">  
			</c:if>    
		</colgroup>         
		<thead>       
			<tr>                 
				<th scope="col">번호</th>     
				<th scope="col">이름</th>         
				<th scope="col">직급</th>      
				<c:if test="${searchVO.popDivn ne 'fvrts' }">
					<th scope="col">즐겨찾기</th>     
				</c:if>  
			</tr>            
		</thead>          
		<tbody>                    
			<c:choose>               
				<c:when test="${fn:length(resultList) gt 0}">      	            
					<c:forEach var="result" items="${resultList}" varStatus="status">      
						<tr class="cursor">    
							<td onclick="fncModalChoose('${result.seq}');">           
								${paginationInfo.totalRecordCount+1 - ((searchVO.popPageIndex-1) * searchVO.pageUnit + status.count)}
							</td>        
							<td onclick="fncModalChoose('${result.seq}');">${result.name }</td>       
							<td onclick="fncModalChoose('${result.seq}');">${result.position }</td>                  
							<c:if test="${searchVO.popDivn ne 'fvrts' }">     
								<td>
									<input type="checkbox" id="${result.seq }__${result.id}" class="fvrts_checkbox" onclick="fncFvrtsOneCheck(this);" value="Y" ${result.fvrtsYn eq 'Y' ? 'checked="checked"' : '' } style="display:none;">
									<label for="${result.seq }__${result.id}" class="cursor">
										<img id="img_${result.seq }__${result.id}" src="/publish/mgr/images/star_${result.fvrtsYn}.png" style="width:20px;"/>
									</label>
								</td>   
							</c:if>                
						</tr>                
					</c:forEach>                
				</c:when>      
				<c:otherwise>              
					<tr><td colspan="${searchVO.popDivn ne 'fvrts' ? '4' : '3' }" class="no_data">데이터가 없습니다.</td></tr>
				</c:otherwise>
			</c:choose>   
		</tbody> 
	</table>               
</div>        
    
<div class="paging_wrap">        
	<div class="paging">              
		<ui:pagination paginationInfo="${paginationInfo}" type="statistics" jsFunction="fncPageEtc" />  
	</div>          
	<div class="pop_footer" style="margin-left:674px;">         
		<a href="javascript:void(0);" class="btn btn_mdl btn_cancel" onclick="view_hide(1);">닫기</a>		
	</div>    
</div>            
     
<script type="text/javascript">    
  
<%-- 즐겨 찾기 배열 선언 & 중복 제거--%>       
var fvrts = new Array();   
              
<%-- 즐겨찾기 체크하기--%>     
function fncFvrtsOneCheck(obj){  
	             
	var chk_state = "";      
	var id = obj.id.split("__")[0];
	  
	/* 즐겨찾기 체크 상태 구분 */ 
	if(obj["checked"]){      
		chk_state = "Y";
		$("#img_"+obj.id).attr("src","/publish/mgr/images/star_"+ chk_state +".png");
	}else{ 
		chk_state = "N";
		$("#img_"+obj.id).attr("src","/publish/mgr/images/star_"+ chk_state +".png");
	}
	    
	$.ajax({     
		method : "POST",
		url : "/mgr/statistics/addFvrts.do",    
		data : {"fvrtsSeq" : id, "chk_state" : chk_state},
		dataType : "JSON",
		success : function(data){  
			console.log("즐겨찾기 " + data.result);
		},    
		complete : function(data){
			console.log("즐겨찾기 종료");
		}
	});
} 
  
<%-- 선택 버튼 --%>           
function fncModalChoose(seq){  
	/* 조회 할 SEQ 셋팅 */              
	$("#schEtc04").val(seq);
      
	/* 개인별 차트 다시 그리기*/
	$(function(){                                      
		 $.ajax({               
			 method: "POST",    
			 url: "/mgr/statistics/midArea.do",
			 data : $("#popFrm").serialize(),     
			 dataType: "HTML", 
			 success: function(data) {      
				 $(".mid_area1").html(data);
				 view_hide(1);    
				 fncLoadingEnd(); 
			 },       
			 complete : function(){         
				 /* 선택된 이름 출력 */
				 $("#display_view1").html(""); 
				 view_hide(1);
			 }
		   });   
		return false;  
	});  
} 
</script>