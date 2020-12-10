package com.event.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.event.domain.Reply;
import com.event.domain.Review;
import com.event.service.ReplyService;
import com.event.service.ReviewService;

public class ReadReviewCommand implements Command{

	ReviewService reviewService = ReviewService.getInstance(); 
	ReplyService replyService = ReplyService.getInstance(); 
	
	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) {
		//리뷰 uid 받기
		Long review_uid = Long.parseLong(String.valueOf(request.getParameter("uid")));
		//조회수 증가
		reviewService.updateViewCount(review_uid);
		
		Review review = reviewService.findByUid(review_uid);
		
		List<Reply> replys = replyService.findAll(review_uid);
		
		request.setAttribute("review", review);
		request.setAttribute("replys", replys);
	}
}
