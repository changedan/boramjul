<%@page import="com.DTO.ExBoardDTO"%>
<%@page import="com.DAO.ExboardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8"); // post 방식으로 전달된 값의 인코딩 타입 설정
	int no = Integer.parseInt(request.getParameter("no"));
	String pageNum = request.getParameter("pageNum");
	String sel = request.getParameter("sel");
	String find = request.getParameter("find");
	ExboardDAO manager = ExboardDAO.getInstance();
	ExBoardDTO oldDB = manager.getBoard(no);
%>
<%-- userBean 및 setProperty 액션태그를 이용하여 form에서 전달한 데이터를 board에 설정 --%>
<jsp:useBean id="board" class="com.DTO.ExBoardDTO" />
<jsp:setProperty property="*" name="board" />

<%
	board.setIp(request.getRemoteAddr()); // 작성자의 ip주소 설정
	// 부모 ref, step, lev와 동일한 값 설정
	board.setRef(oldDB.getRef());
	board.setStep(oldDB.getStep());
	board.setLev(oldDB.getLev());
	// reply 메서드 호출
	manager.reply(board);
%>
<script>
	alert("입력 완료");
<%
	if(sel == null && find == null){
%>
	location.href = "list.jsp?pageNum=<%=pageNum%>";
<%
	}else{
%>
	location.href = "list.jsp?pageNum=<%=pageNum%>&sel=<%=sel%>&find=<%=find%>";
<%
	}
%>
</script>