/*********************************************
* 파일명: lib.validate.js
* 기능: 유연한 자동 폼 검사기
* 만든이: 거친마루 <comfuture@maniacamp.com>
* 날짜: 2002-10-01
* == change log ==
* 2003-10-02 여러칸으로 나눠진 항목에 대한 검사기능 추가
* 2003-10-02 패스워드등 두개 항목에 대한 비교 기능 추가
**********************************************/

/// 에러메시지 포멧 정의 ///
var NO_BLANK = "필수 항목이 입력되지 않았습니다. 입력 후 저장하세요!";
//var NO_BLANK = "{id+을를} 입력해주세요";
var NOT_VALID = "{id+이가} 올바르지 않습니다";
// var TOO_LONG = "{id}의 길이가 초과되었습니다 (최대 {maxbyte}바이트)";

/// 스트링 객체에 메소드 추가 ///
String.prototype.trim = function(str) { 
	str = this != window ? this : str; 
	return str.replace(/^\s+/g,'').replace(/\s+$/g,''); 
}

String.prototype.hasFinalConsonant = function(str) {
	str = this != window ? this : str; 
	var strTemp = str.substr(str.length-1);
	return ((strTemp.charCodeAt(0)-16)%28!=0);
}

String.prototype.bytes = function(str) {
	var len = 0;
	str = this != window ? this : str;
	for(j=0; j<str.length; j++) {
		var chr = str.charAt(j);
		len += (chr.charCodeAt() > 128) ? 2 : 1;
	}
	return len;
}
/**
* 2012.01.04 추가
* 문자열 앞뒤 공백제거 함수
*/
function trim(str) {
	var retVal;
	if(str && str.replace) {
		retVal = str.replace(/^\s+/g,'').replace(/\s+$/g,'');
	} else {
		retVal = str;
	}
	return retVal;
}
function validateForm(form) {
	if(form == null) {
		alert('form이 존재하지 않습니다.');
		return;
	}
	if(form.elements && form.elements.length) {
		var el, checkFlag;
		for(var i=0; i < form.elements.length; i++) {
			el = form.elements[i];
			checkFlag = false;
			if(form[el.name] && form[el.name].length && form[el.name].length > 1 
					&& form[el.name][0].getAttribute("REQUIRED") != null) {
				for(var j=0 ; j < form[el.name].length ; j++) {
					if(!checkFlag) {
						 checkFlag = form[el.name][j].checked;
					}
				}
				if(!checkFlag) {
					alert('해당 필드는 필수 항목 입니다!');
					el.focus();
					return false;
				}
			} else {
				if (el.getAttribute("REQUIRED") != null) {
					if (el.value == null || el.value == "") {
						alert('해당 필드는 필수 항목 입니다!');
						el.focus();
						return false;
					}
				}					
			}
		}
	}
	return true;
}

function fillForm(form) {
	if(!form) {
		alert('Form이 존재하지 않습니다!!');
		return;
	}

	for (var i = 0; i < form.elements.length; i++ ) {
		var el = form.elements[i];
		var option = el.getAttribute("OPTION");
		var nvalue = el.getAttribute("DEFAULT");
		var tagName = el.tagName.toLowerCase();
		
		if(form[el.name] && form[el.name].length && form[el.name].length > 1 
				&& form[el.name][0].getAttribute("REQUIRED") != null) {
			var checkFlag = false;
			for(var j=0 ; j < form[el.name].length ; j++) {
				if(!checkFlag) {
					 checkFlag = form[el.name][j].checked;
				}
			}
			if(!checkFlag) {
				form[el.name][0].checked = true;
			}
		} else {
			if (el.getAttribute("REQUIRED") != null) {
				if (el.value == null || el.value == "") {
					if(tagName == 'select') {
						el.selectedIndex = 2;
					} else if(!option) {
						el.value = '';
					} else if(option.match(/date1/gi)) {
						el.value = '2012-01';
					} else if(option.match(/date2/gi)) {
						el.value = '2012-01-01';
					} else if(option.match(/number/gi)) {
						el.value = nvalue;
					}
					if(el.maxLength && (el.value.length > el.maxLength)) {
						el.value = el.value.substring(0, el.maxLength);
					}
				}
			}
		}
	}
}

function validate(form) {
	if(!form) {
		alert('Form이 존재하지 않습니다!!');
		return;
	}
	for (var i = 0; i < form.elements.length; i++ ) {
		var el = form.elements[i];
		//alert(form.elements[i].name); 
		if (el.tagid == "FIELDSET") continue;
		/*if (el.value) {
			el.value = el.value.trim();
		}*/

		var minbyte = el.getAttribute("MINBYTE");
		var maxbyte = el.getAttribute("MAXBYTE");
		var fixlen = el.getAttribute("FIXLEN");
		var option = el.getAttribute("OPTION");
		var match = el.getAttribute("MATCH");
		var glue = el.getAttribute('GLUE');
		
		if(form[el.name] && form[el.name].length && form[el.name].length > 1 
				&& form[el.name][0].getAttribute("REQUIRED") != null) {
			var checkFlag = false;
			for(var j=0 ; j < form[el.name].length ; j++) {
				if(!checkFlag) {
					 checkFlag = form[el.name][j].checked;
				}
			}
			if(!checkFlag) {
 				alert('해당 필드는 필수 항목 입니다!');
 				jqueryColor();
				$(el).css("background-color"," #CCFFFF");
				return false;
				//return doError(el,NO_BLANK);
			}
		} else {
			if (el.getAttribute("REQUIRED") != null) {
				if (el.value == null || el.value == "") { 
					alert('해당 필드는 필수 항목 입니다!');
					jqueryColor();
					$(el).css("background-color"," #CCFFFF");
					el.focus();
					return false;
					//return doError(el,NO_BLANK);
				}
			}

			if (minbyte != null) {
				if (el.value.bytes() < parseInt(minbyte)) {
					return doError(el,"{id+은는} 최소 "+minbyte+"바이트 이상 입력해야 합니다.");
				}
			}

			if (maxbyte != null && el.value != "") {
				var len = 0;
				if (el.value.bytes() > parseInt(maxbyte)) {
					return doError(el,"{id}의 길이가 초과되었습니다 (최대 "+maxbyte+"바이트)");
				}
			}

			if (fixlen != null) {
				if (el.value.length < parseInt(fixlen)) {
					return doError(el,"{id+은는} "+fixlen+"자리로 입력해야 합니다.");
				}
			}

			if (match && (el.value != form.elements[match].value)) return doError(el,"{id+이가} 일치하지 않습니다");

			if (option != null && el.value != "") {
				if (el.getAttribute('SPAN') != null) {
					var _value = new Array();
					for (span=0; span<el.getAttribute('SPAN');span++ ) {
						_value[span] = form.elements[i+span].value;
					}
					var value = _value.join(glue == null ? '' : glue);
					if (!funcs[option](el,value)) return false;
				} else {
					if (!funcs[option](el)) return false;
				}
			}
		}
	}
	return true;
}

function josa(str,tail) {
	var retText;
	if(str) {
		retText = (str.hasFinalConsonant()) ? tail.substring(0,1) : tail.substring(1,2); 
	} else {
		retText = '을';
	}
	return retText;
}

function doError(el,type,action) {
	var pattern = /{([a-zA-Z0-9_]+)\+?([가-힝]{2})?}/;
	
	if (el.name==undefined){
		return true;		
	} else{
		var id = (hid = el.getAttribute("Hid")) ? hid : el.getAttribute("id");
		if(!id) {
			id = '해당항목';
		}
		//alert(el.name);
		pattern.exec(type);
		var tail = (RegExp.$2) ? josa(eval(RegExp.$1),RegExp.$2) : "";
		alert(type.replace(pattern,eval(RegExp.$1) + tail));
		if (action == "sel") {
			el.select();
		} else if (action == "del")	{
			el.value = "";
		}
		$(el).css("background-color","CCFFFF");
		el.focus();	
		return false;
	}	
}	

/// 특수 패턴 검사 함수 매핑 ///
var funcs = new Array();
funcs['email'] = isValidEmail;
funcs['phone'] = isValidPhone;
funcs['userid'] = isValidUserid;
funcs['userpass'] = isValidpass;
funcs['hangul'] = hasHangul;
funcs['number'] = isNumeric;
funcs['number1'] = isNumeric1;
funcs['number2'] = isNumeric2;
//[+-, 정수3자리, 소수2자리]
funcs['number3'] = isNumeric3;
funcs['number4'] = isNumeric4;
funcs['engonly'] = alphaOnly;
funcs['jumin'] = isValidJumin;
funcs['bizno'] = isValidBizNo;
//[xxxx-xx]
funcs['date1'] = isValidDate1;
//[xxxx-xx-xx]
funcs['date2'] = isValidDate2;

/// 패턴 검사 함수들 ///
function isValidEmail(el,value) {
	var value = value ? value : el.value;
	var pattern = /^[_a-zA-Z0-9-\.]+@[\.a-zA-Z0-9-]+\.[a-zA-Z]+$/;
	return (pattern.test(value)) ? true : doError(el,NOT_VALID);
}

function isValidUserid(el) {
	//var pattern = /^[a-zA-Z0-9_]{4,10}$/;
	var pattern = /^[a-z0-9_]{6,16}$/;
	//return (pattern.test(el.value)) ? true : doError(el,"{id+은는} 8자이상 20자 미만이어야 하고,\n 영문,숫자, _ 문자만 사용할 수 있습니다");
	return (pattern.test(el.value)) ? true : doError(el,"{id+은는} 6~16자의 영문소문자, 숫자만 사용하실 수 있습니다");
}

function isValidpass(el) {
	var pattern = /^[a-zA-Z0-9_]{6,16}$/;
	return (pattern.test(el.value)) ? true : doError(el,"{id+은는}   6~16자의 영문,숫자만 사용할 수 있습니다");
}


function hasHangul(el) {
	var pattern = /[가-힝]/;
	return (pattern.test(el.value)) ? true : doError(el,"{id+은는} 반드시 한글을 포함해야 합니다");
}

function alphaOnly(el) {
	var pattern = /^[a-zA-Z]+$/;
	return (pattern.test(el.value)) ? true : doError(el,NOT_VALID);
}

function isNumeric(el) {
	var pattern = /^[0-9]*$/;
//	return (pattern.test(el.value)) ? true : doError(el,"{id+은는} 반드시 숫자로만 입력해야 합니다");
	return (pattern.test(el.value)) ? true : doError(el,"해당항목은 반드시 숫자로만 입력해야 합니다", "del");
}
function isNumeric1(el) {
	var pattern = /^[0-9,]+$/;
//	return (pattern.test(el.value)) ? true : doError(el,"{id+은는} 반드시 숫자와 -만 입력해야 합니다");
	return (pattern.test(el.value)) ? true : doError(el,"해당항목은 반드시 숫자와 , 만 입력해야 합니다", "del");
}


function isNumeric2(el) {
	var pattern = /^[0-9 -]+$/;
//	return (pattern.test(el.value)) ? true : doError(el,"{id+은는} 반드시 숫자와 -만 입력해야 합니다");
	return (pattern.test(el.value)) ? true : doError(el,"해당항목은 반드시 숫자와 -만 입력해야 합니다", "del");
}

function isNumeric3(el) {
	var pattern = /^[\-]?[\d]*[\.]?[\d]*$/;
	var retVal = pattern.test(el.value);
	if(retVal) {
		if(Math.abs(parseFloat(el.value)) >= 1000) {
			retVal = false;
		}
	}
//	return retVal ? true : doError(el,"{id+은는} 반드시 숫자, -, .만 입력해야 합니다");
	return retVal ? true : doError(el,"해당항목은 반드시 숫자, -, .만 입력해야 합니다 (예:[+-, 정수3자리, 소수2자리])", "del");
}

function isNumeric4(el) {
	var pattern = /^[\0-9-]?[\d]*[\.]?[\d]*$/;
	var retVal = pattern.test(el.value);
	if(retVal) {
		if(Math.abs(parseFloat(el.value)) >= 100000) {
			retVal = false;
		}
	}
//	return retVal ? true : doError(el,"{id+은는} 반드시 숫자, -, .만 입력해야 합니다");
	return retVal ? true : doError(el,"해당항목은 반드시 숫자, -, .만 입력해야 합니다 (예:[+-, 정수5자리, 소수2자리])", "del");
}

function isValidJumin(el,value) {
    var pattern = /^([0-9]{6})-?([0-9]{7})$/; 
	var num = value ? value : el.value;
    if (!pattern.test(num)) return doError(el,NOT_VALID); 
    num = RegExp.$1 + RegExp.$2;

	var sum = 0;
	var last = num.charCodeAt(12) - 0x30;
	var bases = "234567892345";
	for (var i=0; i<12; i++) {
		if (isNaN(num.substring(i,i+1))) return doError(el,NOT_VALID);
		sum += (num.charCodeAt(i) - 0x30) * (bases.charCodeAt(i) - 0x30);
	}
	var mod = sum % 11;
	return ((11 - mod) % 10 == last) ? true : doError(el,NOT_VALID);
}

function isValidBizNo(el, value) { 
    var pattern = /([0-9]{3})-?([0-9]{2})-?([0-9]{5})/; 
	var num = value ? value : el.value;
    if (!pattern.test(num)) return doError(el,NOT_VALID); 
    num = RegExp.$1 + RegExp.$2 + RegExp.$3;
    var cVal = 0; 
    for (var i=0; i<8; i++) { 
        var cKeyNum = parseInt(((_tmp = i % 3) == 0) ? 1 : ( _tmp  == 1 ) ? 3 : 7); 
        cVal += (parseFloat(num.substring(i,i+1)) * cKeyNum) % 10; 
    } 
    var li_temp = parseFloat(num.substring(i,i+1)) * 5 + '0'; 
    cVal += parseFloat(li_temp.substring(0,1)) + parseFloat(li_temp.substring(1,2)); 
    return (parseInt(num.substring(9,10)) == 10-(cVal % 10)%10) ? true : doError(el,NOT_VALID); 
}

function isValidPhone(el,value) {
	var pattern = /^([0]{1}[0-9]{1,2})-?([1-9]{1}[0-9]{2,3})-?([0-9]{4})$/;
	var num = value ? value : el.value;

	if (pattern.exec(num)) {
		if(RegExp.$1 == "010" || RegExp.$1 == "011" || RegExp.$1 == "016" || RegExp.$1 == "017" || RegExp.$1 == "018" || RegExp.$1 == "019") {
			if (!el.getAttribute('SPAN')) el.value = RegExp.$1 + "-" + RegExp.$2 + "-" + RegExp.$3;
		} 
		return true;
	} else {
		return doError(el,NOT_VALID);
	}
}

function isValidDate1(el) {
	var pattern = /^[\d]{4}-[\d]{2}$/;
	return (pattern.test(el.value)) ? true : doError(el,"해당 항목은 반드시 날짜형태(년-월)로 입력해야 합니다");
}

function isValidDate2(el) {
	var pattern = /^[\d]{4}-[\d]{2}-[\d]{2}$/;
	return (pattern.test(el.value)) ? true : doError(el,"해당 항목은 반드시 날짜형태(년-월-일)로 입력해야 합니다");
}