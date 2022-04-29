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
import javax.servlet.http.HttpSession;

@WebServlet("/LoginCon")
public class LoginCon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	      request.setCharacterEncoding("utf-8");

	      String id = request.getParameter("mb_id");
	      String pw = request.getParameter("mb_pw");

	      Connection conn = null;
	      PreparedStatement psmt = null;
	      ResultSet rs = null;
	      
	      HttpSession session = request.getSession();

	      try {
	         Class.forName("oracle.jdbc.driver.OracleDriver");

	         String url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524";
	         String dbid = "cgi_7_2_1216";
	         String dbpw = "smhrd2";

	         conn = DriverManager.getConnection(url, dbid, dbpw);
	         
	         String sql = "select * from T_member where mb_id = ? and mb_pw = ?";

	         psmt = conn.prepareStatement(sql);
	         psmt.setString(1, id);
	         psmt.setString(2, pw);

	         rs = psmt.executeQuery();

	         if (rs.next() == true) {
	            session.setAttribute("mb_id",id);
	            response.sendRedirect("main.jsp");
	         } else {
	        	 response.sendRedirect("Join.html");
	         }

	      } catch (Exception e) {
	         e.printStackTrace();

	      } finally {
	         try {
	            if (rs != null) {
	               psmt.close();
	            }
	            if (psmt != null) {
	               psmt.close();
	            }
	            if (conn != null) {
	               conn.close();
	            }
	         } catch (Exception e) {
	            e.printStackTrace();
	         }
	      }
	      
	
	}

}
