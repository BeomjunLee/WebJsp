package com.event.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.event.domain.Member;
import com.event.service.MemberService;

public class sendEmailCommand implements Command{
	
	MemberService memberService = MemberService.getInstance();
	
	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String phoneNum = request.getParameter("phoneNum");
		String code = null;
		int result = 0;
		//회원정보 아이디로 찾기
		Member member = memberService.findMemberById(id);
		
		if(member == null) {
			result = 2;	//2는 아이디 오류
		}else if(phoneNum.equals(member.getPhoneNum())) {
			try {
				code = memberService.findPwSendEmail(member.getEmail());
				result = 1;	//메일 성공시 1
			}catch(Exception e) {
				e.printStackTrace();
				result = 3;
			}
		}else {
			result = 0; //0은 전화번호 오류
		}
		System.out.println(code);
		request.setAttribute("result", result);
		request.setAttribute("code", code);
	}
}
