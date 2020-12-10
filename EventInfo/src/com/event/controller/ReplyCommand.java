package com.event.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.event.domain.Member;
import com.event.domain.Reply;
import com.event.service.MemberService;
import com.event.service.ReplyService;

public class ReplyCommand implements Command{
	
	MemberService memberService = MemberService.getInstance();
	ReplyService replyService = ReplyService.getInstance();
	
	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		Long member_uid = Long.parseLong(String.valueOf(session.getAttribute("session")));
		Long review_uid = Long.parseLong(request.getParameter("review_uid"));
		String content = request.getParameter("content");
		Member member = memberService.findMember(member_uid);
		String regdate = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
		Reply reply = new Reply(replyService.sequence(), review_uid, member_uid, replyService.sequence(), member.getId(), content, regdate);
		
		int result = replyService.saveReply(reply);
		Long sequence = replyService.sequence();
		replyService.updateGroupId(sequence, sequence);
		int page = Integer.parseInt(request.getParameter("page"));
		request.setAttribute("result", result);
		request.setAttribute("review_uid", review_uid);
		request.setAttribute("page", page);
	}
}
