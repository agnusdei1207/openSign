<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<ul class="list_code02">
	<c:forEach var="result" items="${cdList}" varStatus="status">
		<li id="menu_1_${result.menuCd }">
			<a href="javascript:void(0)" onclick="fncMenuCdSel('${result.menuCd }','2');" class="codeSel">
				${result.menuNm }<c:if test="${not empty result.etc }">(${result.etc })</c:if>
			</a>			
			<span class="code_btns">
				<c:choose>
					<c:when test="${status.first }">
						 <a href="#" onclick="alert('첫번째 항목입니다.');return false;">▲</a>
					</c:when>
					<c:otherwise>
						 <a href="#" onclick="fncSort('up','${result.pMenuCd }','${result.menuCd }','${result.menuNo }','1');">▲</a>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${status.last }">
						 <a href="#" onclick="alert('마지막 항목입니다.');return false;">▼</a>
					</c:when>
					<c:otherwise>
						 <a href="#" onclick="fncSort('down','${result.pMenuCd }','${result.menuCd }','${result.menuNo }','1');" >▼</a>
					</c:otherwise>
				</c:choose>
			 	<a href="javascript:void(0)"  class="btn btn_sml btn_rewrite" onclick="fncMenuCdUpdate('${result.menuSeq }');">수정</a>
			 </span>
		</li>	
	</c:forEach>						
</ul> 
<br>
<div class="code_box"> 
	<input type="text" class="text w43p" id="menuNm_1" placeholder="메뉴명" maxlength="20"/>
	<select id="addUrl_1" class="select w43p">
		<option value="N">URL미생성</option>
		<option value="Y">URL생성</option>
	</select>
	<a href="#"  class="btn btn_sml02 btn_add" onclick="fncMenuCdAdd('1','${searchVO.pMenuCd}');" >추가</a>
</div> 
