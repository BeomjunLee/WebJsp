package com.event.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.event.service.MemberService;

public class LogoutCommand implements Command{
	
	MemberService memberService = MemberService.getInstance();
	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) {
		memberService.logout(request);
		System.out.println("로그아웃 성공");
	}
}
