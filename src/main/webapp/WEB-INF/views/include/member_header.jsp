<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- jstl 코어 태그 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link href="${pageContext.request.contextPath}/resources/css/test.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/header.css" rel="stylesheet">
<link rel="icon" href="${pageContext.request.contextPath}/resources/img/baskin.png" sizes="16x16 32x32" type="image/png">
<!-- context 경로 -->
<c:set var="path" value="${pageContext.request.contextPath}"/>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
</head>
<body>
<div id="header">
<hr id="dec">
<div style="margin-left:20%;">
	<a href="https://www.facebook.com/baskinrobbins.kr"><img src="${pageContext.request.contextPath}/resources/img/face.png"/></a>
	<a href="https://twitter.com/BaskinrobbinsKR"><img src="${pageContext.request.contextPath}/resources/img/twiter.png"/></a>
	<a href="https://blog.naver.com/brgirl31"><img src="${pageContext.request.contextPath}/resources/img/www.png"/></a>
	<a href="https://www.instagram.com/baskinrobbinskorea/"><img src="${pageContext.request.contextPath}/resources/img/insta.png"/></a>
</div>
<center>
<a href="${pageContext.request.contextPath}">
	<img class="i"src="${pageContext.request.contextPath}/resources/img/logo.png"/>
</a>
</center>
</div>
</body>
