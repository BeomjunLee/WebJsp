package com.event.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.event.domain.Member;
import com.event.domain.Pagination;
import com.event.domain.Review;
import com.event.service.MemberService;
import com.event.service.ReviewService;

public class MyPageCommand implements Command{
	
	MemberService memberService = MemberService.getInstance();
	ReviewService reviewService = ReviewService.getInstance();
	
	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		//회원 세션값
		Long member_uid = Long.parseLong(String.valueOf(session.getAttribute("session")));
		//회원찾기
		Member member = memberService.findMember(member_uid);
		
		int page = 0;
		if(request.getParameter("page") == null) page = 1;
		else page = Integer.parseInt(String.valueOf(request.getParameter("page")));
		
		//페이징
		int totalListCnt = reviewService.totalListCount();
		Pagination pagination = new Pagination(totalListCnt, page, 5);
		int startIndex = pagination.getStartIndex();
		int endIndex = pagination.getEndIndex();
		
		List<Review> reviews = reviewService.findByMemberUid(member_uid, startIndex, endIndex);
		
		System.out.println("전체글수: " + pagination.getTotalListCnt() + " | 현재 페이지: " + pagination.getPage() + " | 시작페이지:" +
                pagination.getStartPage() + " | 끝페이지:" + pagination.getEndPage() + "|startIndex:" + startIndex + "|endIndex:" + endIndex
                + "|preBlock:" + pagination.getPreBlock() + "|nextBlock:" + pagination.getNextBlock()+"|block:"+pagination.getBlock());//확인용
		
		request.setAttribute("reviews", reviews);
		request.setAttribute("pagination", pagination);
		request.setAttribute("member", member);
	}
}
