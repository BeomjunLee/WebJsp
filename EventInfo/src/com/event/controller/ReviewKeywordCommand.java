package com.event.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.event.domain.Pagination;
import com.event.domain.Review;
import com.event.service.ReviewService;

public class ReviewKeywordCommand implements Command{
	
	ReviewService reviewService = ReviewService.getInstance();
	
	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) {
		String keyword = request.getParameter("keyword");
		keyword = "%"+keyword+"%";
		
		int page = 0;
		if(request.getParameter("page") == null) page = 1;
		else page = Integer.parseInt(String.valueOf(request.getParameter("page")));
		
		int totalListCnt = reviewService.totalListCountByKeyword(keyword);
		Pagination pagination = new Pagination(totalListCnt, page, 7);
		int startIndex = pagination.getStartIndex();
		int endIndex = pagination.getEndIndex();
		
		List<Review> reviews = reviewService.findByKeyword(keyword, startIndex, endIndex);
		
		System.out.println("전체글수: " + pagination.getTotalListCnt() + " | 현재 페이지: " + pagination.getPage() + " | 시작페이지:" +
                pagination.getStartPage() + " | 끝페이지:" + pagination.getEndPage() + "|startIndex:" + startIndex + "|endIndex:" + endIndex
                + "|preBlock:" + pagination.getPreBlock() + "|nextBlock:" + pagination.getNextBlock()+"|block:"+pagination.getBlock());//확인용
		
		request.setAttribute("reviews", reviews);
		request.setAttribute("pagination", pagination);
	}
}
