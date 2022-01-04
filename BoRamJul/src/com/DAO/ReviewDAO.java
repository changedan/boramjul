package com.DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpSession;

import com.DTO.ReviewDTO;
import com.DTO.memberDTO;
import com.vo.TBookDTO;

public class ReviewDAO {
	
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	int cnt = 0;
	

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
	
	public int Review(String book_title, String mb_nick, String review_content, double star_point, String tag1, String tag2, String tag3) {
				
			try {
				getConn();
				
				if (conn != null) {
				} else {
				}
				
				String sql = "insert into t_review("
						+ "book_title, "
						+ "mb_nick, "
						+ "review_content, "
						+ "star_point, "
						+ "review_tag1, "
						+ "review_tag2, "
						+ "review_tag3) "
						+ "values(?,?,?,?,?,?,?)";
	
				
				psmt = conn.prepareStatement(sql);
				
				psmt.setString(1,book_title);
				psmt.setString(2,mb_nick);
				psmt.setString(3,review_content);
				psmt.setDouble(4,star_point);
				psmt.setString(5,tag1);
				psmt.setString(6,tag2);
				psmt.setString(7,tag3);
				
				cnt = psmt.executeUpdate();
	
			} catch (Exception e) {
				e.printStackTrace();
	
			} finally {
				close();
			}
			
			return cnt;
		}
	
	public ArrayList<ReviewDTO> selectReview() {
		ArrayList<ReviewDTO> review = new ArrayList<ReviewDTO>();

		try {
			getConn();

			String sql = "select a.review_content, a.star_point, a.review_date, a.mb_nick from t_review a, t_book b where a.book_title = b.book_title order by a.star_point";
			
			psmt = conn.prepareStatement(sql);

			rs = psmt.executeQuery();

			while (rs.next()) {
				String review_content = rs.getString(1);
				Double review_star = rs.getDouble(2);
				Date review_date = rs.getDate(3);
				String mb_nick = rs.getString(4);

				review.add(new ReviewDTO(review_content, review_star, review_date, mb_nick));
			}
		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			close();
		}

		return review;
	}

	
			
}
