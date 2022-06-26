<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<script type="text/javascript" src="/publish/frt/js/board.js"></script>
<%--TODO xpay.--%>
<!-- test일 경우 -->
<script src="https://pretest.tosspayments.com:9443/xpay/js/xpay_crossplatform.js" type="text/javascript"></script>
<!--
service일 경우 아래 URL을 사용
<script src="https://xpayvvip.tosspayments.com/xpay/js/xpay_crossplatform.js" type="text/javascript"></script>
-->
<form id="defaultFrm" name="defaultFrm" method="post">
	<div class="tbl_wrap">
		<!-- board -->
		<table class="board_row_type01">
			<caption>내용(제목, 작성자, 작성일 등으로 구성)</caption>
			<colgroup>
				<col class="pc_w20p m_w20p">
				<col class="pc_w30p m_w30p">
				<col class="pc_w20p m_w20p">
				<col class="pc_w30p m_w30p">
			</colgroup>
			<tbody>
				<tr class="board_row_tit">
					<th scope="row" colspan="4">
						<strong>[온라인-11.27(금)] 전파이용 산업분야 앞장감 양성교육 세미나</strong>
					</th>
				</tr>
				<tr>
					<th scope="row"><strong>등록자</strong></th>
					<td>교육원 관리자</td>
					<th scope="row"><strong>등록일</strong></th>
					<td>2020.11.25</td>
				</tr>
				<tr>
					<th scope="row"><strong>첨부파일</strong></th>
					<td colspan="3">
						<a href="/atch/fileDown.do?atchFileId=ATICBD00000000000216&amp;fileSn=0" target="_blank" class="down_file"><img src="/publish/frt/images/sub/file_.png" alt="" class="m"><u>2020112512445528.</u></a>
					</td>
				</tr>
				<tr>
					<td colspan="4" class="tbl_text"></td>
				</tr>
				<tr>
					<th scope="row" colspan="4">결제정보</th>
				</tr>
				<tr>
					<th scope="row">금액</th>
					<td>10000원</td>
					<th scope="row">상품정보</th>
					<td>세미나</td>
				</tr>
				<tr>
					<th scope="row">결제수단</th>
					<td colspan="3">
						<select id="usablepay" name="usablepay">
							<option value="1">신용카드</option>
							<option value="2">계좌이체</option>
						</select>
					</td>
				</tr>
			</tbody>
		</table>
		<!-- //board -->
	</div>
</form>
<div class="btn_area">
	<a href="#" class="btn btn_mdl btn_write" id="btn_xpay">결제</a>
	<a href="#" class="btn btn_mdl btn_list" id="btn_list">목록</a>
</div>
<form method="post" name="LGD_PAYINFO" id="LGD_PAYINFO">
	<input type="hidden" id="LGD_ENCODING" name="LGD_ENCODING" value="UTF-8">
	<input type="hidden" id="LGD_ENCODING_NOTEURL" name="LGD_ENCODING_NOTEURL" value="UTF-8">
	<input type="hidden" id="LGD_ENCODING_RETURNURL" name="LGD_ENCODING_RETURNURL" value="UTF-8">
</form>
<script>
	$(document).ready(function () {
		$("#btn_xpay").click(function () {
			ajaxCall();
			return false;
		});
	});

	const ajaxCall = function () {
		$("#btn_xpay").unbind("click");

		$.ajax({
			type: 'post'
			, url: 'payreq.do'
			, data: $("#defaultFrm").serialize()
			, dataType: 'json'
			, success: function (data) {
				// console.log(data);
				if (data.result) {
					let html = "";
					$.each(data.xpayVO, function (a, b) {
						html = "<input type='hidden' id='" + a.toUpperCase() + "' name='" + a.toUpperCase() + "' value='" + b + "'/>";
						$("#LGD_PAYINFO").append(html);
					});

					openXpay(document.getElementById('LGD_PAYINFO'), $("#CST_PLATFORM").val(), $("#LGD_WINDOW_TYPE").val(), null, "", "");
				} else {
					alert("에러가 발생하였습니다. 잠시 후 다시 시도해주세요.");
				}
			}, error: function () {
				alert("에러가 발생하였습니다. 잠시 후 다시 시도해주세요.");
			}, complete: function () {
				$("#btn_xpay").click(function () {
					ajaxCall();
					return false;
				});
			}
		});
	};
</script>