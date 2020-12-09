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
	
	//싱글톤
	public static MemberService getInstance() {
		return memberService;
	}
	
	protected MemberService() {} //new로 객체생성 막기
	
	//비밀번호 찾기 인증 코드 보내기
	public String findPwSendEmail(String to) throws Exception {
		PasswordEmail email = new PasswordEmail();
		return email.sendEmail(to);
	}
	
	//비밀번호 인증코드 체크
	public int checkCode(String code, String inputCode) {
		int result = 0;
		if(code.equals(inputCode)) {
			System.out.println("인증 성공");
			return result = 1;
		}else {
			System.out.println("인증 실패");
			return result = 0;
		}
	}
	
	//비밀번호 변경
	public int changePw(String pw, String id) throws SQLException {
			BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
			String encodePw = passwordEncoder.encode(pw);
			return memberRepository.updatePw(encodePw, id);
	}
	
	//로그인 체크
	public int checkLogin(String id, String pw, HttpServletRequest request) throws SQLException{
		int result = 0;	//1은 로그인성공, 2는 아이디없음, 3은 비밀번호 불일치,  0은 에러
			Member member = memberRepository.findById(id);
			System.out.println("Member 전달성공");
			
			HttpSession session = request.getSession();
			
			if(member == null) return 2; //회원이 존재하지않음
			else if(member.getId().equals(id) && passwordEncoder.matches(pw, member.getPw())) { //아이디랑 비번이 같을경우
					//세션이있다면 삭제
					if(session.getAttribute("session") != null) session.removeAttribute("session");
					//세션 생성
					session.setAttribute("session", member.getMember_uid());
					System.out.println("세션 생성 : " + session.getAttribute("session"));
					result = 1;	//성공
				}else result = 3; //비밀번호 일치 x
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
	
	//회원정보 아이디로 찾기
	public Member findMemberById(String id) {
		try {
			return memberRepository.findById(id);
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	//회원정보 수정
	public int updateMember(Member member) {
		int result = 0;
		try {
			return memberRepository.update(member);
		} catch (SQLException e) {
			e.printStackTrace();
			return result;
		}
	}
}
