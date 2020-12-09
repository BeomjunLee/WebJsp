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
		//ȸ�� ���ǰ�
		Long member_uid = Long.parseLong(String.valueOf(session.getAttribute("session")));
		//ȸ��ã��
		Member member = memberService.findMember(member_uid);
		
		int page = 0;
		if(request.getParameter("page") == null) page = 1;
		else page = Integer.parseInt(String.valueOf(request.getParameter("page")));
		
		//����¡
		int totalListCnt = reviewService.totalListCount();
		Pagination pagination = new Pagination(totalListCnt, page, 5);
		int startIndex = pagination.getStartIndex();
		int endIndex = pagination.getEndIndex();
		
		List<Review> reviews = reviewService.findByMemberUid(member_uid, startIndex, endIndex);
		
		System.out.println("��ü�ۼ�: " + pagination.getTotalListCnt() + " | ���� ������: " + pagination.getPage() + " | ����������:" +
                pagination.getStartPage() + " | ��������:" + pagination.getEndPage() + "|startIndex:" + startIndex + "|endIndex:" + endIndex
                + "|preBlock:" + pagination.getPreBlock() + "|nextBlock:" + pagination.getNextBlock()+"|block:"+pagination.getBlock());//Ȯ�ο�
		
		request.setAttribute("reviews", reviews);
		request.setAttribute("pagination", pagination);
		request.setAttribute("member", member);
	}
}
