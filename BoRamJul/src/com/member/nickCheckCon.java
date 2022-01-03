package com.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.memberDAO;

@WebServlet("/nickCheckCon")
public class nickCheckCon extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String mb_nick = request.getParameter("mb_nick");
		memberDAO dao = new memberDAO();
		System.out.println(mb_nick);
		boolean check = dao.nickCheck(mb_nick);
		
		PrintWriter out = response.getWriter();
		
		out.print(check);
	
	}
	
}
