<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- jstl 코어 태그 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- context 경로 -->
<c:set var="path" value="${pageContext.request.contextPath}"/>
<link href="${pageContext.request.contextPath}/resources/css/reply.css" rel="stylesheet">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
</head>
<body>
	<table id="reply">
		<c:forEach var="row" items="${list}">
			<tr>
				<td>
					<span>${row.userName} (${row.replyer})</span>
					<br>
					<span id="command">${row.replytext}</span>
					<br>
					<span id="date"><fmt:formatDate value="${row.regdate}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
					 &nbsp;
					<!-- 본인 댓글만 수정버튼 생성되도록 처리 -->
					<c:if test="${sessionScope.userId == row.replyer}">
						<input type="button" class="btn btn-default" id="btnModify" value="수정"
							onclick="showReplyModify('${row.rno}')">
					</c:if>
					<hr>
				</td>
			</tr>
		</c:forEach>
	</table>
	<div id ="modifyReply"></div>
</body>
</html>