<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link href="${pageContext.request.contextPath}/resources/css/test.css" rel="stylesheet">
<title>회원상세페이지</title>
  <%@ include file="../include/member_header.jsp" %> 
  <script>
  	$(document).ready(function(){
  		$("#btnUpdate").click(function(){
  			if(confirm("수정하시겠습니까?")){
  				document.form1.action="${path}/member/update.do";
  				document.form1.submit();
  			}
  		});
  	});
  	$(document).ready(function(){
  		$("#btnDelete").click(function(){
  			if(confirm("삭제하시겠습니까?")){
  				document.form1.action="${path}/member/delete.do";
  				document.form1.submit();
  			}
  		});
  	});
  </script>
</head>
<body>
 <%@ include file="../include/member_menu.jsp" %>  
 <h2> 회원정보상세</h2>
 <form name="form1" method="post">
 <table width="400px">
   <tr>
      <td> 아이디 </td>
      <td><input name="userId" value="${dto.userId}" readonly="readonly"></td>
   </tr>
   <tr>
      <td> 비밀번호 </td>
       <td><input type="password" name="userPw"></td>
   </tr>
   <tr>
      <td> 이름 </td>
       <td><input name="userName" value="${dto.userName}"></td>
   </tr>
   <tr>  
      <td> 이메일 주소</td>
      <td><input name="userEmail" value="${dto.userEmail}"></td>
   </tr>
   <!-- 띄어쓰기 주의!!!!!! -->
     <tr>  
      <td> 회원가입일자</td>
      <td><fmt:formatDate value="${dto.userRegdate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
   </tr>
      <tr>  
      <td> 회원정보 수정일자</td>
      <td><fmt:formatDate value="${dto.userUpdatedate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
   </tr>
   <tr>
   	<td colspan="2">
   		<button id="btnUpdate">수정</button>
   		<button id="btnDelete">삭제</button>
   		<div style="color:red;">${message}</div> <!-- homecontroller의 addattribute -->
   	</td>
   </tr>
 </table>
</form>
</body>
</html>
<%@ include file="../include/member_footer.jsp" %>