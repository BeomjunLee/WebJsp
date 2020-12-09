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

public class UpdateReviewOkCommand implements Command{
	
	ReviewService reviewService = ReviewService.getInstance();
	
	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) {
		int result = 0;
		HttpSession session = request.getSession();
		Long member_uid = Long.parseLong(String.valueOf(session.getAttribute("session")));
		Review review = null;
		
		String uploadPath = session.getServletContext().getRealPath("/upload");

		System.out.println("������ : " + uploadPath);
		     
		    int maxSize =1024 *1024 *10;// �ѹ��� �ø� �� �ִ� ���� �뷮 : 10M�� ����
		    try{
		        // request,����������,�뷮,���ڵ�Ÿ��,�ߺ����ϸ� ���� �⺻ ��å
		    	MultipartRequest multi = new MultipartRequest(request, uploadPath, maxSize,"utf-8",new DefaultFileRenamePolicy());
		    	
		    	Long review_uid = Long.parseLong(multi.getParameter("review_uid"));
		    	System.out.println("review_uid : " + review_uid);
		    	String title = multi.getParameter("title");
		    	String content = multi.getParameter("content");
		    	
		    	String fileName = System.currentTimeMillis() + multi.getOriginalFileName("img");//���ε� �� �����̸�(�ߺ��� �����)
		    	String fileRealName = multi.getFilesystemName("img");//����� ���� �̸�
		    	
		    	//review��ü �� �ֱ�
		    	review = new Review(review_uid, member_uid, title, content, fileRealName);
		    }catch(Exception e){
		        e.printStackTrace();
		    }
		
		result = reviewService.updateReview(review);
		request.setAttribute("result", result);
	}
}
