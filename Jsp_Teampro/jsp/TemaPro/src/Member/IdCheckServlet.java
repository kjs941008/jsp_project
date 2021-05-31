package Member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import Member.DBinfo.DBInfo;

public class IdCheckServlet {
	public boolean checkID(String userid) {
		boolean result = false;
		Connection conn =  null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			Class.forName(DBInfo.mysql_class);
			
			conn = DriverManager.getConnection(DBInfo.mysql_url, DBInfo.mysql_id, DBInfo.mysql_pw);
			pstmt = conn.prepareStatement(""
							+ "SELECT userid FROM charge.member_list " 
							+ " WHERE userid=?"
							+ "");
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				// 아이디 중복검사
				if(rs.getString("userid").equals(userid)) {
					//아이디 중복
					result = true;
					return result;
				}
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			try{
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			}catch(Exception ex){
				
			}
		}
		return result;
	}

}
