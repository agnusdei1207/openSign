
$(document).ready(function(){
	$("#btn_go_search").click(function(){
		fncGoSearch($("#quickSearch").val());
		return false;
	});
	
	if($("#atchFileId").val() != "" && typeof($("#atchFileId").val()) != "undefined" && $("#atchFileId").val() != "undefined"){
		fncGetFileList($("#atchFileId").val());
	}
	
	$(".ico.facebook").bind("click", function(){ // jsp 오케이
		window.open("http://www.facebook.com/sharer/sharer.php?u="+encodeURIComponent(location.href), "facebook으로 공유하기",  "width=600,height=350,scrollbars=yes");
	});
	$(".ico.twitter").bind("click", function(){ // jsp 오케이
		window.open("https://twitter.com/intent/tweet?text="+encodeURIComponent($("#pageMenuDesc").val())+"&url="+encodeURIComponent(location.href), "twitter로 공유하기",  "width=600,height=350,scrollbars=yes");
	});
	
	$(".emaillQuestSend").click(function(){
		fncEmailQuestion('');
	});
	
	if(location.href.indexOf("FN03010701") > -1) {
		if($("#google_map").length){ 
			$.getScript('http://maps.google.com/maps/api/js?v=3.exp&region=KR').done( function() {
				loadGoogleMap();
			});
		}
	}
	
});
var loadGoogleMap = function(){
	
	initialize();
};
function initialize(){
	var mapOptions = {
		disableDefaultUI		: true,		// 기본 UI 사용 여부
		disableDoubleClickZoom 	: true,		// 더블클릭 중심으로 확대 사용 여부
		zoom 					: 17, 		// 기본 확대율
		center 					: new google.maps.LatLng(37.513724, 127.061141),
		scrollwheel 			: false,	//마우스 휠로 확대 축소 사용 여부
		mapTypeControl 			: true		//맵 타입 컨트롤 사용 여부
	};

	var map = new google.maps.Map(document.getElementById('google_map'),mapOptions); //구글 맵 타깃 설정
	
	google.maps.event.addDomListener(window, "resize",function() {
		var center = map.getCenter();
		google.maps.event.trigger(map,"resize");
		map.setCenter(center);
	});
	
	var markerItem = [
	 ['현대빌딩본사(서울본사)', 37.513300, 127.060300,1], 	//1번 타이틀, 마커 좌표값, 우선순위
	 ['아셈타워', 37.512540, 127.059500, 2], 			//2번 타이틀, 마커 좌표값, 우선순위
	 ['현대빌딩 별관', 37.512950, 127.062000,3], 		//3번 타이틀, 마커 좌표값, 우선순위
	 ['현대모터그룹 별관', 37.511740, 127.063900,4] 		//4번 타이틀, 마커 좌표값, 우선순위
	];
	
	setMarkers(map,markerItem);
	
}

var setMarkers= function(map,locations){
	for(var i=0; i < locations.length; i ++){
		
		if(i == 0) var image = "/publish/img/main/mainVisual/pointer/marker_image_01.png";		// 1번 마커 이미지
		if(i == 1) var image = "/publish/img/main/mainVisual/pointer/marker_image_02.png";		// 2번 마커 이미지
		if(i == 2) var image = "/publish/img/main/mainVisual/pointer/marker_image_03.png";		// 3번 마커 이미지
		if(i == 3) var image = "/publish/img/main/mainVisual/pointer/marker_image_04.png";		// 4번 마커 이미지
		
		var compa = locations[i];
		var myLatLng = new google.maps.LatLng(compa[1],compa[2]);
		var marker = new google.maps.Marker({
			position : myLatLng,
			map		 : map,
			icon 	 : image,
			title	 : compa[0],
			zIndex	 : compa[3]
		});
	}
};

var fncGoSearch = function(schKeyword){
	if(schKeyword == "" || schKeyword.length < 2){
		alert("검색어는 2자 이상 입력해주세요.");
		return false;
	}
	
	var cookieKeyword = $.cookie("cookieKeyword");
	var cookieKeywordNm = "";
	if(typeof(cookieKeyword) == "string" && cookieKeyword != ""){
		var cookieKeywordArr = cookieKeyword.split("||$||");
		for(var i = 0;i<cookieKeywordArr.length;i++){
			if(i < 4){
				cookieKeywordNm += encodeURIComponent(cookieKeywordArr[i]) + "||$||";
			}
		}
	}
	cookieKeywordNm = encodeURIComponent(schKeyword) + "||$||" + cookieKeywordNm;
	
	$.cookie("cookieKeyword", cookieKeywordNm);
	
	$("#searchQuery").val(encodeURIComponent(schKeyword));
	$("#searchFrm").submit();
};


function fncAuthCheckPlus( returnUrl ){
	/*$("#defaultFrame").attr("src","about:blank");
	$("#subFrm").attr({"action" : "", "target" : "defaultFrame"}).submit();*/
	//$("#defaultFrame").attr({"action" : "/auth/front/checkPlus/checkPlusMain.do", "target" : "defaultFrame"}).submit();
	$("#defaultFrame").attr("src" , "/auth/front/checkPlus/checkPlusMain.do?returnUrl="+ returnUrl );
};

function fncAuthIpin(  returnUrl ){
	// $("#subFrm").attr({"action" : "/auth/front/ipin/ipinMain.do", "target" : "defaultFrame"}).submit();
	$("#defaultFrame").attr("src" , "/auth/front/ipin/ipinMain.do?returnUrl="+  returnUrl );
};


function fncAuthCheckPlusEvent( returnUrl, ntcobSeq, branchCd, eventSeq, procType ){
	/*$("#defaultFrame").attr("src","about:blank");
	$("#subFrm").attr({"action" : "", "target" : "defaultFrame"}).submit();*/
	//$("#defaultFrame").attr({"action" : "/auth/front/checkPlus/checkPlusMain.do", "target" : "defaultFrame"}).submit();
	$("#defaultFrame").attr("src" , "/auth/front/checkPlus/checkPlusMain.do?returnUrl="+ returnUrl +"&ntcobSeq=" + ntcobSeq +"&branchCd=" + branchCd +"&eventSeq=" + eventSeq +"&procType=" + procType );
};

function fncAuthIpinEvent(  returnUrl, ntcobSeq, branchCd, eventSeq, procType ){
	// $("#subFrm").attr({"action" : "/auth/front/ipin/ipinMain.do", "target" : "defaultFrame"}).submit();
	$("#defaultFrame").attr("src" , "/auth/front/ipin/ipinMain.do?returnUrl="+  returnUrl +"&ntcobSeq=" + ntcobSeq +"&branchCd=" + branchCd +"&eventSeq=" + eventSeq +"&procType=" + procType );
};


function fncZipCodeMain(){//우편번호 새창 완료한듯?
	var url = "/post/jibun.jsp";
 	var add = window.open(url, "zipcheck", "titlebar=no,status=no,toolbar=no,width=440px,height=370px,resizable=no,scrollbars=yes");
	add.focus();
};

function fncCmmnRequestTot( searchCondition ){//메뉴어디? 2015-12
	
	window.open('', 'popupCmmnRequestTot', 'width=650, height=750, top=100, left=100, fullscreen=no, menubar=no, status=no, toolbar=no, titlebar=yes, location=no, scrollbar=no');
	$("#subFrm").attr({"action" : "/cmmn/requestTot/requestTot.do?searchCondition="+searchCondition, "target" : "popupCmmnRequestTot" , "method" : "post"}).submit();
	
};

function fnReserveApply(){
	location.href="/front/reserve/apply/step01.do?mnCd=FN070402";
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

var setUploadData = function(result){
	if(result.result){
		$("#fileList").empty();
	    var isFile = false;
		$.each(result.resultList, function (intIndex, strValue) {
			var thisData = result.resultList[intIndex];
			var innerHtml = "";

			innerHtml += "<li>";
			innerHtml += "<a href=\"javascript:fncFileDownload('"+thisData.atchFileId+"', '"+thisData.fileSn+"', '"+thisData.streFileNm+"');\" class=\"ico file\">"+thisData.orignFileNm+"("+thisData.fileSize+")</a>";
			innerHtml += "</li>";
		   
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

var fncGetImgFileList = function(atchFileId, altTag){
	$.getJSON("/atch/getFileList.json?atchFileId=" + atchFileId, function (result) {
		if(typeof(result.resultList) == "object"){
			if(result.result){
				$("#photoList").empty();
				$.each(result.resultList, function (intIndex, strValue) {
					var thisData = result.resultList[intIndex];
					var innerHtml = "";

					innerHtml += "<div class=\"imgDetail\"><img src=\"/atch/getImage.do?atchFileId="+thisData.atchFileId+"&fileSn="+thisData.fileSn+" alt=\""+altTag+" 이미지\"/></div>";
				   
					$("#photoList").append(innerHtml);
			   		$("#atchFileId").val(thisData.atchFileId);
				});
				$(".imgDetail").find("img").each(function(){
					if($(this).width() > $("#photoList").width()){
						$(this).width($("#photoList").width());
					}
				});
			}
		}
	});
};

var fncEmailQuestion = function(manageId){ //여긴 jsp오케이
	var emailForm = window.open('/function/email/form.do?manageId='+manageId+'&menuCd='+$("#pageMenuCd").val(), 'emailForm', 'width=667,height=808,scrollbars=no');
	emailForm.focus();
};


var fncQuestion = function(divnCd){ //여긴 어드민이라서 안 해도됨
	var emailForm = window.open('/function/email/form.do?divnCd='+divnCd+'&menuCd='+$("#pageMenuCd").val(), 'emailForm', 'width=667,height=808,scrollbars=no');
	emailForm.focus();
};

var fncApplyQuestion = function(branchCd, divnCd){//여긴 메뉴 모름 2015-12
	var emailForm = window.open('/function/email/form.do?divnCd='+divnCd+'&branchCd='+branchCd+'&menuCd='+$("#pageMenuCd").val(), 'emailForm', 'width=667,height=808,scrollbars=no');
	emailForm.focus();
};

//에너지팜 렌탈, 영어강의 신청하기 팝업 parameter = rental, lecture  // 관리자에서 오케이
var fncEnergyQuestion = function(divnCd){
	var emailForm = window.open('/function/'+divnCd+'/form.do?divnCd='+divnCd.toUpperCase()+'&menuCd='+$("#pageMenuCd").val(), 'emailForm', 'width=667,height=900,scrollbars=no');
	emailForm.focus();
};
//공감레터, ENERZINE 사보 신청 레이어팝업 parameter divnCd=newsletter,enerzine, typeCd=insert,update //관리자에서 오케이
var fncEmailRequst = function(typeCd, divnCd){
	var emailForm = window.open('/function/'+divnCd+'Form.do?mode='+typeCd+'&menuCd='+$("#pageMenuCd").val(), divnCd+'Form', 'width=667,height=707,scrollbars=no');
	emailForm.focus();
};
//문자알림 레이어 팝업, parameter = insert,update //관리자에서 오케이
var fncSmsRequest = function(typeCd){
	var emailForm = window.open('/function/smsNotice/view.do?mode='+typeCd+'&menuCd='+$("#pageMenuCd").val(), 'newsletterForm', 'width=667,height=808,scrollbars=no');
	emailForm.focus();
};

var fncGetManageList = function(){
   	$.getJSON("/function/manage/list.json?menuCd=" + $("#pageMenuCd").val(), function (result) {
   		if(typeof(result.manageList) == "object"){
			$("#manageListArea").empty();
    		$.each(result.manageList, function (intIndex, strValue) {
				var thisData = result.manageList[intIndex];
				var strHtml = "<tr>"
				+ "	<td><div class=\"tdCont\">"+thisData.deptNm+" / "+thisData.empNm+"</div></td>"
                + "	<td><div class=\"tdCont\">"+thisData.telNo+"</div></td>"
                + "	<td><div class=\"tdCont\">평일 09:00 ~ 18:00</div></td>"
                + "	<td><div class=\"tdCont\"><a href=\"#\" onclick=\"javascript:fncEmailQuestion('"+thisData.empNo+"');\" class=\"btn action small\" title=\"새창\"><span>이메일 문의하기</span></a></div></td>"
            	+ "</tr>";
				$("#manageListArea").append(strHtml);
				$("#manageInfoList").show();
    		});
   		}
   	});
};


var fncSatiSubmit = function(){

	if($("input[name='ansVal01']").length > 0){
		var isTrue = false;
		for(var i = 0;i<$("input[name='ansVal01']").length;i++){
			if($("input[name='ansVal01']").eq(i).prop("checked") == true){
				isTrue = true;
				break;	
			}
		}

		if(isTrue==false){
			alert("만족도 평가 항목에 별점을 선택해주세요.");
			$("input[name='ansVal01']").eq(0).focus();
			return false;
		}
	}

	if($("input[name='ansVal02']").length > 0){
		var isTrue = false;
		for(var i = 0;i<$("input[name='ansVal02']").length;i++){
			if($("input[name='ansVal02']").eq(i).prop("checked") == true){
				isTrue = true;
				break;	
			}
		}

		if(isTrue==false){
			alert("만족도 평가 항목에 별점을 선택해주세요.");
			$("input[name='ansVal02']").eq(0).focus();
			return false;
		}
	}

	if($("input[name='ansVal03']").length > 0){
		var isTrue = false;
		for(var i = 0;i<$("input[name='ansVal03']").length;i++){
			if($("input[name='ansVal03']").eq(i).prop("checked") == true){
				isTrue = true;
				break;	
			}
		}

		if(isTrue==false){
			alert("만족도 평가 항목에 별점을 선택해주세요.");
			$("input[name='ansVal03']").eq(0).focus();
			return false;
		}
	}

	if($("input[name='ansVal04']").length > 0){
		var isTrue = false;
		for(var i = 0;i<$("input[name='ansVal04']").length;i++){
			if($("input[name='ansVal04']").eq(i).prop("checked") == true){
				isTrue = true;
				break;	
			}
		}

		if(isTrue==false){
			alert("만족도 평가 항목에 별점을 선택해주세요.");
			$("input[name='ansVal04']").eq(0).focus();
			return false;
		}
	}

	$.getJSON("/function/sati/insert.json", $("#satiFrm").serialize(), function (result) {
		if(result.resultCd == true){
			if(confirm("만족도 평가가 완료되었습니다.\n결과를 확인하시겠습니까?")){
				fncSatiResultView();
			}
		}else{
			alert("잠시 시스템 점검중입니다. 잠시후에 시도하여 주시기 바랍니다.");
			return false;
		}
	});	
};
var fncSatiResultView = function(){ // 만족도 jsp 오케이
	var satiResult = window.open('/function/sati/list.do?menuCd='+$("#pageMenuCd").val(), 'satiResult', 'width=771,height=808,scrollbars=yes');
	satiResult.focus();
};

//폼 아이디, 사이즈, KB변환한 사이즈, 파일 번호, 파일확장자
var getFileCheck = function(id, sz, size, num, divn){	
	var imgSize = document.getElementById("fileForm"+num).files[0].size;
	var file = document.getElemetnById("fileForm"+num).value;
	var fileFilter = /\.(jpg|gif|jpeg|bmp|png)$/i;
	
	if(divn == "image"){
		fileFilter = /\.(jpg|gif|jpeg|bmp|png)$/i;
	}else if(divn == "movie"){
		fileFilter = /\.(wmv)$/i;
	}
	
	
	if(imgSize > size ){
		alert(sz+"MB 이하의 이미지만 첨부할 수 있습니다.");
		$("input[name='fileForm"+num+"']").val("");
	}
	
	if(file.match(fileFilter)){
		alert("허용된 확장자가 아닙니다.");
		$("input[name='fileForm"+num+"']").val("");
	}
	
	var cnt = $("#fileList1 > div").length;
	if(cnt == 1){
		alert("배너 이미지 하나만 등록 가능합니다.");
		$("input[name='fileForm"+num+"']").val("");
	}
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

var setUploadData2 = function(result, id){
	if(result.result){
		$("#fileList"+id).empty();
	    $("#fileForm"+id).val("");
	    var isFile = false;
		$.each(result.resultList, function (intIndex, strValue) {
			var thisData = result.resultList[intIndex];
			var innerHtml = "";

			innerHtml += "<div class=\"MultiFile-label\">";
			innerHtml += "<a href=\"javascript:fncFileDownload('"+thisData.atchFileId+"', '"+thisData.fileSn+"', '"+thisData.streFileNm+"'); class=\"btn action small\"><span>"+thisData.orignFileNm+"</span></a>";
			if(typeof($("#atchViewType").val()) == "undefined" || $("#atchViewType").val() == "insert"){
				innerHtml += "<a href=\"javascript:fncFileDelete2('"+thisData.atchFileId+"', '"+thisData.fileSn+"', '"+id+"');\" class=\"btn action small\"><span>DEL</span></a>&nbsp;";
			}
			//innerHtml += "<span class=\"MultiFile-title\" style=\"color:#000;font-size:10px;\">";
			//innerHtml += " &lt;a href=\"javascript:fncFileDownload('"+thisData.atchFileId+"', '"+thisData.fileSn+"', '"+thisData.streFileNm+"');\" title=\""+thisData.orignFileNm+" 다운로드\" &gt;"+thisData.orignFileNm+"&lt;/a&gt;";
			//innerHtml += "</span>";
			innerHtml += "</div>";
			$("#fileList"+id).append(innerHtml);
	   		$("#atchFileId"+id).val(thisData.atchFileId);
	   		isFile = true;
		});	
		if(!isFile){
	   		$("#atchFileId"+id).val("");
		}
	}else{
        alert("파일업로드중 파일형식이 허용되지 않거나 파일용량을 확인하여주시기 바랍니다.");
	}
};

var fncFileDelete2 = function(atchFileId, fileSn, id){
	$.getJSON("/atch/fileDelete.json?atchFileId=" + atchFileId + "&fileSn="+fileSn, function (result) {
		if(typeof(result.resultList) == "object"){
			setUploadData2(result, id);
		}
	});
	$("#atchFileId"+id).val("");
};


var numOnly = function(){
	if((event.keyCode<48) || (event.keyCode>57)){
		event.returnValue = false;
	}
};


//이메일주소 형식 검사
function checkEmail(emailAddr)
{
	var pattern = /([0-9a-zA-Z_-]+)@([0-9a-zA-Z_-]+)\.([0-9a-zA-Z_-]+)/;
	if (!pattern.test(emailAddr)) {
		return false;
	}else{
		return true;
	}
}

;(function (global, $) {

	var DynamicTableBuilder = function () {

		var _private = {}
		, _public = {};


		_private.currOption = {};
		/**
			초기화
		*/
		_private.init = function (option) {
			
			_private.currOption = $.extend (_private.currOption, DynamicTableBuilder.prototype.DEFAULT_OPTION, option);
		};

		/**
			실제 처리
		*/
		_private.proc = function () {

			_private.getAjaxData ()
			.done (_private.buildArea);
		};

		/**
			 AJAX 요청및 처리
		*/
		_private.getAjaxData = function () {

			var _option = _private.currOption;

			return $.getJSON (_option.url, _option.param);
					
		};

		/**
			테이블 생성
		*/
		_private.buildArea = function (data) {

			var _option = _private.currOption
			, $buildeResult = '';
			
			if ($.isFunction (_option.fnBuild)) {
				
				if ($.isFunction (_option.fnPrefix)) {

					_option.fnPrefix (data);
				}

				$buildeResult = _option.fnBuild (data);
				_option.$target.empty ().append ($buildeResult);

				if ($.isFunction (_option.fnSuffix)) {

					_option.fnSuffix (data, $buildeResult);
				}
			}
		};

		/**
			시작
		*/
		_private.start = function () {

			_private.currOption.timer = setInterval(_private.proc, _private.currOption.time);
		};
		/**
			초기화
		*/
		_public.init = function (option) {
			
			_private.init (option);
			_private.start ();
		};

		/**
			호출
		*/
		_public.callFn = function () {	

			// 나중에 만듭시다!!
		};

		return _public;
	};

	DynamicTableBuilder.prototype.DEFAULT_OPTION = {
		'$target'	: undefined,
		'url'		: '',
		'timer'		: '',
		'time'		: '3000',
		'param'		: {},
		'fnBuild'	: function (data) {},
		'fnPrefix'	: function (data) { return data;},
		'fnSuffix'	: function (data) { return data;}
	};

	/**
		사용
	*/
	$.fn.dynamicTableBuilder = function (option) {

		option = option || {};

		var $this = $(this)
		, dataKey = 'dynamicTableBuilder'
		, dynamicTableBuilder
		, isCallFn = typeof option == 'string';

			
		if (isCallFn) {

			dynamicTableBuilder = $this.data (dataKey);
			return dynamicTableBuilder.callFn.apply ($this, $.makeArray (arguments));
		}
		else {

			dynamicTableBuilder = new DynamicTableBuilder ();
			option.$target = $this;
			dynamicTableBuilder.init (option);
			$this.data (dataKey, dynamicTableBuilder);
			return dynamicTableBuilder;
		}
	};
} (this, jQuery));
