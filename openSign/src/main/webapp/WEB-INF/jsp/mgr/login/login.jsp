<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="0"/>
<meta http-equiv="Pragma" content="no-cache"/>
<meta http-equiv="Pragma" content="no-store"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<meta http-equiv="Content-Style-Type" content="text/css" /> 
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<title>오픈노트</title>
<link rel="shortcut icon" href="/publish/frt/images/common/favicon.ico" type="image/x-icon" />
<link rel="apple-touch-icon-precomposed" href="/publish/frt/images/common/apple-touch-icon.png">
<link rel="stylesheet" type="text/css" href="/publish/mgr/css/style.css">
<link rel="stylesheet" type="text/css" href="/publish/mgr/css/jquery-ui-1.12.1.custom.css"><!-- 개별페이지들의 css 영역 -->
<script type="text/javascript" src="/publish/mgr/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="/publish/mgr/js/board.js"></script>
<script type="text/javascript" src="/publish/mgr/js/boardEtc.js"></script>
<script type="text/javascript" src="/publish/mgr/js/common.js"></script>  
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js" charset="utf-8"></script>

</head>       
<body>   

    <div id="skipnavi">
        <a href="#container">▶본문 바로가기</a>
        <a href="#gnb_area">▶주메뉴 바로가기</a>
    </div>
    <div id="wrapper">    
        <div class="login_wrap"> 
            <form:form commandName="loginVO" id="defaultFrm" method="post">
                <form:hidden path="returnUrl" id="inpReturnUrl" />
                <h1><img src="/publish/frt/images/common/logo.png" alt="오픈노트"></h1>
                <div class="login_box">
                    <div class="login_bg">
                        <i><img src="/publish/mgr/images/i_login.png" alt=""></i>
                    </div>
                    <div class="login">
                        <fieldset>       
                            <legend>로그인폼</legend>   
                            <div class="login_input">  
                                <ul> 
                                    <li>
                                        <form:input path="id" class="text" tabindex="1" id="id" placeholder="아이디" maxlength="20" value="admin" />
                                    </li>  
                                    <li>         
                                        <form:password path="pwd" class="text" tabindex="2" id="pwd" placeholder="비밀번호" maxlength="20" value="1111" />
                                    </li>   
                                </ul>
                                <button type="button" id="login_btn" class="btn_login" onclick="javascript:fncLogin(); return false;">로그인</button>
                            </div>
                        </fieldset>              
                        <div class="login_link">                                           
                            <ul>                                                                  
                                <li style="display:inline-block;">   
                                	초기 비밀번호 : 1111   
                                </li>            
                                <li style="display:inline-block; padding-left: 247px;"> 
                               		<a href="javascript:void(0);" class="btn btn_mdl btn_add" onclick='fncOpenModal();' style="position:relative;float:right;right:-12px;bottom:5px;background-color: #308cde;border-color: #308cde;">비밀번호 변경</a>
                                </li>
                            </ul>        
                        </div>         
                    </div>  
                </div> 
            </form:form>    
        </div>          
    </div>    
	<div id="display_view1" class="layer_popup pop_size316 js-popup" style="border:none;">
	</div>  
	<div class="popup_bg" id="js-popup-bg"></div>
</body>

<script type="text/javascript"> 
	$(document).ready(function(){   
		 
		$("#id").focus(); 
		  
		if("${message}"!=""){  
			alert("${message}");
		}
		if("${useYn}"!=""){  
			alert("${useYn}");
		}
		$("#btn_login").click(function(){
			fncLogin();
			return false;
		});
		$("#pwd").keyup(function(){
			if(event.keyCode == 13){
				fncLogin();
				return false;
			}
		});  
		$("#id").keyup(function(){
			if(event.keyCode == 13){
				fncLogin();
				return false;
			}
		}); 
	});
	var fncLogin = function(){
		if($("#id").val() == ""){
			alert("아이디를 입력해 주세요.");
			$("#id").focus();
			return false;
		} 
		if($("#pwd").val() == ""){
			alert("패스워드를 입력해 주세요.");
			$("#pwd").focus();
			return false;  
		}
		$("#defaultFrm").attr({"action":"/loginProcess.do"}); 
		$("#defaultFrm").submit();  
	};     
	     
<%-- 비밀번호 변경 모달 열기 --%>                            
function fncOpenModal(){        
	fncLoadingStart();                  
	$.ajax({                         
	    method: "POST",                  
	    url: "/modalForm.do",	                                                          
	    data : $("#defaultFrm").serialize(),        
	    dataType: "HTML",                                                  
	    success: function(data) {                                                  
	    	$("#display_view1").html(data);       
	    	view_show(1, '42%', '29%', "20%");                
	    },complete : function(){                        
	    	fncLoadingEnd();      
		}      
	});	
}             

</script>

</html>
