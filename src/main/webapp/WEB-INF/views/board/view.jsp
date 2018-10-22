<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="https://fonts.googleapis.com/css?family=Concert+One" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/view.css" rel="stylesheet">
<%@ include file="../include/member_header.jsp" %>
<script>
    $(document).ready(function(){
        /* 댓글 관련 */
        // 1. 댓글 입력
        
        $("#btnReply").click(function(){
        	 var replytext=$("#replytext").val();
             var bno="${dto.bno}"
             if(replytext!=""){
             	// 비밀댓글 파라미터 추가
	            var param="replytext="+replytext+"&bno="+bno;
	            $.ajax({                
	                type: "post",
	                url: "${path}/reply/insert.do",
	                data: param,
	                success: function(){
	                    alert("댓글이 등록되었습니다.");
	                    //listReply2();
	                    listReply();
	                }
	            }); // 폼데이터 형식으로 입력
             }
             else{
            	 alert("댓글을 입력해주세요!");
            	 document.form1.replytext.focus();
             }
          });
        
        // 2. 댓글 목록
        listReply(); // 댓글 목록 불러오기
     
    
        // 1. 게시글 수정
        $("#btnUpdete").click(function(){
           
            var title = $("#title").val();
            var content = $("#content").val();
            //var writer = $("#writer").val();
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
            
            document.form1.action="${path}/board/update.do"
            // 폼에 입력한 데이터를 서버로 전송
            document.form1.submit();
        });
        
        // 2. 게시글 삭제
        $("#btnDelete").click(function(){
            if(confirm("삭제하시겠습니까?")){
                document.form1.action = "${path}/board/delete.do";
                document.form1.submit();
            }
        });
        
        // 3. 게시글 목록으로 이동 - 버튼 클릭시 상세보기화면에 있던 페이지, 검색옵션, 키워드 값을 가지로 목록으로 이동
        $("#btnList").click(function(){
            location.href="${path}/board/list.do?curPage=${curPage}&searchOption=${searchOption}&keyword=${keyword}";
        });
        
    });
    
   
    
    // 2_1. 댓글 목록 - 전통적인 Controller방식
    function listReply(){
        $.ajax({
            type: "get",
            url: "${path}/reply/list.do?bno=${dto.bno}",
            success: function(result){
           
                $("#listReply").html(result);
            }
        });
    }
     
    
   
    // 2_2. 댓글 목록 - 날짜 형식 변환 함수 작성
    function changeDate(date){
        date = new Date(parseInt(date));
        year = date.getFullYear();
        month = date.getMonth();
        day = date.getDate();
        hour = date.getHours();
        minute = date.getMinutes();
        second = date.getSeconds();
        strDate = year+"-"+month+"-"+day+" "+hour+":"+minute+":"+second;
        return strDate;
    }
    
    
    
    // **댓글 수정화면 생성 함수
    function showReplyModify(rno){
        $.ajax({
            type: "get",
            url: "${path}/reply/detail/"+rno,
            success: function(result){
                $("#modifyReply").html(result);
                // 태그.css("속성", "값")
                $("#modifyReply").css("visibility", "visible");
            }
        })
    }
</script>
<style>
    #modifyReply {
        width: 600px;
        height: 130px;
        background-color: gray;
        padding: 10px;
        z-index: 10;
        visibility: hidden;
    }
</style>
</head>
<body>
<%@ include file="../include/member_menu.jsp" %>
<br>
<br>
    <form name="form1" method="post">
    <div id="board">
    <center>
    <table>
    	<tr>
    		<td colspan="2"><input type="text" name="title" id="title" size="80" value="${dto.title}" placeholder="제목을 입력해주세요"></td>
    	</tr>
    	<tr height=50px>
    		<td align="left"><span ><fmt:formatDate value="${dto.regdate}" pattern="yyyy-MM-dd a HH:mm:ss"/></span></td>
    		<td align="right"><span>조회수 ${dto.viewcnt}</span></td>
    	</tr>
    	<tr align="center">
    		<td colspan="2"><textarea name="content" id="content" rows="4" cols="80" placeholder="내용을 입력해주세요">${dto.content}</textarea></td>
    	</tr>
    </table>
        <div style="width:650px; text-align: center;">
            <!-- 게시물번호를 hidden으로 처리 -->
            <input type="hidden" name="bno" value="${dto.bno}">
        <!-- 본인이 쓴 게시물만 수정, 삭제가 가능하도록 처리 -->
        <c:if test="${sessionScope.userId == dto.writer}">
            <button type="button" id="btnUpdete">수정</button>
            <button type="button" id="btnDelete">삭제</button>
        </c:if>
            <!-- 상세보기 화면에서 게시글 목록화면으로 이동 -->
            <button type="button" id="btnList">목록</button>
        </div>
      </center>
    </div>
    </form>
    
    
    <div id="command">
    <center>
        <!-- 로그인 한 회원에게만 댓글 작성폼이 보이게 처리 -->
        <c:if test="${sessionScope.userId != null}">    
        <table>
        	<tr>
        		<td><textarea rows="5" cols="80" id="replytext" placeholder="댓글을 작성해주세요"></textarea></td>
        		<td><button type="button" id="btnReply">댓글 작성</button></td>
        	</tr>
        </table>
        </c:if>
        </center>
    </div>
    <!-- 댓글 목록 출력할 위치 -->
    <center>
    <div id="listReply"></div>
    </center>
</body>
</html>
<%@ include file="../include/member_footer.jsp" %>
