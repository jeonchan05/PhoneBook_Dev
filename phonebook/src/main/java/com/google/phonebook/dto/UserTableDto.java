package com.google.phonebook.dto;

public class UserTableDto {
	private String username;
	private String imgnm;
	private String userid;
	private String userpassword;
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getImgnm() {
		return imgnm;
	}
	public void setImgnm(String imgnm) {
		this.imgnm = imgnm;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUserpassword() {
		return userpassword;
	}
	public void setUserpassword(String userpassword) {
		this.userpassword = userpassword;
	}
	
	@Override
	public String toString() {
		return "UserTableDto [username=" + username + ", imgnm=" + imgnm + ", userid=" + userid + ", userpassword="
				+ userpassword + "]";
	}
	
	
	
	
}
