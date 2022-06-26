
var mainLatest = function(){
   	$.getJSON("/board/boardMain.json?boardCd=BRD_000187&pageUnit=5", function (result) {
   		if(typeof(result.boardList) == "object"){
    		$.each(result.boardList, function (intIndex, strValue) {
				var thisData = result.boardList[intIndex];
    			var boardTitle = thisData.boardTitle;
    			if(boardTitle.length > 20) boardTitle = boardTitle.substring(0, 20)+"...";
				if(intIndex == 0){
					var strHtml = "<a href=\"/board/"+thisData.boardCd+"/boardView.do?boardSeq="+thisData.boardSeq+"\" class=\"photo\">";
					
					if(typeof(thisData.imgAtchFileId) == "string" && thisData.imgAtchFileId != "") strHtml += "<img src=\"/atch/getImage.do?atchFileId="+thisData.imgAtchFileId+"\" alt=\""+thisData.boardTitle+"\">";
					else strHtml += "<img src=\"/publish/img/main/bbsLatest_press_default.jpg\" alt=\""+thisData.boardTitle+"\">";
					
					strHtml += "<span class=\"tit\">"+boardTitle+"</span><span class=\"shortcut\">바로가기</span></a>";
					$("#press_data").append(strHtml);
				}
    		});

			$("#press_data").append(" <h2><img src=\"/publish/img/main/tit_press_data.gif\" alt=\"보도자료\"></h2>");
			var ul = $("<ul/>");
    		$.each(result.boardList, function (intIndex, strValue) {
				var thisData = result.boardList[intIndex];
    			var boardTitle = thisData.boardTitle;
    			if(boardTitle.length > 20) boardTitle = boardTitle.substring(0, 20)+"...";
				if(intIndex > 0){
					var strHtml = " <li><a href=\"/board/"+thisData.boardCd+"/boardView.do?boardSeq="+thisData.boardSeq+"\">"+boardTitle+"";
					if(thisData.newYn != ""){
						strHtml += "&nbsp;<img src=\"/publish/img/main/ico/ico_new.gif\" alt=\"새글\">";
					}
					strHtml += "</a></li>";
					ul.append(strHtml);
				}
    		});$("#press_data").append(ul);
   		}
   	});

   	$.getJSON("/board/boardMain.json?boardCd=BRD_000183&pageUnit=5", function (result) {
   		if(typeof(result.boardList) == "object"){
    		$.each(result.boardList, function (intIndex, strValue) {
				var thisData = result.boardList[intIndex];
    			var boardTitle = thisData.boardTitle;
    			if(boardTitle.length > 20) boardTitle = boardTitle.substring(0, 20)+"...";
				if(intIndex == 0){
					var strHtml = "<a href=\"/board/"+thisData.boardCd+"/boardView.do?boardSeq="+thisData.boardSeq+"\" class=\"photo\">";
					
					if(typeof(thisData.imgAtchFileId) == "string" && thisData.imgAtchFileId != "") strHtml += "<img src=\"/atch/getImage.do?atchFileId="+thisData.imgAtchFileId+"\" alt=\""+thisData.boardTitle+"\">";
					else strHtml += "<img src=\"/publish/img/main/bbsLatest_notice_default.jpg\" alt=\""+thisData.boardTitle+"\">";
					
					strHtml += "<span class=\"tit\">"+boardTitle+"</span><span class=\"shortcut\">바로가기</span></a>";
					$("#notice").append(strHtml);
				}
    		});

			$("#notice").append(" <h2><img src=\"/publish/img/main/tit_notice.gif\" alt=\"공지사항\"></h2>");
			var ul = $("<ul/>");
    		$.each(result.boardList, function (intIndex, strValue) {
				var thisData = result.boardList[intIndex];
    			var boardTitle = thisData.boardTitle;
    			if(boardTitle.length > 20) boardTitle = boardTitle.substring(0, 20)+"...";
				if(intIndex > 0){
					var strHtml = " <li><a href=\"/board/"+thisData.boardCd+"/boardView.do?boardSeq="+thisData.boardSeq+"\">"+boardTitle+"";
					if(thisData.newYn != ""){
						strHtml += "&nbsp;<img src=\"/publish/img/main/ico/ico_new.gif\" alt=\"새글\">";
					}
					strHtml += "</a></li>";
					ul.append(strHtml);
				}
    		});$("#notice").append(ul);
   		}
   	});
   	$.getJSON("/board/boardMain.json?boardCd=BRD_000184&pageUnit=5", function (result) {
   		if(typeof(result.boardList) == "object"){
    		$.each(result.boardList, function (intIndex, strValue) {
				var thisData = result.boardList[intIndex];
    			var boardTitle = thisData.boardTitle;
    			if(boardTitle.length > 20) boardTitle = boardTitle.substring(0, 20)+"...";
				if(intIndex == 0){
					var strHtml = "<a href=\"/board/"+thisData.boardCd+"/boardView.do?boardSeq="+thisData.boardSeq+"\" class=\"photo\">";
					
					if(typeof(thisData.imgAtchFileId) == "string" && thisData.imgAtchFileId != "") strHtml += "<img src=\"/atch/getImage.do?atchFileId="+thisData.imgAtchFileId+"\" alt=\""+thisData.boardTitle+"\">";
					else strHtml += "<img src=\"/publish/img/main/bbsLatest_news_default.jpg\" alt=\""+thisData.boardTitle+"\">";
					
					strHtml += "<span class=\"tit\">"+boardTitle+"</span><span class=\"shortcut\">바로가기</span></a>";
					$("#latest_new").append(strHtml);
				}
    		});

			$("#latest_new").append(" <h2><img src=\"/publish/img/main/tit_latest_news.gif\" alt=\"최근소식\"></h2>");
			var ul = $("<ul/>");
    		$.each(result.boardList, function (intIndex, strValue) {
				var thisData = result.boardList[intIndex];
    			var boardTitle = thisData.boardTitle;
    			if(boardTitle.length > 20) boardTitle = boardTitle.substring(0, 20)+"...";
				if(intIndex > 0){
					var strHtml = " <li><a href=\"/board/"+thisData.boardCd+"/boardView.do?boardSeq="+thisData.boardSeq+"\">"+boardTitle+"";
					if(thisData.newYn != ""){
						strHtml += "&nbsp;<img src=\"/publish/img/main/ico/ico_new.gif\" alt=\"새글\">";
					}
					strHtml += "</a></li>";
					ul.append(strHtml);
				}
    		});$("#latest_new").append(ul);
   		}
   	});
};
