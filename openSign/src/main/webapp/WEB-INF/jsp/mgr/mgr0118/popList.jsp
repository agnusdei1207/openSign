<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>

  
<div class="pop_header">
	<h2>직원 목록</h2>
	<a href="javascript:void(0);" onclick="view_hide(1);" class="pop_close"></a>
</div>

<div class="pop_content">
	<ul class="tab js-tab tab_menu">  
		<li class="cursor current"><a href="javascript:void(0);" onclick="tab_menu('dvlp',this);">개발</a></li>
		<li class="cursor"><a href="javascript:void(0);" onclick="tab_menu('dsgn',this);">디자인</a></li>
	</ul>
	<div class="search_box">
		<form id="popFrm" name="popFrm" method="post" onsubmit="return false;">
			<input type="hidden" id="otSeq" name="otSeq" value="<c:out value="${searchVO.otSeq }"/>"/>
			<input type="hidden" id="popPageIndex" name="popPageIndex" value="<c:out value="${searchVO.popPageIndex }"/>"/>
			<input type="hidden" id="popDivn" name="popDivn" value="${searchVO.popDivn }" /> 
			<input type="hidden" id="pageMove" class="text w100p" value=""/>
			<fieldset>
				<legend>검색</legend>
				<div class="search_basic">
					<table class="type03">
						<colgroup>
							<col style="width:550px;">
						</colgroup>
						<tbody>
							<tr>
								<td>
									<strong class="tit">검색구분</strong>
									<select id="popSearchCondition" name="popSearchCondition" class="text w150">
										<option value="0">전체</option>
										<option value="1">이름</option>
										<option value="2">직급</option>
									</select>
									<input type="text" id="popSearchKeyword" name="popSearchKeyword" class="text w60p hideBtn3" value="<c:out value="${searchVO.searchKeyword }"/>"/>
								</td>
							</tr>
						</tbody>
					</table>
					<span class="search_btns">
						<button type="button" class="btn btn_search" id="btn_search" onclick="fncPageEtc('popList','popAddList.do','1');">검색</button>
					</span>
				</div>
			</fieldset>
		</form>
	</div>
	<div class="popTbl">

	</div>
</div>

<script type="text/javaScript">

$(document).ready(function(){
	$("#popDivn").val("0401");
  	fncPageEtc('popList','popAddList.do',$("#popPageIndex").val());
  	return false;
});

$("#schEtc01").change(function(){ 
	fncPageEtc('popList','popAddList.do',1);
});
      
<%-- 개발/디자인 탭--%>      
function tab_menu(team,obj){  
	
  		 if(team == 'dvlp') {
  			$("#popDivn").val("0401");
  		} else {
			$("#popDivn").val("0403");
  		}  
  		 
		$(obj).parent("li").siblings().removeClass("current");
		$(obj).parent("li").addClass("current"); 
		    
		fncPageEtc('popList','popAddList.do',1);
		return false;
}

<%-- 검색 enter 감지 --%>
$("#popSearchKeyword").keyup(function(){
	if(event.keyCode == 13){
		fncPageEtc('popList','popAddList.do',1);
		return false;
	}
});
</script> 
