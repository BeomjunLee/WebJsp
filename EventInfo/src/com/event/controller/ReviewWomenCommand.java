package com.event.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.event.domain.Pagination;
import com.event.domain.Review;
import com.event.service.ReviewService;

public class ReviewWomenCommand implements Command {

	ReviewService reviewService = ReviewService.getInstance();
	
	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) {
		int page = 0;
		if(request.getParameter("page") == null) page = 1;
		else page = Integer.parseInt(String.valueOf(request.getParameter("page")));
		
		//ī�װ� �̸�
	    String category = "women";
		
		int totalListCnt = reviewService.totalListCountByCategory(category);
		Pagination pagination = new Pagination(totalListCnt, page, 10);
		int startIndex = pagination.getStartIndex();
		int endIndex = pagination.getEndIndex();
		
		List<Review> reviews = reviewService.findByCategory(category, startIndex, endIndex);
		
		System.out.println("��ü�ۼ�: " + pagination.getTotalListCnt() + " | ���� ������: " + pagination.getPage() + " | ����������:" +
                pagination.getStartPage() + " | ��������:" + pagination.getEndPage() + "|startIndex:" + startIndex + "|endIndex:" + endIndex
                + "|preBlock:" + pagination.getPreBlock() + "|nextBlock:" + pagination.getNextBlock()+"|block:"+pagination.getBlock());//Ȯ�ο�
		
		request.setAttribute("reviews", reviews);
		request.setAttribute("pagination", pagination);
	}

}
