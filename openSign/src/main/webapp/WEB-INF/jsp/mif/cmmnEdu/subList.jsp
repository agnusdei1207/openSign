<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<script type="text/javascript" src="/publish/mgr/js/board.js"></script>
<script type="text/javascript" src="/publish/mgr/js/boardEtc.js"></script>
<div class="tbl_wrap">
	<form id="subFrm" name="subFrm"  method="post" onsubmit="return false;">
		<input type="hidden" id="eduBoardCd" name="eduBoardCd" value="${searchVO.eduBoardCd }"/>
		<input type="hidden" id="eduSubCd" name="eduSubCd" value="${searchVO.eduSubCd }"/>
		<input type="hidden" id="eduBoardDivn" name="eduBoardDivn" value="${searchVO.eduBoardDivn }"/>
		<input type="hidden" id="eduBoardSeq" name="eduBoardSeq" value="${searchVO.eduBoardSeq }"/>
		<input type="hidden" id="subPageIndex" name="subPageIndex" value="${searchVO.subPageIndex }"/>
		<div class="tbl_top">
			<span class="tbl_left m_hid"><span class="i_all">전체</span> <strong><span id="totCnt"></span></strong> 건</span>
			<div class="tbl_right type03">
				<strong class="tit m_w20p p_hid">검색어</strong>
				<span class="search_selec m_w30p">
					<select id="schSubCondition" class="w100" name="schSubCondition" title="구분 선택">
						<option value="0" ${searchVO.schSubCondition eq '0' ? 'selected' : '' }>전체</option>
						<option value="1" ${searchVO.schSubCondition eq '1' ? 'selected' : '' }>제목</option>
						<option value="2" ${searchVO.schSubCondition eq '2' ? 'selected' : '' }>내용</option>
						<option value="3" ${searchVO.schSubCondition eq '3' ? 'selected' : '' }>등록자</option>
					</select>
				</span>
				<span class="search_text pc_w25p m_w48p">
					<input type="text" id="schSubKeyword" name="schSubKeyword" class="text pc_w100p" value="${searchVO.schSubKeyword }">
					<button type="button" class="btn btn_search" id="btn_search_sub">검색</button>
				</span>
			</div>
		</div>
	</form>
	<div class="subTbl">
	</div>
</div>
<script type="text/javaScript">
$(document).ready(function(){
	fncPageEtc('subList','subAddList.do', $("#subPageIndex").val());
});
</script>