package com.event.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.event.service.MemberService;

public class InputNewPwOkCommand implements Command{
	MemberService memberService = MemberService.getInstance();
	
	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		int result = 0;
		try {
			System.out.println("변경할 pw:" + pw);
			result = memberService.changePw(pw, id);
			System.out.println("변경 완료");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("변경 실패");
		}
		request.setAttribute("result", result);
	}
}
