package com.event.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.event.domain.Member;
import com.event.service.MemberService;

public class sendEmailCommand implements Command{
	
	MemberService memberService = MemberService.getInstance();
	
	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String phoneNum = request.getParameter("phoneNum");
		String code = null;
		int result = 0;
		//ȸ������ ���̵�� ã��
		Member member = memberService.findMemberById(id);
		
		if(member == null) {
			result = 2;	//2�� ���̵� ����
		}else if(phoneNum.equals(member.getPhoneNum())) {
			try {
				code = memberService.findPwSendEmail(member.getEmail());
				result = 1;	//���� ������ 1
			}catch(Exception e) {
				e.printStackTrace();
				result = 3;
			}
		}else {
			result = 0; //0�� ��ȭ��ȣ ����
		}
		System.out.println(code);
		request.setAttribute("result", result);
		request.setAttribute("code", code);
	}
}
