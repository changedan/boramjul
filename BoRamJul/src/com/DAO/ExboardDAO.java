package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.DTO.ExBoardDTO;

public class ExboardDAO {
	private Connection conn;
	private PreparedStatement ppst;
	private ResultSet rs;

	// 싱글톤
	private static ExboardDAO instance = new ExboardDAO();

	private ExboardDAO() {
	}

	public static ExboardDAO getInstance() {
		return instance;
	}

	// 커넥션 풀 이용
	private Connection getConnection() throws Exception {
		Context initCtx = new InitialContext();
		DataSource ds = (DataSource) initCtx.lookup("java:comp/env/jdbc/orcl");
		return ds.getConnection();
	}

	// 데이터베이스 연결 종료
	private void quitDB() {
		try {
			if (rs != null)
				rs.close();
			if (ppst != null)
				ppst.close();
			if (conn != null)
				conn.close();
		} catch (Exception e) {
			e.getStackTrace();
		}
	}

	// 리스트 페이지에 보여줄 로직(페이징 처리)
			public List<ExBoardDTO> getList(int startRow, int endRow) {
				// 페이징 처리를 위한 sql / 인라인뷰, rownum 사용
				String sql = "select * from "
						+ "(select rownum rn, no, name, passwd, subject, content, reg_date, readcount, ip, ref, step, lev from "
						+ "(select * from exboard order by ref desc, step asc)) where rn between ? and ?";
				List<ExBoardDTO> list = null;
				try {
					conn = getConnection(); // 커넥션을 얻어옴
					ppst = conn.prepareStatement(sql); // sql 정의
					ppst.setInt(1, startRow); // sql 물음표에 값 매핑
					ppst.setInt(2, endRow);
					rs = ppst.executeQuery(); // sql 실행
					if (rs.next()) { // 데이터베이스에 데이터가 있으면 실행
						list = new ArrayList<>(); // list 객체 생성
						do {
							// 반복할 때마다 ExboardDTO 객체를 생성 및 데이터 저장
							ExBoardDTO board = new ExBoardDTO();
							board.setNo(rs.getInt("no"));
							board.setName(rs.getString("name"));
							board.setPasswd(rs.getString("passwd"));
							board.setSubject(rs.getString("subject"));
							board.setContent(rs.getString("content"));
							board.setReg_date(rs.getTimestamp("reg_date"));
							board.setReadCount(rs.getInt("readcount"));
							board.setIp(rs.getString("ip"));
							board.setRef(rs.getInt("ref"));
							board.setStep(rs.getInt("step"));
							board.setLev(rs.getInt("lev"));

							list.add(board); // list에 0번 인덱스부터 board 객체의 참조값을 저장
						} while (rs.next());
					}
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					quitDB(); // DB 연결 종료 / Connection 반환
				}
				return list; // list 반환
			}
	
	// 리스트 페이지에 보여줄 검색 관련 로직(페이징 처리)
			public List<ExBoardDTO> getfList(int startRow, int endRow, String sel, String find) {
				// 검색 페이징 처리를 위한 sql / 인라인뷰, rownum 사용
				String sql = "select * from "
						+ "(select rownum rn, no, name, passwd, subject, content, reg_date, readcount, ip, ref, step, lev from "
						+ "(select * from exboard where "+sel+" like '%"+find+"%' order by ref desc, step asc)) where rn between ? and ?";
				List<ExBoardDTO> list = null;
				try {
					conn = getConnection(); // 커넥션을 얻어옴
					ppst = conn.prepareStatement(sql); // sql 정의
					ppst.setInt(1, startRow); // sql 물음표에 값 매핑
					ppst.setInt(2, endRow);
					rs = ppst.executeQuery(); // sql 실행
					if (rs.next()) { // 데이터베이스에 데이터가 있으면 실행
						list = new ArrayList<>(); // list 객체 생성
						do {
							// 반복할 때마다 ExboardDTO 객체를 생성 및 데이터 저장
							ExBoardDTO board = new ExBoardDTO();
							board.setNo(rs.getInt("no"));
							board.setName(rs.getString("name"));
							board.setPasswd(rs.getString("passwd"));
							board.setSubject(rs.getString("subject"));
							board.setContent(rs.getString("content"));
							board.setReg_date(rs.getTimestamp("reg_date"));
							board.setReadCount(rs.getInt("readcount"));
							board.setIp(rs.getString("ip"));
							board.setRef(rs.getInt("ref"));
							board.setStep(rs.getInt("step"));
							board.setLev(rs.getInt("lev"));

							list.add(board); // list에 0번 인덱스부터 board 객체의 참조값을 저장
						} while (rs.next());
					}
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					quitDB(); // DB 연결 종료 / Connection 반환
				}
				return list; // list 반환
			}

	// insert 로직(원문)
		public void insertDB(ExBoardDTO board) {
			String sql = "insert into exboard values"
					+ "(seq_exboard.nextval,?,?,?,?,sysdate,0,?,seq_exboard.nextval,0,0)";
			try {
				conn = getConnection();
				ppst = conn.prepareStatement(sql);
				// 물음표에 매개변수로 전달된 데이터 매핑
				ppst.setString(1, board.getName());
				ppst.setString(2, board.getPasswd());
				ppst.setString(3, board.getSubject());
				ppst.setString(4, board.getContent());
				ppst.setString(5, board.getIp());
				ppst.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				quitDB();
			}
		}
		
		// 답변글 작성 로직
		public void reply(ExBoardDTO board){
			String sql = "update exboard set step = step+1 where ref = ? and step > ?";
			String sql2 = "insert into exboard values(seq_exboard.nextval,?,?,?,?,sysdate,0,?,?,?,?)";
			int ref = board.getRef();
			int step = board.getStep();
			int lev = board.getLev();
			try {
				conn = getConnection();
				// 동일한 ref를 갖는 레코드 중 부모글의 step 보다 큰 레코드는 step을 1씩 증가(답변글의 최신순 정렬에 사용)
				ppst = conn.prepareStatement(sql);
				ppst.setInt(1, ref);
				ppst.setInt(2, step);
				ppst.executeUpdate();
				
				// 부모의 ref와 동일한 값을 갖고, step 및 lev은 1씩 큰 값을 데이터베이스에 입력
				ppst = conn.prepareStatement(sql2);
				ppst.setString(1, board.getName());
				ppst.setString(2, board.getPasswd());
				ppst.setString(3, board.getSubject());
				ppst.setString(4, board.getContent());
				ppst.setString(5, board.getIp());
				ppst.setInt(6, ref);
				ppst.setInt(7, step+1);
				ppst.setInt(8, lev+1);
				
				ppst.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				quitDB();
			}
		}

	// 제목을 클릭하였을 때 조회수 증가
	public void readCount(int no) {
		String sql = "update exboard set readcount = readcount + 1 where no = " + no;
		try {
			conn = getConnection();
			ppst = conn.prepareStatement(sql);
			ppst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			quitDB();
		}
	}

	// 제목을 클릭하였을 때 특정 항목을 검색할 로직
		public ExBoardDTO getBoard(int no) {
			String sql = "select * from exboard where no = ?";
			ExBoardDTO board = null;
			try {
				conn = getConnection();
				ppst = conn.prepareStatement(sql);
				ppst.setInt(1, no);
				rs = ppst.executeQuery();
				if (rs.next()) {
					board = new ExBoardDTO();
					board.setNo(rs.getInt("no"));
					board.setName(rs.getString("name"));
					board.setPasswd(rs.getString("passwd"));
					board.setSubject(rs.getString("subject"));
					board.setContent(rs.getString("content"));
					board.setReg_date(rs.getTimestamp("reg_date"));
					board.setReadCount(rs.getInt("readcount"));
					board.setIp(rs.getString("ip"));
					board.setRef(rs.getInt("ref"));
					board.setRef(rs.getInt("ref"));
					board.setStep(rs.getInt("step"));
					board.setLev(rs.getInt("lev"));
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				quitDB();
			}
			return board;
		}

	// update 로직
	public void updateDB(ExBoardDTO board) {
		String sql = "update exboard set name = ?, subject = ?, content = ? where no = ?";
		try {
			conn = getConnection();
			ppst = conn.prepareStatement(sql);
			ppst.setString(1, board.getName());
			ppst.setString(2, board.getSubject());
			ppst.setString(3, board.getContent());
			ppst.setInt(4, board.getNo());
			ppst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			quitDB();
		}
	}

	// 해당 데이터 삭제
	public void deleteDB(int no) {
		String sql = "delete from exboard where no = " + no;
		try {
			conn = getConnection();
			ppst = conn.prepareStatement(sql);
			ppst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			quitDB();
		}
	}

	// 총 레코드 수 구하는 로직
	public int getCount() {
		int count = 0;
		String sql = "select count(*) from exboard";
		try {
			conn = getConnection();
			ppst = conn.prepareStatement(sql);
			rs = ppst.executeQuery();
			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			quitDB();
		}
		return count; // 총 레코드 수 리턴
	}

	// 검색어와 일치하는 레코드 수를 구하는 로직
	public int getfCount(String sel, String find) {
		int fCount = 0;
		String sql = "select count(*) from exboard where " + sel + " like '%" + find + "%'";
		try {
			conn = getConnection();
			ppst = conn.prepareStatement(sql);
			rs = ppst.executeQuery();
			if (rs.next()) {
				fCount = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			quitDB();
		}
		return fCount; // 총 레코드 수 리턴
	}
}
