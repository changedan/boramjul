package com.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.vo.TBookDTO;

public class TBookDAO {

	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;

	int cnt = 0;
	TBookDTO dto = null;
	
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
	
	public ArrayList<String> selectCover() {

		ArrayList<String> arr = new ArrayList<String>();

		try {
			getConn();

			String sql = "select book_cover from t_book";

			psmt = conn.prepareStatement(sql);

			rs = psmt.executeQuery();

			while (rs.next() == true) {
				String cover = rs.getString(1);
				
				
				arr.add(cover);
			}
		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			close();
		}
		return arr;
	}
	
	public ArrayList<String> selectTitle() {

		ArrayList<String> arr1 = new ArrayList<String>();

		try {
			getConn();

			String sql = "select book_title from t_book";

			psmt = conn.prepareStatement(sql);

			rs = psmt.executeQuery();

			while (rs.next() == true) {
				String title = rs.getString(1);
				
				
				arr1.add(title);
			}
		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			close();
		}
		return arr1;
	}
}
