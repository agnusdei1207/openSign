<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>   

   
<div class="pop_header">  
	<h2>일일 상세보기</h2>   
	<a href="javascript:void(0);" onclick="view_hide(1);" class="pop_close"></a>
</div>       
     
<figure class="highcharts-figure">
  <div id="chart04"></div>     
	  <p class="highcharts-description">  
	  </p>
</figure>            
    
<div class="pop_footer" style="margin-left: 685px; margin-bottom: 5px;">          
		<a href="javascript:void(0);" class="btn btn_mdl btn_save" onclick="view_hide(1);" style="background-color: #308cde;border-color: #308cde;">닫기</a>		
</div>  
                       
<script type="text/javascript">       
   
var arrData4 = new Array();
 
/* 정확한 소수점 반올림 */
function fncMathRound(num, scale) {     
	if(!scale){scale = "0";}
    return +(Math.round(num+"e+"+scale)+"e-"+scale);
}           
                         
$(function(){                  
	<c:forEach var="info" items="${resultInfo}" varStatus="status">  
		var names = "${info.split('_')[0]}";                  
		var info = "${info.split('_')[1]}"; 
		arrData4.push({"name" : names, "y" : Number(info), "sliced": true, "selected" : true });
	</c:forEach>            
	  
	if(arrData4.length > 0){
		clickDivn = true;
	}
}); 
  
Highcharts.chart('chart04', {  
	  chart: {
	    plotBackgroundColor: null,
	    plotBorderWidth: null,
	    plotShadow: false,      
	    type: 'pie'  
	  }, 
	  title: {           
	    text: ''     
	  },  
	  navigation: {
	      buttonOptions: {
        	  y: -1000 //차트 다운버튼 화면에서 숨김  
	      }  
	  },  
	  credits: {  
	      enabled: false //하단 하이차트 주소 숨김
	  },
	  tooltip: {
	    pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
	  },
	  accessibility: {   
	    point: {
	      valueSuffix: '%'
	    }
	  },
	  plotOptions: {
	    pie: {
	      allowPointSelect: true,
	      cursor: 'pointer',
	      dataLabels: {
	        enabled: true,
	        format: '<b>{point.name}</b>: {point.percentage:.1f} %'
	      }
	    }
	  },                                
	  series: [{                
	    name: '비율',    
	    colorByPoint: true,
	    data:  arrData4 
	  }]
	  
	});


</script>