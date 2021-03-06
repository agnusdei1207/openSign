<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<jsp:directive.include file="/WEB-INF/jsp/cmmn/incTagLib.jsp"/>   

                              
        <div class="state01 m_box" style="min-height: 340px;">                 
        	<div class="main_chart" style="margin-top: 29px; width:100%;">    
        		<h2 class="m_title">식대</h2>           
				<div class="chart_box">                                                                   
					<div id="chart01" style="max-width:1400px; height:230px;"></div>
				</div>            
			</div>        
        </div>                                                                    
        <div class="state01 m_box" style="height: 466px;; margin-bottom:-6%;; width:634px;top:-125px;">          
        	<div class="main_chart">                                                                 
        		<h2 class="m_title2" style="margin-left: -2px;">[${empty selectedUserVO.name ? loginVO.name : selectedUserVO.name }] 님 초과 근무 <a href="javascript:void(0);" class="btn btn_mdl btn_add" onclick="fncOpenModal('modalList.do');" style="position:relative;float:right;bottom:5px;right:4px;background-color: #308cde;border-color: #308cde;">검　색</a> </h2>       
				<figure class="highcharts-figure">           
					<div id="chart03"></div>                   
						<p class="highcharts-description"></p>                     
				</figure>               
			</div>                          
        </div>                           
        <div class="state01 m_box" style="min-height: 340px; margin-top:10px">   
        	<div class="main_chart" style="margin-top: 29px; width:100%;">            
        		<h2 class="m_title">초과 근무</h2>             
				<div class="chart_box">             
					<div id="chart02" style="max-width:1400px; height:230px;"></div>
				</div>  
			</div>       
        </div>                                          
		        
<script type="text/javascript">    

<%-- 모달 열기 --%>                               
function fncOpenModal(url, categoryInfo){     
	
	/* 상세보기 클릭 시 날짜 값 준비*/                   
	if(url == "eatPoint.do" || url == "overTimePoint.do"){       
		$("#schEtc05").val(categoryInfo);
	}  
	/* menuCd 예외 처리 */   
	url = "/mgr/statistics/" + url;       
	        
	fncLoadingStart();                
	$.ajax({                                
	    method: "POST",        
	    url: url,	                                                    
	    data : $("#defaultFrm").serialize(),       
	    dataType: "HTML",                 
	    success: function(data) {         
	    	$("#display_view1").html(data);        
	    	try{  
		    	/* 값이 있을 때만 */                   
	    		if(url.indexOf("modalList") != -1 || data.match(/names/).length == 1){
		    		view_show(1, '30%', '12%');              
	    		}       
	    	} catch(err){
	    		/* 값이 없는 경우 */
	    	}    
	    },complete : function(){  
	    	fncLoadingEnd();  
		}     
	});	 
}          
     
<%-- 식대 차트  --%>         
var arrData = [];      
var arrCategory = [];             
       
<c:forEach var="mgr0117VO" items="${arrMgr0117VO}" varStatus="status">
	/* 리스트 -> 배열 */   
	arrData.push(Number("<c:out value="${mgr0117VO.price}"/>")); 
	/* 배열 초과 */   
	arrCategory.push("<c:out value="${month}"/>/<fmt:formatNumber value='${status.count}' minIntegerDigits='2' type='number'/>");
</c:forEach>   
    
   
Highcharts.chart('chart01', {
    chart: {    
        type: 'line'  
    },                               
    title: false,
    navigation: {
       buttonOptions: {    
         y: -1000 //차트 다운버튼 화면에서 숨김  
       }
    },
    
    credits: {
       enabled: false //하단 하이차트 주소 숨김
    },
    yAxis: {
        title: false,
        labels : {   
            format: '{value:,.0f}'
        }
    },    
    xAxis: {   
     categories: arrCategory
    }, 
    plotOptions: {
        line: {
          dataLabels: {
            enabled: true  
          }      
        },        
	    series: {    
	        cursor: 'pointer',      
	        /* 클릭 이벤트 */
	        point: {        
	            events: {             
	                click: function () {             
	                	fncOpenModal("eatPoint.do", this.category + "_" + this.y); 
	                }
	            }
	        }
	    }
    },             
    tooltip: {                     
    
        headerFormat: '<span style="font-size:10px">{point.key}</span>', 
        pointFormat: '<table><tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                   '<td style="padding:0"><b>{point.y:,.0f}원</b></td></tr>',
        footerFormat: '</table>',
        shared: true,
        useHTML: true,  
    },         
    series: [{     
        name: '금액 합', 
        data: arrData, 
        color:'#6ba8ed',     
    }],
   	  
});
 
Highcharts.setOptions({
    lang : { 
       thousandsSep:','
    }
});     

<%-- 초과 근무 차트 --%>               
var arrData2 = [];         
var arrCategory2 = [];                  
                  
<c:forEach var="mgr0118VO" items="${arrMgr0118VO}" varStatus="status">   
	/* 리스트 -> 배열 */             
	arrData2.push(Number("<c:out value="${mgr0118VO.col1}"/>"));  
	/* 배열 초과 */       
	arrCategory2.push("<c:out value="${month}"/>/<fmt:formatNumber value='${status.count}' minIntegerDigits='2' type='number'/>");
</c:forEach>       
      
Highcharts.chart('chart02', {
    chart: {
        type: 'line' 
    },    
    title: false,
    navigation: {   
       buttonOptions: { 
         y: -1000 //차트 다운버튼 화면에서 숨김  
       }
    },
    credits: {
       enabled: false //하단 하이차트 주소 숨김 
    },
    yAxis: {
        title: false,
        labels : {   
            format: '{value:,.0f}'
        }
    },   
    xAxis: {     
     categories: arrCategory2
    },    
    plotOptions: {  
        line: {
          dataLabels: {
            enabled: true    
          }           
        }                
    },            
    tooltip: {      
        headerFormat: '<span style="font-size:10px">{point.key}</span>',
        pointFormat: '<table><tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                   '<td style="padding:0"><b>{point.y:,.0f}시간</b></td></tr>',
        footerFormat: '</table>',     
        shared: true,            
        useHTML: true         
    },         
    series: {   
        cursor: 'pointer',     
        /* 클릭 이벤트 */
        point: {           
            events: {               
                click: function () {      
                    fncOpenModal("overTime.do", this.category + "_" + this.y); 
                }
            }
        }      
    },   
    plotOptions: {
        line: {
          dataLabels: {
            enabled: true  
          }      
        },       
	    series: {   
	        cursor: 'pointer',     
	        point: {      
	            events: {             
	                click: function () {        
	                    fncOpenModal("overTimePoint.do", this.category + "_" + this.y); 
	                }      
	            }
	        }
	    }
    }, 
    series: [{                      
        name: '초과근무 합',    
        data: arrData2,
        color:'#db44e5',
        
    }]  
});

Highcharts.setOptions({
    lang : { 
       thousandsSep:','         
    }   
});     
             
               
<%-- 개인 근무 시간 --%> 
     
var arrData3 = [];               
var arrCategory3 = [];                  
                          
<c:forEach var="privateWorkTime" items="${arrPrivateWorkTime}" varStatus="status">   
	/* 리스트 -> 배열 */                 
	arrData3.push(Number("<c:out value="${privateWorkTime.col1}"/>")); 
	/* 배열 초과 */         
	arrCategory3.push("<c:out value="${month}"/>/<fmt:formatNumber value='${status.count}' minIntegerDigits='2' type='number'/>");
</c:forEach>   

var chart = Highcharts.chart('chart03', {
	chart: {   
		
    },      
    title: false,     
    navigation: {       
       buttonOptions: {          
         y: -1000 //드롭다운 버튼 화면에서 숨김   
       }
    },          
    xAxis: {           
        categories: arrCategory3
    },      
    yAxis: {                  
    	title:{  
    		text: '근무 시간'
    	},   
    },          
    credits: { 
        enabled: false //하단 하이차트 주소 숨김 
     },       
     tooltip: {      
         headerFormat: '<span style="font-size:10px">{point.key}</span>',
         pointFormat: '<table><tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                    '<td style="padding:0"><b>{point.y:,.0f}시간</b></td></tr>',
         footerFormat: '</table>',     
         shared: true, 
         useHTML: true         
     },            
    series: [{                  
    	name: '초과근무 시간', 
        type: 'column', 
        colorByPoint: true,
        data: arrData3,       
        showInLegend: false 
    }] 
});   
   







</script>