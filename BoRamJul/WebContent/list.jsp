<%@page import="com.DTO.ExBoardDTO"%>
<%@page import="com.DAO.ExboardDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	SimpleDateFormat df = new SimpleDateFormat("YY-MM-dd HH:mm");
	
	String sel = request.getParameter("sel"); // 검색 옵션의 value
	String find = request.getParameter("find"); // 검색어 value

	int pageSize = 10; // 한 페이지에 출력할 레코드 수

	// 페이지 링크를 클릭한 번호 / 현재 페이지
	String pageNum = request.getParameter("pageNum");
	if (pageNum == null){ // 클릭한게 없으면 1번 페이지
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
	
	if(fCount > 0){
		flist = manager.getfList(startRow, endRow, sel, find);
	}
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 목록</title>
<%-- 검색버튼 클릭시 유효성 검사 --%>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	$(function(){
		$("form").submit(function(){
			if($("#find").val() === ""){
				alert("검색어를 입력하세요.");
				$("#find").focus();
				return false;
			}
		})
	})
</script>
</head>
<body>
	<center>
		<h3>게시판 목록</h3>
		(총 레코드 수 : <%=count%> / 검색 데이터 수 : <%=fCount%>)
		<table border="1" width="900">
			<tr>
				<td width="10%">번호</td>
				<td width="10%">이름</td>
				<td width="40%">제목</td>
				<td width="15%">작성일</td>
				<td width="10%">조회수</td>
				<td width="15%">ip</td>
			</tr>
			<%
				if (count > 0 && fCount == 0 && find == null) { // 데이터베이스에 데이터가 있으면
					int number = count - (currentPage - 1) * pageSize; // 글 번호 순번 
					for (int i = 0; i < list.size(); i++) {
						ExBoardDTO board = list.get(i); // 반환된 list에 담긴 참조값 할당
			%>
			<tr>
				<td><%=number--%></td>
				<td><%=board.getName()%></td>
				<td>
					<%
						if(board.getLev() > 0){ // 답변글일 경우 
							for(int k = 0; k < board.getLev(); k++){
					%>
						&nbsp;&nbsp;
					<%			
							}
					%>
						⤷
					<%	
						} // if end
					%>
					<%-- 제목을 클릭하면 get 방식으로 해당 항목의 no값과 pageNum을 갖고 content.jsp로 이동 --%>
					<a href="content.jsp?no=<%=board.getNo()%>&pageNum=<%=currentPage%>"><%=board.getSubject()%></a>
				</td>
				<td><%=df.format(board.getReg_date())%></td>
				<td><%=board.getReadCount()%></td>
				<td><%=board.getIp()%></td>
			</tr>
			<%
					}
				} else if(count == 0) { // 데이터가 없으면
			%>
			<tr>
				<td colspan="6" align="center">게시글이 없습니다.</td>
			</tr>
			<%
				} else if(count > 0 && fCount != 0){ // 검색한 데이터가 있으면
					int number = fCount - (currentPage - 1) * pageSize; // 글 번호 순번
					for(int i = 0; i<flist.size(); i++){
						ExBoardDTO board = flist.get(i);
			%>
			<tr>
				<td><%=number--%></td>
				<td><%=board.getName()%></td>
				<td>
					<%
						if(board.getLev() > 0){ // 답변글일 경우 
							for(int k = 0; k < board.getLev(); k++){
					%>
						&nbsp;&nbsp;
					<%			
							}
					%>
						⤷
					<%	
						} // if end
					%>
					<%-- 제목을 클릭하면 get 방식으로 해당 항목의 no값과 pageNum, sel, find를 갖고 content.jsp로 이동 --%> 
					<a href="content.jsp?no=<%=board.getNo()%>&pageNum=<%=currentPage%>&sel=<%=sel%>&find=<%=find%>"><%=board.getSubject()%></a>
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
					<%-- 버튼을 클릭하면 writeForm.jsp로 이동 --%>
					<input type="button" value="글작성"
					onclick="location.href='writeForm.jsp'">
				</td>
			</tr>
			<tr>
				<td colspan="6" align="center">
					<%	// 페이징  처리(모든 레코드)
						if(count > 0 && fCount == 0 && find == null){
							// 총 페이지의 수
							int pageCount = count / pageSize + (count%pageSize == 0 ? 0 : 1);
							// 한 페이지에 보여줄 페이지 블럭(링크) 수
							int pageBlock = 10;
							// 한 페이지에 보여줄 시작 및 끝 번호(예 : 1, 2, 3 ~ 10 / 11, 12, 13 ~ 20)
							int startPage = ((currentPage-1)/pageBlock)*pageBlock+1;
							int endPage = startPage + pageBlock - 1;
							
							// 마지막 페이지가 총 페이지 수 보다 크면 endPage를 pageCount로 할당
							if(endPage > pageCount){
								endPage = pageCount;
							}
							
							if(startPage > pageBlock){ // 페이지 블록수보다 startPage가 클경우 이전 링크 생성
					%>
								<a href="list.jsp?pageNum=<%=startPage - 10%>">[이전]</a>	
					<%			
							}
							
							for(int i=startPage; i <= endPage; i++){ // 페이지 블록 번호
								if(i == currentPage){ // 현재 페이지에는 링크를 설정하지 않음
					%>
									[<%=i %>]
					<%									
								}else{ // 현재 페이지가 아닌 경우 링크 설정
					%>
									<a href="list.jsp?pageNum=<%=i%>">[<%=i %>]</a>
					<%	
								}
							} // for end
							
							if(endPage < pageCount){ // 현재 블록의 마지막 페이지보다 페이지 전체 블록수가 클경우 다음 링크 생성
					%>
								<a href="list.jsp?pageNum=<%=startPage + 10 %>">[다음]</a>
					<%			
							}
						}else if(fCount > 0){ // 페이징 처리(검색 데이터)
							// 검색된 레코드의 총 페이지의 수
							int pageCount = fCount / pageSize + (fCount%pageSize == 0 ? 0 : 1);
							// 한 페이지에 보여줄 페이지 블럭(링크) 수
							int pageBlock = 10;
							// 한 페이지에 보여줄 시작 및 끝 번호(예 : 1, 2, 3 ~ 10 / 11, 12, 13 ~ 20)
							int startPage = ((currentPage-1)/pageBlock)*pageBlock+1;
							int endPage = startPage + pageBlock - 1;
							
							// 마지막 페이지가 총 페이지 수 보다 크면 endPage를 pageCount로 할당
							if(endPage > pageCount){
								endPage = pageCount;
							}
							
							if(startPage > pageBlock){
					%>
								<a href="list.jsp?pageNum=<%=startPage - 10%>&sel=<%=sel%>&find=<%=find%>">[이전]</a>	
					<%			
							}
							
							for(int i = startPage; i <= endPage; i++){
								if(i == currentPage){ // 현재 페이지는 링크를 설정하지 않음
					%>
								[<%=i%>]
					<%				
								}else{ // 현재 페이지가 아닌 경우 링크
					%>
								<a href="list.jsp?pageNum=<%=i%>&sel=<%=sel%>&find=<%=find%>">[<%=i %>]</a>
					<%				
								}
							}
							
							if(endPage < pageCount){
					%>
								<a href="list.jsp?pageNum=<%=startPage + 10 %>&sel=<%=sel%>&find=<%=find%>">[다음]</a>
					<%			
							}
						}
					%>
				</td>
			</tr>
		</table>
		<%-- 검색어 입력 form / get방식 / option value는 데이터베이스 칼럼과 동일하게 설정 --%>
		<form method="get" action="list.jsp">
			<select name="sel">
				<option value="name">이름</option>
				<option value="subject">제목</option>
			</select>
			<input type="text" name="find" id="find">
			<input type="submit" value="검색">
		</form>
	</center>
</body>
</html>