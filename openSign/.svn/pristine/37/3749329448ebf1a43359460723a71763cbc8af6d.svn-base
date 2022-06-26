<%@ page language="java" isELIgnored="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<%
  /**
  * @Description : List 화면
  *   수정일         수정자                   수정내용
  *  -------    --------    ---------------------------
  *  2014.4.2 박현우           최초 생성
  *  2014.4.2 박현우           검색 조건 수정
  *  
  * @author KOSEP AdcapsuleSoft
  */
%>
<script type="text/javascript">
$(document).ready(function(){
	$(".btn_popup_close").click(function(){
		self.close();
	});
});
</script>
<div id="pop_container">
	<div class="pop_content">
		<div class="section">
			
			<div class="data_wrap">
				<table class="data_table1" summary="파일명 다운로드 표 입니다."><!-- th의 제목을 입력 -->
					<caption>파일 목록</caption><!-- 테이블의 제목을 입력 -->
					<colgroup>
						<col width="*" >
						<col width="27%" >
					</colgroup><!-- th의 개수만큼 col 조정 필요  최종 %값 = 100% -->
					<tbody>
						<c:forEach var="fileVO" items="${fileList}" varStatus="status">
							<tr>
								<th scope="row">
									<span>
										<a href="#" onclick="javascript:fncFileDownload('<c:out value="${fileVO.atchFileId}"/>','<c:out value="${fileVO.fileSn}"/>'); return false;">
											<c:out value="${fileVO.orignFileNm}" />&nbsp;[<fmt:formatNumber value="${fileVO.fileSize}" pattern="#,###" />&nbsp;byte]
										</a>
									</span>
								</th>
								<td>
									<div class="td_cont" style="text-align:center;"><a href="#" class="btnGray small" onclick="javascript:fncFileDownload('<c:out value="${fileVO.atchFileId}"/>','<c:out value="${fileVO.fileSn}"/>'); return false;"><span>다운로드</span></a></div>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div><!-- //data_wrap end -->

			<div class="btn_box">
				<a href="#" class="btnGray btn_popup_close"><span>닫기</span></a>
			</div><!-- //btn_box end -->
		</div><!-- //section end -->
	</div><!-- //content end -->
</div><!-- //container end -->
      
<a href="#" class="layer_close btn_popup_close"><span class="hide">닫기</span></a>