<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%	
	int no = Integer.parseInt(request.getParameter("no"));
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>북작북작 - 삭제</title>
<style>
table {
	width: 20%;
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
<body>
	<center>
		<%-- 삭제 클릭시 delete.jsp로 post 방식으로 이동 / 값 전달(no, passwd) --%>
		<h1 style="text-align: center;">게시글 삭제</h1>
		<hr class="hr_main">
		
		<form action="delete.jsp" method="post">
			<input type="hidden" name="no" value="<%=no%>">
			<table border="1">
			<thead>
				<tr>
					<th>비밀번호</th>
					<td><input style="display:block; margin: 0 auto; type="password" name="passwd"></td>
				</tr>
				
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="삭제"> 
						<input type="button" value="취소" onclick="history.go(-1)">
					</td>
				</tr>
			</thead>
			</table>
		</form>
	</center>
</body>
</html>