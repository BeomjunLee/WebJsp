package com.event.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.event.domain.Member;
import com.event.service.MemberService;

public class UpdateMyPageOkCommand implements Command{
	
	MemberService memberService = MemberService.getInstance();
	
	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) {
		int result = 0;
		HttpSession session = request.getSession();
		Long member_uid = Long.parseLong(String.valueOf(session.getAttribute("session")));
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phoneNum = request.getParameter("phoneNum");
		String address = request.getParameter("address");
		int age = Integer.parseInt(request.getParameter("age"));
		
		Member member = new Member(member_uid, name, email, phoneNum, address, age);
		System.out.println(member.toString());
		result = memberService.updateMember(member);
		
		request.setAttribute("result", result);
	}
}
