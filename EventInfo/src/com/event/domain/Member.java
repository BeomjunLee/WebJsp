package com.event.domain;

public class Member {
	private Long member_uid; 		//uid
	private String id;				//���̵�
	private String pw;				//��й�ȣ
	private String name;			//�̸�
	private String email;			//�̸���
	private String phoneNum;		//��ȭ��ȣ
	private int age;				//����
	private String gender;			//����(����:female ����:male)
	
	protected Member() {} //�׳� ���� �Ұ�
	
	//setter�� �����ʱ� ���� �����ڷ� set 
	public Member(Long member_uid, String id, String pw, String name, String email, String phoneNum, int age, String gender) {
		this.member_uid = member_uid;
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.email = email;
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
	public String getEmail() {
		return email;
	}

	@Override
	public String toString() {
		return "[ȸ�� ]" + member_uid + "|" + id + "|" + pw + "|" + name + "|" + email + "|" + phoneNum + "|" + age + "|" + gender + "|";
	}
}
