<%@page import="com.DAO.ExboardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<%-- userBean 및 setProperty 액션태그를 이용하여 form에서 전달한 데이터를 board에 설정 --%>
<jsp:useBean id="board" class="com.DTO.ExBoardDTO" />
<jsp:setProperty property="*" name="board" />

<%
	board.setIp(request.getRemoteAddr()); // 작성자의 ip주소 설정

	ExboardDAO manager = ExboardDAO.getInstance();
	manager.insertDB(board); // isert 수행 메서드 호출 및 데이터(객체) 전달
%>
<script>
	alert("입력 완료");
	location.href = "list.jsp";
</script>