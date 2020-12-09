package com.event.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.event.domain.Review;
import com.event.service.ReviewService;

public class UpdateReviewCommand implements Command{

	ReviewService reviewService = ReviewService.getInstance(); 
	
	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) {
		//¸®ºä uid ¹Þ±â
		Long review_uid = Long.parseLong(String.valueOf(request.getParameter("uid")));
		
		Review review = reviewService.findByUid(review_uid);
		
		request.setAttribute("review_uid", review_uid);
		request.setAttribute("review", review);
	}
}
