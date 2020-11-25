package com.event.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.event.domain.Member;
import com.event.service.MemberService;

public class SignUpCommand implements Command{
	
	MemberService memberService = MemberService.getInstance();
	
	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) {
		Long member_uid = null;
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String phoneNum = request.getParameter("phoneNum");
		String age2 = request.getParameter("age");
		int age;
		if(age2 == null) age = 0;
		else age = Integer.parseInt(age2);
		String gender = request.getParameter("gender");
		
		Member member = new Member(member_uid, id, pw, name, phoneNum, age, gender);
		
		try {
			int result = memberService.signUp(member);
			request.setAttribute("result", result);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
