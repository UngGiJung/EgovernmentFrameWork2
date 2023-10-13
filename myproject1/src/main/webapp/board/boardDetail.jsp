<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세화면</title>
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
function fn_modify() {
	location = "/myproject1/boardModify.do?unq=${vo.unq}";
}

function fn_delete() {
	location = "/myproject1/boardPassWrite.do?unq=${vo.unq}";
}

function fn_action() {
	location = "/myproject1/boardList.do";
}
</script>

<body>

<div>
<table>
	<caption class="caption1">게시판 상세화면</caption>
	<tr>
		<th>제목</th>
		<td>${vo.title }</td>
	</tr>
	
	<tr>
		<th>글쓴이</th>
		<td>${vo.name }</td>
	</tr>
	<tr>
		<th>등록일</th>
		<td>${vo.rdate }</td>
	</tr>
	<tr>
		<th>내용</th>
		<td>${vo.content }</td>
	</tr>
</table>
</div>
<div class="button_area">
	<button type="button" onclick="fn_modify()">수정</button>
	<button type="button" onclick="fn_delete()">삭제</button>
	<button type="button" onclick="fn_action()">목록</button>
</div>
</body>
</html>



