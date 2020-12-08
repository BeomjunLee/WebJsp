package com.event.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.event.service.MemberService;

public class InputPwCodeOkCommand implements Command{
	
	MemberService memberService = MemberService.getInstance();
	
	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) {
		int result = 0;
		
		String inputCode = request.getParameter("inputCode");
		String code = request.getParameter("code");
		String id = request.getParameter("id");
		result = memberService.checkCode(code, inputCode);
		
		request.setAttribute("result", result);
		request.setAttribute("id", id);
	}
}
