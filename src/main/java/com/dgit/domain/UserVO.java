package com.dgit.domain;

public class UserVO {
	private String uid;
	private String upw;
	private String uname;
	private String uaddr;
	private String utel;
	
	
	public UserVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public UserVO(String uid, String upw, String uname, String uaddr, String utel) {
		super();
		this.uid = uid;
		this.upw = upw;
		this.uname = uname;
		this.uaddr = uaddr;
		this.utel = utel;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getUpw() {
		return upw;
	}
	public void setUpw(String upw) {
		this.upw = upw;
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
	public String getUtel() {
		return utel;
	}
	public void setUtel(String utel) {
		this.utel = utel;
	}
	@Override
	public String toString() {
		return "UserVO [uid=" + uid + ", upw=" + upw + ", uname=" + uname + ", uaddr=" + uaddr + ", utel=" + utel + "]";
	}
	
}
