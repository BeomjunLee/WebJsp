package com.event.controller;
import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.event.exception.IdDuplicatedException;
import com.event.service.MemberService;

public class IdDuplicatedCommand implements Command{
	
	MemberService memberService = MemberService.getInstance();
	
	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		try {
			memberService.duplicated(id);
			request.setAttribute("message", "�ߺ�üũ ����");
		} catch (IdDuplicatedException | SQLException e) {
			request.setAttribute("message", e.getMessage());
			System.out.println("�޼���:" + e.getMessage());
			e.printStackTrace();
		}
	}
}
