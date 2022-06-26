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

const alertMsg = function(mId, color, msg, dis){
	var display = "inline";
	var blank = "　";
	if(dis != null){
		if(dis == "B"){
			display = "block";
			blank = "";
		}
		if(dis == "IB"){
			display = "inline-block";
		}
	}
	
	$("#msg_"+mId).remove();
	if(color!=""&&color!=null&&msg!=""&&msg!=null){
		var msgHtml = '<span class="text" id="msg_'+mId+'" style="color:'+color+';display:'+display+'">'+blank+msg+'</span>';
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

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

$(function() {
  response();
  // foot select
  family_select();

  $('#js-popup-bg').click(function() {
    $("body").removeClass("ofHidden");
    $('.js-popup').css("display", "none");
    $(this).css("display", "none");
  });
  $('.js-top').click(function() {
    $('html, body').animate({
      scrollTop: 0
    }, 400);
    return false;
  });
  $(".btn_sns").click(function() {
    event.preventDefault();
    if ($(this).hasClass("open")) {
      $(".sns_pop").fadeOut(300);
      $(this).removeClass("open");
    } else {
      $(this).addClass("open");
      $(".sns_pop").fadeIn(300);
    }
    return false;
  });
});

$(window).resize(function() {
  response();
});

function response() {
  if ($(window).width() > 1199) {
    pc_gnb();
    loca();
    pcSitemap();//사이트맵
    
    if ($("#container > div").is("#top_area")) {
      subScroll();
    }
    if ($("#container div").hasClass("location_area")) {
      subPageAni();
    }
    $(".m_gnb li").removeClass("expanded");
    $("#js-mSearch").removeClass("active");
    $("#m_share_pop, #bg_m_share, .two_depBox").hide();
  } else {
	$(".one_dep").off();
	mobileMenu();
	locas_m();
    $("#js-sitemapBox, #js-sitemapBg").hide();

  }

}

function mSearch(){
    var searchOpen = $(".btn_m_search");
    var searchbox = $("#js-mSearch");
    var searchClose = $(".close_m_search");
    searchbox.removeClass("active");   
    searchbox.addClass("active");   
    searchClose.click(function(){
        searchbox.removeClass("active");
        return false;
    });
}

function pc_gnb() {
	$('.js-gnb .depth2 > li').on({
		'mouseenter focusin':function() {
			//강좌 여러개 일때 용도로 작성해둠 
			/*var liHegiht = $(".depth1_1 .depthBox").height();
			$(".js-gnb-bg").stop().animate({"height": liHegiht+ 50},500);
			$(".js-gnb .depth2").stop().animate({"height":liHegiht + 100},500);*/
			
			$(".js-gnb-bg").stop().animate({"height":"404px"},500);
			$(".js-gnb .depth2").stop().animate({"height":"454px"},500);
			$(".js-gnb .depth2 li").not(this).removeClass("on");
			$(".gnb .depth2 > li").on("mouseenter focusin", function(){
				$(".gnb .depth2 li").not(this).removeClass("on");
				$(this).addClass("on");
				var gnbImg = $(".gnb_bg > span");
				var gnbOn1 = $(".gnb .depth1_1 ");
				var gnbOn2 = $(".gnb .depth1_2 ");
				var gnbOn3 = $(".gnb .depth1_3 ");
				var gnbOn4 = $(".gnb .depth1_4 ");
				var gnbOn5 = $(".gnb .depth1_5 ");

				if(gnbOn1.hasClass('on')){
					gnbImg.removeClass().addClass("in_bg").addClass("gnb_img01");

				}else if(gnbOn2.hasClass('on')){
					gnbImg.removeClass().addClass("in_bg").addClass("gnb_img02");

				}else if(gnbOn3.hasClass('on')){
					gnbImg.removeClass().addClass("in_bg").addClass("gnb_img03");

				}else if(gnbOn4.hasClass('on')){
					gnbImg.removeClass().addClass("in_bg").addClass("gnb_img04");

				}else if(gnbOn5.hasClass('on')){
					gnbImg.removeClass().addClass("in_bg").addClass("gnb_img05");
				}
			});
			//$(".js-gnb .depth2 li").not(this).children(".gnb_txt").hide();
			$(this).addClass("on");
			//$(this).children(".gnb_txt").show();
		},'mouseleave focusout':function(){
			$(".js-gnb .depth2").stop().animate({"height":"70px"},500);
			$(".js-gnb-bg").stop().animate({"height":"0"},500);
			$(".js-gnb .depth2 li").removeClass("on");
		}
	});
}

//mobile menu
function mobileMenu(){
    var header = $('.js-header');
    $(".two_depBox").hide();
    $(".m_gnb li").removeClass("expanded");
    //menu open
    $('.js-openMenu').click(function(){
        header.addClass('open');
        return false;
    });
    //menu close
    $('.js-closeMenu').click(function(){
        header.removeClass('open');
        $(".m_gnb li").removeClass("expanded");
        $(".two_depBox").slideUp();
        return false;
    });
    //menu list
    $(".one_dep").click(function(){
        var element = $(this).parent('li');
        if(element.hasClass("expanded")){
        	element.removeClass("expanded");
            element.children(".two_depBox").slideUp("slow");
            
        }else{
	        element.siblings("li").children(".two_depBox").slideUp("slow");
	        element.siblings("li").removeClass("expanded");
	        element.addClass("expanded");
	        $(this).next(".two_depBox").slideDown(500);
        }
        return false;
    });
}

function loca() {

  $('.location_select .my_value').off();
// Common
  var select_root = $("div.location_select");
  var select_value = $(".location_select .my_value");
  var select_a = $("div.location_select>ul>li>a");
  var select_input = $("div.location_select>ul>li>input[type=radio]");
  var select_label = $("div.location_select>ul>li>label");
  // Radio Default Value
  $(".location_select .my_value").each(function() {
    var default_value = $(this).next(".i_list").find('input[checked]').next('label').text();
    $(this).append(default_value);
  });
  // Line
  select_value.bind("focusin", function() {
    $(this).addClass("outLine");
  });
  select_value.bind("focusout", function() {
    $(this).removeClass("outLine");
  });
  select_input.bind("focusin", function() {
    $(this).parents("div.location_select").children("div.my_value").addClass("outLine");
  });
  select_input.bind("focusout", function() {
    $(this).parents("div.location_select").children("div.my_value").removeClass("outLine");
  });
  // Show
  function show_option() {
    $(this).parents("div.location_select:first").toggleClass("open");
  }
  // Hover
  function i_hover() {
    $(this).parents("ul:first").children("li").removeClass("hover");
    $(this).parents("li:first").toggleClass("hover");
  }
  // Hide
  function hide_option() {
    var t = $(this);
    setTimeout(function() {
      t.parents("div.location_select:first").removeClass("open");
    }, 1);
  }
  // Set Input
  function set_label() {
    var v = $(this).next("label").text();
    $(this).parents("ul:first").prev(".my_value").text("").append(v);
    $(this).parents("ul:first").prev(".my_value").addClass("selected");
  }
  // Set Anchor
  function set_anchor() {
    var v = $(this).text();
    $(this).parents("ul:first").prev(".my_value").text("").append(v);
    $(this).parents("ul:first").prev(".my_value").addClass("selected");
  }
  // Anchor Focus Out
  $('*:not("div.location_select a")').focus(function() {
    $(".location_select .a_list").parent(".location_select").removeClass("open");
  });
  select_value.mouseover(show_option);
  select_root.removeClass("open");
  select_root.mouseleave(function() {
    $(this).removeClass("open");
  });
  select_a.click(set_anchor).click(hide_option).focus(i_hover).hover(i_hover);
  select_input.change(set_label).focus(set_label);
  select_label.hover(i_hover).mouseleave(hide_option);

}

function locas_m() {
  $('.location_select .my_value').off();

  var select_root = $('.location_select');
  var select_value = $('.location_select .my_value');
  var select_a = $('.location_select>ul>li>a');


  // Show
  function show_option() {
    $(this).parents('div.location_select:first').toggleClass('open');
  }
  // Hover
  function i_hover() {
    $(this).parents('ul:first').children('li').removeClass('hover');
    $(this).parents('li:first').toggleClass('hover');
  }
  // Hide
  function hide_option() {
    var t = $(this);
    setTimeout(function() {
      t.parents('div.location_select:first').removeClass('open');
    }, 1);
  }
  // Set Input
  function set_label() {
    var v = $(this).next('label').text();
    $(this).parents('ul:first').prev('.my_value').text('').append(v);
    $(this).parents('ul:first').prev('.my_value').addClass('selected');
  }
  // Set Anchor
  function set_anchor() {
    var v = $(this).text();
    $(this).parents('ul:first').prev('.my_value').text('').append(v);
    $(this).parents('ul:first').prev('.my_value').addClass('selected');
  }
  // Anchor Focus Out
  $('*:not("div.location_select a")').focus(function() {
    $('.a_list').parent('.location_select').removeClass('open');
  });
  select_value.click(show_option);
  select_root.removeClass('open');
  select_root.mouseleave(function() {
    $(this).removeClass('open');
  });
  select_a.click(set_anchor).click(hide_option).focus(i_hover).hover(i_hover);
}

function family_select() {
	var select_root = $('div.js-fake-select');
	var select_value = $('.js-my-value');
	var select_a = $('div.js-fake-select>ul>li>a');
	var select_input = $('div.js-fake-select>ul>li>input[type=radio]');
	var select_label = $('div.js-fake-select>ul>li>label');
	// Radio Default Value
	$('div.js-my-value').each(function(){
		var default_value = $(this).next('.js-i-list').find('input[checked]').next('label').text();
		$(this).append(default_value);
	 });

		// Line
		select_value.bind('focusin',function(){$(this).addClass('outLine')});
		select_value.bind('focusout',function(){$(this).removeClass('outLine')});
		select_input.bind('focusin',function(){$(this).parents('div.js-fake-select').children('div.js-my-value').addClass('outLine')});
		select_input.bind('focusout',function(){$(this).parents('div.js-fake-select').children('div.js-my-value').removeClass('outLine')});
		// Show
		function show_option(){
			$(this).parents('div.js-fake-select:first').toggleClass('open');
		}
		// Hover
		function i_hover(){
			$(this).parents('ul:first').children('li').removeClass('hover');
			$(this).parents('li:first').toggleClass('hover');
		}
		// Hide
		function hide_option(){
			var t = $(this);
			setTimeout(function(){
				t.parents('div.js-fake-select:first').removeClass('open');
			}, 1);
		}
		// Set Input
		function set_label(){
			var v = $(this).next('label').text();
			$(this).parents('ul:first').prev('.js-my-value').text('').append(v);
			$(this).parents('ul:first').prev('.js-my-value').addClass('selected');
		}
		// Set Anchor
		function set_anchor(){
			var v = $(this).text();
			$(this).parents('ul:first').prev('.js-my-value').text('').append(v);
			$(this).parents('ul:first').prev('.js-my-value').addClass('selected');
		}
		// Anchor Focus Out
		$('*:not("div.js-fake-select a")').focus(function(){
			$('.a_list').parent('.js-fake-select').removeClass('open');
		});
		select_value.click(show_option);
		select_root.removeClass('open');
		select_root.mouseleave(function(){$(this).removeClass('open')});
		select_a.click(set_anchor).click(hide_option).focus(i_hover).hover(i_hover);
		select_input.change(set_label).focus(set_label);
		select_label.hover(i_hover).click(hide_option);
}

function subPageAni() {
  $(window).on('load', function() {
    setTimeout(function() {
      if ($(window).scrollTop() == 0) {
        $('html,body').animate({
          scrollTop: 327
        }, 400);
      }
    }, 350);
  });
}

function subScroll() {
  $(window).scroll(function() {
    var $pagenav = $('#top_area'),
      topH = $('#header').height() + $('.sub_visual').height();

    if ($(this).scrollTop() >= topH) {
      $pagenav.addClass('top_fixed');
      $('#content').addClass('top_fixed');
    } else {
      $pagenav.removeClass('top_fixed');
      $('#content').removeClass('top_fixed');
    }
  });
}

//tab
function subTab() {
  $(".tab_content").hide();
  $(".tab_content:first").show();
  $(".tab li a").click(function(event) {
    event.preventDefault(); //��占쏙옙源�����������占� #���⑼옙節���
    $(this).parent().addClass("current");
    $(this).parent().siblings().removeClass("current");
    var tab = $(this).attr("href");
    $(".tab_content").not(tab).css("display", "none");
    $(tab).fadeIn();
  });
}
//popup
function view_show(num) {
  var left = (($(window).width() - $("#display_view" + num).width()) / 2);
  var top = (($(window).height() - $("#display_view" + num).height()) / 2);
  $("#display_view" + num).css({
    'left': left,
    'top': top,  
    'position': 'fixed'
  });
  document.getElementById("js-popup-bg").style.display = "block";
  document.getElementById("display_view" + num).style.display = "block";
  return false;
}

function view_hide(num) {
  document.getElementById("display_view" + num).style.display = "none";
  document.getElementById("js-popup-bg").style.display = "none";
  return false;
}

function edu_show(num) {
    var left = (( $(window).width() - $("#edu_view"+num).width()) / 2 );
    var top = (( $(window).height() - $("#edu_view"+num).height()) / 2 );
    $("#edu_view" + num).css({
        'left': left,
        'top': top,
        'position': 'fixed'
      });
    document.getElementById("js-popup-bg").style.display = "block";
    document.getElementById("edu_view"+num).style.display = "block";
    return false;
 }
function edu_hide(num) {
	document.getElementById("edu_view"+num).style.display = "none";
	document.getElementById("js-popup-bg").style.display = "none";
	return false;
}

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
      buttonImage: "/publish/frt/images/sub/icon_calendar.png",
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
//占싼�占쎈��占쎈���
function pcSitemap(){
    $('.js-siteMap').click(function(){
        //var left = (( $(window).width() - $("#js-sitemapBox").width()) / 2 );
        //var top = (( $(window).height() - $("#js-sitemapBox").height()) / 2 );
        $("#js-sitemapBox").css({'left':0,'top':0, 'position':'fixed'});
        document.getElementById("js-sitemapBg").style.display = "block";
        document.getElementById("js-sitemapBox").style.display = "block";
        $('html').css('overflow-y','hidden');
        var boxheight = ($(window).height() - $('.sitemap_head').height());
        $('.site_menu_box').css('height:',boxheight);
        return false;
    });
    $('.sitemap_close').click(function(){
        $("#js-sitemapBox, #js-sitemapBg").hide();
        $('html').css('overflow-y','');
        return false;
    });
}
function fncMoPop(uri){
	$("#moPopId").attr("src",uri);
	imgPop_show(1);
	return false;
}


function imgPop_show(num) {
    var left = (( $(window).width() - $("#pop_view"+num).width()) / 2 );
    var top = (( $(window).height() - $("#pop_view"+num).height()) / 2 );
    $("#pop_view"+num).css({'top':top});
    document.getElementById("js-bg-imgpop").style.display = "block";
    document.getElementById("pop_view"+num).style.display = "block";
    return false;
 }
function imgPop_hide(num) {
	document.getElementById("pop_view"+num).style.display = "none";
	document.getElementById("js-bg-imgpop").style.display = "none";
	return false;
}