package com.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;

import javax.swing.border.TitledBorder;

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

	// 책 상세페이지에 보여질 정보 조회
	public TBookDTO selectBookInfo(int b_seq) {
		TBookDTO book = null;

		try {
			getConn();

			String sql = "select * from t_book where book_seq = ?";

			psmt = conn.prepareStatement(sql);
			psmt.setDouble(1, b_seq);

			rs = psmt.executeQuery();

			if (rs.next()) {

				int book_Seq = rs.getInt(1);
				String book_Title = rs.getString(2);
				Date book_Date = rs.getDate(3);
				String book_Author = rs.getString(4);
				String book_Brief = rs.getString(5);
				String book_Cat = rs.getString(6);
				String book_Publisher = rs.getString(7);
				int book_Pages = rs.getInt(8);
				String book_Content = rs.getString(9);
				String book_Cover = rs.getString(10);
				String book_Hashtag = rs.getString(11);
				String book_Kind = rs.getString(13);
				int book_Rank = rs.getInt(14);
				Double book_SizeW = rs.getDouble(15);
				Double book_SizeH = rs.getDouble(16);

				book = new TBookDTO(book_Seq, book_Title, book_Date, book_Author, book_Brief, book_Cat, book_Publisher,
						book_Pages, book_Content, book_Cover, book_Hashtag, book_Kind, book_Rank, book_SizeW,
						book_SizeH);
			}
		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			close();
		}

		return book;
	}

	// 메인페이지에 보여질 책정보 조회
	public ArrayList<TBookDTO> selectBookAll() {
		ArrayList<TBookDTO> arr = new ArrayList<TBookDTO>();

		try {
			getConn();

			String sql = "SELECT a.book_seq, a.book_title, a.book_brief, a.book_cover FROM T_BOOK a, T_best b WHERE a.book_title = b.book_title order by b.book_rank";

			psmt = conn.prepareStatement(sql);

			rs = psmt.executeQuery();

			while (rs.next()) {
				int book_seq = rs.getInt(1);
				String book_title = rs.getString(2);
				String book_brief = rs.getString(3);
				String book_cover = rs.getString(4);

				arr.add(new TBookDTO(book_seq, book_title, book_brief, book_cover));
			}
		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			close();
		}

		return arr;
	}

	// 책 베스트 셀러 보여질 정보 조회
	public ArrayList<TBookDTO> selectbest() {
		ArrayList<TBookDTO> best = new ArrayList<TBookDTO>();

		try {
			getConn();

			String sql = "SELECT a.book_seq, a.book_title, a.book_author, a.book_cover, a.book_publisher FROM T_BOOK a, T_best b WHERE a.book_title = b.book_title order by b.book_rank";

			psmt = conn.prepareStatement(sql);

			rs = psmt.executeQuery();

			while (rs.next()) {
				int book_seq = rs.getInt(1);
				String book_title = rs.getString(2);
				String book_author = rs.getString(3);
				String book_cover = rs.getString(4);
				String book_publisher = rs.getString(5);
				
				
				best.add(new TBookDTO(book_seq, book_title, book_author, book_cover, book_publisher));
			}
		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			close();
		}

		return best;
	}

	// 책 신간 보여질 정보 조회
		public ArrayList<TBookDTO> selectnew() {
			ArrayList<TBookDTO> newbook = new ArrayList<TBookDTO>();

			try {
				getConn();

				String sql = "SELECT a.book_seq, a.book_title, a.book_brief, a.book_cover, a.book_author, a.book_publisher FROM T_BOOK a, T_new b WHERE a.book_title = b.book_title order by b.book_rank";

				psmt = conn.prepareStatement(sql);

				rs = psmt.executeQuery();

				while (rs.next()) {
					int book_seq = rs.getInt(1);
					String book_title = rs.getString(2);
					String book_brief = rs.getString(3);
					String book_cover = rs.getString(4);
					String book_author = rs.getString(5);
					String book_publisher = rs.getString(6);

					newbook.add(new TBookDTO(book_seq, book_title, book_brief, book_cover, book_author , book_publisher));
				}
			} catch (Exception e) {
				e.printStackTrace();

			} finally {
				close();
			}

			return newbook;
		}
		
		// 책 스테디 보여질 정보 조회
				public ArrayList<TBookDTO> selecsteady() {
					ArrayList<TBookDTO> steady = new ArrayList<TBookDTO>();

					try {
						getConn();

						String sql = "SELECT a.book_seq, a.book_title, a.book_brief, a.book_cover, a.book_author, a.book_publisher FROM T_BOOK a, T_steady b WHERE a.book_title = b.book_title order by b.book_rank";

						psmt = conn.prepareStatement(sql);

						rs = psmt.executeQuery();

						while (rs.next()) {
							int book_seq = rs.getInt(1);
							String book_title = rs.getString(2);
							String book_brief = rs.getString(3);
							String book_cover = rs.getString(4);
							String book_author = rs.getString(5);
							String book_publisher = rs.getString(6);

							steady.add(new TBookDTO(book_seq, book_title, book_brief, book_cover, book_author , book_publisher));
						}
					} catch (Exception e) {
						e.printStackTrace();

					} finally {
						close();
					}

					return steady;
				}
	
}
