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
		String joinDate = request.getParameter("joinDate");
		String admin = request.getParameter("admin");

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("Ŭ�������� �ε��Ϸ�");

			String url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524";
			String dbid = "cgi_7_2_1216";
			String dbpw = "smhrd2";

			conn = DriverManager.getConnection(url, dbid, dbpw);

			if (conn != null) {
				System.out.println("���Ἲ��");
			} else {
				System.out.println("�������");
			}

			String sql = "insert into T_member values(?, ?, ?, ?, ?, sysdate, 'Y')";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, pw);
			psmt.setString(3, nick);
			psmt.setString(4, gender);
			psmt.setString(5, age);

			// 6. SQL��ɹ� ����
			int cnt = psmt.executeUpdate();

			// 7. ��� �� ó��
			if (cnt > 0) {
				response.sendRedirect("main.jsp"); // ȸ�������� �����ϸ� ������ �̵�
			} else {

			}

		} catch (Exception e) {
			System.out.println("Ŭ�������� �ε�����");
			e.printStackTrace();

		} finally {
			System.out.println("�����ǽ���");
			try {
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
