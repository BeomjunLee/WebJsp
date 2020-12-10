package com.event.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.event.service.ReplyService;

public class DeleteReplyCommand implements Command{
	
	ReplyService replyService = ReplyService.getInstance();
	
	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		Long reply_uid = Long.parseLong(request.getParameter("reply_uid")); 
		Long member_uid = Long.parseLong(String.valueOf(session.getAttribute("session")));
		
		int result = replyService.deleteReview(reply_uid, member_uid);
		request.setAttribute("result", result);
	}
}
