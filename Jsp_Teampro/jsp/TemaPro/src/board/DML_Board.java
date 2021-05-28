package board;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;

import DB.DBConnect;

/**
 * DML: SELECT || INSERT || UPDATE || DELETE row(s)
 * 
 * @author jaemoonnlee
 *
 */
public class DML_Board {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private Statement stmt = null;
	private CallableStatement cs = null;
	private ResultSet rs = null;
	private Board article = null;
	private Board_Info info = null;
	private List<Object> list = null;

	/**
	 * 
	 * @param input_bid PK, int
	 * @param input_bname varchar(20)
	 * @return > 0 QUERY OK
	 * || == 0 QUERY DOESNT WORK
	 * || == -1 ERROR
	 */
	public int insert_board_info(int input_bid, String input_bname) {
		int result = -1;
		String sql = "INSERT INTO board_info (bid, bname) VALUES (?, ?)";
		try {
			if (conn == null)
				conn = DBConnect.getInstance();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, input_bid);
			pstmt.setString(2, input_bname);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs = null;
//				if (cs != null)
//					cs = null;
//				if (stmt != null)
//					stmt = null;
				if (pstmt != null)
					pstmt = null;
				if (conn != null)
					conn = null;
			} catch (Exception ef) {
				ef.printStackTrace();
			}
		}
		return result;
	}

	/**
	 * 입력한 ID가 DB에 존재하는지 확인
	 * 
	 * @param input_id
	 * @return 1 = exist || 0 = no exist || -1 = error
	 */
	public int find_userid(String input_id) {
		int result = -1;
//		StringBuilder sb = new StringBuilder();
		String sql = "SELECT * FROM charge.member_list WHERE USERID = '?'";
		try {
			if (conn == null)
				conn = DBConnect.getInstance();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, input_id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = 1;
			} else
				result = 0;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs = null;
//				if (cs != null)
//					cs = null;
//				if (stmt != null)
//					stmt = null;
				if (pstmt != null)
					pstmt = null;
				if (conn != null)
					conn = null;
			} catch (Exception ef) {
				ef.printStackTrace();
			}
		}
		return result;
	}
}