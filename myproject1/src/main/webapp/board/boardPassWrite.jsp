<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입력화면</title>
</head>

<style>
body {
	font-size:12px;
	font-family:돋음;
	color:000000;
}
table {
	width:600px;
	border:1px solid #cccccc;
	border-collapse:collapse; /*셀과 셀사이의 간격을 0*/
}
th,td {
	border:1px solid #cccccc;
	padding : 5px;
}
.button_area {
	width:600px;
	text-align:center;
	margin-top:10px;
}
.caption1 {
	font-size:24px;
	font-weigth:bold;
	color:skyblue;
	padding:5px;
}
input,textarea,button {
	font-size:12px;
}
.input1 {
	width:98%;
}
.textarea1 {
	width:98%;
	height:50px;
}
.button1 {
	padding:10px;
	background-color:#99ff00;
	border:1px solid green;
}
</style>

<script>
function fn_save() {
	if( document.frm.pass.value == "" ) {
		alert("암호를 입력해주세요.");
		document.frm.pass.focus();
		return false;
	}
	document.frm.submit();
}

function fn_action() {
	location = "/myproject1/boardList.do";
}


</script>

<body>

<form name="frm" method="post" action="/myproject1/boardDelete.do">

<input type="hidden" name="unq" value="${unq }" />

<div>
<table>
	<caption class="caption1">게시판 암호입력</caption>
	<tr>
		<th>암호</th>
		<td><input type="password" name="pass" class="input1"
		           placeholder="암호를 입력해주세요."></td>
	</tr>
</table>
</div>
<div class="button_area">
	<button type="submit" onclick="fn_save();return false;" class="button1">삭제</button>
	<button type="reset" class="button1">취소</button>
	<button type="button" onclick="fn_action()">목록</button>
</div>
</form>
</body>
</html>



