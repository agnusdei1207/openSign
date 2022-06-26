<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<script type="text/javascript" src="/publish/mgr/js/board.js"></script>
<div class="content_box">
	<form:form commandName="searchVO" name="defaultFrm" id="defaultFrm" method="post">
		<form:hidden path="seq" id="seq"/>
		<form:hidden path="pageIndex" id="pageIndex"/> 
		<jsp:directive.include file="/WEB-INF/jsp/cmmn/inc/incSearchForm.jsp"/>
	</form:form>	
	<%-- tbl --%>
	<div class="tbl_wrap">
		<table class="tbl_row_type01">
			<caption>내용(제목, 작성자, 작성일 등으로 구성)</caption>
			<colgroup>
				<col style="width:20%;">
				<col style="width:30%;">
				<col style="width:20%;">
				<col style="width:30%;">
			</colgroup>       
			<tbody>
				<tr>
					<th scope="row"><strong>메뉴명</strong></th>
					<td>${mgr0017VO.menuNm }</td>
					<th scope="row"><strong>에러페이지</strong></th>
					<td>${mgr0017VO.errPage }</td>
				</tr>
				<tr>
					<th scope="row"><strong>IP</strong></th>
					<td>${mgr0017VO.ip }</td>
					<th scope="row"><strong>발생아이디</strong></th>
					<td>${mgr0017VO.rgstId }</td>
				</tr>
				<tr>
					<th scope="row"><strong>에러타입</strong></th>
					<td colspan="3">${mgr0017VO.errType }</td>
				</tr>
				<tr>
					<th scope="row"><strong>에러메세지</strong></th>
					<td colspan="3">${mgr0017VO.errMsg }</td>
				</tr>
		   </tbody>
		</table>
		<%-- //tbl --%>   
		<div class="btn_area">
			<a href="#" class="btn btn_mdl btn_list" onclick="fncPageBoard('list','list.do');">목록</a>
		</div>	
	</div>
</div>
