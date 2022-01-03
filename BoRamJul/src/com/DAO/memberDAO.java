package com.DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.http.HttpSession;

import com.DTO.memberDTO;

public class memberDAO {
	
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	int cnt = 0;
	private boolean check;
	
	public void getConn() {

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

			String url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524";
			String dbid = "cgi_7_2_1216";
			String dbpw = "smhrd2";

			conn = DriverManager.getConnection(url, dbid, dbpw);

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public void close() {

		try {
			if (rs != null) {
				rs.close();
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
	
	public int Join(String id, String pw, String nick, String gender, String age) {
		
		try {
			getConn();
			
			if (conn != null) {
			} else {
			}

			String sql = "insert into T_member values(?, ?, ?, ?, ?, sysdate, 'Y')";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, pw);
			psmt.setString(3, nick);
			psmt.setString(4, gender);
			psmt.setString(5, age);

			cnt = psmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			close();
		}
		
		return cnt;
	}
	
	public memberDTO Login(String mb_id, String mb_pw) {

	      memberDTO dto = null;
	      
	      try {
	         getConn();
	         
	         String sql = "select * from T_member where mb_id = ?";

	         psmt = conn.prepareStatement(sql);
	         psmt.setString(1, mb_id);

	         rs = psmt.executeQuery();

	         if (rs.next()) {
	        	 
	        	 String getpw = rs.getString(2);
	        	 String getnick = rs.getString(3);
	        	 String getgender = rs.getString(4);
	        	 Double getage = rs.getDouble(5);
	        	 Date getdate = rs.getDate(6);
	        	 
	        	 if(mb_pw.equals(getpw)) {
	    		 dto = new memberDTO(mb_id, getnick, getgender, getage, getdate);
	        	 }

	         } 

	      } catch (Exception e) {
	         e.printStackTrace();

	      } finally {
	         try {
	            close();
	         } catch (Exception e) {
	            e.printStackTrace();
	         }
	      }
		return dto;
	}
	
public boolean idCheck(String mb_id) {
		
		try {
			getConn();
			
			String sql = "select * from t_member where mb_id = ?";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, mb_id);
			
			rs = psmt.executeQuery();		
			
			check = rs.next();
		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			close();
		}
		return check;
	}

public boolean nickCheck(String mb_nick) {
	
	try {
		getConn();
		
		String sql = "select * from t_member where mb_nick = ?";

		psmt = conn.prepareStatement(sql);
		psmt.setString(1, mb_nick);
		
		rs = psmt.executeQuery();		
		
		check = rs.next();
	} catch (Exception e) {
		e.printStackTrace();

	} finally {
		close();
	}
	return check;
}

}
