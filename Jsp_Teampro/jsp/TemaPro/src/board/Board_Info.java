package board;

/**
 * DATABASE: charge TABLE NAME: board_info COLUMNS: bid(PK, int), bname(String)
 * 
 * @author jaemoonnlee
 *
 */
public class Board_Info {
	/**
	 * 게시판 키
	 */
	private int bid;
	/**
	 * 게시판 이름
	 */
	private String bname;

	public Board_Info() {
	}

	public int getBid() {
		return bid;
	}

	public void setBid(int bid) {
		this.bid = bid;
	}

	public String getBname() {
		return bname;
	}

	public void setBname(String bname) {
		this.bname = bname;
	}
}
