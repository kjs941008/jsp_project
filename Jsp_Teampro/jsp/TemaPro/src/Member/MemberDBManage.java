package Member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import Member.DBinfo.DBInfo;

public class MemberDBManage {
	
	public void SignUp(String userid,String upasswd,String uname,String regdate) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(DBInfo.mysql_class);
			conn = DriverManager.getConnection(DBInfo.mysql_url, DBInfo.mysql_id, DBInfo.mysql_pw);
			pstmt = conn.prepareStatement(
					"INSERT INTO "+ 
					"member_list "+
					"(userid,upasswd,uname,regdate)"+
					"VALUES "+
					"(?,?,?,?)");
			

			pstmt.setString(1,userid);
			pstmt.setString(2,upasswd);
			pstmt.setString(3,uname);
			pstmt.setString(4,regdate);
			pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
			
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			}catch(Exception e) {
				
			}
		}
	}
	public int ckLogin(String userid,String upasswd) {
		
		Connection conn =  null;	// DB ¿¬°á°´Ã¼
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			// oracle mysql mssql
			Class.forName(DBInfo.mysql_class);
			
			conn = DriverManager.getConnection(DBInfo.mysql_url, DBInfo.mysql_id, DBInfo.mysql_pw);
			pstmt = conn.prepareStatement(""
							+ "SELECT upasswd FROM charge.member_list " 
							+ " WHERE userid=?"
							+ "");
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString(1).equals(upasswd)) {
					return 1;
				}
				else {
					return 0;
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
		return -1;
	}

}
