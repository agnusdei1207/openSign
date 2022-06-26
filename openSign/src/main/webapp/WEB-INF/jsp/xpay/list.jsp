<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<script type="text/javascript" src="/publish/frt/js/board.js"></script>
<div class="cont_box">
	<!-- search_area -->
	<form id="defaultFrm" name="defaultFrm" method="post" onsubmit="return false;">
		<div class="tbl_top">
			<span class="tbl_left m_hid"><span class="i_all">전체</span> <strong><span
					id="totCnt">261</span></strong> 건</span>
			<div class="tbl_right type03">
					<span class="m-block">
						<span class="search_selec type03 m_w20p">
							<input type="hidden" name="dateCondition" id="dateCondition" value="0">
							<strong class="tit">등록일</strong>
						</span>
						<span class="calendar_input type03">
							<input id="searchStartDate" name="searchStartDate" class="text c hasDatepicker" title="시작일" readonly="readonly" type="text" value="">
							<img class="ui-datepicker-trigger" src="/publish/frt/images/sub/icon_calendar.png" alt="달력" title="달력">
						</span>
						<span class="input_swing"> ~</span>
						<span class="calendar_input type03">
							<input id="searchEndDate" name="searchEndDate" class="text c hasDatepicker" title="종료일" readonly="readonly" type="text" value="">
							<img class="ui-datepicker-trigger" src="/publish/frt/images/sub/icon_calendar.png" alt="달력" title="달력">
						</span>
					</span>
				<strong class="tit m_w20p p_hid">검색어</strong>
				<span class="search_selec type03 m_w30p">
					<select id="searchCondition" name="searchCondition" class="pc_w100 m_w100p" title="구분 선택">
						<option value="0">전체</option>
						<option value="1">제목</option>
						<option value="2">내용</option>
					</select>
				</span>
				<span class="search_text type03 pc_w25p m_w48p">
					<input id="searchKeyword" name="searchKeyword" title="검색어 입력" placeholder="검색어를 입력하세요." class="text pc_w100p" type="text" value="">
					<button type="button" class="btn btn_search" id="btn_search">검색</button>
				</span>
			</div>
		</div>
	</form>
	<!-- //search_area -->
	<div class="tbl"></div>
</div>
<script type="text/javaScript">
	$(document).ready(function () {
		fncPageBoard('addList', 'addList.do', 1);
	});
</script>