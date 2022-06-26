<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<c:set var="url" value="${requestScope['javax.servlet.forward.request_uri']}"/>
<script type="text/javascript" src="/publish/frt/js/board.js"></script>
<script type="text/javascript">
</script>
	<div class="cont_box">
		<form id="defaultFrm" name="defaultFrm" method="post" onsubmit="return false;">
		<input type="hidden" id="kind" name="kind" value="M"/>
		<input type="hidden" id="quitStatus" name="quitStatus" value="N"/>
		<input type="hidden" id="tchrYn" name="tchrYn" value="N"/>
		<div class="tbl_wrap">
			<div class="tit_area">
	            <div class="left"><h3 class="md_tit"><span>개인회원 정보</span></h3></div>
	            <div class="right"><span class="essential_txt"><span>*</span>는 필수입력입니다.</span></div>
	        </div>
			<table class="join_tbl">
				<caption>개인회원 정보</caption>
				<colgroup class="m_hid">
					<col style="width:15%;">
					<col style="width:35%;">
					<col style="width:15%;">
					<col style="width:35%;">
				</colgroup> 
				<tbody>
					<tr>
						<th scope="row"><strong>아이디</strong></th>
                        <td>
                            <input type="hidden" id="id" name="id" maxlength="10" value="${userVO.id }" />
		                    <span style="font-weight: bold;">[ ${userVO.id } ]</span>
                        </td>
                        <th scope="row"><strong class="th_tit">성명</strong></th>
						<td>
							<input type="text" id="name" name="name" class="text pc_w60p" maxlength="20" value="${userVO.name }" placeholder="성명을 입력해주세요"/>
						</td>
					</tr>
					<tr>
                        <th scope="row"><strong class="pwnoTh">비밀번호</strong></th>
                        <td>
                            <input type="password" id="passwd" name="passwd" class="text pc_w60p m_w65p" maxlength="20" placeholder="4~20자의 영문 대소문자, 숫자, 특수문자"/>
                          　<span class="checkboxs m_m0 m-inline"><input type="checkbox" id="passwdUpdate"><label for="passwdUpdate" class="m_m0"><span class="txt">변경하기</span></label></span>
                        </td>
                        <th scope="row"><strong class="pwnoTh">비밀번호 확인</strong></th>
                        <td>
                        	<input type="password" id="passwdRe" name="passwdRe" class="text pc_w60p" maxlength="20" />
                        </td>
                    </tr>
					<tr>
						<th scope="row"><strong class="th_tit">휴대전화</strong></th>
                        <td>
                            <input type="text" id="cell" name="cell" class="text pc_w60p numOnly" maxlength="11" value="${userVO.cell }" placeholder="'-'를 제외한 숫자만 입력해 주세요"/>
                        </td>
						<th scope="row"><strong>전화번호</strong></th>
                        <td>
                            <input type="text" id="tel" name="tel" class="text pc_w60p numOnly" maxlength="11" value="${userVO.tel }" placeholder="'-'를 제외한 숫자만 입력해 주세요"/>
                        </td>
					</tr>
					<tr>
						<th scope="row"><strong class="th_tit">이메일</strong></th>
                        <td>
                            <input type="text" id="email" name="email" class="text pc_w60p m_w70p" maxlength="50" value="${userVO.email }" placeholder="이메일을 입력해주세요"/>
                            <a href="javascript:void(0)" class="btn btn_sml btn_confirm" onclick="ovrlpCheck('eml')" >중복확인</a>
                        </td>
                        <th scope="row"><strong>이메일 수신 여부</strong></th>
                        <td colspan="3">
							<span class="radios"><input type="radio" id="mailReceive_y" name="mailReceive" class="cursor" value="Y" ${userVO.mailReceive eq 'Y' ? 'checked' : ''} /><label for="mailReceive_y" class="cursor">예</label></span>　
                        	<span class="radios"><input type="radio" id="mailReceive_n" name="mailReceive" class="cursor" value="N" ${userVO.mailReceive eq 'N' ? 'checked' :	 empty userVO.mailReceive ? 'checked' : ''} /><label for="mailReceive_n" class="cursor">아니요</label></span>
                        </td>
					</tr>
					<tr>
						<th scope="row"><strong class="th_tit">주소</strong></th>
                        <td colspan="3">
							<input type="text" id="post" name="post" class="text w100 c" maxlength="6" value="${userVO.post }" readonly="readonly" placeholder="우편번호" style="margin-right: 0px; padding: 0px;"/>
							<a href="javascript:void(0)" class="btn btn_sml btn_confirm" onclick="daum_post()">주소검색</a><br />
							<input type="text" id="addr1" name="addr1" class="text pc_w59p" maxlength="50" value="${userVO.addr1 }" readonly="readonly" placeholder="주소" style="margin-top:5px; margin-left: 0px;"/>							
							<input type="text" id="addr2" name="addr2" class="text pc_w59p" maxlength="50"value="${userVO.addr2 }" placeholder="상세주소" style="margin-top:5px; margin-left: 0px;"/>
                        </td>
					</tr>
					<tr>
						<th scope="row"><strong>직업</strong></th>
						<td colspan="3">
							<input type="text" id="job" name="job" class="text pc_w24p" maxlength="20" value="${userVO.job }" placeholder="직업을 입력해주세요"/>
						</td>
					</tr>
					<tr>
						<th scope="row"><strong class="strong_cls">직장명(학교명)</strong></th>
						<td>
							<input type="text" id="busiName" name="busiName" class="text pc_w60p" maxlength="50" value="${userVO.busiName }" placeholder="직장명(학교명)을 입력해주세요"/>
						</td>
						<th scope="row"><strong>부서명(학부/학과)</strong></th>
						<td>
							<input type="text" id="takeStation" name="takeStation" class="text pc_w60p" maxlength="50" value="${userVO.takeStation }" placeholder="부서명(학부/학과)을 입력해주세요"/>
						</td>
					</tr>
					<tr>
						<th scope="row"><strong>직급(학년)</strong></th>
						<td>
							<input type="text" id="takePosition" name="takePosition" class="text pc_w60p" maxlength="50" value="${userVO.takePosition }" placeholder="직급(학년)을 입력해주세요"/>
						</td>
						<th scope="row"><strong>홈페이지</strong></th>
						<td>
							<input type="text" id="homepage" name="homepage" class="text pc_w60p" maxlength="50" value="${userVO.homepage }" placeholder="http://"/>
						</td>
					</tr>
					<tr>
						<th scope="row"><strong>회사 전화번호</strong></th>
                        <td>
                            <input type="text" id="telo" name="telo" class="text pc_w60p numOnly" maxlength="11" value="${userVO.telo }" placeholder="'-'를 제외한 숫자만 입력해 주세요"/>
                        </td>
						<th scope="row"><strong>회사 팩스번호</strong></th>
                        <td>
                            <input type="text" id="fax" name="fax" class="text pc_w60p numOnly" maxlength="11" value="${userVO.fax }" placeholder="'-'를 제외한 숫자만 입력해 주세요"/>
                        </td>
					</tr>
					<tr>
                        <th scope="row"><strong>회원사여부</strong></th>
                        <td>
							<span class="radios"><input type="radio" id="memType_y" name="memType" value="Y" ${userVO.memType eq 'Y' ? 'checked' : ''} /><label for="memType_y" class="cursor">회원사</label></span>
                        	<span class="radios"><input type="radio" id="memType_n" name="memType" value="N" ${userVO.memType eq 'N' ? 'checked' : empty userVO.memType ? 'checked' : ''} /><label for="memType_n" class="cursor">비회원사</label></span>
                        </td>
						<th scope="row"><strong>강사회원 신청</strong></th>
                        <td>
							<span class="checkboxs m_m0 m-inline"><input type="checkbox" id="tchr_move" name="tchr_move" onclick="fncTchr_move();"/><label for="tchr_move" class="cursor">체크시 강사회원으로 신청됩니다</label></span>
                        </td>
					</tr>					
					<tr>
						<th scope="row"><strong>탈퇴 사유</strong></th>
						<td colspan="3"><input type="text" id="quitContent" class="text pc_w100p m_w100p" placeholder="탈퇴시 입력해 주세요"/></td>
					</tr>
				</tbody>
			</table>
		</div>
		
		<div class="tbl_wrap" id="tbl_tchr" style="display: none;">
			<div class="tit_area">
	            <div class="left"><h3 class="md_tit"><span>강사정보</span></h3></div>
	            <div class="right"><span class="essential_txt"><span>*</span>는 필수입력입니다.</span></div>
	        </div>
	        <table class="join_tbl">
				<caption>강사정보</caption>
				<colgroup class="m_hid">
					<col style="width:7.5%;">
					<col style="width:7.5%;">
					<col style="width:8.75%;">
					<col style="width:8.75%;">
					<col style="width:8.75%;">
					<col style="width:8.75%;">
					<col style="width:7.5%;">
					<col style="width:7.5%;">
					<col style="width:8.75%;">
					<col style="width:8.75%;">
					<col style="width:8.75%;">
					<col style="width:8.75%;">
				</colgroup> 
				<tbody>
					<tr>
                        <th scope="row" colspan="2"><strong>강사승인상태</strong></th>
                        <td colspan="10">
                            <input type="hidden" id="tchrStep" name="tchrStep" value="${userVO.tchrStep }"/>
                            <span id="span_tchrStep">
	                            ${userVO.tchrStep eq '0' ? '미신청' : userVO.tchrStep eq '1' ? '신　청' : userVO.tchrStep eq '2' ? '승　인' : userVO.tchrStep eq '3' ? '반　려' : '-'}
                            </span>　
                            <c:if test="${userVO.tchrStep eq '0' or userVO.tchrStep eq '3' }">
	                            <a href="javascript:void(0)" class="btn btn_sml btn_confirm" id="btn_tchrStep" onclick="fncTchrStep()" >신청하기</a>
                            </c:if>
                        </td>
					</tr>
					<tr>
						<th scope="row" colspan="2"><strong class="th_tit">성명(한자)</strong></th>
                        <td colspan="4">
                            <input type="text" id="tchrNm" name="tchrNm" class="text pc_w60p" value="${userVO.tchrNm }" maxlength="20" placeholder="성명(한자)을 입력해주세요"/>
                        </td>
                        <th scope="row" colspan="2"><strong class="th_tit">성별</strong></th>
                        <td colspan="4">
                            <input type="radio" id="tchrGender_m" name="tchrGender" class="cursor" value="M" ${userVO.tchrGender eq 'M' ? 'checked' : ''}/><label for="tchrGender_m" class="cursor">남성</label>　
                            <input type="radio" id="tchrGender_f" name="tchrGender" class="cursor" value="F" ${userVO.tchrGender eq 'F' ? 'checked' : ''}/><label for="tchrGender_f" class="cursor">여성</label>
                        </td>
					</tr>
					<tr>
						<th scope="row" colspan="2" class="group"><strong>강의분야</strong></th>
						<td colspan="10">
							 <div class="m_wrap">								
								 <table class="in_tbl">
								 	<caption>강의분야</caption>
								 	<colgroup>
										<col class="pc_w20p m_w20p">
										<col class="pc_w30p m_w30p">
										<col class="pc_w20p m_w20p">
										<col class="pc_w30p m_w30p">
									</colgroup>
								 	<tbody>
								 		<tr>
											<th scope="row"><strong>대분류</strong></th>
					                        <td>
					                            <input type="text" id="tchrFldLarge" name="tchrFldLarge" class="text w80p" value="${userVO.tchrFldLarge }" maxlength="100" placeholder="대분류를 입력해주세요"/>
					                        </td>
					                        <th scope="row"><strong>중분류</strong></th>
					                        <td>
					                            <input type="text" id="tchrFldMiddle" name="tchrFldMiddle" class="text w80p" value="${userVO.tchrFldMiddle }" maxlength="100" placeholder="중분류를 입력해주세요"/>
					                        </td>
										</tr>
										<tr>
											<th scope="row"><strong>소분류</strong></th>
					                        <td>
					                            <input type="text" id="tchrFldSmall" name="tchrFldSmall" class="text w80p" value="${userVO.tchrFldSmall }" maxlength="100" placeholder="소분류를 입력해주세요"/>
					                        </td>
					                        <th scope="row"><strong>세분류</strong></th>
					                        <td>
					                            <input type="text" id="tchrFldDetail" name="tchrFldDetail" class="text w80p" value="${userVO.tchrFldDetail }" maxlength="100" placeholder="세분류를 입력해주세요"/>
					                        </td>
										</tr>
										<tr>
											<th scope="row"><strong>기타</strong></th>
					                        <td colspan="3">
					                            <input type="text" id="tchrFldEtc" name="tchrFldEtc" class="text w80p" value="${userVO.tchrFldEtc }" maxlength="100" placeholder="기타를 입력해주세요"/>
					                        </td>
										</tr>
								 	</tbody>							 	
								 </table>
							 </div>
						</td>
					</tr>	
					<tr>
						<th scope="row" colspan="2" class="group"><strong>학력사항　</strong><span class="group_btn"><a href="javascript:void(0)" class="btn btn_sml btn_add" onclick="fncTrAdd('tr_edu');">　추　가　</a></span></th>
						<td colspan="10" >
							<div class="m_wrap">
								<table class="in_tbl">
									<caption>학력사항</caption>
									<colgroup>
										<col class="pc_w18p m_w150">
										<col class="pc_w18p m_w100">
										<col class="pc_w18p m_w100">
										<col class="pc_w18p m_w100">
										<col class="m_w100">
										<col class="pc_w10p m_w100">
									</colgroup>
									<thead>
										<tr class="tr_edu">
											<th scope="col">기간</th>
											<th scope="col">학교명</th>
											<th scope="col">전공학과</th>
											<th scope="col">학위</th>
											<th scope="col">비고</th>
											<th scope="col">삭제</th>
										</tr>
									</thead>
									<tbody>
										<c:choose>
											<c:when test="${fn:length(eduList) > 0 }">
												<c:forEach var="list" items="${eduList }" varStatus="status">
													<tr id="tr_edu_${status.count }" class="tr_edu">
														<td>
															<input type="text" id="eduPeri_${status.count }" name="arrEduPeri" class="text" value="${list.eduPeri }" maxlength="100" placeholder="예시) 2020.01~2020.12"/>
														</td>
														<td>
															<input type="text" id="school_${status.count }" name="arrSchool" class="text" value="${list.school }" maxlength="20" placeholder="학교명"/>
														</td>
														<td>
															<input type="text" id="major_${status.count }" name="arrMajor" class="text" value="${list.major }" maxlength="20" placeholder="전공학과"/>
														</td>
														<td>
															<input type="text" id="degree_${status.count }" name="arrDegree" class="text" value="${list.degree }" maxlength="20" placeholder="학위"/>
														</td>
														<td>
															<input type="text" id="eduRmrk_${status.count }" name="arrEduRmrk" class="text" value="${list.eduRmrk }" maxlength="100" placeholder="비고"/>
														</td>
														<td>
															<a href="javascript:void(0)" class="btn btn_sml btn_del" onclick="fncTrDel('tr_edu', '${status.count }');">　삭　제　</a>
															<input type="hidden" id="tchrEduSeq_${status.count }" name="arrTchrEduSeq" value="${list.tchrEduSeq }"/>
														</td>
													</tr>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<tr id="tr_edu_1" class="tr_edu">
													<td >
														<input type="text" id="eduPeri_1" name="arrEduPeri" class="text" maxlength="100" placeholder="예시) 2020.01~2020.12"/>
													</td>
													<td >
														<input type="text" id="school_1" name="arrSchool" class="text" maxlength="20" placeholder="학교명"/>
													</td>
													<td >
														<input type="text" id="major_1" name="arrMajor" class="text" maxlength="20" placeholder="전공학과"/>
													</td>
													<td>
														<input type="text" id="degree_1" name="arrDegree" class="text" maxlength="20" placeholder="학위"/>
													</td>
													<td>
														<input type="text" id="eduRmrk_1" name="arrEduRmrk" class="text" maxlength="100" placeholder="비고"/>
													</td>
													<td>
														<a href="javascript:void(0)" class="btn btn_sml btn_del" onclick="fncTrDel('tr_edu', '1');">　삭　제　</a>
														<input type="hidden" id="tchrEduSeq_1" name="arrTchrEduSeq" value=" "/>
													</td>
												</tr>
											</c:otherwise>
										</c:choose>
									</tbody>
								</table>
							</div>
						</td>						
					</tr>					
					<tr>
						<th scope="row" colspan="2" class="group"><strong>경력사항　</strong><span class="group_btn"><a href="javascript:void(0)" class="btn btn_sml btn_add" onclick="fncTrAdd('tr_crr');">　추　가　</a></span></th>
						<td colspan="10">
							<div class="m_wrap">
								<table class="in_tbl">
									<caption>경력사항</caption>
									<colgroup>
										<col class="pc_w18p m_w150">
										<col class="pc_w18p m_w100">
										<col class="pc_w18p m_w100">
										<col class="pc_w18p m_w100">
										<col class="m_w100">
										<col class="pc_w10p m_w100">
									</colgroup>
									<thead>
										<tr class="tr_crr">
											<th scope="col">기간</th>
											<th scope="col">근무처</th>
											<th scope="col">부서</th>
											<th scope="col">직위</th>
											<th scope="col">주요업무내용</th>
											<th scope="col">삭제</th>
										</tr>
									</thead>
									<tbody>
										<c:choose>
											<c:when test="${fn:length(crrList) > 0 }">
												<c:forEach var="list" items="${crrList }" varStatus="status">
													<tr id="tr_crr_${status.count }" class="tr_crr">
														<td>
															<input type="text" id="crrPeri_${status.count }" name="arrCrrPeri" class="text" value="${list.crrPeri }" maxlength="100" placeholder="예시) 2020.01~2020.12"/>
														</td>
														<td>
															<input type="text" id="work_${status.count }" name="arrWork" class="text" value="${list.work }" maxlength="20" placeholder="근무처"/>
														</td>
														<td>
															<input type="text" id="dprt_${status.count }" name="arrDprt" class="text" value="${list.dprt }" maxlength="20" placeholder="부서"/>
														</td>
														<td>
															<input type="text" id="pstn_${status.count }" name="arrPstn" class="text" value="${list.pstn }" maxlength="20" placeholder="직위"/>
														</td>
														<td>
															<input type="text" id="jobCont_${status.count }" name="arrJobCont" class="text" value="${list.jobCont }" maxlength="100" placeholder="주요업무내용"/>
														</td>
														<td class="c">
															<a href="javascript:void(0)" class="btn btn_sml btn_del" onclick="fncTrDel('tr_crr', '${status.count }');">　삭　제　</a>
															<input type="hidden" id="tchrCrrSeq_${status.count }" name="arrTchrCrrSeq" value="${list.tchrCrrSeq }"/>
														</td>
													</tr>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<tr id="tr_crr_1" class="tr_crr">
													<td>
														<input type="text" id="crrPeri_1" name="arrCrrPeri" class="text" maxlength="100" placeholder="예시) 2020.01~2020.12"/>
													</td>
													<td>
														<input type="text" id="work_1" name="arrWork" class="text" maxlength="20" placeholder="근무처"/>
													</td>
													<td>
														<input type="text" id="dprt_1" name="arrDprt" class="text" maxlength="20" placeholder="부서"/>
													</td>
													<td>
														<input type="text" id="pstn_1" name="arrPstn" class="text" maxlength="20" placeholder="직위"/>
													</td>
													<td>
														<input type="text" id="jobCont_1" name="arrJobCont" class="text" maxlength="100" placeholder="주요업무내용"/>
													</td>
													<td class="c">
														<a href="javascript:void(0)" class="btn btn_sml btn_del" onclick="fncTrDel('tr_crr', '1');">　삭　제　</a>
														<input type="hidden" id="tchrCrrSeq_1" name="arrTchrCrrSeq" value=" "/>
													</td>
												</tr>
											</c:otherwise>
										</c:choose>
									</tbody>
								</table>
							</div>
						</td>						
					</tr>				
					
					<tr>
						<th scope="row" colspan="2" class="group"><strong>강의경력　</strong><span class="group_btn"><a href="javascript:void(0)" class="btn btn_sml btn_add" onclick="fncTrAdd('tr_lctr');">　추　가　</a></span></th>
						<td scope="row" colspan="10">
							<div class="m_wrap">
								<table class="in_tbl">
									<caption>강의경력</caption>
									<colgroup>
										<col class="pc_w18p m_w150">
										<col class="pc_w14p m_w100">
										<col class="pc_w14p m_w100">
										<col class="pc_w14p m_w100">
										<col class="pc_w10p m_w100">
										<col class="pc_w10p m_w100">
										<col class="m_w100">
										<col class="pc_w10p m_w100">
									</colgroup>
									<thead>
										<tr class="tr_lctr">
											<th scope="col">기간</th>
											<th scope="col">학교(기관)명</th>
											<th scope="col">대상</th>
											<th scope="col">강의과목</th>
											<th scope="col">교육시간</th>
											<th scope="col">교재</th>
											<th scope="col">비고</th>
											<th scope="col">삭제</th>
										</tr>
									</thead>
									<tbody>
										<c:choose>
											<c:when test="${fn:length(lctrList) > 0 }">
												<c:forEach var="list" items="${lctrList }" varStatus="status">
													<tr id="tr_lctr_${status.count }" class="tr_lctr">
														<td>
															<input type="text" id="lctrPeri_${status.count }" name="arrLctrPeri" class="text" value="${list.lctrPeri }" maxlength="100" placeholder="예시) 2020.01~2020.12"/>
														</td>
														<td >
															<input type="text" id="orgNm_${status.count }" name="arrOrgNm" class="text" value="${list.orgNm }" maxlength="20" placeholder="학교(기관)명"/>
														</td>
														<td>
															<input type="text" id="tgt_${status.count }" name="arrTgt" class="text" value="${list.tgt }" maxlength="20" placeholder="대상"/>
														</td>
														<td>
															<input type="text" id="subject_${status.count }" name="arrSubject" class="text" value="${list.subject }" maxlength="20" placeholder="강의과목"/>
														</td>
														<td>
															<input type="text" id="lctrTime_${status.count }" name="arrLctrTime" class="text numOnly" value="${list.lctrTime }" maxlength="5" placeholder="교육시간"/>
														</td>
														<td>
															<input type="text" id="lctrBook_${status.count }" name="arrLctrBook" class="text" value="${list.lctrBook }" maxlength="20" placeholder="교재"/>
														</td>
														<td>
															<input type="text" id="lctrRmrk_${status.count }" name="arrLctrRmrk" class="text" value="${list.lctrRmrk }" maxlength="100" placeholder="비고"/>
														</td>
														<td class="c">
															<a href="javascript:void(0)" class="btn btn_sml btn_del" onclick="fncTrDel('tr_lctr', '${status.count }');">　삭　제　</a>
															<input type="hidden" id="tchrLctrSeq_${status.count }" name="arrTchrLctrSeq" value="${list.tchrLctrSeq }"/>
														</td>
													</tr>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<tr id="tr_lctr_1" class="tr_lctr">
													<td>
														<input type="text" id="lctrPeri_1" name="arrLctrPeri" class="text" maxlength="100" placeholder="예시) 2020.01~2020.12"/>
													</td>
													<td>
														<input type="text" id="orgNm_1" name="arrOrgNm" class="text" maxlength="20" placeholder="학교(기관)명"/>
													</td>
													<td>
														<input type="text" id="tgt_1" name="arrTgt" class="text" maxlength="20" placeholder="대상"/>
													</td>
													<td>
														<input type="text" id="subject_1" name="arrSubject" class="text" maxlength="20" placeholder="강의과목"/>
													</td>
													<td>
														<input type="text" id="lctrTime_1" name="arrLctrTime" class="text numOnly" maxlength="5" placeholder="숫자만 입력"/>
													</td>
													<td>
														<input type="text" id="lctrBook_1" name="arrLctrBook" class="text" maxlength="20" placeholder="교재"/>
													</td>
													<td>
														<input type="text" id="lctrRmrk_1" name="arrLctrRmrk" class="text" maxlength="100" placeholder="비고"/>
													</td>
													<td class="c">
														<a href="javascript:void(0)" class="btn btn_sml btn_del" onclick="fncTrDel('tr_lctr', '1');">　삭　제　</a>
														<input type="hidden" id="tchrLctrSeq_1" name="arrTchrLctrSeq" value=" "/>
													</td>
												</tr>
											</c:otherwise>
										</c:choose>
									</tbody>
								</table>
							</div>
						</td>
					</tr>				
					
					<tr>
						<th scope="row" colspan="2" class="group"><strong>저　　서　</strong><span class="group_btn"><a href="javascript:void(0)" class="btn btn_sml btn_add" onclick="fncTrAdd('tr_book');">　추　가　</a></span></th>
						<td scope="row" colspan="10">
							<div class="m_wrap">
								<table class="in_tbl">
									<caption>저서</caption>
									<colgroup>
										<col class="pc_w20p m_w150">
										<col class="pc_w20p m_w150">
										<col class="pc_w20p m_w100">
										<col class="m_w150">
										<col class="pc_w10p m_w100">
									</colgroup>
									<thead>
										<tr class="tr_book">
											<th scope="col">저서명</th>
											<th scope="col">출판사</th>
											<th scope="col">출판년도</th>
											<th scope="col">공저 및 편저사항</th>
											<th scope="col">삭제</th>
										</tr>
									</thead>
									<tbody>
										<c:choose>
											<c:when test="${fn:length(bookList) > 0 }">
												<c:forEach var="list" items="${bookList }" varStatus="status">
													<tr id="tr_book_${status.count }" class="tr_book">
														<td>
															<input type="text" id="book_${status.count }" name="arrBook" class="text w100p" value="${list.book }" maxlength="20" placeholder="저서명"/>
														</td>
														<td>
															<input type="text" id="pbls_${status.count }" name="arrPbls" class="text w100p" value="${list.pbls }" maxlength="20" placeholder="출판사"/>
														</td>
														<td>
															<input type="text" id="pblsYear_${status.count }" name="arrPblsYear" class="text w100p numOnly c pd_l0" value="${list.pblsYear }" maxlength="4" placeholder="출판년도"/>
														</td>
														<td>
															<input type="text" id="bookRmrk_${status.count }" name="arrBookRmrk" class="text w100p" value="${list.bookRmrk }" maxlength="100" placeholder="공저 및 편저사항"/>
														</td>
														<td>
															<a href="javascript:void(0)" class="btn btn_sml btn_del" onclick="fncTrDel('tr_book', '${status.count }');">　삭　제　</a>
															<input type="hidden" id="tchrBookSeq_${status.count }" name="arrTchrBookSeq" value="${list.tchrBookSeq }"/>
														</td>
													</tr>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<tr id="tr_book_1" class="tr_book">
													<td>
														<input type="text" id="book_1" name="arrBook" class="text w100p" maxlength="20" placeholder="저서명"/>
													</td>
													<td>
														<input type="text" id="pbls_1" name="arrPbls" class="text w100p" maxlength="20" placeholder="출판사"/>
													</td>
													<td>
														<input type="text" id="pblsYear_1" name="arrPblsYear" class="text w100p numOnly c pd_l0" maxlength="4" placeholder="출판년도"/>
													</td>
													<td>
														<input type="text" id="bookRmrk_1" name="arrBookRmrk" class="text w100p" maxlength="100" placeholder="공저 및 편저사항"/>
													</td>
													<td>
														<a href="javascript:void(0)" class="btn btn_sml btn_del" onclick="fncTrDel('tr_book', '1');">　삭　제　</a>
														<input type="hidden" id="tchrBookSeq_1" name="arrTchrBookSeq" value=" "/>
													</td>
												</tr>
											</c:otherwise>
										</c:choose>
									</tbody>
								</table>
							</div>
						</td>
					</tr>	
					<tr>
						<th scope="row" colspan="2" class="group"><strong>학회협회　</strong><span class="group_btn"><a href="javascript:void(0)" class="btn btn_sml btn_add" onclick="fncTrAdd('tr_asct');">　추　가　</a></span></th>
						<td scope="row" colspan="10">
							<div class="m_wrap">
								<table class="in_tbl">
									<caption>학회협회</caption>
									<colgroup>
										<col class="pc_w45p m_w150">
										<col class="m_w150">
										<col class="pc_w10p m_w100">
									</colgroup>
									<thead>
										<tr class="tr_asct">
											<th scope="col">학회 및 협회</th>
											<th scope="col">담당역할</th>
											<th scope="col">삭제</th>
										</tr>
									</thead>
									<tbody>
										<c:choose>
											<c:when test="${fn:length(asctList) > 0 }">
												<c:forEach var="list" items="${asctList }" varStatus="status">
													<tr id="tr_asct_${status.count }" class="tr_asct">
														<td>
															<input type="text" id="association_${status.count }" name="arrAssociation" class="text w100p" value="${list.association }" maxlength="100" placeholder="학회 및 협회"/>
														</td>
														<td>
															<input type="text" id="role_${status.count }" name="arrRole" class="text w100p" value="${list.role }" maxlength="100" placeholder="담당역할"/>
														</td>
														<td>
															<a href="javascript:void(0)" class="btn btn_sml btn_del" onclick="fncTrDel('tr_asct', '${status.count }');">　삭　제　</a>
															<input type="hidden" id="tchrAsctSeq_${status.count }" name="arrTchrAsctSeq" value="${list.tchrAsctSeq }"/>
														</td>
													</tr>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<tr id="tr_asct_1" class="tr_asct">
													<td>
														<input type="text" id="association_1" name="arrAssociation" class="text w100p" maxlength="100" placeholder="학회 및 협회"/>
													</td>
													<td>
														<input type="text" id="role_1" name="arrRole" class="text w100p" maxlength="100" placeholder="담당역할"/>
													</td>
													<td>
														<a href="javascript:void(0)" class="btn btn_sml btn_del" onclick="fncTrDel('tr_asct', '1');">　삭　제　</a>
														<input type="hidden" id="tchrAsctSeq_1" name="arrTchrAsctSeq" value=" "/>
													</td>
												</tr>
											</c:otherwise>
										</c:choose>
									</tbody>
								</table>
							</div>
						</td>
					</tr>					
					
					<tr>
						<th scope="row" colspan="2"><strong>증명사진</strong></th>
                        <td colspan="10">
                        	<iframe name="atchFileIdFrame" id="atchFileIdFrame" src="/atch/fileUpload.do?atchFileId=${userVO.atchFileId }&fileCnt=1&atchFileIdNm=atchFileId&updateType=imageUpload" style="width: 100%;" height="50" frameborder="0" title="파일 업로드 폼"></iframe>
                            <input type="hidden" id="atchFileId" name="atchFileId" value="${userVO.atchFileId }"/>
                        </td>
					</tr>
					<tr><td colspan="12" style="border-left: 0px;"></td></tr>
					<tr>
						<th scope="row" colspan="12"><strong class="th_tit">개인정보 수집·이용에 대한 동의 추가</strong></th>
					</tr>
					<tr>
						<th scope="row" colspan="3" class="group">수집하는 개인정보 항목</th>
						<td colspan="9">성명, 연락처, 소속, 직위, 계좌번호, 주소</td>
					</tr>
					<tr>
						<th scope="row" colspan="3" class="group">개인정보의 수집 및 이용목적</th>
						<td colspan="9">제공하신 정보는 한국전파진흥협회의 수당지급(기타소득신고)을 위해서만 사용됩니다.</td>
					</tr>
					<tr>
						<th scope="row" colspan="3" class="group">개인정보의 보유 및 이용기간</th>
						<td colspan="9">수집된 개인정보의 보유기간은 5년입니다.</td>
					</tr>
					<tr><td colspan="12" style="border: 0px;">※ 귀하는 이에 대한 동의를 거부할 수 있습니다. 다만, 동의가 없을 경우 이와 관련된 업무 진행이 불가능 할 수 있음을 알려드립니다</td></tr>
					<tr>
                        <td colspan="12" class="r" style="border: 0px;">
                            <input type="radio" id="prvcPlcyYn_y" name="prvcPlcyYn" class="cursor" value="Y" ${userVO.prvcPlcyYn eq 'Y' ? 'checked' : '' }/><label for="prvcPlcyYn_y" class="cursor">동의함</label>　
                            <input type="radio" id="prvcPlcyYn_n" name="prvcPlcyYn" class="cursor" value="N" ${userVO.prvcPlcyYn eq 'N' ? 'checked' : '' }/><label for="prvcPlcyYn_n" class="cursor">동의하지 않음</label>
                        </td>
					</tr>
					<tr><td colspan="12" style="border-left: 0px;"></td></tr>
					<tr>
						<th scope="row" colspan="12"><strong class="th_tit">고유식별정보 처리에 대한 동의</strong></th>
					</tr>
					<tr>
						<th scope="row" colspan="3" class="group">수집하는 개인정보 항목</th>
						<td colspan="9">-</td>
					</tr>
					<tr>
						<th scope="row" colspan="3" class="group">개인정보의 수집 및 이용목적</th>
						<td colspan="9">제공하신 정보는 한국전파진흥협회의 수당지급(기타소득신고)을 위해서만 사용됩니다.</td>
					</tr>
					<tr>
						<th scope="row" colspan="3" class="group">개인정보의 보유 및 이용기간</th>
						<td colspan="9">수집된 고유식별정보의 보유기간은 5년입니다.</td>
					</tr>
					<tr><td colspan="12" style="border: 0px;">※ 귀하는 이에 대한 동의를 거부할 수 있습니다. 다만, 동의가 없을 경우 이와 관련된 업무 진행이 불가능 할 수 있음을 알려드립니다</td></tr>
					<tr>
                        <td colspan="12" class="r" style="border: 0px;">
                            <input type="radio" id="unqIdYn_y" name="unqIdYn" class="cursor" value="Y" ${userVO.unqIdYn eq 'Y' ? 'checked' : '' }/><label for="unqIdYn_y" class="cursor">동의함</label>　
                            <input type="radio" id="unqIdYn_n" name="unqIdYn" class="cursor" value="N" ${userVO.unqIdYn eq 'N' ? 'checked' : '' }/><label for="unqIdYn_n" class="cursor">동의하지 않음</label>
                        </td>
					</tr>
					<tr><td colspan="12" style="border-left: 0px;"></td></tr>
					<tr>
						<th scope="row" colspan="12"><strong class="th_tit">개인정보의 제 3자 제공에 대한 동의</strong></th>
					</tr>
					<tr>
						<th scope="row" colspan="3" class="group">제공 목적</th>
						<td colspan="9">정부부처 및 내/외부 감사 등에 비정기적 제공</td>
					</tr>
					<tr>
						<th scope="row" colspan="3" class="group">제공 항목</th>
						<td colspan="9">성명, 연락처, 계좌번호, 주소</td>
					</tr>
					<tr>
						<th scope="row" colspan="3" class="group">제공받는 자</th>
						<td colspan="9">국세청, 기획재정부, 한국방송통신전파진흥원, 한국전파진흥협회 등</td>
					</tr>
					<tr><td colspan="12" style="border: 0px;">※ 귀하는 이에 대한 동의를 거부할 수 있습니다. 다만, 동의가 없을 경우 이와 관련된 업무 진행이 불가능 할 수 있음을 알려드립니다</td></tr>
					<tr>
                        <td colspan="12" class="r" style="border: 0px;">
                            <input type="radio" id="prvdPrsnYn_y" name="prvdPrsnYn" class="cursor" value="Y" ${userVO.prvdPrsnYn eq 'Y' ? 'checked' : '' }/><label for="prvdPrsnYn_y" class="cursor">동의함</label>　
                            <input type="radio" id="prvdPrsnYn_n" name="prvdPrsnYn" class="cursor" value="N" ${userVOr.prvdPrsnYn eq 'N' ? 'checked' : '' }/><label for="prvdPrsnYn_n" class="cursor">동의하지 않음</label>
                        </td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="btn_area03">
			<a href="/mif/mif0090/main.do" class="btn btn_big btn_list">취소</a>
		    <a href="javascript:void(0);" class="btn btn_big btn_rewrite" id="btn_submit">수정</a>
		    <a href="javascript:void(0);" class="btn btn_big btn_del" onclick="fncQuitStatusN();">탈퇴</a>
		</div>
		</form>
	</div>
</div>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
<%-- 아이디 정규표현식. 영문 대소문자, 숫자 입력가능 --%>
var idChk = RegExp(/^[a-zA-Z0-9]{3,10}$/);
<%-- 비밀번호 정규표현식. 영문 대소문자, 숫자, 특수문자 입력가능 --%>
var pwChk = RegExp(/^[a-zA-Z0-9~`!@#$%^&*()-+\\_\\=\\?]{4,20}$/);
<%-- 일반전화 정규표현식 --%>
var telChk = RegExp(/^(02||0[3-6]{1}[1-5]{1})([0-9]{3,4})([0-9]{4})$/);
<%-- 핸드폰번호 정규표현식 --%>
var phnChk = RegExp(/^(01[0|1|6|7|8|9]{1})([0-9]{3,4})([0-9]{4})$/);
<%-- 팩스번호 정규표현식 --%>
var faxChk = RegExp(/^(02||0[0-9]{2})([0-9]{3,4})([0-9]{4})$/);
<%-- 이메일 정규표현식 --%>
var emlChk = RegExp(/^[0-9a-zA-Z-\\_]*@[0-9a-zA-Z-\\_]*\.([a-zA-Z]{2,6}||[a-zA-Z]{2,6}.[a-zA-Z]{2,6})$/);
<%-- 주민번호 정규표현식 --%>
var juminChk = RegExp(/^([0-9]{2})(0[1-9]{1}||1[0-2]{1})(0[1-9]{1}||[1-2]{1}[0-9]{1}||3[0-1]{1})([1-4]{1})([0-9]{6})$/);

$(document).ready(function(){
	<c:if test="${userVO.tchrYn eq 'Y'}">
		$("#tchr_move").prop("checked", true);
		$("#tbl_tchr").show();
	</c:if>
});

$("#email").keypress(function(){
	if (window.event.keyCode == 13) {
		ovrlpCheck('eml');
	}
});

<%-- 탈퇴하기 --%>
function fncQuitStatusN(){
	if($("#quitContent").val() == null || $("#quitContent").val() == ""){
		alert("탈퇴 사유를 입력해주세요");
		$("#quitContent").focus();
		return false;
	}
	if(!confirm("탈퇴하시겠습니까?")){
		return false;
	}
	
	$.ajax({
		method : "POST",
		url : "quitStatusN.do",
		data : {"quitContent" : $("#quitContent").val()},
		dataType : "JSON",
		success : function(data){
			alert("탈퇴 되었습니다");
			window.location.replace("/frt/main.do");
		},error : function(req, text){
			alert("탈퇴 신청이 실패하였습니다..");			
		}
	});
}

<%-- 강사승인상태 신청하기 --%>
function fncTchrStep(){
	$("#tchrStep").val("1");
	$("#span_tchrStep").text("신청");
	$("#btn_tchrStep").hide();
}

<%-- 강사TR 추가 액션 --%>
var trEduLength = "${fn:length(eduList) > 0 ? 'fn:length(eduList)' : '1' }";
var trCrrLength = "${fn:length(crrList) > 0 ? 'fn:length(crrList)' : '1' }";
var trLctrLength = "${fn:length(lctrList) > 0 ? 'fn:length(lctrList)' : '1' }";
var trBookLength = "${fn:length(bookList) > 0 ? 'fn:length(bookList)' : '1' }";
var trAsctLength = "${fn:length(asctList) > 0 ? 'fn:length(asctList)' : '1' }";
function fncTrAdd(cls){
	var trHtml = '';
	if(cls == "tr_edu"){
		trEduLength++;
		trHtml += '<tr id="tr_edu_'+trEduLength+'" class="tr_edu">';
		trHtml += '<td><input type="text" id="eduPeri_'+trEduLength+'" name="arrEduPeri" class="text w100p" maxlength="100" placeholder="예시) 2020.01~2020.12"/></td>';
		trHtml += '<td><input type="text" id="school_'+trEduLength+'" name="arrSchool" class="text w100p" maxlength="20" placeholder="학교명"/></td>';
		trHtml += '<td><input type="text" id="major_'+trEduLength+'" name="arrMajor" class="text w100p" maxlength="20" placeholder="전공학과"/></td>';
		trHtml += '<td><input type="text" id="degree_'+trEduLength+'" name="arrDegree" class="text w100p" maxlength="20" placeholder="학위"/></td>';
		trHtml += '<td><input type="text" id="eduRmrk_'+trEduLength+'" name="arrEduRmrk" class="text w100p" maxlength="100" placeholder="비고"/></td>';
		trHtml += '<td class="c"><a href="javascript:void(0)" class="btn btn_sml btn_del" onclick="fncTrDel(\'tr_edu\', \''+trEduLength+'\');">　삭　제　</a>';
		trHtml += '<input type="hidden" id="tchrEduSeq_'+trEduLength+'" name="arrTchrEduSeq" value=" "/></td></tr>';
	}
	if(cls == "tr_crr"){
		trCrrLength++;
		trHtml += '<tr id="tr_crr_'+trCrrLength+'" class="tr_crr">';
		trHtml += '<td><input type="text" id="crrPeri_'+trCrrLength+'" name="arrCrrPeri" class="text w100p" maxlength="100" placeholder="예시) 2020.01~2020.12"/></td>';
		trHtml += '<td><input type="text" id="work_'+trCrrLength+'" name="arrWork" class="text w100p" maxlength="20" placeholder="근무처"/></td>';
		trHtml += '<td><input type="text" id="dprt_'+trCrrLength+'" name="arrDprt" class="text w100p" maxlength="20" placeholder="부서"/></td>';
		trHtml += '<td><input type="text" id="pstn_'+trCrrLength+'" name="arrPstn" class="text w100p" maxlength="20" placeholder="직위"/></td>';
		trHtml += '<td><input type="text" id="jobCont_'+trCrrLength+'" name="arrJobCont" class="text w100p" maxlength="100" placeholder="주요업무내용"/></td>';
		trHtml += '<td class="c"><a href="javascript:void(0)" class="btn btn_sml btn_del" onclick="fncTrDel(\'tr_crr\', \''+trCrrLength+'\');">　삭　제　</a>';
		trHtml += '<input type="hidden" id="tchrCrrSeq_'+trCrrLength+'" name="arrTchrCrrSeq" value=" "/></td></tr>';
	}
	if(cls == "tr_lctr"){
		trLctrLength++;
		trHtml += '<tr id="tr_lctr_'+trLctrLength+'" class="tr_lctr">';
		trHtml += '<td><input type="text" id="lctrPeri_'+trLctrLength+'" name="arrLctrPeri" class="text w100p" maxlength="100" placeholder="예시) 2020.01~2020.12"/></td>';
		trHtml += '<td><input type="text" id="orgNm_'+trLctrLength+'" name="arrOrgNm" class="text w100p" maxlength="20" placeholder="학교(기관)명"/></td>';
		trHtml += '<td><input type="text" id="tgt_'+trLctrLength+'" name="arrTgt" class="text w100p" maxlength="20" placeholder="대상"/></td>';
		trHtml += '<td><input type="text" id="subject_'+trLctrLength+'" name="arrSubject" class="text w100p" maxlength="20" placeholder="강의과목"/></td>';
		trHtml += '<td><input type="text" id="lctrTime_'+trLctrLength+'" name="arrLctrTime" class="text w100p numOnly c pd_l0" maxlength="5" placeholder="교육시간"/></td>';
		trHtml += '<td><input type="text" id="lctrBook_'+trLctrLength+'" name="arrLctrBook" class="text w100p" maxlength="20" placeholder="교재"/></td>';
		trHtml += '<td><input type="text" id="lctrRmrk_'+trLctrLength+'" name="arrLctrRmrk" class="text w100p" maxlength="100" placeholder="비고"/></td>';
		trHtml += '<td class="c"><a href="javascript:void(0)" class="btn btn_sml btn_del" onclick="fncTrDel(\'tr_lctr\', \''+trLctrLength+'\');">　삭　제　</a>';
		trHtml += '<input type="hidden" id="tchrLctrSeq_'+trLctrLength+'" name="arrTchrLctrSeq" value=" "/></td></tr>';
	}
	if(cls == "tr_book"){
		trBookLength++;
		trHtml += '<tr id="tr_book_'+trBookLength+'" class="tr_book">';
		trHtml += '<td><input type="text" id="book_'+trBookLength+'" name="arrBook" class="text w100p" maxlength="20" placeholder="저서명"/></td>';
		trHtml += '<td><input type="text" id="pbls_'+trBookLength+'" name="arrPbls" class="text w100p" maxlength="20" placeholder="출판사"/></td>';
		trHtml += '<td><input type="text" id="pblsYear_'+trBookLength+'" name="arrPblsYear" class="text w100p numOnly c pd_l0" maxlength="4" placeholder="출판년도"/></td>';
		trHtml += '<td><input type="text" id="bookRmrk_'+trBookLength+'" name="arrBookRmrk" class="text w100p" maxlength="100" placeholder="공저 및 편저사항"/></td>';
		trHtml += '<td class="c"><a href="javascript:void(0)" class="btn btn_sml btn_del" onclick="fncTrDel(\'tr_book\', \''+trBookLength+'\');">　삭　제　</a>';
		trHtml += '<input type="hidden" id="tchrBookSeq_'+trBookLength+'" name="arrTchrBookSeq" value=" "/></td></tr>';
	}
	if(cls == "tr_asct"){
		trAsctLength++;
		trHtml += '<tr id="tr_asct_'+trAsctLength+'" class="tr_asct">';
		trHtml += '<td><input type="text" id="association_'+trAsctLength+'" name="arrAssociation" class="text w100p" maxlength="100" placeholder="학회 및 협회"/></td>';
		trHtml += '<td><input type="text" id="role_'+trAsctLength+'" name="arrRole" class="text w100p" maxlength="100" placeholder="담당역할"/></td>';
		trHtml += '<td class="c"><a href="javascript:void(0)" class="btn btn_sml btn_del" onclick="fncTrDel(\'tr_asct\', \''+trAsctLength+'\');">　삭　제　</a>';
		trHtml += '<input type="hidden" id="tchrAsctSeq_'+trAsctLength+'" name="arrTchrAsctSeq" value=" "/></td></tr>';
	}
	$("."+cls+":last").after(trHtml);
}

<%-- 강사TR 삭제 액션 --%>
function fncTrDel(cls, index){
	$("#"+cls+"_"+index).remove();
	if($("."+cls).length < 2){
		fncTrAdd(cls);
	}
}

<%-- 강사회원 신청 체크액션 --%>
function fncTchr_move(){
	if($("#tchr_move").prop("checked")){
		$("#tbl_tchr").show();
		$("#atchFileIdFrame").css("height", "190px");
	}else{
		$("#tbl_tchr").hide();
	}
}

<%-- 다음 주소API --%>
function daum_post(){
	new daum.Postcode({
	oncomplete: function(data) {
		var address = data.userSelectedType=='J'
								 ? data.jibunAddress : data.roadAddress;
			if( data.buildingName != '' ) address += '(' + data.buildingName + ')';
			$("#addr1").val( address );
			$("#post").val( data.zonecode );
			alertMsg("addr1");
	}
  }).open();
}

<%-- 이메일 검증 --%>
var emlPass = true;
$("#email").change(function(){
	emlPass = false;
});
<%-- 비밀번호 변경 체크 --%>
var pwPass = false;
$("#passwdUpdate").click(function(){
	if($("#passwdUpdate").prop("checked")){
		pwPass = true;
		$(".pwnoTh").addClass("th_tit");
	}else{
		pwPass = false;
		$(".pwnoTh").removeClass("th_tit");
		alertMsg("passwd");
		alertMsg("passwdRe");
	}
});

<%-- 이메일 중복체크 --%>
function ovrlpCheck(dvsn){
	var emlVal = "";
	if(dvsn == "eml"){
		emlVal = $("#email").val();
		
		if(emlVal == "" || emlVal == null) {
			alertMsg("email", "red", "이메일을 입력해주세요");
			$("#email").focus();
			emlPass = false;
			return false;
		}
		if("${userVO.email}" == emlVal && "${userVO.email}" != "" && "${userVO.email}" != null){
			alertMsg("email", "green", "기존 이메일 입니다");
			emlPass = true;
			return false;
		}
		if(!emlChk.test(emlVal)){
			alertMsg("email", "red", "이메일이 적합하지 않습니다");
			$("#email").focus();
			emlPass = false;
			return false;
		}	
	}
	
	$.ajax({
		method : "POST",
		url : "/mbr/mbr0052/ovrlpCheck.do",
		data : {"email" : emlVal},
		dataType : "JSON",
		success : function(data){
			if(data.result == "fail"){
				alert(data.msg);
			}else{
				if(data.cnt == 0){
					alertMsg(data.dvsn, "green", data.msg);
					if(data.dvsn == "email"){
						emlPass = true;
					}
				}else{
					alertMsg(data.dvsn, "red", data.msg);
					if(data.dvsn == "email"){
						emlPass = false;
					}
				}
			}
		},error : function(req, text){
			alert("중복확인이 실패하였습니다..");			
		}
	});
}

<%-- 유효성 체크 --%>
$("#btn_submit").bind("click", function(){
	
	if($("#name").val() == "" || $("#name").val() == null) {
		alertMsg("name", "red", "성명을 입력해주세요");
		$("#name").focus();
		return false;
	}else{
		alertMsg("name");
	}
	
	if(pwPass){
		if($("#passwd").val() == "" || $("#passwd").val() == null){
			alertMsg("passwd", "red", "비밀번호를 입력해주세요");
			$("#passwd").focus();
			return false;
		}
		if(!pwChk.test($("#passwd").val())){
			alertMsg("passwd", "red", "4~20자의 영문 대소문자, 숫자, 특수문자로 입력해주세요");
			$("#passwd").focus();
			return false;
		}else{
			alertMsg("passwd", "green", "비밀번호가 적합합니다");
		}
		
		if($("#passwdRe").val() == "" || $("#passwdRe").val() == null){
			alertMsg("passwdRe", "red", "비밀번호 확인을 입력해주세요");
			$("#passwdRe").focus();
			return false;
		}
		if($("#passwd").val() != $("#passwdRe").val()){
			alertMsg("passwdRe", "red", "비밀번호가 일치하지 않습니다");
			$("#passwdRe").focus();
			return false;
		}else{
			alertMsg("passwdRe", "green", "비밀번호가 일치합니다");
		}
	}
	
	if($("#cell").val() == "" || $("#cell").val() == null){
		alertMsg("cell", "red", "휴대전화를 입력해주세요");
		return false;
	}
	
	if(!phnChk.test($("#cell").val())){
		alertMsg("cell", "red", "휴대전화가 적합하지 않습니다");
		$("#cell").focus();
		return false;
	}else{
		alertMsg("cell");
	}	
	
	if($("#tel").val() != "" && $("#tel").val() != null){
		if(!telChk.test($("#tel").val())){
			alertMsg("tel", "red", "전화번호가 적합하지 않습니다");
			$("#tel").focus();
			return false;
		}else{
			alertMsg("tel");
		}	
	}else{
		alertMsg("tel");
	}
	
	if($("#email").val() == "" || $("#email").val() == null) {
		alertMsg("email", "red", "이메일을 입력해주세요");
		$("#email").focus();
		emlPass = false;
		return false;
	}
	
	if(!emlPass){
		if("${userVO.email}" == $("#email").val() && "${userVO.email}" != "" && "${userVO.email}" != null){
			alertMsg("email", "green", "기존 이메일 입니다");
			emlPass = true;
		}else{
			alertMsg("email", "red", "이메일 중복검사를 해주세요");
			$("#email").focus();
			emlPass = false;
			return false;
		}
	}
	
	if($("#addr1").val() == "" || $("#addr1").val() == null){
		alertMsg("addr1", "red", "주소를 검색해주세요");
		$("#addr1").focus();
		return false;
	}else{
		alertMsg("addr1");
	}
	
	if($("#addr2").val() == "" || $("#addr2").val() == null){
		alertMsg("addr1", "red", "상세주소를 입력해주세요");
		$("#addr2").focus();
		return false;
	}else{
		alertMsg("addr1");
	}
	
	if($("#telo").val() != "" && $("#telo").val() != null){
		if(!telChk.test($("#telo").val())){
			alertMsg("telo", "red", "회사 전화번호가 적합하지 않습니다");
			$("#telo").focus();
			return false;
		}else{
			alertMsg("telo");
		}
	}else{
		alertMsg("telo");
	}

	if($("#fax").val() != "" && $("#fax").val() != null){
		if(!faxChk.test($("#fax").val())){
			alertMsg("fax", "red", "회사 팩스번호가 적합하지 않습니다");
			$("#fax").focus();
			return false;
		}else{
			alertMsg("fax");
		}
	}else{
		alertMsg("fax");
	}
	
	if($("#tchr_move").prop("checked")){
		if($("#tchrNm").val() == "" || $("#tchrNm").val() == null) {
			alertMsg("tchrNm", "red", "성명(한자)을 입력해주세요");
			$("#tchrNm").focus();
			return false;
		}else{
			alertMsg("tchrNm");
		}
		if(!$("#tchrGender_m").prop("checked") && !$("#tchrGender_f").prop("checked")){
			alertMsg("tchrGender_m", "red", "성별을 선택해주세요");
			return false;
		}else{
			alertMsg("tchrGender_m");
		}
		if(!$("#prvcPlcyYn_y").prop("checked") && !$("#prvcPlcyYn_n").prop("checked")){
			alertMsg("prvcPlcyYn_y", "red", "개인정보 수집·이용에 대한 동의 추가를 선택해주세요");
			return false;
		}else{
			alertMsg("prvcPlcyYn_y");
		}
		if(!$("#unqIdYn_y").prop("checked") && !$("#unqIdYn_n").prop("checked")){
			alertMsg("unqIdYn_y", "red", "고유식별정보 처리에 대한 동의를 선택해주세요");
			return false;
		}else{
			alertMsg("unqIdYn_y");
		}
		if(!$("#prvdPrsnYn_y").prop("checked") && !$("#prvdPrsnYn_n").prop("checked")){
			alertMsg("prvdPrsnYn_y", "red", "개인정보의 제 3자 제공에 대한 동의를 선택해주세요");
			return false;
		}else{
			alertMsg("prvdPrsnYn_y");
		}
		if(!$("#prvcPlcyYn_y").prop("checked") || !$("#unqIdYn_y").prop("checked") || !$("#prvdPrsnYn_y").prop("checked")){
			alert("정보의 수집·이용, 제공 및 처리에 모두 동의해주십시오");
			return false;
		}
		
		$("#tchrYn").val("Y");
	}else{
		$("#table_tchr").remove();
	}
	
	if(pwPass == false){
		$("#passwd").val("");
		$("#passwdRe").val("");
	}
	
	fncPageBoard('submit','userInfoSubmit.do');
	return false;
});
</script>