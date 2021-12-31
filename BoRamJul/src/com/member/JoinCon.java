package com.member;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.memberDAO;

@WebServlet("/JoinCon")
public class JoinCon extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");

		String id = request.getParameter("mb_id");
		String pw = request.getParameter("mb_pw");
		String nick = request.getParameter("mb_nick");
		String gender = request.getParameter("mb_gender");
		String age = request.getParameter("mb_age");
		
		memberDAO dao = new memberDAO();
		int cnt = dao.Join(id, pw, nick, gender, age);

		if (cnt > 0) {
			response.sendRedirect("main.jsp"); 
		} else {

		}
		
	}

}
