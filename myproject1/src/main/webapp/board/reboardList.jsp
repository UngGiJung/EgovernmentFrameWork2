<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>답변형 게시판 목록화면</title>
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
	text-align:right;
	margin-top:10px;
}
.pagging_area {
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
function fn_action() {
	location = "/myproject1/reboardWrite.do";
}
</script>

<body>

<!-- 번호 / 제목 / 등록일 / 글쓴이 / 조회수 -->

<div>
<table>
	<caption class="caption1">답변형 게시판 목록화면</caption>
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>등록일</th>
		<th>글쓴이</th>
		<th>조회수</th>
	</tr>
	
	<c:set var="count" value="${pageno }"/>
	<c:set var="len" value="${fn:length(list.thread) }"/>
	
	<c:forEach var="list" items="${resultList}">
	
	<tr>
		<td> </td>  <!--  웹주소?파라미터값 -->
		<td>
		<c:forEach var="i" begin="2" end="${fn:length(list.thread)}">
			&nbsp;&nbsp; 
		</c:forEach>
		<c:if test="${fn:length(list.thread) > 1}">[re]</c:if>
		
		<a href="/myproject1/reboardDetail.do?unq=${list.unq }">${list.title }</a>
		
		</td>
		<td>${fn:substring(list.rdate,0,10) }</td>
		<td>${list.name }</td>
		<td>${list.hits }</td>
	</tr>
	<c:set var="count" value="${count-1 }"/>
	
	</c:forEach>

</table>
</div>

<div class="pagging_area">

	<c:forEach var="i" begin="1" end="${lastpage }">
		<a href="/myproject1/boardList.do?page=${i }">${i }</a> 
	</c:forEach>

</div>

<div class="button_area">
	<button type="button" onclick="fn_action()">글쓰기</button>
</div>

</body>
</html>



