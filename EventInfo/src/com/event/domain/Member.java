package com.event.domain;

public class Member {
	private Long member_uid; 		//uid
	private String id;				//아이디
	private String pw;				//비밀번호
	private String name;			//이름
	private String phoneNum;		//전화번호
	private int age;				//나이
	private String gender;			//성별(여자:female 남자:male)
	
	protected Member() {} //그냥 생성 불가
	
	public Member(Long member_uid, String id, String pw, String name, String phoneNum, int age, String gender) {
		this.member_uid = member_uid;
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.phoneNum = phoneNum;
		this.age = age;
		this.gender = gender;
	}
	
	public Long getMember_uid() {
		return member_uid;
	}
	public String getId() {
		return id;
	}
	public String getPw() {
		return pw;
	}
	public String getName() {
		return name;
	}
	public String getPhoneNum() {
		return phoneNum;
	}
	public int getAge() {
		return age;
	}
	public String getGender() {
		return gender;
	}
	
	@Override
	public String toString() {
		return "[회원 ]" + member_uid + "|" + id + "|" + pw + "|" + name + "|" + phoneNum + "|" + age + "|" + gender + "|";
	}
}
