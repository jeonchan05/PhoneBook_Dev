package com.google.phonebook.dto;

public class PhoneBookDto {
	private String userid;
	private String membernm;
	private String phonenumber;
	private String address;
	private String groupno;
	private String groupnm;
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getMembernm() {
		return membernm;
	}
	public void setMembernm(String membernm) {
		this.membernm = membernm;
	}
	public String getPhonenumber() {
		return phonenumber;
	}
	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getGroupno() {
		return groupno;
	}
	public void setGroupno(String groupno) {
		this.groupno = groupno;
	}
	public String getGroupnm() {
		return groupnm;
	}
	public void setGroupnm(String groupnm) {
		this.groupnm = groupnm;
	}
	
	@Override
	public String toString() {
		return "PhonebookDto [userid=" + userid + ", membernm=" + membernm + ", phonenumber=" + phonenumber
				+ ", address=" + address + ", groupno=" + groupno + ", groupnm=" + groupnm + "]";
	}
}