package com.event.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.event.domain.Member;
import com.event.repository.MemberRepository;

public class LoginCommand implements Command{
	
	//MemberRepository memberRepository = MemberRepository.getInstance();
	MemberRepository memberRepository = MemberRepository.getInstance();
	
	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		try {
			Member member = memberRepository.findMember(id);
			request.setAttribute("member", member);
			System.out.println("Member 전달성공");
		} catch (SQLException e) {
			System.out.println("Member 전달실패");
			e.printStackTrace();
		}
	}
}
