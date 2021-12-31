package com.member;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.memberDAO;
import com.DTO.memberDTO;

@WebServlet("/LoginCon")
public class LoginCon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	      request.setCharacterEncoding("utf-8");

	      String mb_id = request.getParameter("mb_id");
	      String mb_pw = request.getParameter("mb_pw");
	      
	      memberDAO dao = new memberDAO();
	      memberDTO dto = dao.Login(mb_id,mb_pw);
	      
     	 if(dto!=null) {
    		 
    		 HttpSession session = request.getSession();
    		 session.setAttribute("dto", dto);
    		 response.sendRedirect("main.jsp");
    		 
    	 }else {
        	 response.sendRedirect("LoginFalse.jsp");
         }
	      
	
	}

}
