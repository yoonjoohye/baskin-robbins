<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/resources/css/login.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Concert+One" rel="stylesheet">
<title>로그인 페이지</title>
<%@ include file="../include/member_header.jsp"%>
<script>
	$(document).ready(function(){
		$("#btnLogin").click(function(){
			var userId=$("#userId").val();
			var userPw=$("#userPw").val();
			if(userId==""){
				alert("아아디를 입력하세요.");
				return;
			}
			if(userPw==""){
				alert("비밀번호을 입력하세요.");
				return;
			}
			document.form1.action="${path}/login/loginCheck.do"
			document.form1.submit();
		});
	});
</script>
</head>
<body>
<%@ include file="../include/member_menu.jsp" %>
<div id="greeting">
<h2 style="font-size:30pt; font-family: 'Concert One', cursive;"><b>LOGIN</b></h2>
배스킨라빈스 홈페이지에 오신 것을 환영합니다.
</div>
<hr id="top">
<form name="form1" method="post">

	<table id="login" style="float:left;">
		<tr>
			<td colspan="2">
				배스킨라빈스 로그인<br>
				<span>해피포인트 아이디로 간편하게 로그인하세요.</span>
			</td>
		</tr>
		<tr>
			<td><input type="text" name="userId" id="userId" placeholder="아이디를 입력하세요"></td>
			<td rowspan="2"><button id="btnLogin">로그인</button></td>
		</tr>
		<tr>
			<td><input type="password" name="userPw" id="userPw" placeholder="비밀번호를 입력하세요"></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
                <c:if test="${msg == 'failure'}"> 
                    <script>alert("아이디 또는 비밀번호가 일치하지 않습니다.");</script>
                </c:if>
                <c:if test="${msg == 'logout'}">
                	<script>alert("로그아웃되었습니다.");</script>
                </c:if>
			</td>
		</tr>
	</table>
</form>
	<div id="a">
		<h3>SPC 통합회원 서비스</h3>
		<p>하나의 ID/Password로 SPC가 운영하는 사이트(배스킨라빈스, 던킨도너츠, <br>
		해피포인트카드, 파리바게뜨, 파리크라상, 파스쿠찌, SPC그룹,우리밀愛)를 한번에!!<br>
		간단한 동의 절차만 거치면 하나의 ID/Password로 제휴사이트를<br>
		로그인 하실 수 있습니다.</p><br>
	
		<h3>고객센터</h3>
		<table id="info">
			<tr>
				<td>운영시간</td>
				<td>월~금 09:00~17:30 토/일요일 휴무</td>
			</tr>
			<tr>
				<td>Tel.</td>
				<td>080-555-3131(수신자부담)</td>
			</tr>
		</table>
	</div>
	<div id="b">
	<hr id="bottom">
		해피포인트 회원이 아니시라면 지금 해피포인트에 가입하시고<br>
		다양한 혜택을 경험하세요.<br>
	</div>

</body>
</html>
<%@ include file="../include/member_footer.jsp" %>