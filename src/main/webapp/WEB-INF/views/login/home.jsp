<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Home</title>
<%@ include file="../include/member_header.jsp"%>
</head>
<body>
<%@ include file="../include/member_menu.jsp" %>
<c:if test="${msg=='success' }">
	<script>alert("${sessionScope.userName}님 환영합니다.");
			location.href="${pageContext.request.contextPath}/";
	</script>
	
</c:if>
</body>
</html>
<%@ include file="../include/member_footer.jsp" %>