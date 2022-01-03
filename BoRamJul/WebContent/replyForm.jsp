<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	int no = Integer.parseInt(request.getParameter("no"));
	String pageNum = request.getParameter("pageNum");
	String sel = request.getParameter("sel");
	String find = request.getParameter("find");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글작성 양식</title>
<script src="./js/jquery-3.6.0.min.js"></script>
<script src="check.js"></script>
</head>
<body>
	<center>
		<h3>글작성 양식</h3>
		<%-- 확인(submit) 클릭시 post 방식으로 해당 값을 reply.jsp로 전달 --%>
		<form action="reply.jsp" method="post">
			<input type="hidden" name="no" value="<%=no%>">
			<input type="hidden" name="pageNum" value="<%=pageNum%>">
			<%
			if(sel != null && find != null){ // 검색기능을 사용하였을 때 sel과 find를 넘겨줌
			%>
			<input type="hidden" name="sel" value="<%=sel%>">
			<input type="hidden" name="find" value="<%=find%>">
			<%	
			}
			%>
			<table border="1">
				<tr>
					<td>이름</td>
					<td><input type="text" name="name" id="name"></td>
					<td>비밀번호</td>
					<td><input type="password" name="passwd" id="passwd"></td>
				</tr>
				<tr>
					<td>제목</td>
					<td colspan="3"><input type="text" name="subject" id="subject" size="58" value="[답변] "></td>
				</tr>
				<tr>
					<td>내용</td>
					<td colspan="3"><textarea rows="15" cols="60" name="content" id="content"></textarea></td>
				</tr>
				<tr align="center">
					<td colspan="4">
						<input type="submit" value="확인"> 
						<input type="button" value="취소" onclick="history.go(-1)">
					</td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>