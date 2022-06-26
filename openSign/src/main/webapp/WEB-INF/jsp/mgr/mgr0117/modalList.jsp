<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>  

                      
<div class="pop_header">  
	<h2>직원 목록</h2>   
	<a href="javascript:void(0);" onclick="view_hide(1);" class="pop_close"></a>
</div>  
                                 
<div class="pop_content">         
		<%-- search  --%>                          
		<ul class="tab js-tab tab_menu">         
		    <li class="cursor current"><a onclick="selectDivn(this,'0401')">개발</a></li>   
		    <li class="cursor"><a onclick="selectDivn(this,'0403')">디자인</a></li>   
		    <li class="cursor"><a onclick="selectDivn(this,'fvrts')">즐겨찾기</a></li>   
		</ul>                                    
		<div class="search_box">                                        
			<form name="popFrm" id="popFrm" method="post"  onsubmit="return false;">     
				<input type="hidden" name="popPageIndex" id="popPageIndex" value="${searchVO.popPageIndex }" />      
				<input type="hidden" name="popDivn" id="popDivn" value="${searchVO.popDivn }" placeholder="popDivn" />      
				<fieldset>         
					<legend>검색</legend>                        
					<div class="search_basic">          
						<strong class="tit">검색구분</strong>             
						<select name="popSearchCondition" id="popSearchCondition" title="구분 선택" class="w100">  
							<option value="0" >전체</option>
							<option value="1" >이름</option>    
							<option value="2" >직급</option>          
						</select>                 
						<input type="text" name="popSearchKeyword" id="popSearchKeyword" class="text w70p"/>
						<span class="search_btns">  
							<button type="button" class="btn btn_search" onclick="fncPageEtc('popList','modalAddList.do','1');">검색</button>
						</span>     
					</div>            
				</fieldset>        
			</form>       
		</div>           
		<%--// search  --%>      
		<div class="popTbl">      
		</div>  
</div>      
                   
<script type="text/javaScript">  
  
$(function(){                            
	     
	$("#popDivn").val("${searchVO.popDivn}");  
	
	if("${searchVO.popDivn}" == null || "${searchVO.popDivn}" == ""){
		$("#popDivn").val("0401");
	}     
	 
	fncPageEtc("popList", "modalAddList.do", '1'); 
	return false;                 
});       
                                  
<%-- 개발/디자인 구분 --%>         
function selectDivn(obj,popDivn){   
	$("#popDivn").val(popDivn);
	$(obj).parent('li').siblings().removeClass("current");
	$(obj).parent('li').addClass("current");
	      
	fncPageEtc("popList", "modalAddList.do", '1');    
	return false;    
}        
               
<%-- 검색 enter 감지 --%>
$("#popSearchKeyword").keyup(function(){
	if(event.keyCode == 13){
		fncPageEtc("popList", "modalAddList.do", '1'); 
		return false;   
	}   
});

</script>
