<%@page import="com.DTO.memberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.DAO.TBookDAO"%>
<%@page import="com.vo.TBookDTO"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.DTO.ExBoardDTO"%>
<%@page import="com.DAO.ExboardDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	memberDTO dto = (memberDTO) session.getAttribute("dto");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	SimpleDateFormat df = new SimpleDateFormat("YY-MM-dd HH:mm");

String sel = request.getParameter("sel"); // 검색 옵션의 value
String find = request.getParameter("find"); // 검색어 value

int pageSize = 5; // 한 페이지에 출력할 레코드 수

// 페이지 링크를 클릭한 번호 / 현재 페이지
String pageNum = request.getParameter("pageNum");
if (pageNum == null) { // 클릭한게 없으면 1번 페이지
	pageNum = "1";
}
// 연산을 하기 위한 pageNum 형변환 / 현재 페이지
int currentPage = Integer.parseInt(pageNum);

// 해당 페이지에서 시작할 레코드 / 마지막 레코드
int startRow = (currentPage - 1) * pageSize + 1;
int endRow = currentPage * pageSize;

int count = 0;
int fCount = 0;

ExboardDAO manager = ExboardDAO.getInstance();
count = manager.getCount(); // 데이터베이스에 저장된 총 갯수

fCount = manager.getfCount(sel, find); // DB에 저장된 검색어와 일치하는 총 갯수

List<ExBoardDTO> list = null;
List<ExBoardDTO> flist = null;

if (count > 0 && find == null) {
	// getList()메서드 호출 / 해당 레코드 반환
	list = manager.getList(startRow, endRow);
}

if (fCount > 0) {
	flist = manager.getfList(startRow, endRow, sel, find);
}
%>
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
<script src="http://code.jquery.com/jquery-latest.js"></script>
<title>보람줄 - 북작북작</title>

<style>
#board {
	width: 60%;
	margin-left: auto;
	margin-right: auto;
	border-top: 2px solid black;
	border-bottom: 2px solid black;
}

#board thead {
	border-bottom: 1px solid black;
	background-color: rgb(234, 245, 248);
	height: 50px;
}

#board thead tr th {
	text-align: center;
	vertical-align: middle;
	height: 30px;
}

#board tbody {
	border-bottom: 1px dotted black;
}

#board tbody tr {
	height: 70px;
}

#board tbody tr th {
	text-align: center;
	vertical-align: middle;
}

.write {
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
				<%
					if (dto == null) {
				%>
				<a onclick="openlogin()" style="font-size: 20px; font-weight: bold;">로그인&nbsp;&nbsp;&nbsp;</a>
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
							style="margin-left: 50px;" value="10">10대 <input id="age"
							name="mb_age" type="radio" value="20">20대 <input id="age"
							name="mb_age" type="radio" value="30">30대<br> <input
							id="age" name="mb_age" type="radio" style="margin-left: 50px;"
							value="40">40대 <input id="age" name="mb_age" type="radio"
							value="50">50대 <input id="age" name="mb_age" type="radio"
							value="60">60대 이상
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
					<form action="LoginCon" method="post" id="loginForm">
						<input id="loginId" class="mainInfologin" type="text" name="mb_id"
							placeholder="ID를 입력해주세요"> <input id="loginPw"
							class="mainInfologin" type="password" name="mb_pw"
							placeholder="비밀번호를 입력해주세요"> <br>
						<hr>
						<input type="submit" class="loginsub" value="로그인" form="loginForm"> <br>
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
	<center>
		<h1 style="text-align: center;">자유게시판</h1>
		(총 게시글 수 :<%=count%>/ 검색 데이터 수 :<%=fCount%>)
		<div>
			<table table id="board" border="0" class="table table-hover">
				<thead>
					<tr>
						<th style="width: 100px;">번호</th>
						<th style="width: 200px;">작성자</th>
						<th style="width: 500px;">제목</th>
						<th style="width: 100px;">작성일</th>
						<th style="width: 100px;">조희수</th>
					</tr>
					<%
						if (count > 0 && fCount == 0 && find == null) { // 데이터베이스에 데이터가 있으면
						int number = count - (currentPage - 1) * pageSize; // 글 번호 순번 
						for (int i = 0; i < list.size(); i++) {
							ExBoardDTO board = list.get(i); // 반환된 list에 담긴 참조값 할당
					%>
				</thead>
				<tbody>
					<tr>
						<td><%=number--%></td>
						<td><%=board.getName()%></td>
						<td>
							<%
								if (board.getLev() > 0) { // 답변글일 경우 
								for (int k = 0; k < board.getLev(); k++) {
							%> &nbsp;&nbsp; <%
				 	}
				 %> ⤷ <%
				 	} // if end
				 %> <%-- 제목을 클릭하면 get 방식으로 해당 항목의 no값과 pageNum을 갖고 content.jsp로 이동 --%>
					<a href="content.jsp?no=<%=board.getNo()%>&pageNum=<%=currentPage%>"><%=board.getSubject()%></a>
						</td>
						<td><%=df.format(board.getReg_date())%></td>
						<td><%=board.getReadCount()%></td>
					</tr>
					<%
						}
					} else if (count == 0) { // 데이터가 없으면
					%>
					<tr>
						<td colspan="6" align="center">게시글이 없습니다.</td>
					</tr>
					<%
						} else if (count > 0 && fCount != 0) { // 검색한 데이터가 있으면
					int number = fCount - (currentPage - 1) * pageSize; // 글 번호 순번
					for (int i = 0; i < flist.size(); i++) {
						ExBoardDTO board = flist.get(i);
					%>
					<tr>
						<td><%=number--%></td>
						<td><%=board.getName()%></td>
						<td>
							<%
								if (board.getLev() > 0) { // 답변글일 경우 
								for (int k = 0; k < board.getLev(); k++) {
							%> &nbsp;&nbsp; <%
 	}
 %> ⤷ <%
 	} // if end
 %> <%-- 제목을 클릭하면 get 방식으로 해당 항목의 no값과 pageNum, sel, find를 갖고 content.jsp로 이동 --%>
							<a
							href="content.jsp?no=<%=board.getNo()%>&pageNum=<%=currentPage%>&sel=<%=sel%>&find=<%=find%>"><%=board.getSubject()%></a>
						</td>
						<td><%=df.format(board.getReg_date())%></td>
						<td><%=board.getReadCount()%></td>
						<td><%=board.getIp()%></td>
					</tr>
					<%
						}
					} else { // 검색된 데이터가 없으면
					%>
					<tr>
						<td colspan="6" align="center">게시글이 없습니다.</td>
					</tr>
					<%
						}
					%>
					<tr>
						<td colspan="6" align="right">
							<%-- 버튼을 클릭하면 writeForm.jsp로 이동 --%> <%
					 	if (dto == null) {
					 %> <%
					 	} else if (dto != null) {
					 %> <input type="button" value="글작성"
												onclick="location.href='writeForm.jsp'"> <%
					 	}
					 %>
						</td>
					</tr>
					<tr>
						<td colspan="6" align="center">
							<%
								// 페이징  처리(모든 레코드)
							if (count > 0 && fCount == 0 && find == null) {
								// 총 페이지의 수
								int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
								// 한 페이지에 보여줄 페이지 블럭(링크) 수
								int pageBlock = 3;
								// 한 페이지에 보여줄 시작 및 끝 번호(예 : 1, 2, 3 ~ 10 / 11, 12, 13 ~ 20)
								int startPage = ((currentPage - 1) / pageBlock) * pageBlock + 1;
								int endPage = startPage + pageBlock - 1;

								// 마지막 페이지가 총 페이지 수 보다 크면 endPage를 pageCount로 할당
								if (endPage > pageCount) {
									endPage = pageCount;
								}

								if (startPage > pageBlock) { // 페이지 블록수보다 startPage가 클경우 이전 링크 생성
							%> <a href="list.jsp?pageNum=<%=startPage - 3%>">◀</a> <%
							 	}
							
							 for (int i = startPage; i <= endPage; i++) { // 페이지 블록 번호
							 if (i == currentPage) { // 현재 페이지에는 링크를 설정하지 않음
							 %> [<%=i%>] <%
							 	} else { // 현재 페이지가 아닌 경우 링크 설정
							 %> <a href="list.jsp?pageNum=<%=i%>">[<%=i%>]
													</a> <%
							 	}
							 } // for end
							
							 if (endPage < pageCount) { // 현재 블록의 마지막 페이지보다 페이지 전체 블록수가 클경우 다음 링크 생성
							 %> <a href="list.jsp?pageNum=<%=startPage + 3%>">▶</a> <%
							 	}
							 } else if (fCount > 0) { // 페이징 처리(검색 데이터)
							 // 검색된 레코드의 총 페이지의 수
							 int pageCount = fCount / pageSize + (fCount % pageSize == 0 ? 0 : 1);
							 // 한 페이지에 보여줄 페이지 블럭(링크) 수
							 int pageBlock = 10;
							 // 한 페이지에 보여줄 시작 및 끝 번호(예 : 1, 2, 3 ~ 10 / 11, 12, 13 ~ 20)
							 int startPage = ((currentPage - 1) / pageBlock) * pageBlock + 1;
							 int endPage = startPage + pageBlock - 1;
							
							 // 마지막 페이지가 총 페이지 수 보다 크면 endPage를 pageCount로 할당
							 if (endPage > pageCount) {
							 endPage = pageCount;
							 }
							
							 if (startPage > pageBlock) {
							 %> <a
													href="list.jsp?pageNum=<%=startPage - 10%>&sel=<%=sel%>&find=<%=find%>">◀</a>
							<%
								}

							for (int i = startPage; i <= endPage; i++) {
							if (i == currentPage) { // 현재 페이지는 링크를 설정하지 않음
							%> [<%=i%>] <%
								} else { // 현재 페이지가 아닌 경우 링크
							%> <a href="list.jsp?pageNum=<%=i%>&sel=<%=sel%>&find=<%=find%>">[<%=i%>]
						</a> <%
 	}
 }

 if (endPage < pageCount) {
 %> <a
							href="list.jsp?pageNum=<%=startPage + 10%>&sel=<%=sel%>&find=<%=find%>">▶</a>
							<%
								}
							}
							%>
						</td>
					</tr>
				</tbody>
			</table>
			<%-- 검색어 입력 form / get방식 / option value는 데이터베이스 칼럼과 동일하게 설정 --%>
			<form method="get" action="list.jsp" id="form2">
				<select name="sel">
					<option value="name">이름</option>
					<option value="subject">제목</option>
				</select> <input type="text" name="find" id="find"> <input
					type="submit" value="검색" form="form2">
			</form>
	</center>



	<script>
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
	</script>

	<script type="text/javascript">
		$(document).ready(function() {

			console.log("로딩");

		});
	</script>

	<script src="js/vendor/jquery-1.11.0.min.js"></script>
	<script>
		window.jQuery
				|| document
						.write('<script src="js/vendor/jquery-1.11.0.min.js"><\/script>')
	</script>
	<script src="js/bootstrap.js"></script>
	<script src="js/plugins.js"></script>
	<script src="js/main.js"></script>
	<script>
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
						$('#result').html("중복된 아이디입니다.").css('color', 'red');
					} else {
						$('#result').html("사용가능한 아이디입니다.")
								.css('color', 'green');
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
				$('#pw_result').html("비밀번호가 일치하지 않습니다.").css('color', 'red');
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
						$('#result1').html("중복된 닉네임입니다.").css('color', 'red');
					} else {
						$('#result1').html("사용가능한 닉네임입니다.").css('color',
								'green');
					}
				},
				error : function() {
					alert("요청실패!")
				}
			});
		}
		$(function() {
			$("#form2").submit(function() {
				if ($("#find").val() === "") {
					alert("검색어를 입력하세요.");
					$("#find").focus();
					return false;
				}
			})
		})
	</script>
</body>
</html>