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
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class WriteReviewCommand implements Command{
	
	ReviewService reviewService = ReviewService.getInstance();
	MemberService memberService = MemberService.getInstance();
	
	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) {
		int result = 0;
		HttpSession session = request.getSession();
		Long review_uid = null;
		Long member_uid = Long.parseLong(String.valueOf(session.getAttribute("session")));
		
		String regdate = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
		
		Review review = null;
		//��� ã��(�̸�)
		Member member = memberService.findMember(member_uid);
		
		String uploadPath = session.getServletContext().getRealPath("/upload");
		System.out.println("������ : " + uploadPath);
		     
		    int maxSize =1024 *1024 *10;// �ѹ��� �ø� �� �ִ� ���� �뷮 : 10M�� ����
		    try{
		        // request,����������,�뷮,���ڵ�Ÿ��,�ߺ����ϸ� ���� �⺻ ��å
		    	MultipartRequest multi = new MultipartRequest(request, uploadPath, maxSize,"utf-8",new DefaultFileRenamePolicy());
		    	
		    	String title = multi.getParameter("title");
		    	String content = multi.getParameter("content");
		    	String category = multi.getParameter("category");
		    	
		    	String fileName = System.currentTimeMillis() + multi.getOriginalFileName("img");//���ε� �� �����̸�(�ߺ��� �����)
		    	String fileRealName = multi.getFilesystemName("img");//����� ���� �̸�
		    	
		    	//review��ü �� �ֱ�
		    	review = new Review(review_uid, member_uid, member.getName(), category, title, content, fileRealName, 0, 0, regdate);
		    }catch(Exception e){
		        e.printStackTrace();
		    }
		
		result = reviewService.writeReview(member_uid, review);
		request.setAttribute("result", result);
	}
}
