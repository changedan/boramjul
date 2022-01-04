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
memberDTO dto = (memberDTO) session.getAttribute("dto");
%>
<%
	TBookDAO dao = new TBookDAO();
ArrayList<TBookDTO> newbook = dao.selectbest();
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
	display: flex;
}

.rank_tab img {
	width: 105px;
	height: 140px;
	margin-top: 30px;
	margin-bottom: 30px;
	margin-left: 500px;
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
}
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
					<a href="#" onclick="openlogin()"
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
					<div id="overinfo" class="overlayinfo" style="z-index: 2000;">
						<div class="joinOver">
							<span class="closebtn" onclick="closeinfo()" title="close">X</span>
							<h2 style="text-align: center;">
								BZBZ<br>회원정보
							</h2>
							<hr>
							<form>
								<ul style="list-style: none;">
									<li>회원 ID : <%=dto.getMbId()%></li>
									<br>
									<br>
									<li>닉네임 : <%=dto.getMbNick()%>
									</li>
									<br>
									<br>
									<li>성별 : <%
										String gender = "";
									if (dto.getMbGender().equals("M")) {
										gender = "남";
									} else {
										gender = "여";
									}
									%> <%=gender%></li>
								</ul>
								<hr>
								<hr>
							</form>
						</div>
					</div>
					<%
						}
					%>
				</div>
				<div id="overjoin" class="overlayjoin" style="z-index: 2000;">
					<div class="joinOver">
						<span class="closebtn" onclick="closejoin()" title="close">X</span>
						<h2 style="text-align: center;">
							BZBZ<br>회원가입
						</h2>
						<hr>
						<form action="JoinCon" method="post">
							<input class="mainInfojoin" type="text" id="join_id" name="mb_id"
								placeholder="ID를 입력해주세요">
							<button type="button" id="check" onclick="idCheck()">중복확인</button>
							<p id="result"></p>
							<input class="mainInfojoin" type="password" onchange="pwcheck()"
								id="pw1" name="mb_pw" placeholder="비밀번호를 입력해주세요"> <br>
							<input class="mainInfojoin" type="password" onchange="pwcheck()"
								id="pw2" name="mb_pw" placeholder="비밀번호를 다시 입력해주세요"> <br>

							<input class="mainInfojoin" type="text" id="join_nick"
								name="mb_nick" placeholder="사용하실 닉네임을 입력해주세요">
							<button type="button" id="check" onclick="nickCheck()">중복확인</button>
							<p id="result1"></p>
							<br> <label for="gen" style="margin-left: 35px;">성별<br>
								<input name="mb_gender" type="radio" style="margin-left: 50px;"
								name="성별" value="M">남 <input name="mb_gender"
								type="radio" name="성별" value="F">여
							</label><br> <br> <label for="age" style="margin-left: 35px;">연령<br>
								<input id="age" name="mb_age" type="radio"
								style="margin-left: 50px;" value="10">10대 <input
								id="age" name="mb_age" type="radio" value="20">20대 <input
								id="age" name="mb_age" type="radio" value="30">30대<br>
								<input id="age" name="mb_age" type="radio"
								style="margin-left: 50px;" value="40">40대 <input
								id="age" name="mb_age" type="radio" value="50">50대 <input
								id="age" name="mb_age" type="radio" value="60">60대 이상
							</label><br> <br>
							<hr>
							<p id="pw_result"></p>

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
							<input id="loginId" class="mainInfologin" type="text"
								name="mb_id" placeholder="ID를 입력해주세요"> <input
								id="loginPw" class="mainInfologin" type="password" name="mb_pw"
								placeholder="비밀번호를 입력해주세요"> <br>
							<hr>
							<input type="submit" class="loginsub" value="로그인"> <br>
							<br>
						</form>
					</div>
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
	<hr class="hr_main">
	<h1 style="text-align: center; margin: 30px;">신간도서</h1>
	<%
		for (int i = 0; i < 8; i++) {
	%>
	<%
		if (i % 2 == 0) {
	%>
	<a href="BookInfo?no=<%=newbook.get(i).getBookSeq()%>">
		<div class="rank_tab" style="background-color: rgb(248, 246, 234)">

			<div class="th_img" style="display: inline-block;">


				<img src="<%=newbook.get(i).getBookCover()%>">
			</div>
			<div class="info_tab_bl">

				<ul>
					<li style="padding-top: 55px;">제목 : <%=newbook.get(i).getBookTitle()%></li>
					<br>
					<li>저자 : <%=newbook.get(i).getBookAuthor()%></li>
					<br>
					<li>출판사 : <%=newbook.get(i).getBookPublisher()%></li>
				</ul>

			</div>
		</div> <%
 	}
 %> <%
 	if (i % 2 == 1) {
 %> <a href="BookInfo?no=<%=newbook.get(i).getBookSeq()%>">
			<div class="rank_tab" style="background-color: rgb(248, 226, 234)">
				<div class="th_img" style="display: inline-block;">
					<img src="<%=newbook.get(i).getBookCover()%>">
				</div>
				<div class="info_tab_bl">
					<ul>
						<li style="padding-top: 55px;">제목 : <%=newbook.get(i).getBookTitle()%></li>
						<br>
						<li>저자 : <%=newbook.get(i).getBookAuthor()%></li>
						<br>
						<li>출판사 : <%=newbook.get(i).getBookPublisher()%></li>
					</ul>
				</div>
			</div> <%
 	}
 %> <%
 	}
 %> <script>
		function openjoin() {
			document.getElementById("overjoin").style.display = "block";
		}

		function openlogin() {
			document.getElementById("overlogin").style.display = "block";
		}

		function openupdate() {
			document.getElementById("overUpdate").style.display = "block";
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

		function closeupdate() {
			document.getElementById("overUpdate").style.display = "none";
		}

		function closeinfo() {
			document.getElementById("overinfo").style.display = "none";
		}
	</script> <script type="text/javascript">
		$(document).ready(function() {

			console.log("로딩");

		});
	</script> <script src="js/vendor/jquery-1.11.0.min.js"></script> <script>
		window.jQuery
				|| document
						.write('<script src="js/vendor/jquery-1.11.0.min.js"><\/script>')
	</script> <script src="js/bootstrap.js"></script> <script src="js/plugins.js"></script>
			<script src="js/main.js"></script> <script>
				function idCheck() {
					$.ajax({
						url : "CheckCon",
						type : "get",
						data : {
							"mb_id" : $('#join_id').val()
						},
						success : function(res) {
							console.log(res)
							if (res == 'true') {
								$('#result').html("중복된 아이디입니다.").css('color',
										'red');
							} else {
								$('#result').html("사용가능한 아이디입니다.").css('color',
										'green');
							}
						},
						error : function() {
							alert("요청실패!")
						}
					});
				}

				function pwcheck() {
					if ($('#pw1').val() == $('#pw2').val()) {
						$('#pw_result')
								.html(
										'<input type="submit" class="joinsub" value="회원가입을 완료합니다"> ');
					} else {
						$('#pw_result').html("비밀번호가 일치하지 않습니다.").css('color',
								'red');
					}
				}

				function nickCheck() {
					$.ajax({
						url : "nickCheckCon",
						type : "get",
						data : {
							"mb_nick" : $('#join_nick').val()
						},
						success : function(res) {
							console.log(res)
							if (res == 'true') {
								$('#result1').html("중복된 닉네임입니다.").css('color',
										'red');
							} else {
								$('#result1').html("사용가능한 닉네임입니다.").css(
										'color', 'green');
							}
						},
						error : function() {
							alert("요청실패!")
						}
					});
				}
			</script>
</body>
</html>