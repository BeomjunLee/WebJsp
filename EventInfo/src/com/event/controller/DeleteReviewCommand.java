package com.event.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.event.service.ReviewService;

public class DeleteReviewCommand implements Command{
	
	ReviewService reviewService = ReviewService.getInstance();
	
	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) {
			int result = 0;
			HttpSession session = request.getSession();
		
			Long review_uid = Long.parseLong(request.getParameter("uid")); 
			Long member_uid = Long.parseLong(String.valueOf(session.getAttribute("session")));
			
			result = reviewService.deleteReview(review_uid, member_uid);
			request.setAttribute("result", result);
	}	
}	
