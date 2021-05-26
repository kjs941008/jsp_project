package Member;

public class MemberInfo {
	
	private String mid;
	private int rid;
	private String userid;
	private String upasswd;
	private String uname;
	private String regdate;
	private int suc;
	@Override
	public String toString() {
		return "MemberInfo [mid=" + mid + ", rid=" + rid + ", userid=" + userid + ", upasswd=" + upasswd + ", uname="
				+ uname + ", redate=" + regdate + "]";
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public int getSuc() {
		return suc;
	}
	public void setSuc(int suc) {
		this.suc = suc;
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
	public String getRedate() {
		return regdate;
	}
	public void setRedate(String redate) {
		this.regdate = redate;
	}
}
