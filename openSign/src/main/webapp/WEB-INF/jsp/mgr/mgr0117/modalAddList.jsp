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
			<col style="width:20%">    
			<c:if test="${searchVO.popDivn ne 'fvrts' }">   
				<col style="width:5%">  
			</c:if>      
		</colgroup>      
		<thead>       
			<tr>                
				<th scope="col"><input type="checkbox" onclick="fncAllCheck(this);" id="all_check"></th>
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
							<td>                      
								<input type="checkbox" id="${result.seq }-${result.position}" class="checkbox" onclick="fncOneCheck(this);" value="${result.seq }-${result.position}&${result.name}_${result.position}">
							</td>                   
							<td>      
								${paginationInfo.totalRecordCount+1 - ((searchVO.popPageIndex-1) * searchVO.pageUnit + status.count)}
							</td>    
							<td>${result.name }</td>       
							<td>${result.position }</td>                     
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
					<tr><td colspan="${searchVO.popDivn ne 'fvrts' ? '5' : '4' }" class="no_data">데이터가 없습니다.</td></tr>
				</c:otherwise>
			</c:choose> 
		</tbody>
	</table>         
</div>     

<div class="paging_wrap">      
	<div class="paging">            
		<ui:pagination paginationInfo="${paginationInfo}" type="modal" jsFunction="fncPageEtc" />  
	</div>         
	<div class="pop_footer" style="margin-left:570px;">   
		<a href="javascript:void(0);" class="btn btn_mdl btn_save" onclick="fncModalChoose();">선택</a>		
		<a href="javascript:void(0);" class="btn btn_mdl btn_cancel" onclick="view_hide(1);">취소</a>		
	</div>  
</div>           
  
     
<script type="text/javascript">    
  
<%-- 즐겨 찾기 배열 선언 & 중복 제거--%>    
var fvrts = new Array(); 
            
$(function(){       
	/* 체크 박스 */
	for(var i = 0; i < checked.length; i++){   
		var id = checked[i].split("&")[0];     
		$("#" + id).prop("checked", true); 
	}          
	fncCheckLength(); 
	return false;     
})           
        
<%-- 전체 체크 --%>  
function fncAllCheck(obj){      
	/* 체크 상태 확인 */
	if(obj["checked"]){
		$(".checkbox").each(function(){ 
			if($("#" + this.id).prop("checked")){  
				checked.splice(checked.indexOf(this.value), 1); // 중복 제거 
			}   
			$("#" + this.id).prop("checked", true);
			checked.push(this.value);   
		});       
	}else if(!obj["checked"]){
		$(".checkbox").each(function(){       
			$("#" + this.id).prop("checked",false);  
			checked.splice(checked.indexOf(this.value), 1); // 중복 제거
		});    
	}   
	fncCheckLength();
	return false;
} 
 
<%-- 개별 체크 --%> 
function fncOneCheck(obj){
	/* 체크 상태 확인 */
	if(obj["checked"]){
		checked.push(obj.value);
	}else{         
		$("#" + obj.id).prop("checked", false);
		checked.splice(checked.indexOf(obj.value), 1); // 중복 제거
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

<%-- 선택 버튼 --%>  
function fncModalChoose(){
	 
	var html = "";     
	 
	for(var i = 0; i < checked.length; i++){      
		      
		var pstn = checked[i].split("&")[0];    
		var info = checked[i].split("&")[1];    
		                         
		<%-- id 중복 방지를 위해 hyphen '-' 사용--%>                               
		html += '<li class="mail_select_obj" id="'+ pstn +'-" style="display:inline-block; width:17%;">';     
		html += info;                                                
		html += '<a class="mail_del btn_del cursor" onclick="fncUserDel(\''+ pstn +'\', \''+ checked[i] +'\');">x</a>';
		html += '</li>'; 
	}
	<%-- 목록 생성 --%>
	$("#receiver").html(html);    
	<%-- 리스트 닫기 --%>  
	$("#popTbl").html("");    
	<%-- 모달 닫기 --%>  
	view_hide(1);
	return false;
} 
           
<%-- 즐겨찾기 체크 및 해제 --%>  
function fncFvrtsOneCheck(obj){ 
	           
	var chk_state = "";
	var id =obj.id.split("__")[0];
	    
	/* 체크 상태 구분 */   
	if(obj["checked"]){     
		chk_state = "Y";
		$("#img_"+obj.id).attr("src","/publish/mgr/images/star_"+ chk_state +".png"); // 별 이미지 셋팅
	}else{ 
		chk_state = "N";
		$("#img_"+obj.id).attr("src","/publish/mgr/images/star_"+ chk_state +".png"); // 별 이미지 셋팅
	} 
	    
	$.ajax({     
		method : "POST",
		url : "addFvrts.do",    
		data : {"fvrtsSeq" : id, "chk_state" : chk_state},
		dataType : "JSON",
		success : function(data){  
			console.log("즐겨찾기 추가 및 해제 : " + data.result);
		},    
		complete : function(data){
			console.log("즐겨찾기 종료"); 
		}
	});
}


</script>