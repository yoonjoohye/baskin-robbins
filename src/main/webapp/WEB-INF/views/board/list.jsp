<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://fonts.googleapis.com/css?family=Concert+One" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/list.css" rel="stylesheet">
<title>배스킨라빈스</title>
<%@ include file="../include/member_header.jsp" %>
<script>
    $(document).ready(function(){
        $("#btnWrite").click(function(){
            // 페이지 주소 변경(이동)
            location.href = "${path}/board/write.do";
        });
    });
    
    function list(page){
    	  location.href="${path}/board/list.do?curPage="+page+"&searchOption-${map.searchOption}"+"&keyword=${map.keyword}";
    }
    
</script>
</head>
<body>
<%@ include file="../include/member_menu.jsp" %>
    <div id="greeting">
    <h2 style="font-size:30pt; font-family: 'Concert One', cursive;">NOTICE</h2>
  	 배스킨라빈스의 신제품 안내, 신규 CF등 다양한 소식을 알려드립니다!
   </div>
   
   <div id="search">
    <form name="form1" method="post" action="${path}/board/list.do">
   		<span  style="margin-right:400px"> 총 <span style="color:#fb6a92;">${map.count}</span>건이 검색되었습니다.</span>
        <select name="searchOption">
            <!-- 검색조건을 검색처리후 결과화면에 보여주기위해  c:out 출력태그 사용, 삼항연산자 -->
            <option value="all" selected <c:out value="${map.searchOption == 'all'?'selected':''}"/> >전체</option>
            <option value="writer" <c:out value="${map.searchOption == 'writer'?'selected':''}"/> >이름</option>
            <option value="content" <c:out value="${map.searchOption == 'content'?'selected':''}"/> >내용</option>
            <option value="title" <c:out value="${map.searchOption == 'title'?'selected':''}"/> >제목</option>
        </select>
        <input id="keyword" name="keyword" value="${map.keyword}">
        <input type="submit" value="검색">
    </form>
    </div><br>
    <center>
      <table id="notice" width="600px">
        <c:forEach var="row" items="${map.list}">
        <tr>
            <td>${row.bno}</td>
          
            <td>
               <a href="${path}/board/view.do?bno=${row.bno}&curPage=${map.boardPager.curPage}&searchOption=${map.searchOption}&keyword=${map.keyword}">${row.title}
                       <!-- ** 댓글이 있으면 게시글 이름 옆에 출력하기 -->
                    <c:if test="${row.recnt > 0}">
                    <span style="color: #fb6a92;">(${row.recnt})
                    </span>
                    </c:if>  
               </a>
                                                          
            </td>
            <td>
              <!-- 원하는 날짜형식으로 출력하기 위해 fmt태그 사용 -->
             <fmt:formatDate value="${row.regdate}" pattern="yyyy-MM-dd"/>
            </td>
            <td>${row.viewcnt}</td>
        </tr>    
        </c:forEach>
      </table><br>
        
        <table id="num">
        <tr>
            <td colspan="5">
                <!-- **처음페이지로 이동 : 현재 페이지가 1보다 크면  [처음]하이퍼링크를 화면에 출력-->
                <c:if test="${map.boardPager.curBlock > 1}">
                    <a href="javascript:list('1')"><span><</span></a>
                </c:if>
                
                <!-- **이전페이지 블록으로 이동 : 현재 페이지 블럭이 1보다 크면 [이전]하이퍼링크를 화면에 출력 -->
                <c:if test="${map.boardPager.curBlock > 1}">
                    <a href="javascript:list('${map.boardPager.prevPage}')"><span><</span></a>
                </c:if>
                
                <!-- **하나의 블럭에서 반복문 수행 시작페이지부터 끝페이지까지 -->
                <c:forEach var="num" begin="${map.boardPager.blockBegin}" end="${map.boardPager.blockEnd}">
                    <!-- **현재페이지이면 하이퍼링크 제거 -->
                    <c:choose>
                        <c:when test="${num == map.boardPager.curPage}">
                            <span style="color: #fb6a92;">${num}</span>
                        </c:when>
                        <c:otherwise>
                            <a href="javascript:list('${num}')"><span>${num}</span></a>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
                
                <!-- **다음페이지 블록으로 이동 : 현재 페이지 블럭이 전체 페이지 블럭보다 작거나 같으면 [다음]하이퍼링크를 화면에 출력 -->
                <c:if test="${map.boardPager.curBlock <= map.boardPager.totBlock}">
                    <a href="javascript:list('${map.boardPager.nextPage}')"><span>></span></a>
                </c:if>
                
                <!-- **끝페이지로 이동 : 현재 페이지가 전체 페이지보다 작거나 같으면 [끝]하이퍼링크를 화면에 출력 -->
                <c:if test="${map.boardPager.curPage <= map.boardPager.totPage}">
                    <a href="javascript:list('${map.boardPager.totPage}')"><span>></span></a>
                </c:if>
            </td>
        </tr>
	</table>
	<br>
	 <c:if test="${sessionScope.userId != null}">
	<button type="button" id="btnWrite">글쓰기</button>
	</c:if>
 </center>
</body>
</html>
<%@ include file="../include/member_footer.jsp" %>
