<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://fonts.googleapis.com/css?family=Concert+One" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/notice.css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 작성</title>
<%@ include file="../include/member_header.jsp" %>

<script>
    $(document).ready(function(){
        $("#btnSave").click(function(){
            
            var title = $("#title").val();
            var content = $("#content").val();
           // var writer = $("#writer").val();
            if(title == ""){
                alert("제목을 입력하세요");
                document.form1.title.focus();
                return;
            }
            if(content == ""){
                alert("내용을 입력하세요");
                document.form1.content.focus();
                return;
            }
            /*if(writer == ""){
                alert("이름을 입력하세요");
                document.form1.writer.focus();
                return;
            }*/
            // 폼에 입력한 데이터를 서버로 전송
            document.form1.submit();
        });
    });
</script>
</head>
<body>
<%@ include file="../include/member_menu.jsp" %>
 <div id="greeting">
    <h2 style="font-size:30pt; font-family: 'Concert One', cursive;">WRITE</h2>
  	 배스킨라빈스의 신제품 안내, 신규 CF등 다양한 소식을 적어주세요!
   </div>
   <hr id="top">
<form name="form1" method="post" action="${path}/board/insert.do">
<div id="notice">
<center>
    <table id="write">
    	<tr>
    		<td><input type="text" name="title" id="title" size="80" placeholder="제목을 입력해주세요"></td>
    	</tr>
    	<tr>
    		<td> <textarea name="content" id="content" rows="4" cols="80" placeholder="내용을 입력해주세요"></textarea></td>
    	</tr>
    	<tr align="center">
    		<td>
    			<button type="button" id="btnSave">확인</button>
       			<button type="reset">취소</button>
       		 </td>
    	</tr>
    </table>
    </center>
</div>
</form>
</body>
</html>
<%@ include file="../include/member_footer.jsp" %>
