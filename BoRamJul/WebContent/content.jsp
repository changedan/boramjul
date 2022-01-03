<%@page import="com.DTO.ExBoardDTO"%>
<%@page import="com.DAO.ExboardDAO"%>
<%@page import="com.DTO.memberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.DAO.TBookDAO"%>
<%@page import="com.vo.TBookDTO"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	memberDTO dto = (memberDTO) session.getAttribute("dto");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	// 제목을 클릭하였을 때 get방식으로 넘어오는 no, pageNum, sel, find를 변수에 할당
	int no = Integer.parseInt(request.getParameter("no"));
	String pageNum = request.getParameter("pageNum");
	String sel = request.getParameter("sel");
	String find = request.getParameter("find");
	
	
	ExboardDAO manager = ExboardDAO.getInstance();
	// 제목을 클릭했을 때 조회수 증가
	manager.readCount(no);
	// no에 해당하는 데이터베이스의 데이터를 board 객체에 할당
	ExBoardDTO board = manager.getBoard(no);
%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/animate.css">
<link rel="stylesheet" href="css/templatemo_misc.css">
<link rel="stylesheet" href="style.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="js/vendor/modernizr-2.6.1-respond-1.1.0.min.js"></script>
<title>>북작북작 - 게시글</title>
<style>
table {
	width: 50%;
	margin-left: auto;
	margin-right: auto;
	border-top: 2px solid black;
	border-bottom: 2px solid black;
}

thead {
	border-bottom: 1px solid black;
	background-color: rgb(234, 245, 248);
	height: 50px;
}

thead tr th {
	text-align: center;
	vertical-align: middle;
	height: 30px;
}

.overlayinfo {
	display: none;
	position: fixed;
	height: 100%;
	width: 100%;
	z-index: 1;
	top: 0;
	left: 0;
	background: rgba(0, 0, 0, 0.2);
}

.board_content {
	width: 80%;
	line-height: 25px;
	margin-left: 10%;
	margin-right: 10%;
	margin-top: 50px;
	margin-bottom: 50px;
}
.repl{
	width: 50%;
	margin-left: 25%;
	margin-right: 25%;
	padding: 3px;
	border-bottom: 1px solid black;
}
.repl_wri{
	width: 50%;
	margin-left:25%;
	margin-right:25%;
}
.btn_rep{
	padddig: 5px;
	margin-left: 91%;
}
.repl_wri form{
	border: 1px dotted black;
	padding: 5px;
}
</style>
</head>
<body class="site-main" id="sTop">
	<div class="site-header">
		<div class="container">
			<nav id="nav_header">
				<div id="nav_title">
					<a href="main.jsp">북작북작</a>
				</div>
				<div id="nav_login">
					<%
						if (dto == null) {
					%>
					<a href="main.jsp" onclick=""
						style="font-size: 20px; font-weight: bold;">로그인&nbsp;&nbsp;&nbsp;</a>
					<a href="main.jsp" onclick=""
						style="font-size: 20px; font-weight: bold;">회원가입</a>
					<%
						} else {
					%>
					<a href="LogoutCon" style="font-size: 20px; font-weight: bold;">로그아웃&nbsp;&nbsp;&nbsp;</a>
					<a href="#" onclick=""
						style="font-size: 20px; font-weight: bold;">회원정보[닉네임:<%=dto.getMbNick()%>]
					</a>
					<%
						}
					%>
				</div>
			</nav>
		</div>
		<div class="main-header">
			<div class="container">
				<div id="menu-wrapper">
					<ul class="menu-first">
						<li><a href="booklist.jsp">베스트셀러</a></li>
						<li><a href="newlist.jsp">신간도서</a></li>
						<li><a href="steadylist.jsp">스테디셀러</a>
						<li><a href="list.jsp">자유게시판</a></li>
					</ul>
					<!-- /.main-menu -->
				</div>
				<!-- /#menu-wrapper -->
			</div>
			<!-- /.container -->
		</div>
		<!-- /.main-header -->
	</div>
	<!-- /.site-header -->
	
	<center>
		<hr class="hr_main">
		<h1 style="text-align: center;">자유게시판</h1>
		<div>
		<table>
			<thead>
				<tr>				
					<th>제목</th>
					<td colspan="3"><%=board.getSubject() %></td>
					<th>조회수</th>
					<td width="250"><%=board.getReadCount() %></td>
				</tr>
			</thead>
		</table>
		<div
			style="width: 50%; margin-left: 25%; margin-right: 25%; border-bottom: 2px solid black;">
			<p class="board_content">
				<%=board.getContent() %>
			</p>
		</div>
		<div class="repl">
			<p style="margin: 5px;">작성자</p>
				<span style="margin-left: 12px;"><%=board.getName() %></span>
		</div>
			<tr align="center">
				<td colspan="4">
					
					<%
						if(sel == null && find == null){ // 검색을 하지 않았을 때
					%>
					<%-- 버튼을 클릭하면 해당 페이지로 이동 / 수정과 삭제는 get방식으로 no값 및 pageNum을 전달 --%>
					<input type="button" value="글목록" onclick="location.href='list.jsp?pageNum=<%=pageNum%>'">
					<%if(dto==null) {%>
					<%}else if(dto!=null){ %>
					<input type="button" value="수정" onclick="location.href='updateForm.jsp?no=<%=no%>&pageNum=<%=pageNum%>'"> 
					<input type="button" value="삭제" onclick="location.href='deleteForm.jsp?no=<%=no%>&pageNum=<%=pageNum%>'">
					<input type="button" value="답글" onclick="location.href='replyForm.jsp?no=<%=no%>&pageNum=<%=pageNum%>'">
					<%} %>
					<%		
						}else{ // 검색 기능을 사용하였을 때
					%>
					<input type="button" value="글목록" onclick="location.href='list.jsp?pageNum=<%=pageNum%>&sel=<%=sel%>&find=<%=find%>'">
					<%if(dto==null) {%>
					<%}else if(dto!=null){ %>
					<input type="button" value="수정" onclick="location.href='updateForm.jsp?no=<%=no%>&pageNum=<%=pageNum%>&sel=<%=sel%>&find=<%=find%>'"> 
					<input type="button" value="삭제" onclick="location.href='deleteForm.jsp?no=<%=no%>&pageNum=<%=pageNum%>&sel=<%=sel%>&find=<%=find%>'">
					<input type="button" value="답글" onclick="location.href='replyForm.jsp?no=<%=no%>&pageNum=<%=pageNum%>&sel=<%=sel%>&find=<%=find%>'">
					<%} %>
					<%		
						}
					%>
					
				</td>
			</tr>
		</table>
	</center>
</body>
</html>