package com.saeyan.javabeans;

public class MemberBean {
	private String name;
	private String userid;
	
	//getter, setter
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	
	//매개변수가 있는 생성자
	public MemberBean(String name, String userid) {
		this.name = name;
		this.userid = userid;
	}
	//매개변수가 없는 디폴트 생성자
	public MemberBean() {
	}
	@Override
	public String toString() {
		return "MemberBean [name=" + name + ", userid=" + userid + "]";
	}
	
	
}
