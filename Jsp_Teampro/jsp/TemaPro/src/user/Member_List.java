package user;

import java.sql.Timestamp;

/**
 * DATABASE: charge TABLE NAME: member_rank COLUMNS: mid(PK, AI, int), rid(FK, int),
 * userid(UK, varchar(20)), upasswd(text), uname(varchar(20)),
 * uaddr(varchar(45)), umail(varchar(45)), regdate(timestamp)
 * 
 * @author jaemoonnlee
 *
 */
public class Member_List {
	private int mid;
	private int rid;
	private String userid;
	private String upasswd;
	private String uname;
	private String uaddr;
	private String umail;
	private Timestamp regdate;

	public int getMid() {
		return mid;
	}

	public void setMid(int mid) {
		this.mid = mid;
	}

	public int getRid() {
		return rid;
	}

	public void setRid(int rid) {
		this.rid = rid;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getUpasswd() {
		return upasswd;
	}

	public void setUpasswd(String upasswd) {
		this.upasswd = upasswd;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getUaddr() {
		return uaddr;
	}

	public void setUaddr(String uaddr) {
		this.uaddr = uaddr;
	}

	public String getUmail() {
		return umail;
	}

	public void setUmail(String umail) {
		this.umail = umail;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	public Member_List(int mid, int rid, String userid, String upasswd, String uname, String uaddr, String umail,
			Timestamp regdate) {
		this.mid = mid;
		this.rid = rid;
		this.userid = userid;
		this.upasswd = upasswd;
		this.uname = uname;
		this.uaddr = uaddr;
		this.umail = umail;
		this.regdate = regdate;
	}

	public Member_List() {
	}

}
