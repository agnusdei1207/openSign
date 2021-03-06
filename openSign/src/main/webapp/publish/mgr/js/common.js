$(document).ready(function(){
	$('.numOnly').on('input', function(){
		this.value=this.value.replace(/[^0-9]/g,'');
	});
	$('.numDotOnly').on('input', function(){
		this.value=this.value.replace(/^([^.]*\.)|\.+/g, '$1').replace(/[^\d.]+/g, '');
	});
});

const fncColLength = function(){
	$("colgroup").each(function(index){
		$(this).nextAll('tbody:first').find(".no_data").attr("colspan", $(this).children("col").length);
	});
};

/* 유효성 메시지 */
const alertMsg = function(mId, color, msg, dis){
	var display = "inline";
	var margin = "5px;";
	if(dis != null){
		if(dis == "B"){
			display = "block";
			margin = "";
		}
		if(dis == "IB"){
			display = "inline-block";
		}
	}
	
	$("#msg_"+mId).remove();
	if(color!=""&&color!=null&&msg!=""&&msg!=null){
		var msgHtml = '<span class="text" id="msg_'+mId+'" style="color:'+color+';display:'+display+';margin-left:'+margin+';">'+msg+'</span>';
		$("#"+mId).parent().append(msgHtml);
	}
};


const numFormat = function(object, divn){
	var numVal = object.text().trim();
	if(divn == "tel"){
		numVal = numVal.replace(/^(02[0-9]{0}|0[0-9]{2}|01[0|1|6|7|8|9]{1})([0-9]{3,4})([0-9]{4})$/,"$1-$2-$3");
	}
	if(divn == "busi"){
		numVal = numVal.replace(/^([0-9]{3})([0-9]{2})([0-9]{5})$/,"$1-$2-$3");
	}
	if(divn == "num"){
		numVal = numVal.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	object.text(numVal);
};
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/*$(function(){
	$(".gnb").hover(function(){
		if($(".subWrap").is(":hidden")){
			$(".subWrap").slideDown();
			$(".gnb_bg").slideDown();
		}else{
			$(".subWrap").show();
			$(".gnb_bg").show();
		}
		$(".gnb > li").on("mouseenter focusin",function(){
			$(".gnb > li > a").removeClass("current");
			$(this).children().addClass("current");
		});
	});
	$(".gnb").on("mouseenter focusin",function(){
		if($(".subWrap").is(":hidden")){
			$(".subWrap").slideDown();
			$(".gnb_bg").slideDown();
		}else{
			$(".subWrap").show();
			$(".gnb_bg").show();
		}
		$(".gnb > li").on("mouseenter focusin",function(){
			$(".gnb > li > a").removeClass("current");
			$(this).children().addClass("current");
		});
	});
	$(".gnb").on("mouseleave blur",function(){
		$(".subWrap").slideUp();
		$(".gnb_bg").slideUp();
	});
	$(".gnb > li").on("mouseleave blur",function(){
		$(this).children().removeClass("current");
	});
	$('*:not(".gnb *")').focus(function(){
		$(".subWrap").slideUp();
		$(".gnb > li > a").removeClass("current");
		$(".gnb_bg").slideUp();
	});
});*/

//left menu
(function($){
    $(document).ready(function(){
    $('#lnb li.active').addClass('open').children('ul').show();
        $('#lnb li.has_sub>a').on('click', function(){
            $(this).removeAttr('href');
            var element = $(this).parent('li');
            if (element.hasClass('open')) {
                element.removeClass('open');
                element.find('li').removeClass('open');
                element.find('ul').slideUp(200);
            }
            else {
                element.addClass('open');
                element.children('ul').slideDown(200);
                element.siblings('li').children('ul').slideUp(200);
                element.siblings('li').removeClass('open');
                element.siblings('li').find('li').removeClass('open');
                element.siblings('li').find('ul').slideUp(200);
            }
        });
    });
})(jQuery);

$(document).ready(function(){
	//leftarea on off
/*	$('.btn_sideClose').click(function(){
    if ($('.btn_sideClose').hasClass('open')) {
      $(this).removeClass('open');
      $('#left_content').stop().animate({"left":"0"},500);
	  $('#content').stop().animate({"padding-left":"210px"},500);
    }else {
      $(this).addClass('open');
      $('#left_content').stop().animate({"left":"-210px"},500);
	  $('#content').stop().animate({"padding-left":"0"},500);
    }
  });
  $('.btn_sideOpen').click(function(){
    $('#left_content').stop().animate({"left":"0"},500);
	 $('#content').stop().animate({"padding-left":"210px"},500);
    $(this).hide();
    $('.btn_sideClose').show();
});*/


	//search
	$(".search_detail").hide();
    $(".search_block").show();
    $(".btn_detail").click(function(){
        if($('.search_detail').is(":hidden")){
             $(".search_detail").slideDown("4000");
             $(".btn_search i").removeClass("fa-caret-down").addClass("fa-caret-up");
        }else{
            $(".search_detail").slideUp("4000");
            $(".btn_search i").removeClass("fa-caret-up").addClass("fa-caret-down");
        }
    });

	var selectTarget = $('.search_select select');
    selectTarget.on('blur', function(){
        $(this).parent().removeClass('focus');
    });
    selectTarget.change(function(){
        var select_name = $(this).children('option:selected').text();
        $(this).siblings('label').text(select_name);
    });

	//tab
	$(".tab_content").hide();
    $(".tab_content:first").show();
	$(".tab_menu a").click(function(event) {
		event.preventDefault();
		$(this).parent().addClass("current");
		$(this).parent().siblings().removeClass("current");
		var tab = $(this).attr("href");
		$(".tab_content").not(tab).css("display", "none");
		$(tab).fadeIn();
	});
	
	
	/* tab */
	
	 // main tab
    $(".main_tabCcontent").hide();
    $(".main_tabCcontent:first").show();
    $("#mainTab a").click(function(event) {
        event.preventDefault(); //주소에 #숨김
        $(this).parent().addClass("current");
        $(this).parent().siblings().removeClass("current");
        var tab = $(this).attr("href");
        $(".main_tabCcontent").not(tab).css("display", "none");
        $(tab).fadeIn();
    });
    // main tab
   $(".main_tabCcontent2").hide();
   $(".main_tabCcontent2:first").show();
   $("#mainTab2 a").click(function(event) {
       event.preventDefault(); //주소에 #숨김
       $(this).parent().addClass("current");
       $(this).parent().siblings().removeClass("current");
       var tab = $(this).attr("href");
       $(".main_tabCcontent2").not(tab).css("display", "none");
       $(tab).fadeIn();
   });
    //sub tab1
    $(".tab_content1").hide();
    $(".tab_content1:first").show();
    $("#tab1 a").click(function(event) {
        event.preventDefault(); //주소에 #숨김
        $(this).parent().addClass("current");
        $(this).parent().siblings().removeClass("current");
        var tab = $(this).attr("href");
        $(".tab_content1").not(tab).css("display", "none");
        $(tab).fadeIn();
    });
    //sub tab2
    $(".tab_content2").hide();
    $(".tab_content2:first").show();
    $("#tab2 a").click(function(event) {
        event.preventDefault(); //주소에 #숨김
        $(this).parent().addClass("active");
        $(this).parent().siblings().removeClass("active");
        var tab = $(this).attr("href");
        $(".tab_content2").not(tab).css("display", "none");
        $(tab).fadeIn();
    });
	
	
});


var fncDate = function(){
	var setDate = arguments;
	var getId;
	var fmt = "yy.mm.dd";
	switch (setDate.length) {
		case 1: getId ="#"+setDate[0];break;
		case 2: if(setDate[1] != ''){getId ="#"+setDate[0]+", #"+setDate[1];break;}else{getId ="#"+setDate[0];break;}
		case 3: if(setDate[1] != ''){getId ="#"+setDate[0]+", #"+setDate[1];fmt=setDate[2];break;}else{getId ="#"+setDate[0];fmt=setDate[2];break;}
	}
	
	 var dates = $( getId ).datepicker({
      changeMonth: true,
      changeYear: true,
      showOn: "button",
      buttonImage: "/publish/mgr/images/icon_calendar.png",
      buttonImageOnly: true,
      dateFormat : fmt,
      onSelect: function( selectedDate ) {
          var option = this.id == setDate[0] ? "minDate" : "maxDate",
          instance = $( this ).data( "datepicker" ),
          date = (fmt == 'yy.mm' ? new Date(instance.selectedYear, instance.selectedMonth, 1) : $.datepicker.parseDate( $.datepicker._defaults.dateFormat, selectedDate, instance.settings ))
    	  dates.not( this ).datepicker( "option", option, date );
      }
  });
}

var getMenuCd = function(str){alert(str);
	 var rStr="";
	 var arrStr = str.split("/");
	 if(arrStr.length == 4){
		 rStr = arrStr[1]+"/"+arrStr[2];
	 }else if(arrStr.length == 5){
		 rStr = arrStr[1]+"/"+arrStr[2]+"/"+arrStr[3];
	 }
	 return rStr;
}

var replaceAll = function(str, oldChar, newChar){
	   var tmp = str.split(oldChar).join(newChar);
	   return tmp;
	};
	  
function view_show(num, left, top, right) {
    var auto_left = (( $(window).width() - $("#display_view"+num).width()) / 2 );
    var auto_top = (( $(window).height() - $("#display_view"+num).height()) / 2 );
    if(left == '' || top == '' || right == ''){
    	$("#display_view"+num).css({'left':auto_left,'top':auto_top,'right':auto_top, 'position':'fixed'});
    }else{
    	$("#display_view"+num).css({'left':left,'top':top,'right':right, 'position':'fixed'});
    } 
    document.getElementById("display_view"+num).style.display = "block";
    document.getElementById("js-popup-bg").style.display = "block";
    return false;
 } 
function view_hide(num) {
    $("body").removeClass("ofHidden");
    document.getElementById("display_view"+num).style.display = "none";
    document.getElementById("js-popup-bg").style.display = "none";
    return false;
}
  
$(function(){
    $('#js-popup-bg').click(function(){
        $('.js-popup').css("display","none");
        $(this).css("display","none");
    });
});
  
// 팝업 드래그(jquery ui 파일이 연결되어 있어야함.)
//$( ".js-popup" ).draggable();
  
/*윈도우팝업 공통 class로 닫기 처리 - 닫기버튼에 window_close 추가*/
$(function(){
    $('.window_close').click(function(){
        window.open('about:blank', '_self').close();
    });
});