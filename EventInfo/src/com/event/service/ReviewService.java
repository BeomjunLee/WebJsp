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
	public int writeReview(Long member_uid, Review review) {
		int result = 0;
		try {
			result = reviewRepository.save(review);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	//파일 업로드
	public void uploadFile(HttpServletRequest request, String img) {
		// request.getRealPath("상대경로") 를 통해 파일을 저장할 절대 경로를 구해온다.
	    // 운영체제 및 프로젝트가 위치할 환경에 따라 경로가 다르기 때문에 아래처럼 구해오는게 좋음
	    String uploadPath = request.getRealPath("/front/img");
	  	System.out.println("절대경로 : " + uploadPath +"<br/>");
	     
	    int maxSize =1024 *1024 *10;// 한번에 올릴 수 있는 파일 용량 : 10M로 제한
	    try{
	        // request,파일저장경로,용량,인코딩타입,중복파일명에 대한 기본 정책
	    	MultipartRequest multi = new MultipartRequest(request, uploadPath, maxSize,"utf-8",new DefaultFileRenamePolicy());
	    	
	    	String fileName = multi.getOriginalFileName("img");//업로드 된 파일이름(중복시 변경됨)
	    	String fileRealName = multi.getFilesystemName("img");
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
