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
	
	//싱글톤
	public static MemberService getInstance() {
		return memberService;
	}
	
	protected MemberService() {} //new로 객체생성 막기
	
//	//회원select
//	public Member findMember() {
//		Member member = new Member();
//		
//		return member;
//	}
	
	//로그인 체크
	public int checkLogin(String id, String pw, HttpServletRequest request) throws SQLException{
		int result = 0;	//1은 로그인성공, 2는 아이디없음, 3은 비밀번호 불일치,  0은 에러
			Member member = memberRepository.findById(id);
			System.out.println("Member 전달성공");
			
			if(member == null) return 2;
			else if(member.getId().equals(id) && member.getPw().equals(pw)) {
				result = 1;
				HttpSession session = request.getSession();
				session.setAttribute("session", member.getMember_uid());
				System.out.println("세션 생성 : " + session.getAttribute("session"));
			}
			else result = 3;
		return result;
	}
	
	//아이디 중복체크
	public void duplicated(String id) throws SQLException {
		Member member = memberRepository.findById(id);
		try {
			if(member.getId().equals(id)) {
				throw new IdDuplicatedException("아이디가 중복되었습니다.");
			}
		}catch(IdDuplicatedException e) {
			e.printStackTrace();
		}
	}
	
	//회원가입
	public int signUp(Member member) throws SQLException{
		int result = 0;
		result = memberRepository.save(member);
		return result;
	}
	
}
