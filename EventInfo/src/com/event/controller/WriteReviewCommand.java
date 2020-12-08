package com.event.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.event.domain.Member;
import com.event.domain.Review;
import com.event.service.MemberService;
import com.event.service.ReviewService;

public class WriteReviewCommand implements Command{
	
	ReviewService reviewService = ReviewService.getInstance();
	MemberService memberService = MemberService.getInstance();
	
	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) {
		int result = 0;
		HttpSession session = request.getSession();
		Long review_uid = null;
		Long member_uid = Long.parseLong(String.valueOf(session.getAttribute("session")));
		
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String category = request.getParameter("category");
		String img1 = request.getParameter("img1");
		String regdate = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
			
		//멤버 찾기(이름)
		Member member = memberService.findMember(member_uid);
		
		Review review = new Review(review_uid, member_uid, member.getName(), category, title, content, img1, 0, 0, regdate);
		
		result = reviewService.writeReview(member_uid, review, request, img1, "");
		request.setAttribute("result", result);
	}
}
