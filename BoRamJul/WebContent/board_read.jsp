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
	table{
		width: 50%;
		margin-left: auto;
		margin-right: auto;
		border-top: 2px solid black;
		border-bottom: 2px solid black;
	}
	thead{
		border-bottom: 1px solid black;
		background-color: rgb(234, 245, 248);
		height: 50px;
	}
	thead tr th{
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
	.board_content{
		width: 70%;
		line-height: 25px;
		margin-left: 15%;
		margin-right: 15%;
		margin-top: 50px;
		margin-bottom: 50px;
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
							<a href="#" onclick="openinfo()" style="font-size: 20px; font-weight: bold;">회원정보[닉네임:<%=dto.getMbNick()%>]</a>
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
		<table>
			<thead>
				<tr>
					<th style="width: 100px;">번호</th>
					<th>제목</th>
					<th style="width: 100px;">작성자</th>
				</tr>
			</thead>
		</table>
		<div style="width: 50%; margin-left:25%; margin-right:25%; border-bottom: 2px solid black;">
			<p class="board_content">
				아침에 눈을 떴는데 글쎄 유난히 성스러워 보이는 햇빛이 커튼 틈 사이로 한 내리쬐는 게... 앞으로 펼쳐질 하루가 녹록치 않을 것임을 암시하는 듯했다.<br>
				아니나 다를까 늦잠이었다.....<br>
				내뱉을 수 있는 세상 모든 욕을 다 내뱉고 시간을 확인해 보니 그 사이에 5분이 더 지나 있었다. WTF!!<br>
				버스는 이미 떠났고 시간은 붙잡을 수도 없이 흐르고 있었으므로 급하게 어플을 켜서 택시를 호출했는데 도착 예정 시간이 10분 뒤었다. 아니, 상식적으로 근방에 있는 택시가 콜을 잡아야 맞는 거 아님?<br>
				그래도 급한 건 나니까, 울며 겨자 뽑아 먹는 심정으로 불러서 타기는 했는데.....
			</p>
		</div>
	</div>
</body>
</html>