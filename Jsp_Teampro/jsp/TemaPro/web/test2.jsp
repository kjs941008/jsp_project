<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function check(){
var str = document.getElementById('personName');
if( str.value == '' || str.value == null ){
    alert( '값을 입력해주세요' );
    return false;
}
var blank_pattern = /^\s+|\s+$/g;
if( str.value.replace( blank_pattern, '' ) == "" ){
    alert(' 공백만 입력되었습니다 ');
    return false;
}
//공백 금지
//var blank_pattern = /^\s+|\s+$/g;(/\s/g
var blank_pattern = /[\s]/g;
if( blank_pattern.test( str.value) == true){
    alert(' 공백은 사용할 수 없습니다. ');
    return false;
}

var special_pattern = /[`~!@#$%^&*|\\\'\";:\/?]/gi;
if( special_pattern.test(str.value) == true ){
    alert('특수문자는 사용할 수 없습니다.');
    return false;
}
alert( '최종 : ' + str.value );
</script>
</head>
<body>
<input type="text" ev:onkeyup="scwin.input1_onkeyup" name="personName" id="personName"/>
<input type="button" value="특수문자 체크" onClick="check()"/>
</body>
</html>