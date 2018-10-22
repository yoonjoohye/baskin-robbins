<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link href="${pageContext.request.contextPath}/resources/css/test.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/css/write.css" rel="stylesheet">
 <link href="https://fonts.googleapis.com/css?family=Do+Hyeon" rel="stylesheet">
  <%@ include file="../include/member_header.jsp" %> 
<title>회원 등록</title>
<script>
	$(document).ready(function(){
		$("#btn").click(function(){
			var userId=$("#userId").val();
			var userPw=$("#userPw").val();
			var userName=$("#userName").val();
			var userEmail=$("#userEmail").val();
			if(userId==""){
				alert("아아디를 입력하세요.");
				return;
			}
			if(userPw==""){
				alert("비밀번호를 입력하세요.");
				return;
			}
			if(userName==""){
				alert("이름을 입력하세요.");
				return;
			}
			if(userEmail==""){
				alert("이메일을 입력하세요.");
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
 <center>
 <div id="greeting">
	 <h2 style="font-size:30pt; font-family: 'Do Hyeon', sans-serif;">회원가입</h2>
	 배스킨라빈스 회원가입을 환영합니다.
 </div>
 <hr id="join">
 <form name="form1" method="post" action="${path}/member/insert.do">
  <table width="400px" align="center">
   <tr>
      <td><input type="text" name="userId" id="userId" placeholder="아이디"></td>
   </tr>
   <tr>
       <td><input type="password" name="userPw" id="userPw" placeholder="비밀번호"></td>
   </tr>
   <tr>
       <td><input type="text"  name="userName" id="userName" placeholder="이름"></td>
   </tr>
   <tr>  
      <td><input type="text" name="userEmail" id="userEmail" placeholder="이메일"></td>
   </tr>
   <tr>
   <td align="center">
   		<input type="button" id="btn" value="확인">
   		<input type="reset" value="취소">
   	</td>
   </tr>
 </table>
 </form>
 </center>
</body>
</html>
<%@ include file="../include/member_footer.jsp" %>