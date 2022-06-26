$(document).ready(function(){
	$("#btn_search_pop").click(function(){
		fncPageEtc('popList','popAddList.do',1)
	});
	$("#btn_search_sub").click(function(){
		fncPageEtc('subList','subAddList.do',1)
	});
	$("#schPopKeyword").keypress(function(){
		if (window.event.keyCode == 13) {
			fncPageEtc('popList','popAddList.do',1)
		}
	});
	$("#schSubKeyword").keypress(function(){
		if (window.event.keyCode == 13) {
			fncPageEtc('subList','subAddList.do',1)
		}
	});
});
function fncSubAddList(url){
	
	if(url.indexOf("delete") > -1 || url.indexOf("Delete") > -1){
		if(!confirm("삭제하시겠습니까?")){
			return false;
		}
	}
	fncLoadingStart();
	$.ajax({
		method : "POST",
		url : url,
		data : $("#subFrm").serialize(),
		dataType : "JSON",
		success : function(data){
			alert(data.msg);
			if(data.url != null && data.url != ""){
				$.ajax({
					method: "POST",
					url: data.url,
					data : $("#subFrm").serialize(),
					dataType : "HTML",
					success: function(subData){
						$(".subList").html(subData);
					}
				});
			}
		},complete : function(){
			fncLoadingEnd();
		}
	});
}
function fncSubTab(divnVal, divn){
	$("#subPageIndex").val(1);
	$("#schSubCondition").val(0);
	$("#schSubKeyword").val("");
	$("#schSubStartDate").val("");
	$("#schSubEndDate").val("");
	$("#schSub01").val("");
	$("#schSub02").val("");
	$("#schSub03").val("");
	$("#schSub04").val("");
	$("#schSub05").val("");
	$("#schSub06").val("");
	$("#schSub07").val("");
	$("#schSub08").val("");
	$("#schSub09").val("");
	$("#schSub10").val("");
	$("#schSub11").val("");
	$("#schSub12").val("");
	$("#schSub13").val("");
	$("#schSub14").val("");
	$("#schSub15").val("");
	fncPageEtc('subAction','subList.do',1,divnVal,divn);
}
function fncPopTab(divnVal, divn){
	$("#subPageIndex").val(1);
	$("#schSubCondition").val(0);
	$("#schSubKeyword").val("");
	$("#schSubStartDate").val("");
	$("#schSubEndDate").val("");
	$("#schSub01").val("");
	$("#schSub02").val("");
	$("#schSub03").val("");
	$("#schSub04").val("");
	$("#schSub05").val("");
	$("#schSub06").val("");
	$("#schSub07").val("");
	$("#schSub08").val("");
	$("#schSub09").val("");
	$("#schSub10").val("");
	$("#schSub11").val("");
	$("#schSub12").val("");
	$("#schSub13").val("");
	$("#schSub14").val("");
	$("#schSub15").val("");
	fncPageEtc('popAction','popList.do',1,divnVal,divn);
}
function fncPageEtc(divn, url, index, arrVal, arrValNm){
	if(arrVal != null && arrVal != "" && arrValNm != null && arrValNm != ""){
		var val = arrVal.split(',');
		var valNm = arrValNm.split(',');
	}
	switch (divn) {
		case 'popList' : $("#popPageIndex").val(index);
							if(arrVal != null && arrVal != "" && arrValNm != null && arrValNm != ""){
								if(val.length > 0 && valNm.length > 0){
									for(var i = 0; i < valNm.length; i++){
										$("#"+valNm[i]).val(val[i]);
									}
								}
							}
							fncLoadingStart();
							$.ajax({
								method : "POST",
								url : url,
								data : $("#popFrm").serialize(),
								dataType : "HTML",
								success : function(data){
									$(".popTbl").html(data);
								},complete : function(){
									fncLoadingEnd();
								}
							});
							break;
		case 'subList' : $("#subPageIndex").val(index);
							if(arrVal != null && arrVal != "" && arrValNm != null && arrValNm != ""){
								if(val.length > 0 && valNm.length > 0){
									for(var i = 0; i < valNm.length; i++){
										$("#"+valNm[i]).val(val[i]);
									}
								}
							}
							fncLoadingStart();
							$.ajax({
								method : "POST",
								url : url,
								data : $("#subFrm").serialize(),
								dataType : "HTML",
								success : function(data){
									$(".subTbl").html(data);
								},complete : function(){
									fncLoadingEnd();
								}
							});
							break;
		case 'popAction' : if(arrVal != null && arrVal != "" && arrValNm != null && arrValNm != ""){
								if(val.length > 0 && valNm.length > 0){
									for(var i = 0; i < valNm.length; i++){
										$("#"+valNm[i]).val(val[i]);
									}
								}
							}
							fncLoadingStart();
							$("#popFrm").attr({"action" : url, "method" : "post", "target" : "_self" , "onsubmit" : ""}).submit();
							break;
		case 'subAction' :  if(arrVal != null && arrVal != "" && arrValNm != null && arrValNm != ""){
								if(val.length > 0 && valNm.length > 0){
									for(var i = 0; i < valNm.length; i++){
										$("#"+valNm[i]).val(val[i]);
									}
								}
							}
							fncLoadingStart();
							$("#subFrm").attr({"action" : url, "method" : "post", "target" : "_self" , "onsubmit" : ""}).submit();
							break;
		case 'popSubmit' : if(wrestSubmit(document.popFrm)){ 
								fncLoadingStart();
								$("#popFrm").removeAttr("enctype");
								$("#popFrm").attr({"action" : url, "method" : "post", "target" : "_self", "onsubmit" : ""}).submit();
							}
							break;
		case 'subSubmit' : if(wrestSubmit(document.subFrm)){ 
								fncLoadingStart();
								$("#subFrm").removeAttr("enctype");
								$("#subFrm").attr({"action" : url, "method" : "post", "target" : "_self", "onsubmit" : ""}).submit();
							}
							break;
		case 'popDel' : if(!confirm("삭제하시겠습니까")){return false;};
						if(arrVal != null && arrVal != "" && arrValNm != null && arrValNm != ""){
							if(val.length > 0 && valNm.length > 0){
								for(var i = 0; i < valNm.length; i++){
									$("#"+valNm[i]).val(val[i]);
								}
							}
						}
						fncLoadingStart();
						$("#popFrm").attr({"action" : url, "method" : "post", "target" : "_self" , "onsubmit" : ""}).submit();
						break;
		case 'subDel' : if(!confirm("삭제하시겠습니까?")){return false;};
						if(arrVal != null && arrVal != "" && arrValNm != null && arrValNm != ""){
							if(val.length > 0 && valNm.length > 0){
								for(var i = 0; i < valNm.length; i++){
									$("#"+valNm[i]).val(val[i]);
								}
							}
						}
						fncLoadingStart();
						$("#subFrm").attr({"action" : url, "method" : "post", "target" : "_self" , "onsubmit" : ""}).submit();
						break;
		default	 : alert("유효하지 않은 값입니다.");
					return false; break;
	}
}

var fncLoadingStart = function(){
	$(".loading_wrap").show();
}

var fncLoadingEnd = function(){
	setTimeout(function(){ 
		$(".loading_wrap").hide();
    }, 250);	
}