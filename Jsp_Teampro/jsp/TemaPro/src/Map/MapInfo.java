package Map;

public class MapInfo {
	private String addr;
	
	public String getAddr() {
		return addr;
	}
	public void setAdd(String add) {
		this.addr = add;
	}
	
	@Override
	public String toString() {
		return "MapInfo [addr=" + addr + "]";
	}
}
