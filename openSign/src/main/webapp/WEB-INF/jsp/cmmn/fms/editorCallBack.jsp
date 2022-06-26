<%@ page language="java" isELIgnored="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%
  /**
  * @Description : 게시판 업로드 화면
  *   수정일         수정자                   수정내용
  *  -------    --------    ---------------------------
  *  2014.4.2 박현우           최초 생성
  *  2014.4.2 박현우           검색 조건 수정
  *  
  * @author AdcapsuleSoft
  */
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>사진 첨부하기 | 수출지원포털</title>
</head>
<body>
    <script type="text/javascript">
  	//<![CDATA[
        var sUrl = document.location.search.substr(1);

        <c:choose>
        	<c:when test="${fileVO.editorErrstr eq 'error'}">
        		sUrl = "callback_func=<c:out value='${fileVO.callBackFunc}'/>&errstr=error";
        	</c:when>	
        	<c:otherwise>
        		sUrl = "callback_func=<c:out value='${fileVO.callBackFunc}'/>&bNewLine=<c:out value='${fileVO.editorNewLine}'/>"
        			+"&imageWidth=<c:out value='${fileVO.imageWidth}'/>"
        			+"&imageHeight=<c:out value='${fileVO.imageHeight}'/>"
        			+"&sFileName=<c:out value='${fileVO.editorFileName}'/>&altText=<c:out value='${fileVO.altText}'/>&sFileURL=<c:out value='${fileVO.editorFileURL}'/>";
        	</c:otherwise>
        </c:choose>
		if (sUrl != "blank") {
	        var oParameter = {}; // query array

	        sUrl.replace(/([^=]+)=([^&]*)(&|$)/g, function(){
	            oParameter[arguments[1]] = arguments[2];
	            return "";
	        });
	        
	        if ((oParameter.errstr || '').length) { // on error
	            (parent.jindo.FileUploader._oCallback[oParameter.callback_func+'_error'])(oParameter);
	        } else {
		        (parent.jindo.FileUploader._oCallback[oParameter.callback_func+'_success'])(oParameter);
		   }
		}
		//]]>
    </script>
</body>
</html>