package com.event.service;

import java.sql.SQLException;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.event.domain.Member;
import com.event.exception.IdDuplicatedException;
import com.event.repository.MemberRepository;

public class MemberService {

	MemberRepository memberRepository = MemberRepository.getInstance();

	private static MemberService memberService = new MemberService();
	
	//�̱���
	public static MemberService getInstance() {
		return memberService;
	}
	
	protected MemberService() {} //new�� ��ü���� ����
	
//	//ȸ��select
//	public Member findMember() {
//		Member member = new Member();
//		
//		return member;
//	}
	
	//�α��� üũ
	public int checkLogin(String id, String pw, HttpServletRequest request) throws SQLException{
		int result = 0;	//1�� �α��μ���, 2�� ���̵����, 3�� ��й�ȣ ����ġ,  0�� ����
			Member member = memberRepository.findById(id);
			System.out.println("Member ���޼���");
			
			if(member == null) return 2;
			else if(member.getId().equals(id) && member.getPw().equals(pw)) {
				result = 1;
				HttpSession session = request.getSession();
				session.setAttribute("session", member.getMember_uid());
				System.out.println("���� ���� : " + session.getAttribute("session"));
			}
			else result = 3;
		return result;
	}
	
	//���̵� �ߺ�üũ
	public void duplicated(String id) throws SQLException {
		Member member = memberRepository.findById(id);
		try {
			if(member.getId().equals(id)) {
				throw new IdDuplicatedException("���̵� �ߺ��Ǿ����ϴ�.");
			}
		}catch(IdDuplicatedException e) {
			e.printStackTrace();
		}
	}
	
	//ȸ������
	public int signUp(Member member) throws SQLException{
		int result = 0;
		result = memberRepository.save(member);
		return result;
	}
	
}
