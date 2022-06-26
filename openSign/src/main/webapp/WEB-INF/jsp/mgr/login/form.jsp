<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>
	
         
<div class="pop_header">  
	<h2>비밀번호 변경</h2>   
	<a href="javascript:void(0);" onclick="view_hide(1);" class="pop_close"></a>
</div>  
    
	  <div class="pop_content"> 
	  	<div class="tbl_wrap">             
	  		<form name="popFrm" id="popFrm" method="post"> 
				<table class="tbl_col_type02">
					<caption>정보</caption>       
					<tbody>    
						<tr>   
							<td>
								<input type="text" name="id" id="ch_id" class="text" placeholder="아이디" maxlength="20" />
							</td>
						</tr>             
						<tr>
							<td>
								<input type="password" name="pwd" id="old_pwd" class="text" placeholder="현재 비밀번호" maxlength="20"/>
							</td>
						</tr>                
						<tr>
							<td>
								<input type="password" name="schEtc01" id="new_pwd" class="text" placeholder="새 비밀번호" maxlength="20"/>
							</td>
						</tr>              
						<tr>
							<td>
								<input type="password" id="new_pwd_chk" class="text" placeholder="새 비밀번호 확인" maxlength="20"/>
							</td>
						</tr>                
					</tbody>   
				</table>                    
			</form>      
			      
			<div class="pop_footer">                
		        <a href="javscript:void(0);" onclick="fncUpdatePwd(1);return false" class="btn btn_mdl btn_save" style="background-color: #308cde;border-color: #308cde;">변경</a>
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

$("#new_pwd_chk").keyup(function(){
	if(event.keyCode == 13){
		fncUpdatePwd();
		return false;
	}
});

</script>

</html>
