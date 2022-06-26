var wrestMsg = "";
var wrestFld = null;
var wrestFldDefaultColor = "";
//var wrestFldBackColor = "#ff3061";
var req_chk = 0;

// subject 속성값을 얻어 return, 없으면 tag의 name을 넘김
function wrestItemname(fld)
{
    //return fld.getAttribute("title") ? fld.getAttribute("title") : ( fld.getAttribute("alt") ? fld.getAttribute("alt") : fld.name );
    var id = fld.getAttribute("id");
    var labels = document.getElementsByTagName("label");
    var el = null;

    for(i=0; i<labels.length; i++) {
        if(id == labels[i].htmlFor) {
            el = labels[i];
            break;
        }
    }

    if(el != null) {
        var text =  el.innerHTML.replace(/[<].*[>].*[<]\/+.*[>]/gi, "");

        if(text == '') {
            return fld.getAttribute("title") ? fld.getAttribute("title") : ( fld.getAttribute("placeholder") ? fld.getAttribute("placeholder") : fld.name );
        } else {
            return text;
        }
    } else {
        return fld.getAttribute("title") ? fld.getAttribute("title") : ( fld.getAttribute("placeholder") ? fld.getAttribute("placeholder") : fld.name );
    }
}

// 양쪽 공백 없애기
function wrestTrim(fld)
{
    var pattern = /(^\s+)|(\s+$)/g; // \s 공백 문자
    return fld.value.replace(pattern, "");
}

// 필수 입력 검사
function wrestRequired(fld)
{	
	console.log(fld.name+"//"+fld.type+"///"+wrestTrim(fld));
	if(fld.type == "radio" || fld.type == "checkbox"){
			console.log($("[NAME="+fld.name+"]:CHECKED").length)
		if($("[NAME="+fld.name+"]:CHECKED").length < 1){
			wrestMsg = "필수 선택입니다.";
			req_chk += 1;
			if (fld.style.display != "none") {
				
				var id = fld.getAttribute("id");
				console.log(id);
				// 오류메세지를 위한 element 추가
				var msgHtml = '<strong id="msg_'+id+'" data-name="'+fld.name+'" class="msg_only"><font color="red">&nbsp;'+wrestMsg+'</font></strong>	';
				
				$("[data-name="+fld.name+"]").remove();
				$("#"+id).parent().append(msgHtml);
			}
		}
	}else{
		if (wrestTrim(fld) == "") {
			// 셀렉트박스일 경우에도 필수 선택 검사합니다.
			wrestMsg = "필수 "+(fld.type=="select-one"?"선택":"입력")+"입니다.";
			req_chk += 1;
			if (fld.style.display != "none") {
				
				var id = fld.getAttribute("id");
				// 오류메세지를 위한 element 추가
				var msgHtml = '<strong id="msg_'+id+'" class="msg_only"><font color="red">&nbsp;'+wrestMsg+'</font></strong>	';
				
				$("#msg_"+id).remove();
				$("#"+id).parent().append(msgHtml);
				/* if (typeof(fld.select) != "undefined")
            	fld.select();
	            fld.focus();
	        }*/
			}
		}
	}
}

// 김선용 2006.3 - 전화번호(휴대폰) 형식 검사 : 123-123(4)-5678
function wrestTelNum(fld)
{
    if (!wrestTrim(fld)) return;

    var pattern = /^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}$/;
    if(!pattern.test(fld.value)){
        if(wrestFld == null){
            wrestMsg = wrestItemname(fld)+" : 전화번호 형식이 올바르지 않습니다.\n\n하이픈(-)을 포함하여 입력하세요.\n";
            wrestFld = fld;
            fld.select();
        }
    }
}

// 이메일주소 형식 검사
function wrestEmail(fld)
{
    if (!wrestTrim(fld)) return;

    //var pattern = /(\S+)@(\S+)\.(\S+)/; 이메일주소에 한글 사용시
    var pattern = /([0-9a-zA-Z_-]+)@([0-9a-zA-Z_-]+)\.([0-9a-zA-Z_-]+)/;
    if (!pattern.test(fld.value)) {
        if (wrestFld == null) {
            wrestMsg = wrestItemname(fld) + " : 이메일주소 형식이 아닙니다.\n";
            wrestFld = fld;
        }
    }
}

// 한글인지 검사 (자음, 모음 조합된 한글만 가능)
function wrestHangul(fld)
{
    if (!wrestTrim(fld)) return;

    //var pattern = /([^가-힣\x20])/i;
    var pattern = /([^가-힣\x20])/;

    if (pattern.test(fld.value)) {
        if (wrestFld == null) {
            wrestMsg = wrestItemname(fld) + ' : 한글이 아닙니다. (자음, 모음 조합된 한글만 가능)\n';
            wrestFld = fld;
        }
    }
}

// 한글인지 검사2 (자음, 모음만 있는 한글도 가능)
function wrestHangul2(fld)
{
    if (!wrestTrim(fld)) return;

    var pattern = /([^가-힣ㄱ-ㅎㅏ-ㅣ\x20])/i;
    //var pattern = /([^가-힣ㄱ-ㅎㅏ-ㅣ\x20])/;

    if (pattern.test(fld.value)) {
        if (wrestFld == null) {
            wrestMsg = wrestItemname(fld) + ' : 한글이 아닙니다.\n';
            wrestFld = fld;
        }
    }
}

// 한글,영문,숫자인지 검사3
function wrestHangulAlNum(fld)
{
    if (!wrestTrim(fld)) return;

    var pattern = /([^가-힣\x20^a-z^A-Z^0-9])/i;

    if (pattern.test(fld.value)) {
        if (wrestFld == null) {
            wrestMsg = wrestItemname(fld) + ' : 한글, 영문, 숫자가 아닙니다.\n';
            wrestFld = fld;
        }
    }
}

// 한글,영문 인지 검사
function wrestHangulAlpha(fld)
{
    if (!wrestTrim(fld)) return;

    var pattern = /([^가-힣\x20^a-z^A-Z])/i;

    if (pattern.test(fld.value)) {
        if (wrestFld == null) {
            wrestMsg = wrestItemname(fld) + ' : 한글, 영문이 아닙니다.\n';
            wrestFld = fld;
        }
    }
}

// 숫자인지검사
// 배부른꿀꿀이님 추가 (http://dasir.com) 2003-06-24
function wrestNumeric(fld)
{
    if (fld.value.length > 0) {
        for (i = 0; i < fld.value.length; i++) {
            if (fld.value.charAt(i) < '0' || fld.value.charAt(i) > '9') {
                wrestMsg = wrestItemname(fld) + " : 숫자가 아닙니다.\n";
                wrestFld = fld;
            }
        }
    }
}

// 영문자 검사
function wrestAlpha(fld)
{
    if (!wrestTrim(fld)) return;

    var pattern = /(^[a-zA-Z]+$)/;

    if (!pattern.test(fld.value)) {
        if (wrestFld == null) {
            wrestMsg = wrestItemname(fld) + " : 영문이 아닙니다.\n";
            wrestFld = fld;
        }
    }
}

// 영문자와 숫자 검사
function wrestAlNum(fld)
{
   if (!wrestTrim(fld)) return;

   var pattern = /(^[a-zA-Z0-9]+$)/;

   if (!pattern.test(fld.value)) {
       if (wrestFld == null) {
           wrestMsg = wrestItemname(fld) + " : 영문 또는 숫자가 아닙니다.\n";
           wrestFld = fld;
       }
   }
}

// 영문자와 숫자 그리고 _ 검사
function wrestAlNum_(fld)
{
   if (!wrestTrim(fld)) return;

   var pattern = /(^[a-zA-Z0-9\_]+$)/;

   if (!pattern.test(fld.value)) {
       if (wrestFld == null) {
           wrestMsg = wrestItemname(fld) + " : 영문, 숫자, _ 가 아닙니다.\n";
           wrestFld = fld;
       }
   }
}

// 최소 길이 검사
function wrestMinLength(fld)
{
    if (!wrestTrim(fld)) return;

    var minlength = fld.getAttribute("minlength");

    if (wrestFld == null) {
        if (fld.value.length < parseInt(minlength)) {
            wrestMsg = wrestItemname(fld) + " : 최소 "+minlength+"글자 이상 입력하세요.\n";
            wrestFld = fld;
        }
    }
}

// 이미지 확장자
function wrestImgExt(fld)
{
    if (!wrestTrim(fld)) return;

    var pattern = /\.(gif|jpg|png)$/i; // jpeg 는 제외
    if(!pattern.test(fld.value)){
        if(wrestFld == null){
            wrestMsg = wrestItemname(fld)+" : 이미지 파일이 아닙니다.\n.gif .jpg .png 파일만 가능합니다.\n";
            wrestFld = fld;
            fld.select();
        }
    }
}

// 확장자
function wrestExtension(fld, css)
{
    if (!wrestTrim(fld)) return;

    var str = css.split("="); // ext=?? <-- str[1]
    var src = fld.value.split(".");
    var ext = src[src.length - 1];

    if (wrestFld == null) {
        if (ext.toLowerCase() < str[1].toLowerCase()) {
            wrestMsg = wrestItemname(fld) + " : ."+str[1]+" 파일만 가능합니다.\n";
            wrestFld = fld;
        }
    }
}

// 공백 검사후 공백을 "" 로 변환
function wrestNospace(fld)
{
    var pattern = /(\s)/g; // \s 공백 문자

    if (pattern.test(fld.value)) {
        if (wrestFld == null) {
            wrestMsg = wrestItemname(fld) + " : 공백이 없어야 합니다.\n";
            wrestFld = fld;
        }
    }
}

// submit 할 때 속성을 검사한다.
function wrestSubmit(form)
{
    wrestMsg = "";
    wrestFld = null;
    req_chk = 0;
    var attr = null;
    // 해당폼에 대한 요소의 개수만큼 돌려라
    $(".msg_only").remove();
    for (var i=0; i<form.elements.length; i++) {
        var el = form.elements[i];
        // Input tag 의 type 이 text, file, password 일때만
        // 셀렉트 박스일때도 필수 선택 검사합니다. select-one
        console.log(el.type);
        if (el.type=="text" || el.type=="hidden" || el.type=="file" || el.type=="password" || el.type=="select-one" || el.type=="textarea" || el.type=="radio" ||  el.type=="checkbox") {
        	if (el.getAttribute("required") != null) {
                wrestRequired(el);
            }

        	/*if (el.getAttribute("minlength") != null) {
                wrestMinLength(el);
            }*/
            
            // 필드가 null 이 아니라면 오류메세지 출력후 포커스를 해당 오류 필드로 옮김
            // 오류 필드는 배경색상을 바꾼다.

            /*var array_css = el.className.split(" "); // class 를 공백으로 나눔

            el.style.backgroundColor = wrestFldDefaultColor;

            // 배열의 길이만큼 돌려라
            for (var k=0; k<array_css.length; k++) {
                var css = array_css[k];
                switch (css) {
                    case "required"     : wrestRequired(el); break;
                    case "trim"         : wrestTrim(el); break;
                    case "email"        : wrestEmail(el); break;
                    case "hangul"       : wrestHangul(el); break;
                    case "hangul2"      : wrestHangul2(el); break;
                    case "hangulalpha"  : wrestHangulAlpha(el); break;
                    case "hangulalnum"  : wrestHangulAlNum(el); break;
                    case "nospace"      : wrestNospace(el); break;
                    case "numeric"      : wrestNumeric(el); break;
                    case "alpha"        : wrestAlpha(el); break;
                    case "alnum"        : wrestAlNum(el); break;
                    case "alnum_"       : wrestAlNum_(el); break;
                    case "telnum"       : wrestTelNum(el); break; // 김선용 2006.3 - 전화번호 형식 검사
                    case "imgext"       : wrestImgExt(el); break;
                    default :
                        if (/^extension\=/.test(css)) {
                            wrestExtension(el, css); break;
                        }
                } // switch (css)
            } // for (k)
*/        } // if (el)
    } // for (i)
    console.log(req_chk);
    if(req_chk > 0 ){
    	return false;
    }

    if (form.oldsubmit && form.oldsubmit() == false)
        return false;

    return true;
}