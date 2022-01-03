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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	memberDTO dto = (memberDTO) session.getAttribute("dto");
%>
<%
	// get 방식으로 전달된  no값을 할당
	int no = Integer.parseInt(request.getParameter("no"));
	ExboardDAO manager = ExboardDAO.getInstance();
	// getBoard 메서드로 해당 no의 데이터를 반환 받음
	ExBoardDTO board = manager.getBoard(no);
%>

<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/animate.css">
<link rel="stylesheet" href="css/templatemo_misc.css">
<link rel="stylesheet" href="style.css">
<script src="js/vendor/modernizr-2.6.1-respond-1.1.0.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>북작북작 - 수정</title>
<script src="./js/jquery-3.6.0.min.js"></script>
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
<%-- 유효성 검사 --%>
<script>
	$(function() {
		$("form").submit(function() {
			if ($("#name").val() === "") {
				alert("이름 입력");
				$("#name").focus();
				return false;
			}
			if ($("#passwd").val() === "") {
				alert("비밀번호 입력");
				$("#passwd").focus();
				return false;
			}
			if ($("#subject").val() === "") {
				alert("제목 입력");
				$("#subject").focus();
				return false;
			}
			if ($("#content").val() === "") {
				alert("내용 입력");
				$("#content").focus();
				return false;
			}
		})
	})
</script>
</head>
	<center>
		<h1 style="text-align: center;">게시글 수정</h1>
		<hr class="hr_main">
		
		<%-- 확인 시 post 방식으로 해당 값을 갖고 update.jsp로 이동 --%>
		<form action="update.jsp" method="post">
			<%-- hidden 값으로 no를 갖고 넘어감 / primary key --%>
			<input type="hidden" name="no" value="<%=no%>">
			<table border="1">
			<thead>
				<tr>				
					<th>작성자</th>
					<td><input style="text-align:center; display:block; margin: 0 auto;" type="text" name="name" id="name" value="<%=board.getName()%>"></td>
					<th>비밀번호</th>
					<td><input style="text-align:center; display:block; margin: 0 auto;" type="password" name="passwd" id="passwd"></td>
				</tr>
				<tr>
					<th>제목</th>
					<td colspan="3"><input style="text-align:center; display:block; margin: 0 auto;" type="text" name="subject" id="subject"
						size="58" value="<%=board.getSubject()%>"></td>
				</tr>
				<tr>
					<th>내용</th>
					<td colspan="3">
						<textarea style="display:block; margin: 0 auto;" rows="15" cols="60" name="content" id="content"><%=board.getContent() %></textarea>
					</td>
				</tr>
				<tr align="center">
					<td colspan="4"><input type="submit" value="확인"> 
					<input type="button" value="취소" onclick="history.go(-1)"></td>
				</tr>
			</thead>
			</table>
		</form>
	</center>
</body>
</html>