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
	
	//�Ű������� �ִ� ������
	public MemberBean(String name, String userid) {
		this.name = name;
		this.userid = userid;
	}
	//�Ű������� ���� ����Ʈ ������
	public MemberBean() {
	}
	@Override
	public String toString() {
		return "MemberBean [name=" + name + ", userid=" + userid + "]";
	}
	
	
}