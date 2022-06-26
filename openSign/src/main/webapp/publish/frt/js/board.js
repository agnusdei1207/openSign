$(document).ready(function(){
	
	//등록폼
	$("#btn_write").click(function(){
		fncPageBoard('write','insertForm.do');
	});
	//검색
	$("#btn_search").click(function(){
		fncPageBoard('addList','addList.do','1');
	});
	//수정폼
	$("#btn_update").click(function(){
		fncPageBoard('update','updateForm.do');
	});
	//목록
	$("#btn_list").click(function(){
		fncPageBoard('list','list.do');
	});
	//삭제 액션
	$("#btn_del").click(function(){
		fncPageBoard('del','deleteProc.do');
	});
	//상세
	$("#btn_view").click(function(){
		fncPageBoard('view','view.do');
	});
	//검색 엔터 체크
	$("#searchKeyword").keydown(function(e){
		 if (e.keyCode == 13) { 
			fncPageBoard('addList','addList.do','1');
		 }
	});
	
});

var process = "N";
/* 구분,url,(pageIndex && 일련번호),일련번호명 */
const fncPageBoard = function(){
	var getBoard = arguments;
	var gubun="";
	var url="";
	var idx= "";
	var seqVal= [];
	var seqNm=[];
	var wth="800";
	var het="600";
	if(getBoard.length > 1){
		switch (getBoard.length) {
	 		case 2: gubun = getBoard[0]; url = getBoard[1];break;
	 		case 3: gubun = getBoard[0]; url = getBoard[1]; idx = getBoard[2];break;
	 		case 4: gubun = getBoard[0]; url = getBoard[1]; seqVal = getBoard[2].split(','); seqNm = getBoard[3].split(',');break;
	 		case 5: gubun = getBoard[0]; url = getBoard[1]; seqVal = getBoard[2].split(','); seqNm = getBoard[3].split(','); wth = getBoard[4]; break;
	 		case 6: gubun = getBoard[0]; url = getBoard[1]; seqVal = getBoard[2].split(','); seqNm = getBoard[3].split(','); wth = getBoard[4]; het = getBoard[5]; break;
	 	}
	}	
	switch (gubun) {
	  case 'write'  :  fncLoadingStart();$("#defaultFrm").attr({"action" : url, "method" : "post", "target" : "_self" , "onsubmit" : ""}).submit(); //등록폼
					   break;
	  case 'addList':  $("#pageIndex").val(idx);
	  				   fncLoadingStart();
					   $.ajax({  method: "POST",  url: url,  data : $("#defaultFrm").serialize(), dataType: "html", success: function(data) {$(".tbl").html(data);fncLoadingEnd(); }
					   });//목록호출
					   break;
	  case 'viewList':  $("#viewPageIndex").val(idx);
						   fncLoadingStart();
					   $.ajax({  method: "POST",  url: url,  data : $("#defaultFrm").serialize(), dataType: "html", success: function(data) {$(".tbl").html(data);fncLoadingEnd(); }
					   });//목록호출
	   break;
	  case 'view'   :  if(seqNm.length > 0 && seqVal.length > 0){ for (var i = 0; i < seqNm.length; i++) { $("#"+seqNm[i]).val('');$("#"+seqNm[i]).val(seqVal[i]); } }
	  					fncLoadingStart();$("#defaultFrm").attr({"action" : url, "method" : "post", "target" : "_self", "onsubmit" : ""}).submit();//상세
		  			   break;
	  case 'update' :  if(seqNm.length > 0 && seqVal.length > 0){ for (var i = 0; i < seqNm.length; i++) { $("#"+seqNm[i]).val('');$("#"+seqNm[i]).val(seqVal[i]); } }
	  					fncLoadingStart();$("#defaultFrm").attr({"action" : url, "method" : "post", "target" : "_self", "onsubmit" : ""}).submit();//수정폼
	                   break;
	  case 'del'    :  if(confirm("삭제하시겠습니까?")){
		  					if(seqNm.length > 0 && seqVal.length > 0){ for (var i = 0; i < seqNm.length; i++) { $("#"+seqNm[i]).val('');$("#"+seqNm[i]).val(seqVal[i]); } }
		  					fncLoadingStart();$("#defaultFrm").attr({"action" : url, "method" : "post", "target" : "_self", "onsubmit" : ""}).submit();//삭제
					   }
		  			   break;
	  case 'list'   :  if(seqNm.length > 0 && seqVal.length > 0){ for (var i = 0; i < seqNm.length; i++) { $("#"+seqNm[i]).val('');$("#"+seqNm[i]).val(seqVal[i]); } }
	  					fncLoadingStart();$("#defaultFrm").attr({"action" : url, "method" : "post", "target" : "_self", "onsubmit" : ""}).submit();//목록
	              	   break;
	  case 'submit' :  if(process == "Y"){ alert("처리중입니다. 잠시만 기다려주세요."); return false;}//등록 액션
					   if(wrestSubmit(document.defaultFrm)){ 
					      process = "Y" 
					      if(seqNm.length > 0 && seqVal.length > 0){ for (var i = 0; i < seqNm.length; i++) { $("#"+seqNm[i]).val('');$("#"+seqNm[i]).val(seqVal[i]); } }
					      fncLoadingStart();
					      $("#defaultFrm").removeAttr("enctype");
						  $("#defaultFrm").attr({"action" : url, "method" : "post", "target" : "_self", "onsubmit" : ""}).submit();
					   }
					   break;
	  case 'submit2' : if(seqNm.length > 0 && seqVal.length > 0){ for (var i = 0; i < seqNm.length; i++) { $("#"+seqNm[i]).val('');$("#"+seqNm[i]).val(seqVal[i]); } }
					  fncLoadingStart();
					  $("#defaultFrm").removeAttr("enctype");
					  $("#defaultFrm").attr({"action" : url, "method" : "post", "target" : "_self", "onsubmit" : ""}).submit();
					  break;
	  case 'pop'   :  window.open('', url.replace(".do",""), 'top=120,left=50,titlebar=no,status=no,toolbar=no,resizable=no,scrollbars=yes,width='+wth+'px, height='+het+'px');
	  				  if(seqNm.length > 0 && seqVal.length > 0){ for (var i = 0; i < seqNm.length; i++) { $("#"+seqNm[i]).val('');$("#"+seqNm[i]).val(seqVal[i]); } }
	  				  $("#defaultFrm").attr({"action" : url, "method" : "post", "target" : url.replace(".do",""), "onsubmit" : ""}).submit();
					  break;
	  case 'blank' : if(seqNm.length > 0 && seqVal.length > 0){ for (var i = 0; i < seqNm.length; i++) { $("#"+seqNm[i]).val('');$("#"+seqNm[i]).val(seqVal[i]); } }
					  $("#defaultFrm").removeAttr("enctype");
					  $("#defaultFrm").attr({"action" : url, "method" : "post", "target" : "_blank", "onsubmit" : ""}).submit();
				  break;
	  default       : alert("유효하지 않은 값입니다.");return false; break;
	}
}



Date.prototype.format = function (f) {
    if (!this.valueOf()) return " ";
    var weekKorName = ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"];
    var weekKorShortName = ["일", "월", "화", "수", "목", "금", "토"];
    var weekEngName = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];
    var weekEngShortName = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];
    var d = this;
    return f.replace(/(yyyy|yy|MM|dd|KS|KL|ES|EL|HH|hh|mm|ss|a\/p)/gi, function ($1) {

        switch ($1) {
            case "yyyy": return d.getFullYear(); // 년 (4자리)
            case "yy": return (d.getFullYear() % 1000).zf(2); // 년 (2자리)
            case "MM": return (d.getMonth() + 1).zf(2); // 월 (2자리)
            case "dd": return d.getDate().zf(2); // 일 (2자리)
            case "KS": return weekKorShortName[d.getDay()]; // 요일 (짧은 한글)
            case "KL": return weekKorName[d.getDay()]; // 요일 (긴 한글)
            case "ES": return weekEngShortName[d.getDay()]; // 요일 (짧은 영어)
            case "EL": return weekEngName[d.getDay()]; // 요일 (긴 영어)
            case "HH": return d.getHours().zf(2); // 시간 (24시간 기준, 2자리)
            case "hh": return ((h = d.getHours() % 12) ? h : 12).zf(2); // 시간 (12시간 기준, 2자리)
            case "mm": return d.getMinutes().zf(2); // 분 (2자리)
            case "ss": return d.getSeconds().zf(2); // 초 (2자리)
            case "a/p": return d.getHours() < 12 ? "오전" : "오후"; // 오전/오후 구분
            default: return $1;
        }
    });
};

String.prototype.string = function (len) { var s = '', i = 0; while (i++ < len) { s += this; } return s; };
String.prototype.zf = function (len) { return "0".string(len - this.length) + this; };
Number.prototype.zf = function (len) { return this.toString().zf(len); };	


var calByte = {
	getByteLength : function(s) {

		if (s == null || s.length == 0) {
			return 0;
		}
		var size = 0;

		for ( var i = 0; i < s.length; i++) {
			size += this.charByteSize(s.charAt(i));
		}

		return size;
	},
		
	cutByteLength : function(s, len) {

		if (s == null || s.length == 0) {
			return 0;
		}
		var size = 0;
		var rIndex = s.length;

		for ( var i = 0; i < s.length; i++) {
			size += this.charByteSize(s.charAt(i));
			if( size == len ) {
				rIndex = i + 1;
				break;
			} else if( size > len ) {
				rIndex = i;
				break;
			}
		}

		return s.substring(0, rIndex);
	},

	charByteSize : function(ch) {

		if (ch == null || ch.length == 0) {
			return 0;
		}

		var charCode = ch.charCodeAt(0);

		if (charCode <= 0x00007F) {
			return 1;
		} else if (charCode <= 0x0007FF) {
			return 2;
		} else if (charCode <= 0x00FFFF) {
			return 3;
		} else {
			return 4;
		}
	}
};

/* 사업소  */
var fncDeptSel = function(val,gubun,id,selVal,txt){
	if(txt == "전체"){
		if(id == "dept2Cd"){
			$("#dept1 ,#schDept1").html('<option value="ALL" >전체</option>');
			$("#dept2 ,#schDept2").html('<option value="ALL" >전체</option>');
		}else if(id == "dept1"){
			$("#dept1 ,#schDept1").html('<option value="ALL" >전체</option>');
		}
	}else{
		if(id == "dept2Cd"){
			$("#dept1 ,#schDept1").html('<option value="" >선택</option>');
			$("#dept2 ,#schDept2").html('<option value="" >선택</option>');
		}else if(id == "dept1"){
			$("#dept1 ,#schDept1").html('<option value="" >선택</option>');
			
		}
	}
/*	if(val == 'ALL'){
		$("#dept2Cd").html('<option value="ALL" >전체</option>');
	}*/
	
	$.ajax({ 
	    method: "POST",
	    url: "/codeDeptSel.do",
	    data: {
	    	pCode : val,
	    	selVal : selVal,
	    	gubun : gubun,
	    	txt : txt
	    },
	    dataType: "json",   
	    success: function(data) {
	    	var addHtml = "";
	    	addHtml += "<option value='ALL' >전체</option>";
	    	for(i = 0; i < data.deptList.length; i++){
	    		addHtml += '<option value="'+data.deptList[i].dept2Cd+'" >'+data.deptList[i].dept2+'</option>';
	    	}
	    	/*if(val == 'ALL'){
	    		addHtml += '<option value="ALL" >전체</option>';
	    	}*/
	    	$("#"+id).html(addHtml);
	    	if(selVal != null && selVal != ""){
	    		$("#"+id).val(selVal);
	    	}
	    }
	}); 
}

/*자동채우기 함수*/
function fillForm(form) {
 if(!form) {
  alert('Form이 존재하지 않습니다!!');
  return;
 }
 for (var i = 0; i < form.elements.length; i++ ) {
  var el = form.elements[i];
  var option = el.getAttribute("option");
  var nvalue = el.getAttribute("default");
  var tagName = el.tagName.toLowerCase();
  
  if(form[el.name] && form[el.name].length && form[el.name].length > 1 
    && form[el.name][0].getAttribute("required") != null) {
   var checkFlag = false;
   for(var j=0 ; j < form[el.name].length ; j++) {
    if(!checkFlag) {
      checkFlag = form[el.name][j].checked;
    }
   }
   if(!checkFlag) {
    form[el.name][0].checked = true;
   }
  } else {
   curdate = new Date();
   year = curdate.getFullYear();
   month = curdate.getMonth()+1;
   day = curdate.getDate();
  if (el.getAttribute("required") != null) {
    if (el.value == null || el.value == "") {
     if(tagName == 'select') {
      el.selectedIndex = 2;
     } else if(!option) {
      el.value = '';
     } else if(option.match(/date1/gi)) {
      el.value = year+'.'+(month < 10 ? '0'+ month : month);
     } else if(option.match(/date2/gi)) {
      el.value =year+'.'+(month < 10 ? '0'+ month : month)+'.'+(day < 10 ? '0'+ day : day);
     } else if(option.match(/number/gi)) {
      el.value = nvalue;
     }
     if(el.value.length > el.maxLength) {
    	 el.value = nvalue.substring(0, el.maxLength);
     }else{
    	 el.value = nvalue;
     }
    }
   }
  }
 }
}

// ROW병합
$.fn.rowspan = function(colIdx) {
	 return this.each(function(){
		 console.log(colIdx);
  var that;
  $('tr', this).each(function(row) {
  $('td:eq('+colIdx+')', this).each(function(col) {
      if ($(this).html() == $(that).html()) {
        rowspan = $(that).attr("rowSpan");
        if (rowspan == undefined) {
  
          $(that).attr("rowSpan",1);
          rowspan = $(that).attr("rowSpan");
        }
        rowspan = Number(rowspan)+1;
        $(that).attr("rowSpan",rowspan); 
        $(this).hide(); 
      } else {
        that = this;
      }
      that = (that == null) ? this : that; 
  });
 });

 });
}	 

//ROW병합 속성
$.fn.rowspanAttr = function(colIdx) {
	 return this.each(function(){
		 console.log(colIdx);
  var that;
  $('tr', this).each(function(row) {
  $('td:eq('+colIdx+')', this).each(function(col) {
      if ($(this).attr("data-rowspan") == $(that).attr("data-rowspan")) {
        rowspan = $(that).attr("rowSpan");
        if (rowspan == undefined) {
  
          $(that).attr("rowSpan",1);
          rowspan = $(that).attr("rowSpan");
        }
        rowspan = Number(rowspan)+1;
        $(that).attr("rowSpan",rowspan); 
        $(this).hide(); 
      } else {
        that = this;
      }
      that = (that == null) ? this : that; 
  });
 });

 });
}	 
//COL병합
 $.fn.colspan = function(rowIdx) {
	 return this.each(function(){
	  var that;
	  $('tr', this).filter(":eq("+rowIdx+")").each(function(row) {
	  $(this).find('td').each(function(col) {
	      if ($(this).html() == $(that).html()) {
	        colspan = $(that).attr("colSpan");
	        if (colspan == undefined) {
	          $(that).attr("colSpan",1);
	          colspan = $(that).attr("colSpan");
	        }
	        colspan = Number(colspan)+1;
	        $(that).attr("colSpan",colspan);
	        $(this).hide(); 
	      } else {
	        that = this;
	      }
	      that = (that == null) ? this : that;
	  });
	 });

	 });
	}
var setDate = function(){
	var getId = arguments;
	var curdate = new Date();
	var year = curdate.getFullYear();
	var month = curdate.getMonth()+1;
	var day = curdate.getDate();
	console.log(getId.length);
	for (var i = 0; i < getId.length; i++) {
		$("#"+getId[i]).val(year+'.'+(month < 10 ? '0'+ month : month)+'.'+(day < 10 ? '0'+ day : day));
	}
}

var setDateMon = function(){
	var getId = arguments;
	var curdate = new Date();
	var year = curdate.getFullYear();
	var month = curdate.getMonth()+1;
	console.log(getId.length);
	for (var i = 0; i < getId.length; i++) {
		$("#"+getId[i]).val(year+'.'+(month < 10 ? '0'+ month : month));
	}
}


var fncLoadingStart = function(){
	$(".loading_wrap").show();
}

var fncLoadingEnd = function(){
	setTimeout(function(){ 
		$(".loading_wrap").hide();
    }, 350);	
}

function nullString(str, defaultStr){
	
	if(typeof str == "undefined" || str == null || str == "")
		str = defaultStr ;
	
	return str ;
}

function fncSiteSelGet(id,gubun,selVal){
	$.ajax({
	    method: "POST",
	    url: "/mgr/sys/st/siteSel.do",	    
	    data : {
	    		gubun : gubun
	    		, selVal : selVal
	    		},
	    dataType: "html",  
	    success: function(data) { 
	    	$("#"+id).html(data);
	    }
	});
}

function fncArtclAsctn(conClcd,id){
	
	$.ajax({ 
	    method: "POST",
	    url: "/frt/artclAsctn.do",
	    data: {
	    	conClcd : conClcd
	    },
	    dataType: "json",   
	    success: function(data) {
	    	$("#"+id).html(data.incrp.replace(/(\n|\r\n)/g, '<br>'));
	    }
	}); 
}

function fncSiteClcd(id,val){
	$("#"+id).val(val);
	$("#"+id+" OPTION").not(":SELECTED").prop("disabled", true);
}

function fncSelSite(id1,id2,pCd,type){
	var str = '';
	if(type.indexOf('sel') >= 0){
		str += '<option value="" label="업무 구분 선택"></option>';
	}else{
		str += '<option value="" label="전체"></option>';
	}
	var data = {};
	
	if(type.indexOf('voc') >= 0){
		data = {'pCd':pCd,'schEtc13':'voc'};
	}else{
		data = {'pCd':pCd};
	}
	
	if($("#"+id1).val() == ""){
		$("#"+id2).html(str);
	}else{
		$.ajax({
			url:'/selSite.do',
			type:'post',
			data:data,
			dataType:'json',
			async:false,
			success:function(data){
				for(var i = 0; i < data.resultList.length; i++){
					str += '<option value="'+data.resultList[i].cCd+'" label="'+data.resultList[i].cCdNm+'"></option>'
				}
				$("#"+id2).html(str);				
			}
		})	
	}
}

function fncNcNtPg(rUrl){
	fncPageBoard('list', rUrl);
}

function fncCodeSel(id,pCd,selVal,gubun){
	if(pCd == ''){
		return false;
	}
	$.ajax({
	    method: "POST",
	    url: "/cdSel.do",
	    data: {
	    		pCd : pCd
	    		,selVal : selVal
	    		,gubun : gubun
    		},  
	    dataType: "html",   
	    success: function(data) { 
	        $("#"+id).html(data)
	    }
	});
}
