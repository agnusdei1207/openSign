<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<c:set var="url" value="${requestScope['javax.servlet.forward.request_uri']}"/>
<%
    pageContext.setAttribute("crcn", "\r\n");
    pageContext.setAttribute("br", "<br>");
%> 
<div id="edu_box01" class="tab_cont tab_content">
	<div id="frt_print">
		<h3 class="md_tit03">담당자 정보</h3>
		<!--tbl_wrap-->
		<div class="tbl_wrap">
			<table class="board_row_type01">
				<caption></caption>
				<colgroup>
					<col class="pc_w15p m_w20p">
					<col class="pc_w35p m_w30p">
					<col class="pc_w15p m_w20p">
					<col class="pc_w35p m_w30p">
				</colgroup>
				<tbody>
					<tr>
						<th scope="row"><strong>구분</strong></th>
						<td colspan="">
							<c:choose>
								<c:when test="${fn:length(kindList) > 0 }">
									<c:forEach var="list" items="${kindList }">
										${orderVO.kind eq list.cCd ? list.cCdNm : '' }
									</c:forEach>
								</c:when>
								<c:otherwise>-</c:otherwise>
							</c:choose>
						</td>
						<th scope="row"><strong>결제상태</strong></th>
						<td colspan="" id="td_viewAddList_status">
							${empty orderVO.status ? '-' : orderVO.status eq '0' ? '결제대기' : orderVO.status eq '1' ? '미입금'
							 	: orderVO.status eq '2' ? '결제완료' : orderVO.status eq '3' ? '수강취소신청' : orderVO.status eq '4' ? '수강취소' : '-' }
						</td>
					</tr>
					<tr>
						<th scope="row"><strong>회사명</strong></th>
						<td colspan="">
							${orderVO.busiName }
						</td>
						<th scope="row"><strong>사업자 번호</strong></th>
						<td colspan="">
							<span class="busi">${orderVO.busiNo}</span>
						</td>
					</tr>
					<tr>
						<th scope="row"><strong>담당자 성명</strong></th>
						<td colspan="">
							${orderVO.mngName }
						</td>
						<th scope="row"><strong>휴대전화</strong></th>
						<td colspan="">
							<span class="tel">${orderVO.mngCell }</span>
						</td>
					</tr>
					<tr>
						<th scope="row"><strong>이메일</strong></th>
						<td colspan="">
							${orderVO.mngEmail }
						</td>
						<th scope="row"><strong>홈페이지</strong></th>
						<td colspan="">
							${orderVO.homepage }
						</td>
					</tr>
					<tr>
						<th scope="row"><strong>교육비할인 대상</strong></th>
						<td colspan="">
							${orderVO.dscnStatus eq 'Y' ? '승인완료' : orderVO.dscnStatus eq 'N' ? '승인요청' : orderVO.dscnStatus eq 'X' ? '반려' : '-' }　
							<c:if test="${orderVO.dscnStatus eq 'X' }">
								<a href="javascript:void(0)" class="btn btn_sml btn_save" onclick="fncDscnYn('${orderVO.ordernumber}','N');">승인요청</a>
							</c:if>
						</td>
						<th scope="row"><strong>신청인원</strong></th>
						<td colspan="">
							<span class="num">${orderVO.joinCnt }명</span>
						</td>
					</tr>
					<c:if test="${not empty orderVO.dscnStatus}">
						<tr>
							<th scope="row"><strong>할인대상 증빙서류</strong></th>
							<td colspan="3">
								<iframe name="atchFileIdFrame" id="atchFileIdFrame" src="/atch/fileUpload.do?atchFileId=${orderVO.atchFileId }&fileCnt=5&atchFileIdNm=atchFileId&updateType=upload" style="width: 100%;" height="50" frameborder="0" title="파일 업로드 폼"></iframe>
								<input type="hidden" id="atchFileId" name="atchFileId" />
							</td>
						</tr>
					</c:if>
				</tbody>
			</table>
		</div>
	       <!--//tbl_wrap-->
		
		<h3 class="md_tit03">신청자 정보 [${orderVO.joinCnt }명]</h3>
	       <!--tbl_wrap-->
		<div class="tbl_wrap">
			<table class="table_info_type01">
				<caption></caption>
				<colgroup>
					<col style="width:18%;">
					<col style="width:32%;">
					<col style="width:18%;">
					<col style="width:32%;">
				</colgroup> 
				<c:if test="${fn:length(orderList) > 0 }">
					<c:forEach var="list" items="${orderList }" varStatus="status">
						<tbody>
							<tr>
								<th scope="row"><strong>성명</strong></th>
								<td colspan="">
									${list.name }
								</td>
								<th scope="row"><strong>수료여부</strong></th>
								<td colspan="">
									${list.completeStatus eq 'Y' ? '수료' : list.completeStatus eq 'N' ? '미수료' : '-' }
								</td>
							</tr>
							<tr>
								<th scope="row"><strong>생년월일</strong></th>
								<td colspan="">
									${fn:split(list.juminno, '-')[0] }년 ${fn:split(list.juminno, '-')[1] }월 ${fn:split(list.juminno, '-')[2] }일
								</td>
								<th scope="row"><strong>성별</strong></th>
								<td colspan="">
									${list.gender eq 'M' ? '남자' : list.gender eq 'F' ? '여자' : '-' }
								</td>
							</tr>
							<tr>
								<th scope="row"><strong>이메일</strong></th>
								<td colspan="">
									${list.email }
								</td>
								<th scope="row"><strong>휴대전화</strong></th>
								<td colspan="">
									<span class="tel">${list.tel }</span>
								</td>
							</tr>
							<tr>
								<th scope="row"><strong>주소</strong></th>
								<td colspan="3">
									[${list.post }] ${list.addr1 } ${list.addr2 }
								</td>
							</tr>
							<tr>
							<tr>
								<th scope="row"><strong>담당업무</strong></th>
								<td colspan="">
									${list.position }
								</td>
								<th scope="row"><strong>경력</strong></th>
								<td colspan="">
									${list.career }
								</td>
							</tr>
							<tr>
								<th scope="row"><strong>전공</strong></th>
								<td colspan="">
									${list.major }
								</td>
								<th scope="row"><strong>학위</strong></th>
								<td colspan="">
									${list.degree }
								</td>
							</tr>
							<tr>
								<th scope="row"><strong>비고</strong></th>
								<td colspan="3">
									<pre class="text_pre">${orderVO.etc }</pre>
								</td>
							</tr>
							<tr><td colspan="4"></td></tr>
						</tbody>
					</c:forEach>
				</c:if>
			</table>
		</div>
	</div>
	<div class="btn_area">
		<div class="btn_left">
			<c:if test="${orderVO.completeStatus eq 'N' }">
				<c:if test="${orderVO.status ne '3' and orderVO.status ne '4'}">
					<a href="javascript:void(0);" class="btn btn_mdl btn_del" onclick="fncStatusCancel('${orderVO.ordernumber}','3');">수강 취소신청</a>
				</c:if>
			</c:if>
		</div>
		<div class="btn_right">
			<c:if test="${not empty orderVO.payStoreId and orderVO.status eq '1' and orderVO.acptYn eq 'Y' and searchVO.payDivn eq 'Y'}">
				<c:if test="${orderVO.payMethod eq '1' or orderVO.payMethod eq '2' }">
					<a href="javascript:void(0);" class="btn btn_mdl btn_save" id="btn_xpay">결제</a>
				</c:if>
			</c:if>
			<c:if test="${orderVO.completeStatus eq 'Y' }">
				<a href="/mif/mif0094/list.do" class="btn btn_mdl btn_save" >증명서 신청</a>
			</c:if>
			<c:if test="${orderVO.status eq '2' and orderVO.payMethod ne '0' }">
				<a href="javascript:void(0);" class="btn btn_mdl btn_save" onclick="fncPopPrint();">영수증 출력</a>
			</c:if>
			<a href="javascript:window.open('/frt/frtPrintPop.do','print','width=1200, height=800,top=100, left=200')" class="btn btn_mdl btn_save">출력</a>
			<a href="javascript:void(0);" class="btn btn_mdl btn_list" onclick="fncPageBoard('list', 'list.do')">목록</a>
		</div>
	</div>
	<form method="post" name="LGD_PAYINFO" id="LGD_PAYINFO">
		<input type="hidden" id="LGD_ENCODING" name="LGD_ENCODING" value="UTF-8">
		<input type="hidden" id="LGD_ENCODING_NOTEURL" name="LGD_ENCODING_NOTEURL" value="UTF-8">
		<input type="hidden" id="LGD_ENCODING_RETURNURL" name="LGD_ENCODING_RETURNURL" value="UTF-8">
	</form>
</div>
<script type="text/javaScript">
$(document).ready(function(){
	$(".num").each(function(){
		numFormat($(this), 'num');
	});
	$(".busi").each(function(){
		numFormat($(this), 'busi');
	});
	$(".tel").each(function(){
		numFormat($(this), 'tel');
	});
	if($("#payDivn").val()=="N"){
		$("#btn_xpay").remove();
	}
	$("#td_viewList_status").text($("#td_viewAddList_status").text());
});
<%-- iframe load 이벤트 --%>
$('iframe').load(function(){
	fncUpdateFile();
});
function isMobile(){
	return /(iphone|ipod|ipad|android|blackberry|windows ce|palm|symbian)/i.test(navigator.userAgent);
}
function fncPopPrint(){
	fncPageBoard('pop','popPrint.do','','','400','500');
	fncLoadingEnd();
}
function fncUpdateFile(){
	$.ajax({
		method : "POST",
		url : "updateFile.do",
		data : {"ordernumber":$("#ordernumber").val(),"atchFileId" : $("#atchFileId").val()},
		dataType : "JSON",
		success : function(data){
		},error : function(req, text){
		}
	});
}
function fncDscnYn(num, divn){
	
	if(!confirm("재신청 하시겠습니까?")){
		return false;
	}
	
	fncLoadingStart();
	$.ajax({
		method : "POST",
		url : "/mif/mif0092/dscnYn.do",
		data : {"ordernumber":num, "dscnYn":divn},
		dataType : "JSON",
		success : function(data){
			alert("재신청 되었습니다");
			fncPageBoard('addList','fedViewAddList.do', 1);
		},error : function(req, text){
			alert("실패하였습니다..");
		},complete : function(){
			fncLoadingEnd();
		} 
	});
}

function fncStatusCancel(num, divn){
	
	if(!confirm("수강취소를 신청하시겠습니까?")){
		return false;
	}
	
	fncLoadingStart();
	$.ajax({
		method : "POST",
		url : "/mif/mif0092/statusChange.do",
		data : {"ordernumber":num, "status":divn},
		dataType : "JSON",
		success : function(data){
			alert("수강취소가 신청되었습니다");
			fncPageBoard('addList','fedViewAddList.do', 1);
		},error : function(req, text){
			alert("실패하였습니다..");
		},complete : function(){
			fncLoadingEnd();
		} 
	});
}

$("#btn_xpay").click(function(){
	var typeChk = "P";
	if(isMobile()){
		typeChk = "M";
	}	
	fncPayAciton("${orderVO.ordernumber}",typeChk);
	return false;
});

function fncPayAciton(ordernumber){
	$("#btn_xpay").off("click");
	
	fncLoadingStart();
	$.ajax({
		method : "POST",
		url : "/xpay/payreq.do",
		data : {"ordernumber":ordernumber, "typeChk":typeChk},
		dataType : "JSON",
		success : function(data){
			if(data.stop){
				alert(data.msg);
			}else{
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
			}
		},error : function(req, text){
			alert("결제가 실패하였습니다..");
		},complete : function(){
			$("#btn_xpay").on("click",function(){
				var typeChk = "P";
				if(isMobile()){
					typeChk = "M";
				}	
				fncPayAciton("${orderVO.ordernumber}",typeChk);
				return false;
			});
			fncLoadingEnd();
		}
	});
}
</script>