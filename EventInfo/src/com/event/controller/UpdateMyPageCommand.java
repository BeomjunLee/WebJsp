package com.event.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.event.domain.Member;
import com.event.service.MemberService;

public class UpdateMyPageCommand implements Command{
	
	MemberService memberService = MemberService.getInstance();
	
	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		Long member_uid = Long.parseLong(String.valueOf(session.getAttribute("session")));
		
		Member member = memberService.findMember(member_uid);
		
		
		request.setAttribute("member", member);
	}
}
