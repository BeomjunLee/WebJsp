package com.event.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.event.domain.Review;
import com.event.service.ReviewService;

public class ReviewCommand implements Command{
	
	ReviewService reviewService = ReviewService.getInstance();
	
	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) {
		
		List<Review> reviews = reviewService.findAll();
		request.setAttribute("reviews", reviews);
	}
}
