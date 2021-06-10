package Map;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import Member.DBinfo.DBInfo;

public class MapDBManage {
	
	public ArrayList MarkingMap() {
		ArrayList<String> list = new ArrayList<String>();
		Connection conn =  null;	// DB ���ᰴü
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			// oracle mysql mssql
			Class.forName(DBInfo.mysql_class);
			
			conn = DriverManager.getConnection(DBInfo.mysql_url, DBInfo.mysql_id, DBInfo.mysql_pw);
			pstmt = conn.prepareStatement(""
							+ "SELECT addr FROM charge.charge_spot "
							+ "");
			rs = pstmt.executeQuery();
			while(rs.next()) {
				MapInfo map = new MapInfo();
				map.setAddr(rs.getString("addr"));
				list.add(map.getAddr());
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
		return list;
	}
	public ArrayList SearchMap(String addr) {
		ArrayList<MapInfo> list = new ArrayList<MapInfo>();
		Connection conn =  null;	// DB ���ᰴü
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			// oracle mysql mssql
			Class.forName(DBInfo.mysql_class);
			
			conn = DriverManager.getConnection(DBInfo.mysql_url, DBInfo.mysql_id, DBInfo.mysql_pw);
			pstmt = conn.prepareStatement(""
							+ "SELECT addr, spot, type FROM charge.charge_spot where addr like \"%" + addr + "%\""
							+ "");
			//pstmt.setString(1,addr);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				MapInfo map = new MapInfo();
				map.setAddr(rs.getString("addr"));
				map.setType(rs.getString("type"));
				map.setSpot(rs.getString("spot"));
				list.add(map);
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
		return list;
	}
}