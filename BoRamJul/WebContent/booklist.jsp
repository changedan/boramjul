<%@page import="com.DTO.memberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.DAO.TBookDAO"%>
<%@page import="com.vo.TBookDTO"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%	
	TBookDTO book = (TBookDTO) request.getAttribute("book");
	memberDTO dto = (memberDTO)session.getAttribute("dto");
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/animate.css">
<link rel="stylesheet" href="css/templatemo_misc.css">
<!-- 북작북작 css -->
<link rel="stylesheet" href="style.css">
<script src="js/vendor/modernizr-2.6.1-respond-1.1.0.min.js"></script>
<title>보람줄 - 북작북작</title>
<style>
.rank_tab {
	height: 200px;
	margin: 2px;
	padding: 0px;
	border-top: 1px dotted black;
	border-bottom: 1px dotted black;
	display: flex;
}

.rank_tab img {
	width: 105px;
	height: 140px;
	padding-top: 30px;
	padding-bottom: 30px;
	margin-left:600px;
}

.rank_tab_bl {
	display: inline-block;
	margin-top: 0px;
}

.info_tab_bl ul {
	list-style: none;
	padding-left: 30px;
	margin-top: 0px;
	margin-bottom: 0px;
	overflow: hidden;
</style>
</head>
<body>
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
					<a href="main.jsp" onclick="openlogin()"
						style="font-size: 20px; font-weight: bold;">로그인&nbsp;&nbsp;&nbsp;</a>
					<a href="#" onclick="openjoin()"
						style="font-size: 20px; font-weight: bold;">회원가입</a>
					<%
						} else {
					%>
					<a href="LogoutCon" style="font-size: 20px; font-weight: bold;">로그아웃&nbsp;&nbsp;&nbsp;</a>
					<a href="#" onclick="openinfo()"
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
						<li><a href="#Newbooks">신간도서</a></li>
						<li><a href="#our-team">자유게시판</a></li>
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
	<hr class="hr_main">
	<h1 style="text-align: center; margin: 30px;">베스트셀러</h1>
		<div class="rank_tab" style="background-color: rgb(248, 246, 234)">
		<div class="th_img" style="display: inline-block;">
			<img src="images/book/nb1.jpg">
		</div>
		<div class="info_tab_bl">
			<ul>
				<li style="padding-top: 55px;"></li><br>
				<li>도서1</li><br>
				<li>도서2</li><br>
				<li>도서3</li>
			</ul>
		</div>
	</div>

</body>
</html>