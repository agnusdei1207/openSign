
/** Script logger */
var logger = {
	level: 2,	// 0: none, 1: info, 2: debug, 3: alert
	info: function (msg) {
		if(typeof console == "undefined") {return "";}
		if (logger.level > 0) {logger._print(msg);}
	}, debug: function (subject, msg) {
		if(typeof console == "undefined") {return "";}
		if (logger.level > 1) {
			logger._print("[DEBUG] " + subject);
			logger._print(msg);
		}
	}, error: function (msg) {
		if(typeof console == "undefined") {return "";}
		if (logger.level > 0) {logger._error(msg);}
	}, _print: function (msg) {
		if(typeof console == "undefined") {return "";}
		logger.level == 3 ? alert(msg) : console.log(msg);
	}, _error: function (msg) {
		if(typeof console == "undefined") {return "";}
		logger._print("[ERROR]");
		console.log(msg);
	}
};

var setUploadData = function(result){
	if(result.result){
		$("#fileList").empty();
	    $("#fileForm").val("");
	    var isFile = false;
		$.each(result.resultList, function (intIndex, strValue) {
			var thisData = result.resultList[intIndex];
			var innerHtml = "";

			innerHtml += "<div class=\"MultiFile-label\">";
			if(typeof($("#atchViewType").val()) == "undefined" || $("#atchViewType").val() == "insert"){
				innerHtml += "<a href=\"javascript:fncFileDelete('"+thisData.atchFileId+"', '"+thisData.fileSn+"');\" class=\"btnGray small\"><span>DEL</span></a>&nbsp;";
			}
			innerHtml += "<a href=\"javascript:fncFileDownload('"+thisData.atchFileId+"', '"+thisData.fileSn+"', '"+thisData.streFileNm+"');\" class=\"btnGray small\"><span>"+thisData.orignFileNm+"</span></a>";
			innerHtml += "<span class=\"MultiFile-title\" style=\"color:#000;font-size:10px;\">";
			//	innerHtml += " &lt;a href=\"javascript:fncFileDownload('"+thisData.atchFileId+"', '"+thisData.fileSn+"', '"+thisData.streFileNm+"');\" title=\""+thisData.orignFileNm+" 다운로드\" &gt;"+thisData.orignFileNm+"&lt;/a&gt;";
			innerHtml += "/atch/fileDown.do?atchFileId="+thisData.atchFileId+"&fileSn="+thisData.fileSn+"&streFileNm="+thisData.streFileNm;
			innerHtml += "</span>";
			innerHtml += "</div>";
		   
			$("#fileList").append(innerHtml);
	   		$("#atchFileId").val(thisData.atchFileId);
	   		isFile = true;
		});	
		if(!isFile){
	   		$("#atchFileId").val("");
		}
	}else{
        alert("파일업로드중 장애가 발생하였습니다. 운영담당자에게 문의하여 주시기 바랍니다.");
	}
};

var setUploadData2 = function(result, id){
	if(result.result){
		$("#fileList"+id).empty();
	    $("#fileForm"+id).val("");
	    var isFile = false;
		$.each(result.resultList, function (intIndex, strValue) {
			var thisData = result.resultList[intIndex];
			var innerHtml = "";

			innerHtml += "<div class=\"MultiFile-label\">";
			if(typeof($("#atchViewType").val()) == "undefined" || $("#atchViewType").val() == "insert"){
				innerHtml += "<a href=\"javascript:fncFileDelete2('"+thisData.atchFileId+"', '"+thisData.fileSn+"', '"+id+"');\" class=\"btnGray small\"><span>DEL</span></a>&nbsp;";
			}
			innerHtml += "<a href=\"javascript:fncFileDownload('"+thisData.atchFileId+"', '"+thisData.fileSn+"', '"+thisData.streFileNm+"');\" class=\"btnGray small\"><span>"+thisData.orignFileNm+"</span></a>";
			innerHtml += "<span class=\"MultiFile-title\" style=\"color:#000;font-size:10px;\">";
			innerHtml += " &lt;a href=\"javascript:fncFileDownload('"+thisData.atchFileId+"', '"+thisData.fileSn+"', '"+thisData.streFileNm+"');\" title=\""+thisData.orignFileNm+" 다운로드\" &gt;"+thisData.orignFileNm+"&lt;/a&gt;";
			innerHtml += "</span>";
			innerHtml += "</div>";
			$("#fileList"+id).append(innerHtml);
	   		$("#atchFileId"+id).val(thisData.atchFileId);
	   		isFile = true;
		});	
		if(!isFile){
	   		$("#atchFileId"+id).val("");
		}
	}else{
        alert("파일업로드중 장애가 발생하였습니다. 운영담당자에게 문의하여 주시기 바랍니다.");
	}
};

var fncFileDelete = function(atchFileId, fileSn){
	$.getJSON("/atch/fileDelete.json?atchFileId=" + atchFileId + "&fileSn="+fileSn, function (result) {
		if(typeof(result.resultList) == "object"){
			setUploadData(result);
		}
	});
};

var fncFileDelete2 = function(atchFileId, fileSn, id){
	$.getJSON("/atch/fileDelete.json?atchFileId=" + atchFileId + "&fileSn="+fileSn, function (result) {
		if(typeof(result.resultList) == "object"){
			setUploadData2(result, id);
		}
	});
};

var fncFileDelete3 = function(atchFileId, fileSn, form){
	$.getJSON("/atch/fileDelete.json?atchFileId=" + atchFileId + "&fileSn="+fileSn, function (result) {
		if(typeof(result.resultList) == "object"){
			$("#"+atchFileId+fileSn).remove();
			$("#"+form).val("");
		}
	});
};

var fncFileDownload = function(atchFileId, fileSn, streFileNm){
	$("#subFrmAtchFileId").val(atchFileId);
	$("#subFrmFileSn").val(fileSn);
	$("#subFrmStreFileNm").val(streFileNm);
	$("#subFrm").attr({"action" : "/atch/fileDown.do", "target" : "defaultFrame", "method" : "post" }).submit();
};

var fncGetFileList = function(atchFileId){
	$.getJSON("/atch/getFileList.json?atchFileId=" + atchFileId, function (result) {
		if(typeof(result.resultList) == "object"){
			setUploadData(result);
		}else{
			alert("조회된 첨부파일 정보가 없습니다.");
			return false;
		}
	});
};

var fncGetFileList2 = function(atchFileId, id){
	$.getJSON("/atch/getFileList.json?atchFileId=" + atchFileId, function (result) {
		if(typeof(result.resultList) == "object"){
			setUploadData2(result, id);
		}else{
			alert("조회된 첨부파일 정보가 없습니다.");
			return false;
		}
	});
};

var fncGetFile = function(atchFileId, fileSn){
	$.getJSON("/atch/getFile.json?atchFileId=" + atchFileId + "&fileSn=" + fileSn, function (result) {
		if(typeof(result.fileVO) == "object"){
			setUploadData(result);
		}else{
			alert("조회된 첨부파일 정보가 없습니다.");
			return false;
		}
	});
};

var popFileList = function(atchFileId){ //새창 완료
	var filePop = window.open('', 'fileListPop', 'width=600px, height=450px, scrollbars=yes');
	$("#subFrmAtchFileId").val(atchFileId);
	$("#subFrm").attr({"action" : "/atch/getFileList.do", "target" : "fileListPop", "method" : "post" }).submit();
	
	filePop.focus();
};
/*var popFileList = function(selectSeq){ //새창 완료
	var filePop = window.open('', 'fileListPop', 'width=600px, height=450px, scrollbars=yes');
	$("#selectedId").val(selectSeq);
	$("#defaultFrm").attr({"action" : "pop01.do", "target" : "fileListPop", "method" : "post" }).submit();
	
	filePop.focus();
};*/

var checkValidate = function(form){	//Checkbox 
	var checkVal = 0;
	$.each($(form), function (intIndex, strValue) {
		if($(this).prop("checked")){
			checkVal++;
		}
	});
	if(checkVal == 0) return false;
	else return true;
};

$(document).ready(function(){
	if($("#atchFileId").val() != "" && typeof($("#atchFileId").val()) != "undefined" && $("#atchFileId").val() != "undefined"){
		fncGetFileList($("#atchFileId").val());
	}

	if($("#imgAtchFileId").val() != "" && typeof($("#imgAtchFileId").val()) != "undefined" && $("#imgAtchFileId").val() != "undefined"){
		$.getJSON("/atch/getFileList.json?atchFileId=" + $("#imgAtchFileId").val(), function (result) {
			if(typeof(result.resultList) == "object"){
			$("#imgAtchFileView").empty();
			$.each(result.resultList, function (intIndex, strValue) {
				var thisData = result.resultList[intIndex];
				var innerHtml = "";

				innerHtml += "<div class=\"MultiFile-label\" id=\""+thisData.atchFileId+thisData.fileSn+"\">";
				if(typeof($("#atchViewType").val()) == "undefined" || $("#atchViewType").val() == "insert"){
					innerHtml += "<a href=\"javascript:fncFileDelete3('"+thisData.atchFileId+"', '"+thisData.fileSn+"', 'imgAtchFileId');\" class=\"btnGray small\"><span>DEL</span></a>&nbsp;";
				}
				innerHtml += "<a href=\"javascript:fncFileDelete3('"+thisData.atchFileId+"', '"+thisData.fileSn+"', 'imgAtchFileId');\" class=\"btnGray small\"><span>"+thisData.orignFileNm+"</span></a>";
				innerHtml += "<span class=\"MultiFile-title\" style=\"color:#000;font-size:10px;\">";
				//	innerHtml += " &lt;a href=\"javascript:fncFileDownload('"+thisData.atchFileId+"', '"+thisData.fileSn+"', '"+thisData.streFileNm+"');\" title=\""+thisData.orignFileNm+" 다운로드\" &gt;"+thisData.orignFileNm+"&lt;/a&gt;";
				innerHtml += "/atch/fileDown.do?atchFileId="+thisData.atchFileId+"&fileSn="+thisData.fileSn+"";
				innerHtml += "</span>";
				innerHtml += "</div>";
				
				$("#imgAtchFileView").append(innerHtml);
			});	
			}
		});
	}
	
    $("#fileUploadBtn").bind("click", function(){
    	if($("input[name='fileForm']").val() != ""){
	    	$("#defaultFrm").attr({"action": "/atch/fileUpload.action", "enctype" : "multipart/form-data"});
		    $("#defaultFrm").ajaxSubmit({
		       cache: false,
		       dataType:"json",
		       beforeSubmit: function (data, frm, opt) {
		           return true;
		       },
		       success: function(result, statusText){
		           setUploadData(result); //받은 정보를 화면 출력하는 함수 호출
		       },
		       error: function(e){
		           alert("파일업로드중 장애가 발생하였습니다. 운영담당자에게 문의하여 주시기 바랍니다.");
		           logger.debug(e);
		       }
		    });
    	}else{
    		alert("선택된 파일이 없습니다. 파일을 선택하여 주세요.");
    		return false;
    	}
	 });

    
    $(".mutilFileUploadBtn").bind("click", function(){
    	var fileFormNm = $(this).attr("title");
    	if($("input[name='"+fileFormNm+"']").val() != ""){
	    	$("#defaultFrm").attr({"action": "/atch/atchFileUpload.action?fileFormNm="+fileFormNm, "enctype" : "multipart/form-data"});
		    $("#defaultFrm").ajaxSubmit({
		       cache: false,
		       dataType:"json",
		       beforeSubmit: function (data, frm, opt) {
		           return true;
		       },
		       success: function(result, statusText){
	    		if(result.result){
	    			$("#"+fileFormNm+"View").empty();
	    		    $("#"+fileFormNm+"Id").val("");
	    		    var isFile = false;

	    			$.each(result.resultList, function (intIndex, strValue) {
	    				var thisData = result.resultList[intIndex];
	    				var innerHtml = "<div id=\""+thisData.atchFileId+thisData.fileSn+"\"><span>"+thisData.orignFileNm+"</span><a href=\"javascript:fncFileDelete3('"+thisData.atchFileId+"', '"+thisData.fileSn+"', '"+fileFormNm+"Id');\" class=\"btnGray small\"><span>DEL</span></a></div>";
	    				$("#"+fileFormNm+"View").append(innerHtml);
	    				$("#"+fileFormNm+"Id").val(thisData.atchFileId);
	    		   		isFile = true;
	    			});
	    		   		
	    			if(!isFile){
	    		   		$("#"+fileFormNm+"Id").val("");
	    			}
	    			
	    		}else{
	    	        alert("파일업로드중 장애가 발생하였습니다. 운영담당자에게 문의하여 주시기 바랍니다.");
	    		}
		       },
		       error: function(e){
		           alert("파일업로드중 장애가 발생하였습니다. 운영담당자에게 문의하여 주시기 바랍니다.");
		           logger.debug(e);
		       }
		    });
    	}else{
    		alert("선택된 파일이 없습니다. 파일을 선택하여 주세요.");
    		return false;
    	}
	 });
});