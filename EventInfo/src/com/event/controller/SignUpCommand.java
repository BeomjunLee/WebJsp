package com.event.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.event.domain.Member;
import com.event.security.BCryptPasswordEncoder;
import com.event.service.MemberService;

public class SignUpCommand implements Command{
	
	MemberService memberService = MemberService.getInstance();
	
	BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
	
	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) {
		Long member_uid = null;
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phoneNum = request.getParameter("phoneNum");
		String age2 = request.getParameter("age");
		int age;
		if(age2 == null) age = 0;
		else age = Integer.parseInt(age2);
		String gender = request.getParameter("gender");
		
		//암호화
		String encodePw = passwordEncoder.encode(pw);
		System.out.println("pw 암호화 : " + encodePw);
		
		Member member = new Member(member_uid, id, encodePw, name, email, phoneNum, age, gender);
		int result = memberService.signUp(member);
		request.setAttribute("result", result);
	}
}
