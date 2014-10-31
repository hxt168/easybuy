package un.dez.easybuy.entity;

public class User {
	private int euUserId;
	private String euUserName;
	private String euPassword;
	private String euRealName;
	private String euSex;
	private String euBirthday;
	private String euIdentityCode;
	private String euEmail;
	private String euMobile;
	private String euAddress;
	private int euStatus;
	


	public User() {
	}
	
	public User(String euUserName, String euPassword, String euRealName,String euSex,
			String euBirthday, String euIdentityCode, String euEmail,
			String euMobile, String euAddress, int euStatus) {

		this.euUserName = euUserName;
		this.euPassword = euPassword;
		this.euRealName = euRealName;
		this.euSex = euSex;
		this.euBirthday = euBirthday;
		this.euIdentityCode = euIdentityCode;
		this.euEmail = euEmail;
		this.euMobile = euMobile;
		this.euAddress = euAddress;
		this.euStatus = euStatus;
	}
	
	public int getEuUserId() {
		return euUserId;
	}
	public void setEuUserId(int euUserId) {
		this.euUserId = euUserId;
	}
	public String getEuUserName() {
		return euUserName;
	}
	public void setEuUserName(String euUserName) {
		this.euUserName = euUserName;
	}
	public String getEuPassword() {
		return euPassword;
	}
	public void setEuPassword(String euPassword) {
		this.euPassword = euPassword;
	}
	public String getEuSex() {
		return euSex;
	}
	public void setEuSex(String euSex) {
		this.euSex = euSex;
	}
	public String getEuBirthday() {
		return euBirthday;
	}
	public void setEuBirthday(String euBirthday) {
		this.euBirthday = euBirthday;
	}
	public String getEuIdentityCode() {
		return euIdentityCode;
	}
	public void setEuIdentityCode(String euIdentityCode) {
		this.euIdentityCode = euIdentityCode;
	}
	public String getEuEmail() {
		return euEmail;
	}
	public void setEuEmail(String euEmail) {
		this.euEmail = euEmail;
	}
	public String getEuMobile() {
		return euMobile;
	}
	public void setEuMobile(String euMobile) {
		this.euMobile = euMobile;
	}
	public String getEuAddress() {
		return euAddress;
	}
	public void setEuAddress(String euAddress) {
		this.euAddress = euAddress;
	}
	public int getEuStatus() {
		return euStatus;
	}
	public void setEuStatus(int euStatus) {
		this.euStatus = euStatus;
	}
	public String getEuRealName() {
		return euRealName;
	}

	public void setEuRealName(String euRealName) {
		this.euRealName = euRealName;
	}
	
	@Override
	public String toString() {
		return "User [euUserId=" + euUserId + ", euUserName=" + euUserName
				+ ", euPassword=" + euPassword + ", euRealName=" + euRealName
				+ ", euSex=" + euSex + ", euBirthday=" + euBirthday
				+ ", euIdentityCode=" + euIdentityCode + ", euEmail=" + euEmail
				+ ", euMobile=" + euMobile + ", euAddress=" + euAddress
				+ ", euStatus=" + euStatus + "]";
	}
	
}
