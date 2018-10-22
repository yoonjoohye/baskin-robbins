<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- jstl 코어 태그 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="${pageContext.request.contextPath}/resources/css/test.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/menu.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Gothic+A1" rel="stylesheet">
<!-- context 경로 -->
<div id="menu">
<c:set var="path" value="${pageContext.request.contextPath}"/>
    <c:choose>
		 <c:when test="${sessionScope.userId == null}">
		   <a class="a" href="${path}/login/login.do"><span>LOGIN</span></a>
		   <a class="a" href="${path}/member/write.do">JOIN</a>
		 </c:when>
		<c:otherwise>
		  <span class="a">${sessionScope.userName}님</span>
		   <a class="a" href="${path}/login/logout.do">LOGOUT</a>
		</c:otherwise>
    </c:choose>
    
    <a  class="b" href="${path}/menu/list.do">MENU</a>
    <a  class="c" href="${path}/event/event.do">EVENT</a>
    <a  class="c" href="${path}/store/map.do">STORE</a>
    <a  class="c" href="${path}/board/list.do">ABOUT</a>
   <!--
   	<a href="${path}/member/list.do">회원관리</a>
    <a  href="${path}/board/list.do">게시판관리</a>-->
</div>
<hr>