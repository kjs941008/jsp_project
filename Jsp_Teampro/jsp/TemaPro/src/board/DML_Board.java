package board;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.TimeZone;

import DB.DBConnect;
import DB.MySQL;

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
	private List<Board> list = null;
	private Timestamp ts = null;
	private SimpleDateFormat sdf = null;

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
			ts = new Timestamp(System.currentTimeMillis());
			sdf = new SimpleDateFormat(MySQL.FORM_TIME24HOURS);
			sdf.setTimeZone(TimeZone.getTimeZone("Asia/Seoul"));
			pstmt.setTimestamp(5, Timestamp.valueOf(sdf.format(ts)));
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
			ts = new Timestamp(System.currentTimeMillis());
			sdf = new SimpleDateFormat(MySQL.FORM_TIME24HOURS);
			sdf.setTimeZone(TimeZone.getTimeZone("Asia/Seoul"));
			pstmt.setTimestamp(3, Timestamp.valueOf(sdf.format(ts)));
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
	 * @param opt   검색 조건(제목, 내용, 제목+내용)
	 * @param param 검색 내용
	 * @return
	 */
	public ArrayList<Board> select_article1(SEL_OPT opt, String param, int page, int maxRow) {
		list = new ArrayList<>();
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT * FROM board_list");
		String sql = "";
		try {
			if (conn == null)
				conn = DBConnect.getInstance();
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
			sb.append(" LIMIT ");
			sb.append(maxRow);
			sb.append(" OFFSET ");
			sb.append(maxRow * (page - 1));
			sql = sb.toString();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, param);
			if (opt == SEL_OPT.title_content)
				pstmt.setString(2, param);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				article = new Board();
				article.setArticle_idx(rs.getInt("article_idx"));
				article.setBid(rs.getInt("bid"));
				article.setMid(rs.getInt("mid"));
				article.setTitle(rs.getString("title"));
				article.setContent(rs.getString("content"));
				article.setReg_date(rs.getTimestamp("reg_date"));
				article.setMod_date(rs.getTimestamp("mod_date"));
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
		return (ArrayList<Board>) list;
	}

	/**
	 * 전체 조회
	 * 
	 * @param page   페이지
	 * @param maxRow 한 페이지 행 수
	 * @return
	 */
	public ArrayList<Board> select_all(int page, int maxRow) {
		list = new ArrayList<>();
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT * FROM board_list");
		String sql = "";
		try {
			if (conn == null)
				conn = DBConnect.getInstance();
			sb.append(" LIMIT ");
			sb.append(maxRow);
			sb.append(" OFFSET ");
			sb.append(maxRow * (page - 1));
			sql = sb.toString();
//			System.out.println(">> query = " + sql);
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				article = new Board();
				article.setArticle_idx(rs.getInt("article_idx"));
				article.setBid(rs.getInt("bid"));
				article.setMid(rs.getInt("mid"));
				article.setTitle(rs.getString("title"));
				article.setContent(rs.getString("content"));
				article.setReg_date(rs.getTimestamp("reg_date"));
				article.setMod_date(rs.getTimestamp("mod_date"));
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
		return (ArrayList<Board>) list;
	}

	/**
	 * 페이지 = (게시글 총 수 / 한 페이지 최대 행 수)
	 * 
	 * @param maxRow 한 페이지 최대 행 수
	 * @return > 0 페이지 반환 || == -1 글 없음
	 */
	public int select_pageCount(int maxRow) {
		int result = -1;
		int count = 0;
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT COUNT(*) CNT FROM board_list");
		String sql = "";
		try {
			if (conn == null)
				conn = DBConnect.getInstance();
			sql = sb.toString();
//			System.out.println(">> query = " + sql);
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				count = rs.getInt("CNT");
			}
			if (count == 0)
				return result;
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
		result = count / maxRow;
		if (count % maxRow > 0)
			result++;
		return result;
	}

	// TODO 게시글 검색 두 번째. 회원 정보(회원번호, 아이디, 이름)로 검색. Member관리에서 만들까?
}