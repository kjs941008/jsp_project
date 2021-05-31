package Member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import Member.DBinfo.DBInfo;

public class MemberDBManage {
	
	public int IdCheck(String userid) {
		int result = 1;
		Connection conn =  null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			Class.forName(DBInfo.mysql_class);
			
			conn = DriverManager.getConnection(DBInfo.mysql_url, DBInfo.mysql_id, DBInfo.mysql_pw);
			pstmt = conn.prepareStatement(""
							+ "SELECT count(userid) as cnt FROM charge.member_list " 
							+ " WHERE userid= ? "
							+ "");
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				// 아이디 갯수 확인 
				if(rs.getInt("cnt") == 0) {
					// 1이 나오면 아이디가 있고 0이면 없음
					result = 0;
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
	public MemberInfo ckLogin(String userid,String upasswd) {
		MemberInfo member = new MemberInfo();
		Connection conn =  null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			Class.forName(DBInfo.mysql_class);
			
			conn = DriverManager.getConnection(DBInfo.mysql_url, DBInfo.mysql_id, DBInfo.mysql_pw);
			pstmt = conn.prepareStatement(""
							+ "SELECT * FROM charge.member_list " 
							+ " WHERE userid=?"
							+ "");
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				// DB 비밀번호 비교
				if(rs.getString("upasswd").equals(upasswd)) {
					//비밀번호 일치하면
					member.setUserid(userid);
					member.setUpasswd(upasswd);
					member.setUname(rs.getString("uname"));
					member.setSuc(1);
					return member;
				}
				else {
					//비밀번호 불일치
					member.setSuc(0);
					return member;
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
		//아이디가 틀리면
		member.setSuc(-1);
		return member;
	}
	
}
