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
		width: 60%;
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
		right: 20%;
		padding: 8px;
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
		<table table id="board" border="0" class="table table-hover">
			<thead>
				<tr>
					<th style="width: 100px;">번호</th>
					<th style="width: 500px;">제목</th>
					<th style="width: 200px;">작성자</th>
					<th style="width: 100px;">작성일</th>
					<th style="width: 100px;">조회수</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th>1</th>
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
	<div id="overjoin" class="overlayjoin" style="z-index: 2000;">
		<div class="joinOver">
			<span class="closebtn" onclick="closejoin()" title="close">X</span>
			<h2 style="text-align: center;">
				BZBZ<br>회원가입
			</h2>
			<hr>
			<form action="JoinCon" method="post">
				<input class="mainInfojoin" type="text" name="mb_id" placeholder="ID를 입력해주세요">
					<button onclick="">중복확인</button>
					<input class="mainInfojoin" type="password" name="mb_pw" placeholder="비밀번호를 입력해주세요"> <br> 
					<input class="mainInfojoin" type="text" name="mb_nick" placeholder="사용하실 닉네임을 입력해주세요">
					<button onclick="">중복확인</button>
					<br> <label for="gen" style="margin-left: 35px;">성별<br>
						<input name="mb_gender" type="radio" style="margin-left: 50px;" name="성별" value="M">남 
						<input name="mb_gender" type="radio" name="성별" value="F">여
					</label><br> <br> <label for="age" style="margin-left: 35px;">연령<br>
						<input id="age" name="mb_age" type="radio" style="margin-left: 50px;" value="10">10대
						<input id="age" name="mb_age" type="radio" value="20">20대 
						<input id="age" name="mb_age" type="radio" value="30">30대<br> 
						<input id="age" name="mb_age" type="radio" style="margin-left: 50px;" value="40">40대 
						<input id="age" name="mb_age" type="radio" value="50">50대 
						<input id="age" name="mb_age" type="radio" value="60">60대 이상
				</label><br> <br>
				<hr>
				<input type="submit" class="joinsub" value="회원가입을 완료합니다"> <br>
				<br>
			</form>
		</div>
	</div>
	<div id="overlogin" class="overlaylogin" style="z-index: 2000;">
		<div class="joinOver">
			<span class="closebtn" onclick="closelogin()" title="close">X</span>
			<h2 style="text-align: center;">
				BZBZ<br>로그인
			</h2>
			<hr>
			<form action="LoginCon" method="post"> 
				<input id="loginId" class="mainInfologin" type="text" name="mb_id" placeholder="ID를 입력해주세요"> 
				<input id="loginPw" class="mainInfologin" type="password" name="mb_pw" placeholder="비밀번호를 입력해주세요">
				<br>
				<hr>
				<input type="submit" class="loginsub" value="로그인"> <br>
				<br>
			</form>
		</div>
	</div>
	<div id="overinfo" class="overlayinfo" style="z-index: 2000;">
		<div class="joinOver">
			<span class="closebtn" onclick="closeinfo()" title="close">X</span>
			<h2 style="text-align: center;">
				BZBZ<br>회원정보
			</h2>
			<hr>
			<form>
		 		<ul style="list-style: none;">
		 			<li>회원 ID : </li>
		 			<li>Nickname :</li>
		 			<li>성별 </li>
				</ul>
				<hr>
				<hr>
			</form>
		</div>
	</div>
	<script>
		function openjoin() {
			document.getElementById("overjoin").style.display = "block";
		}
		function openlogin() {
			document.getElementById("overlogin").style.display = "block";
		}
		function openinfo() {
			document.getElementById("overinfo").style.display = "block";
		}
		function closejoin() {
			document.getElementById("overjoin").style.display = "none";
		}
		function closelogin() {
			document.getElementById("overlogin").style.display = "none";
		}
		function closeinfo() {
			document.getElementById("overinfo").style.display = "none";
		}
	</script>
</body>
</html>