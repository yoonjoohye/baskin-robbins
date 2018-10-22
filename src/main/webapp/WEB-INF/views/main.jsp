<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link href="${pageContext.request.contextPath}/resources/css/main.css" rel="stylesheet">
<title>Insert title here</title>
<%@ include file="include/member_header.jsp"%>
</head>
<body>
<%@ include file="include/member_menu.jsp" %>

<div id="slide">
	<input type="radio" name="pos" id="pos1" checked>
	<input type="radio" name="pos" id="pos2">
	<input type="radio" name="pos" id="pos3">
	<input type="radio" name="pos" id="pos4">
	<ul>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
	</ul>
	<p class="pos">
		<label for="pos1"></label>
		<label for="pos2"></label>
		<label for="pos3"></label>
		<label for="pos4"></label>
	</p>
</div>

</body>
</html>
<%@ include file="include/member_footer.jsp" %>