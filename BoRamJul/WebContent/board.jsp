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
	#board{
		width: 70%;
		margin-left: auto;
		margin-right: auto;
		border-top: 2px solid black;
		border-bottom: 2px solid black;
	}
	#board thead{
		border-bottom: 1px solid black;
		background-color: rgb(234, 245, 248);
		height: 50px;
	}
	#board thead tr th{
		text-align: center;
		vertical-align: middle;
		height: 30px;
	}
	#board tbody{
		border-bottom: 1px dotted black;
	}
	#board tbody tr{
		height: 70px;		
	}
	#board tbody tr th{
		text-align: center;
		vertical-align: middle;		
	}
	.write{
		position: absolute;
		right: 15%;
		padding: 8px;
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
							<%if (dto == null){%>
							<a href="#" onclick="openlogin()" style="font-size: 20px; font-weight: bold;">로그인&nbsp;&nbsp;&nbsp;</a>
							<a href="#" onclick="openjoin()"style="font-size: 20px; font-weight: bold;">회원가입</a>
							<%}else {%>
							<a href ="LogoutCon" style="font-size: 20px; font-weight: bold;">로그아웃&nbsp;&nbsp;&nbsp;</a>
							<a href="#" onclick="openinfo()"style="font-size: 20px; font-weight: bold;">회원정보[닉네임:<%=dto.getMbNick()%>]</a>
							<%} %>  
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
	<h1 style="text-align: center;">자유게시판</h1>
	<div>
		<table table id="board" border="0" class="table table-hover">
			<thead>
				<tr>
					<th>번호</th>
					<th style="width: 80px;">미리보기</th>
					<th style="width: 420px;">제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th>1</th>
					<th>
						<img src="" style="width: 60px; height: 60px; border-radius: 10%;">
					</th>
					<th><a href="">프로젝트 하다가 선생이랑 싸운 썰 푼다</a></th>
					<th>Mr.P</th>
					<th>2022.01.02</th>
					<th>37</th>
				</tr>
			</tbody>
		</table>
	</div>
	<div>
		<button class="write">글쓰기</button>
		<br><br>
			<div class="text-center">
				<ul class="pagination">
					<li><a href="#">◀</a></li>
					<li><a href="#">1</a></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">4</a></li>
					<li><a href="#">5</a></li>
					<li><a href="#">▶</a></li>
				</ul>
			</div>
	</div>
</body>
</html>