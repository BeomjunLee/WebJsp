package com.event.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.event.service.MemberService;

public class LogoutCommand implements Command{
	
	MemberService memberService = MemberService.getInstance();
	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) {
		try {
			memberService.logout(request);
			System.out.println("�α׾ƿ� ����");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
