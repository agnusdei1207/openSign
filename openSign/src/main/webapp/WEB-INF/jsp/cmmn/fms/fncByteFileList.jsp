<%@ page language="java" isELIgnored="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=Edge">
	<link rel="stylesheet" type="text/css" href="/publish/mgr/css/style.css">
	<link rel="stylesheet" type="text/css" href="/publish/mgr/css/jquery-ui-1.12.1.custom.css">
	<script type="text/javascript" src="/publish/mgr/js/jquery-1.11.3.min.js"></script>
	<script type="text/javascript" src="/publish/mgr/js/common.js"></script>
	<script type="text/javascript">
	var atchId;
	var fileSize=150485760;
	$(document).ready(function(){
		
		
		
		var parentUrl = parent.document.location.href;
		var myUrl = document.location.href;
		
		
		
		if(parentUrl == myUrl){
			location.href = "/error/error404.do";
		}
		
		if("${fileVO.atchFileId}" != ""){
			//Iframe의 높이 설정
			parent.$("#${fileVO.atchFileIdNm}Frame").height($("#defaultFrm table tbody tr").length * 20 +100 );
			parent.$("#${fileVO.atchFileIdNm}").val("${fileVO.atchFileId}");
			var loc = ""+parent.document.location ; 
			
			if(loc.indexOf("view.do") > 0){
				parent.$("#${fileVO.atchFileIdNm}Frame").height($("#defaultFrm table tbody tr").length * 30 +100 );
			}
		}else if("${fn:length(resultList)}" == "0"){
			parent.$("#${fileVO.atchFileIdNm}").val("");
		}else{
			parent.$("#${fileVO.atchFileIdNm}").val("");
		}
		$("#fncFileDelteBtn").click(function(){
			var chLen = 0;
			$(".chbox").each(function(idx, item){
				var isChecked = $(this).is(":checked");
				
				if(isChecked == true){
					chLen++;
				}
			});
			
			if(chLen == 0){
				alert("선택된 파일이 없습니다.");
			}else{
				if(confirm(chLen + "개의 파일을 삭제하시겠습니까?")){
					$(".chbox").each(function(idx, item){
						var isChecked = $(this).is(":checked");
						
						if(isChecked == true){
							var chboxId = $(this).attr('id');
							var chboxSeq = $(this).attr('seq');
							
							fncFileDeleteFrame(chboxId, chboxSeq);
						}
					});
				}
			}
		});
		
		$("#allcheck").click(function(){
			if($("#allcheck").is(":checked") == true){
				$(".chbox").prop('checked', true); 
			}else{
				$(".chbox").prop('checked', false); 
			}
		});
		
		
		
		if(navigator.userAgent.indexOf('MSIE') !== -1 || navigator.appVersion.indexOf('Trident/') > 0){
			var rv = 0;
			var ua = navigator.userAgent;
			var re = new RegExp("MSIE ([0-9]{1,}[\.0-9]{0,})");
			if(re.exec(ua) != null){
				rv = parseFloat(RegExp.$1);
			}
			if(rv != 0 && rv <= 9){
				$("#pop_container").remove();
			}
		}
	});
	
	window.onload = function(){
		var url = parent.document.location + "";
		 var height = parseInt($("#defaultFrm").css("height").replace("px",""));
		 parent.$("#${fileVO.atchFileIdNm}Frame").height(height+5); 
			/* if(parent.self.opener){
				parent.fncResize();
			} */
			
	} 
	
	function fn_FileUpload(){
		if(${fileVO.fileCnt} > ${fn:length(resultList)}){
			if($("#fileForm").val() == ""){
				//alert("첨부파일을 선택해 주세요.");
				return false;
			}else{
				var fileNm = $("#fileForm").val();
				var fileExt = fileNm.substring(fileNm.lastIndexOf(".") + 1);
				var reg;
				if($("#atchFileIdNm").val().indexOf('Img') > -1){
					reg =/jpg|png/i;
				}else if(parent.window.location.pathname.indexOf('/ad/') > -1){
					if($("#atchFileIdNm").val().indexOf('Img') > -1){
						reg =/jpg|png/i;
					}else{
		     			reg = /doc|docx|ppt|pptx|hwp|xlsx|xls|pdf|jpg|gif|png|csv|zip|egg/i;
					}
				}else{
	     			reg = /doc|docx|ppt|pptx|hwp|xlsx|xls|pdf|jpg|gif|png|csv/i;
				}
					if(reg.test(fileExt) == false){
						alert("첨부할수 없는 확장자입니다.");
						return false;
					}
					if(document.getElementById("fileForm").files[0].size > fileSize){
						alert("첨부파일 용량이 너무 큽니다.");
						return false;
					}
				$(".popChk").show();
				$("#defaultFrm").attr({"action": "/atch/byteFileUploadAction.do", "enctype" : "multipart/form-data"}).submit();
				//parent.document.all.uplode.value="upload";
			}	
		}else{
			alert("첨부파일은 ${fileCnt}개 까지 등록 가능합니다.")
		}
	}
	


	var fncFileDeleteFrame = function(atchFileId, fileSn){
		$("#atchFileId").val(atchFileId);
		$("#fileSn").val(fileSn);
		//access_list("/atch/ajaxFileDelete.do?atchFileId="+atchFileId,"filedel");
		$.ajax({
		    method: "POST",
		    url: "/atch/fileDelete.do",
		    data: $('#defaultFrm').serialize(),  // 폼데이터 직렬화
		    
		    dataType: "json",   // 데이터타입을 JSON형식으로 지정
		    async: false,
		    success: function(data) { // data: 백엔드에서 requestBody 형식으로 보낸 데이터를 받는다.
		        
		    	//values = data.resultList; 
		    	parent.$("#${fileVO.atchFileIdNm}").val("");
		    	window.location.reload();
                
                
		    },
		    error: function(jqXHR, textStatus, errorThrown) {
		        alert("에러");
		    }
		});
	};
	
	var fncFileDown = function(a,b,c){
		$("#atchFileId").val(a);
		$("#fileSn").val(b);
		$("#streFileNm").val(c);
		
		$("#defaultFrm").attr({"action" : "/atch/fileDown.do", "method" : "post"}).submit();
		
	}
	
	/* var drop = function(ev){
		$(".popChk").show();
		ev.preventDefault();
		var files = ev.dataTransfer.files;
		var nCount = files.length;
		if (!!files && nCount === 0){
			//파일이 아닌, 웹페이지에서 이미지를 드래서 놓는 경우.
			alert("정상적인 첨부방식이 아닙니다.");
			$(".popChk").hide();
			return false;
		}
		var atchId;
		var reg;
		var fileInfo  = null;
			fileInfo = [];
		if($("#atchFileIdNm").val().indexOf('Img') > -1){
			reg =/jpg|png/i;
		}else if(parent.window.location.pathname.indexOf('/ad/') > -1){
			if($("#atchFileIdNm").val().indexOf('Img') > -1){
				reg =/jpg|png/i;
			}else{
     			reg = /doc|docx|ppt|pptx|hwp|xlsx|xls|pdf|jpg|gif|png|csv|zip|egg/i;
			}
		}else{
 			reg = /doc|docx|ppt|pptx|hwp|xlsx|xls|pdf|jpg|gif|png|csv/i;
		}
		
		if(${fileVO.fileCnt} >= Number(${fn:length(resultList)}) + Number(nCount)){
			
			if($("#atchFileId").val() == ""){
				$.ajax({
				    method: "POST",
				    url: "/atch/getAtchFileId.do",
				    dataType: "json", 
				    async: false, 
				    success: function(data) { 
				    	atchId = data.atchFileId;
				    }
				
				});	
				$("#atchFileId").val(atchId);
			}
			
			for (var i = 0; i < nCount; i++) {
				var fileNm = files[i].name;
				
				if (!reg.test(fileNm.substring(fileNm.lastIndexOf(".") + 1))) {
					alert("첨부할수 없는 확장자입니다.");
					$(".popChk").hide();
					return false;
				}
				
				if(files[i].size > fileSize ){
					alert("첨부파일 용량이 너무 큽니다.");
					$(".popChk").hide();
					return false;
				}
				
			}
			
			
			
			for (var i = 0; i < nCount; i++) {
				fncFileUp(files[i],Number(nCount));
			}
		}else{
			alert("첨부파일은 ${fileCnt}개 까지 등록 가능합니다.");
			$(".popChk").hide();
			return false;
		}
	}
	
	var allowDrop = function(ev){
		ev.preventDefault();
	}
	

	var fileCnt = 0;
	var fncFileUp = function(tempFile,j){
		var formData = new FormData();
			formData.append('files',tempFile);
			formData.append('atchFileId',$("#atchFileId").val());
			
			$.ajax({
			    method: "POST",
			    url: "/atch/fileInfs.do",
			    data: formData,  
			    processData:false,
			    contentType: false,
			    dataType: "json",   
			    success: function(data) { 
			    	fileCnt = fileCnt + 1;
			    	if(fileCnt === j){
			    		$("#defaultFrm").attr({"action": "/atch/fileUpload.do", "enctype" : "multipart/form-data"}).submit();
			    	}
			    	
			    	//makeArrayFromString(data.sFileInfo);
			    }, error : function(jqXHR, textStatus, errorThrown){
					alert("error");
					return false;
				}
			
			});	
	}
	 */
	
	</script>
	<style type="text/css">
		.popup01 {position:absolute; left:50%;top:30%;width:300px; margin-left:-150px;z-index:5000;background:#fff;border-radius:5px;border:2px solid #2b75d1;overflow:hidden;}
		.popup02 {position:fixed; left:50%;top:10%;width:520px; margin-left:-260px;z-index:5000;background:#fff;border-radius:5px;border:2px solid #2b75d1;overflow:hidden;}
		.popup03 {position:fixed; left:45%;top:25%;width:595px; margin-left:-260px;z-index:5000;background:#fff;border-radius:5px;border:2px solid #2b75d1;overflow:hidden;}
		.popup04 {position:fixed; left:45%;top:25%;width:595px; margin-left:-260px;z-index:5000;background:#fff;border-radius:5px;border:2px solid #2b75d1;overflow:hidden;}
		.pop_head {position:relative;background:#4080d5;}
		.pop_head h1 {font-size:14px; color:#fff; font-weight:bold; padding-left:15px;height:35px; line-height:35px;}
		.pop_close {position:absolute; right:10px; top:7px;background:url(/publish/front/images/pop_close.png) no-repeat 0 0;width:17px; height:17px; text-indent:-9999em; font-size:0;}
		.pop_content {position:relative; padding:0px;}
		.pop_content02 {position:relative; padding:20px 30px;}
		.pop_content .searchbox {margin-bottom:15px; padding:8px;min-width:auto !important;}
		.pop_content .file_road {font-size:13px;padding:0px 0 3px 0;color:#0876de;}
		.pop_content .short_txt {text-align:center; font-size:13px; border-bottom:1px solid #eee; padding:15px 0 20px 0 ;}
		.pop_content .short_txt02 {text-align:center; font-size:11px; padding:0px 0 3px 0 ;/* margin-top:10px; */}
		#footerBG{width:100%; height:100%; _height:800px;background:#000; filter:alpha(opacity=70); opacity:0.7; position:fixed;_position:absolute; _filter:alpha(opacity=70); top:0px; left:0px; z-index:1000;}
		.drag_area{overflow:hidden;overflow-y:auto;position:relative;width:100%;height:134px;margin-top:4px;border:1px solid #eceff2}
		.drag_area .bg{display:block;position:absolute;top:0;width:100%;height:132px;background:#fdfdfd url(/resource/editor/photo/photo_uploader/img/bg_drag_image.png) center no-repeat}
		.lst_type li{overflow:hidden;position:relative;padding:7px 0 6px 8px;border-bottom:1px solid #f4f4f4;vertical-align:top}
		:root .lst_type li{padding:6px 0 5px 8px}
		.lst_type li span{float:left;color:#222}
		.lst_type li em{float:right;margin-top:1px;padding-right:22px;color:#a1a1a1;font-size:11px}
		.lst_type li a{position:absolute;top:6px;right:5px}
		.dsc_v1{margin-top:12px}
		.blind{visibility:hidden;position:absolute;line-height:0}
	</style>
</head>
<body style="height: 90%;">
	<form name="defaultFrm" id="defaultFrm" method="post" enctype="multipart/form-data">
		<input type="hidden" name="fileSn" id="fileSn" /> 
		<input type="hidden" name="atchFileIdNm" id="atchFileIdNm" value="${fileVO.atchFileIdNm }" />
		<input type="hidden" name="atchFileId" id="atchFileId" value="${fileVO.atchFileId }" /> 
		<input type="hidden" name="fileCnt" id="fileCnt" value="${fileVO.fileCnt }" />
		<input type="hidden" name="updateType" id="updateType" value="${fileVO.updateType }" />
		<input type="hidden" name="streFileNm" id="streFileNm" value="" />
		<c:choose>
			<c:when test="${fileVO.updateType eq 'upload'}">
				<div class="file_wrap">
				    <a href="javascript:void(0);" id="fncFileUploadBtn" onclick="$('#fileForm').click();"><span class="btn btn_file"><i></i>파일선택</span></a>
				    <a href="javascript:void(0);" id="fncFileDelteBtn"><span class="btn btn_fileDel"><i></i>파일삭제</span></a>
				    <input type="file" name="fileForm" id="fileForm" style="display: none;" onchange="fn_FileUpload()">
				    <table class="tbl_file mar_b20">
				        <caption>첨부파일 업로드 목록</caption>
				        <colgroup>
				            <col style="width:10%"/>
				            <col />
				            <col style="width:15%"/>
				        </colgroup>
				        <thead>
				            <tr>
				                <th scope="col"><input type="checkbox" id="allcheck" title="전체선택"/></th>
				                <th scope="col">첨부파일명</th>
				                <th scope="col">용량</th>
				            </tr>
				        </thead>
				        <tbody>
				        	<c:choose>
				        		<c:when test="${fn:length(resultList) > 0 }">
				        			<c:forEach var="result" items="${resultList}" varStatus="status">
				        				 <tr>
							                <td>
							                	<input type="checkbox" class="chbox" id="<c:out value='${result.atchFileId}'/>" seq="<c:out value='${result.fileSn}'/>"/>
						                	</td>
							                <td>
							                    <div class="file_tit">
							                        <span><a href="#" onclick="fncFileDown('${result.atchFileId}','${result.fileSn}','${result.streFileNm}');"><c:out value="${result.orignFileNm}" /></a></span>
							                    </div>
							                </td>
							                <td>
								                <c:if test="${!empty result.fileSize}">
													<fmt:formatNumber value="${result.fileSize/1024/1024}" pattern="#,###.##"/>MB
												</c:if>
											</td>
							            </tr>
				        			</c:forEach>
				        		</c:when>
				        		<c:otherwise>
				        			  <tr>
						                <td colspan="3"> 첨부파일이 없습니다.</td>
						            </tr>
				        		</c:otherwise>
				        	</c:choose>
				        </tbody>
				    </table>
				</div>
			</c:when>
			<c:otherwise>
				<div class="file_wrap">
				    <table class="tbl_file mar_b20">
				        <caption>첨부파일 업로드 목록</caption>
				        <colgroup>
				            <col />
				            <col style="width:15%"/>
				        </colgroup>
				        <thead>
				            <tr>
				                <th scope="col">첨부파일명</th>
				                <th scope="col">용량</th>
				            </tr>
				        </thead>
				        <tbody>
				        	<c:choose>
				        		<c:when test="${fn:length(resultList) > 0 }">
				        			<c:forEach var="result" items="${resultList}" varStatus="status">
				        				 <tr>
							                <td>
							                    <div class="file_tit">
							                        <span><a href="#" onclick="fncFileDown('${result.atchFileId}','${result.fileSn}','${result.streFileNm}');"><c:out value="${result.orignFileNm}" /></a></span>
							                    </div>
							                </td>
							                <td>
								                <c:if test="${!empty result.fileSize}">
													<fmt:formatNumber value="${result.fileSize/1024/1024}" pattern="#,###.##"/>MB
												</c:if>
											</td>
							            </tr>
				        			</c:forEach>
				        		</c:when>
				        		<c:otherwise>
				        			  <tr>
						                <td colspan="2"> 첨부파일이 없습니다.</td>
						            </tr>
				        		</c:otherwise>
				        	</c:choose>
				        </tbody>
				    </table>
				</div>
			</c:otherwise>
		</c:choose>
	</form>
	<form name="subFrm" id="subFrm">
		<input type="hidden" name="atchFileId" id="subFrmAtchFileId" />
		<input type="hidden" name="fileSn" id="subFrmFileSn" />
		<input type="hidden" name="streFileNm" id="subFrmStreFileNm" />
	</form>
	<div class="popup01 popChk" id="display_view1"  style="display:none;">
		<div class="pop_content c" >
		<div class="file_road"><strong>파일업로드 중입니다.</strong></div>
		<div><img src="/publish/mgr/images/file_road.gif"/></div>
		<p class="short_txt02"> 잠시만 기다려주세요.
		</div>
	</div>
	<div class="popup_bg" id="layer_bg"></div>
	<div class="popChk" id="footerBG" style="display:none;"></div>
	<iframe name="defaultFrame" id="defaultFrame" title="업무 처리용 프레임" width="0" height="0" frameborder="0" style="display: none;"></iframe>
</body>
</html>