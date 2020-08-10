package com.company.dto;

public class Members1 {
	public int userno;
	public String username;
	public String userid;
	public String userpass;
	public String useremail;
	public String userip;
	public String userdate;
	public String userpost;
	public int getUserno() {
		return userno;
	}
	public void setUserno(int userno) {
		this.userno = userno;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUserpass() {
		return userpass;
	}
	public void setUserpass(String userpass) {
		this.userpass = userpass;
	}
	public String getUseremail() {
		return useremail;
	}
	public void setUseremail(String useremail) {
		this.useremail = useremail;
	}
	public String getUserip() {
		return userip;
	}
	public void setUserip(String userip) {
		this.userip = userip;
	}
	public String getUserdate() {
		return userdate;
	}
	public void setUserdate(String userdate) {
		this.userdate = userdate;
	}
	public String getUserpost() {
		return userpost;
	}
	public void setUserpost(String userpost) {
		this.userpost = userpost;
	}
	@Override
	public String toString() {
		return "Members1 [userno=" + userno + ", username=" + username + ", userid=" + userid + ", userpass=" + userpass
				+ ", useremail=" + useremail + ", userip=" + userip + ", userdate=" + userdate + ", userpost="
				+ userpost + ", getUserno()=" + getUserno() + ", getUsername()=" + getUsername() + ", getUserid()="
				+ getUserid() + ", getUserpass()=" + getUserpass() + ", getUseremail()=" + getUseremail()
				+ ", getUserip()=" + getUserip() + ", getUserdate()=" + getUserdate() + ", getUserpost()="
				+ getUserpost() + "]";
	}
	
	
	
	
}