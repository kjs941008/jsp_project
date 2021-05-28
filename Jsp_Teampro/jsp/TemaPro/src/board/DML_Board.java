package board;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
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
//	private Statement stmt = null;
//	private CallableStatement cs = null;
	private ResultSet rs = null;
	private Board article = null;
//	private Board_Info info = null;
	private List<Object> list = null;

	/**
	 * 게시글 작성.
	 * 
	 * @param bid      게시판 아이디(FK)
	 * @param mid      회원 아이디(FK)
	 * @param title    글 제목
	 * @param content  글 내용
	 * @param reg_date 작성 일자
	 * @return > 0 QUERY OK || == 0 QUERY DOESNT WORK || == -1 ERROR
	 */
	public int insert_article(int bid, int mid, String title, String content, Date reg_date) {
		int result = -1;
		String sql = "INSERT INTO board_list (bid, mid, title, content, reg_date) VALUES (?, ?, ?, ?, ?)";
		try {
			if (conn == null)
				conn = DBConnect.getInstance();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bid);
			pstmt.setInt(2, mid);
			pstmt.setString(3, title);
			pstmt.setString(4, content);
			// TODO 글 작성 시간
			pstmt.setDate(5, null);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs = null;
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
	 * 게시글 수정.
	 * 
	 * @param article_idx 글 번호(PK)
	 * @param title       글 제목
	 * @param content     글 내용
	 * @param mod_date    수정 일자
	 * @return > 0 QUERY OK || == 0 QUERY DOESNT WORK || == -1 ERROR
	 */
	public int update_article(int article_idx, String title, String content, Date mod_date) {
		int result = -1;
		String sql = "UPDATE charge.board_list SET title = ?, content = ?, mod_date = ? WHERE article_idx = ?";
		try {
			if (conn == null)
				conn = DBConnect.getInstance();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			// TODO 글 수정 시간
			pstmt.setDate(3, null);
			pstmt.setInt(4, article_idx);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs = null;
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
	 * 게시글 삭제.
	 * 
	 * @param article_idx 글 번호(PK)
	 * @return > 0 QUERY OK || == 0 QUERY DOESNT WORK || == -1 ERROR
	 */
	public int delete_article(int article_idx) {
		int result = -1;
		String sql = "DELETE FROM board_list WHERE article_idx = ?";
		try {
			if (conn == null)
				conn = DBConnect.getInstance();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, article_idx);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs = null;
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
	 * 제목(title), 내용(content), 제목+내용(title_content)
	 */
	public static enum SEL_OPT {
		/**
		 * 제목으로 검색
		 */
		title,
		/**
		 * 내용으로 검색
		 */
		content,
		/**
		 * 제목+내용으로 검색
		 */
		title_content
	}

	/**
	 * 게시글 검색 첫 번째. 제목과 내용을 검색
	 * 
	 * @param bool  T: 검색 조건 있음 || F: 검색 조건 없음
	 * @param opt   검색 조건(제목, 내용, 제목+내용)
	 * @param param 검색 내용
	 * @return
	 */
	public Board[] select_article1(boolean bool, SEL_OPT opt, String param) {
		list = new ArrayList<>();
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT * FROM board_list");
		String sql = "";
		try {
			if (conn == null)
				conn = DBConnect.getInstance();
			if (bool)
				switch (opt) {
				case title:
					sb.append(" WHERE title LIKE ?");
					break;
				case content:
					sb.append(" WHERE content LIKE ?");
					break;
				case title_content:
					sb.append(" WHERE title LIKE ? OR content LIKE ?");
					break;
				}
			sql = sb.toString();
			pstmt = conn.prepareStatement(sql);
			if (bool) {
				pstmt.setString(1, param);
				if (opt == SEL_OPT.title_content)
					pstmt.setString(2, param);
			}
			rs = pstmt.executeQuery();
			while (rs.next()) {
				article = new Board();
				article.setArticle_idx(rs.getInt("article_idx"));
				article.setBid(rs.getInt("bid"));
				article.setMid(rs.getInt("mid"));
				article.setTitle(rs.getString("title"));
				article.setContent(rs.getString("content"));
				article.setReg_date(rs.getDate("reg_date"));
				article.setMod_date(rs.getDate("mod_date"));
				list.add(article);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs = null;
				if (pstmt != null)
					pstmt = null;
				if (conn != null)
					conn = null;
			} catch (Exception ef) {
				ef.printStackTrace();
			}
		}
		return (Board[]) list.toArray();
	}
	// TODO 게시글 검색 두 번째. 회원 정보(회원번호, 아이디, 이름)로 검색
	// int mid, String userid, String uname
}