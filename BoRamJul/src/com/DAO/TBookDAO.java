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
	
	//책 상세페이지에 보여질 정보 조회
	public TBookDTO selectBookInfo(int b_seq){
		TBookDTO book = null;
		
		try {
			getConn();

			String sql = "select * from t_book where book_seq = ?";

			psmt = conn.prepareStatement(sql);
			psmt.setDouble(1, b_seq);

			rs = psmt.executeQuery();

			if (rs.next()) {
			    int bookSeq = rs.getInt(1);
			    String bookTitle = rs.getString(2);
			    Date bookDate = rs.getDate(3);
			    String bookAuthor = rs.getString(4);
			    String bookBrief = rs.getString(5);
			    String bookCat = rs.getString(6);
			    String bookPublisher = rs.getString(7);
			    int bookPages = rs.getInt(8);
			    String bookContent = rs.getString(9);
			    String bookCover = rs.getString(10);
			    String bookHashtag = rs.getString(11);
			    String bookKind = rs.getString(13);
			    int bookRank = rs.getInt(14);
			    Double bookSizeW = rs.getDouble(15);
			    Double bookSizeH = rs.getDouble(16);
				
				book = new TBookDTO(bookSeq, bookTitle, bookDate, bookAuthor, bookBrief, bookCat, bookPublisher, bookPages, bookContent, bookCover, bookHashtag, bookKind, bookRank, bookSizeW, bookSizeH);
			}
		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			close();
		}
		
		return book;
	}
	
	
	//메인페이지에 보여질 책정보 조회
	public ArrayList<TBookDTO> selectBookAll(){
		ArrayList<TBookDTO> arr = new ArrayList<TBookDTO>();
		
		try {
			getConn();

			String sql = "select book_seq, book_title, book_brief, book_cover from t_book";

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
	

}
