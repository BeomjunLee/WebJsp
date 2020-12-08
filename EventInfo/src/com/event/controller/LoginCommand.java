package com.event.controller;

import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.event.security.BCryptPasswordEncoder;
import com.event.service.MemberService;

public class LoginCommand implements Command{
	
	MemberService memberService = MemberService.getInstance();
	
	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
			
		int result = 0;
		try {
			result = memberService.checkLogin(id, pw, request);
			request.setAttribute("result", result);
			System.out.println("[loginCheck]Result : " + result);
//			
//			if(result == 1) response.sendRedirect("loginOk.do");
//			else response.sendRedirect("login.do");
//			
		} catch (SQLException e) {
			System.out.println("Result 전달실패");
			e.printStackTrace();
		} 
//		catch (IOException e) {
//			e.printStackTrace();
//		}
	}

}
