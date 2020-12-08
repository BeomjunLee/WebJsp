package com.event.service;

import java.sql.SQLException;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.event.domain.Member;
import com.event.exception.IdDuplicatedException;
import com.event.repository.MemberRepository;
import com.event.security.BCryptPasswordEncoder;
import com.event.security.PasswordEmail;

public class MemberService {

	MemberRepository memberRepository = MemberRepository.getInstance();
	BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
	private static MemberService memberService = new MemberService();
	
	//�̱���
	public static MemberService getInstance() {
		return memberService;
	}
	
	protected MemberService() {} //new�� ��ü���� ����
	
	//��й�ȣ ã��
	public String findPwSendEmail(String to) throws Exception {
		PasswordEmail email = new PasswordEmail();
		return email.sendEmail(to);
	}
	
	//�α��� üũ
	public int checkLogin(String id, String pw, HttpServletRequest request) throws SQLException{
		int result = 0;	//1�� �α��μ���, 2�� ���̵����, 3�� ��й�ȣ ����ġ,  0�� ����
			Member member = memberRepository.findById(id);
			System.out.println("Member ���޼���");
			
			if(member == null) return 2;
			else if(member.getId().equals(id) && passwordEncoder.matches(pw, member.getPw())) {
				result = 1;
				HttpSession session = request.getSession();
				session.setAttribute("session", member.getMember_uid());
				System.out.println("���� ���� : " + session.getAttribute("session"));
			}
			else result = 3;
		return result;
	}
	
	//�α׾ƿ�
	public void logout(HttpServletRequest request){
		HttpSession session = request.getSession();
		session.removeAttribute("session");
		System.out.println("���� ����");
	}
	
	//���̵� �ߺ�üũ
	public int duplicated(String id) throws SQLException {
		Member member = memberRepository.findById(id);
			if(member == null){
				return 1; 	//�ߺ��� �ƴ�
			}else if(member.getId().equals(id)){
				return 0;	//�ߺ�
			}else {
				return 2;
			}
	}
	
	//ȸ������
	public int signUp(Member member){
		int result = 0;
		try {
			result = memberRepository.save(member);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//ȸ������
	public Member findMember(Long member_uid) {
		try {
			return memberRepository.findByUid(member_uid);
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	//ȸ������ ���̵�� ã
	public Member findMemberById(String id) {
		try {
			return memberRepository.findById(id);
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
}
