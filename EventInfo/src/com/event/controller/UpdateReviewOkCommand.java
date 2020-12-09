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

		System.out.println("절대경로 : " + uploadPath);
		     
		    int maxSize =1024 *1024 *10;// 한번에 올릴 수 있는 파일 용량 : 10M로 제한
		    try{
		        // request,파일저장경로,용량,인코딩타입,중복파일명에 대한 기본 정책
		    	MultipartRequest multi = new MultipartRequest(request, uploadPath, maxSize,"utf-8",new DefaultFileRenamePolicy());
		    	
		    	Long review_uid = Long.parseLong(multi.getParameter("review_uid"));
		    	System.out.println("review_uid : " + review_uid);
		    	String title = multi.getParameter("title");
		    	String content = multi.getParameter("content");
		    	
		    	String fileName = System.currentTimeMillis() + multi.getOriginalFileName("img");//업로드 된 파일이름(중복시 변경됨)
		    	String fileRealName = multi.getFilesystemName("img");//저장된 파일 이름
		    	
		    	//review객체 값 넣기
		    	review = new Review(review_uid, member_uid, title, content, fileRealName);
		    }catch(Exception e){
		        e.printStackTrace();
		    }
		
		result = reviewService.updateReview(review);
		request.setAttribute("result", result);
	}
}
