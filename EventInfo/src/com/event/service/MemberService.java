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
	
	//로그아웃
	public void logout(HttpServletRequest request){
		HttpSession session = request.getSession();
		session.removeAttribute("session");
		System.out.println("세션 제거");
	}
	
	//아이디 중복체크
	public int duplicated(String id) throws SQLException {
		Member member = memberRepository.findById(id);
			if(member == null){
				return 1; 	//중복이 아님
			}else if(member.getId().equals(id)){
				return 0;	//중복
			}else {
				return 2;
			}
	}
	
	//회원가입
	public int signUp(Member member){
		int result = 0;
		try {
			result = memberRepository.save(member);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//회원정보
	public Member findMember(Long member_uid) {
		try {
			return memberRepository.findByUid(member_uid);
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
}
