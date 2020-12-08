package com.event.service;

import java.io.File;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.event.domain.Member;
import com.event.domain.Review;
import com.event.repository.MemberRepository;
import com.event.repository.ReviewRepository;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class ReviewService {
	
	ReviewRepository reviewRepository = ReviewRepository.getInstance();
	
	
	private static ReviewService reviewService = new ReviewService();
	
	public static ReviewService getInstance() {
		return reviewService;
	}
	
	//리뷰 쓰기
	public int writeReview(Long member_uid, Review review, HttpServletRequest request, String img1, String img2) {
		int result = 0;
		uploadFile(request, img1, img2);
		try {
			result = reviewRepository.save(review);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	//파일 업로드
	public void uploadFile(HttpServletRequest request, String img1, String img2) {
		// request.getRealPath("상대경로") 를 통해 파일을 저장할 절대 경로를 구해온다.
	    // 운영체제 및 프로젝트가 위치할 환경에 따라 경로가 다르기 때문에 아래처럼 구해오는게 좋음
	    String uploadPath = request.getRealPath("/front/img");
	  	System.out.println("절대경로 : " + uploadPath +"<br/>");
	     
	    int maxSize =1024 *1024 *10;// 한번에 올릴 수 있는 파일 용량 : 10M로 제한
     
	    String fileName1 ="";// 중복처리된 이름
	    String originalName1 ="";// 중복 처리전 실제 원본 이름
	    long fileSize =0;// 파일 사이즈
	    String fileType ="";// 파일 타입
	     
	    MultipartRequest multi =null;
	     
	    try{
	        // request,파일저장경로,용량,인코딩타입,중복파일명에 대한 기본 정책
	        multi =new MultipartRequest(request,uploadPath,maxSize,"utf-8",new DefaultFileRenamePolicy());
	        
	        img1 = multi.getParameter("img1");
	        img2 = multi.getParameter("img2");
	         
	        // 전송한 전체 파일이름들을 가져옴
	        Enumeration<String> files = multi.getFileNames();
	         
	        while(files.hasMoreElements()){
	            // form 태그에서 <input type="file" name="여기에 지정한 이름" />을 가져온다.
	            String file1 = (String)files.nextElement();// 파일 input에 지정한 이름을 가져옴
	            // 그에 해당하는 실재 파일 이름을 가져옴
	            originalName1 = multi.getOriginalFileName(file1);
	            // 파일명이 중복될 경우 중복 정책에 의해 뒤에 1,2,3 처럼 붙어 unique하게 파일명을 생성하는데
	            // 이때 생성된 이름을 filesystemName이라 하여 그 이름 정보를 가져온다.(중복에 대한 처리)
	            fileName1 = multi.getFilesystemName(file1);
	            // 파일 타입 정보를 가져옴
	            fileType = multi.getContentType(file1);
	            // input file name에 해당하는 실재 파일을 가져옴
	            File file = multi.getFile(file1);
	            // 그 파일 객체의 크기를 알아냄
	            fileSize = file.length();
	        }
	    }catch(Exception e){
	        e.printStackTrace();
	    }


	}
	
	//추천 
	public void recommend(){
		
	}
	
	//조회수
	//리뷰 보기
	public Review findByUid(Long review_uid) {
		try {
			return reviewRepository.findByUid(review_uid);
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	//전체 검색
	public List<Review> findAll(int startIndex, int endIndex) {
		try {
			return reviewRepository.findAll(startIndex, endIndex);
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	//전체 글 수
	public int totalListCount() {
		try {
			return reviewRepository.totalListCount();
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		}
	}
}	
