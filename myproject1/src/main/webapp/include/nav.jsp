<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>    

userid :: ${sessionScope.SessionID}
<c:set var="sessionid" value="${sessionScope.SessionID}"/>
    
 	 	<div class="nav_left_space">&nbsp;</div>
		<div class="nav_center_space"> 
		<ul>
			<li class="menuLink"><a href="/sample.do">홈</a></li>
			<li class="menuLink"><a href="#">일정관리</a></li>
			<li class="menuLink"><a href="#">게시판</a></li>
			<li class="menuLink"><a href="/reboardList.do">답변게시판</a></li>
		
		<c:if test="${sessionid == null}">	
			<li class="menuLink"><a href="/memberWrite.do">회원가입</a></li>
			<li class="menuLink"><a href="/loginWrite.do">로그인</a></li>
		</c:if>
		
		<c:if test="${sessionid != null}">	
			<li class="menuLink"><a href="/memberModify.do">회원가입</a></li>
			<li class="menuLink"><a href="/Logout.do">로그아웃</a></li>
		</c:if>
		
		</ul>
		</div>
		<div class="nav_right_space">&nbsp;</div>