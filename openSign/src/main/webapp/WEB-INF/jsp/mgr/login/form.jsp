<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
    
<style>     
.join_wrap {position:relative;width:50%;margin: 0 auto;}
.join {position:relative;} 
.join .input_box {position:relative; margin-top:6px;padding-left:48px;border:1px solid #e3e3e3;}
.join .last .input_box {padding-right:120px;}   
.join span {position:absolute;left:-1px;top:-1px;bottom:-1px;width:48px;line-height:48px;text-indent:-9999em;border-right:1px solid #e3e3e3;}
.join .i_nm {background:#308cde url(http://opennote.co.kr/guide/images/sample/i_nm.png) no-repeat 50% 50%}
.join .i_pw {background:#308cde url(http://opennote.co.kr/guide/images/sample/i_pw.png) no-repeat 50% 50%}
.join .i_pwr {background:#308cde url(http://opennote.co.kr/guide/images/sample/i_pwr.png) no-repeat 50% 50%}
.join .text {width:100%;height:48px;border:0;}
</style>	    
            
<div class="pop_header">   
	<h2>비밀번호 변경</h2>    
	<a href="javascript:void(0);" onclick="view_hide(1);" class="pop_close"></a>    
</div>        
    <div class="join_wrap" style="width:130%;">      
		<div class="pop_content" style="margin-right:111px;margin-left:2px;margin-top: -20px;">   
		  		<form name="popFrm" id="popFrm" method="post">   
			        <ul class="join js-join">    
			            <li>    
			                <div class="input_box">
			                    <span class="i_nm">이름</span><input type="text" name="id" id="ch_id" class="text js-text" placeholder="아이디" maxlength="20" />
			                </div>
			            </li>
			            <li>
			                <div class="input_box">
			                    <span class="i_pw">비밀번호</span><input type="password" name="pwd" id="old_pwd" class="text js-text" placeholder="현재 비밀번호" maxlength="20"/>
			                </div>
			            </li>
			            <li>
			                <div class="input_box">
			                    <span class="i_pwr">새 비밀번호</span><input type="password" name="schEtc01" id="new_pwd" class="text js-text" placeholder="새 비밀번호" maxlength="20"/>
			                </div>
<!-- 			            </li> -->
			            <li>     
			                <div class="input_box">
			                    <span class="i_pwr">새 비밀번호 확인</span><input type="password" id="new_pwd_chk" class="text js-text" placeholder="새 비밀번호 확인" maxlength="20"/>
			                </div>
			            </li>     
			        </ul>      
			      </form>
				<div class="pop_footer">                 
			        <a href="javscript:void(0);" onclick="fncUpdatePwd(1);return false" class="btn btn_mdl btn_save" style="background-color: #308cde;border-color: #308cde;margin-left:-13px;">변경</a>
			        <a href="javscript:void(0);" onclick="view_hide(1);return false" class="btn btn_mdl btn_close">닫기</a>
				</div> 
			 </div>
		</div>     
	         
   
<script type="text/javascript">     
 
<%-- 비밀번호 변경 버튼 --%>	   
function fncUpdatePwd(){  
	  
	<%-- 유효성 검사 --%>
	if($("#ch_id").val() == null || $("#ch_id").val() == ""){
		alert("아이디를 입력해주세요.");
		$("#ch_id").focus();
		return false;
	}
	if($("#old_pwd").val() == null || $("#old_pwd").val() == ""){
		alert("현재 비밀번호를 입력해주세요.");
		$("#old_pwd").focus();
		return false;
	} 
	if($("#new_pwd").val() == null || $("#new_pwd").val() == ""){
		alert("새 비밀번호를 입력해주세요.");
		$("#new_pwd").focus();  
		return false;
	}
	if($("#new_pwd_chk").val() == null || $("#new_pwd_chk").val() == ""){
		alert("새 비밀번호 확인을 입력해주세요.");
		$("#new_pwd_chk").focus();
		return false;  
	} 
	if($("#new_pwd").val() != $("#new_pwd_chk").val()){
		alert("비밀번호가 서로 같지 않습니다.");
		$("#new_pwd_chk").focus()
		return false;
	}  
	  
	<%-- 비밀번호 변경 --%>
	$.ajax({                            
	    method: "POST",              
	    url: "/updatePwd.do",	                                                     
	    data : $("#popFrm").serialize(),    
	    dataType: "JSON",            
	    success: function(data) {                 
	    	if(data.result){
				alert("비밀번호 변경이 완료되었습니다.");	    
				view_hide(1);
	    	}else{      
	    		alert("아이디 혹은 비밀번호가 틀렸습니다.");
	    	} 
	    },complete : function(){   
		}           
	});	
}     
 
<%-- enter key --%>
$("#new_pwd_chk").keyup(function(){
	if(event.keyCode == 13){
		fncUpdatePwd();
		return false;
	}
});

</script>

</html>
