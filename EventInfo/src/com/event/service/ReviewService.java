package com.event.service;

import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import com.event.domain.Member;
import com.event.domain.Review;
import com.event.repository.MemberRepository;
import com.event.repository.ReviewRepository;

public class ReviewService {
	
	ReviewRepository reviewRepository = ReviewRepository.getInstance();
	
	
	private static ReviewService reviewService = new ReviewService();
	
	public static ReviewService getInstance() {
		return reviewService;
	}
	
	//���� ����
	public int writeReview(Long member_uid, Review review) {
		int result = 0;
		try {
			result = reviewRepository.save(review);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	//��õ 
	public void recommend(){
		
	}
	
	//��ȸ��
	
	//��ü �˻�
	public List<Review> findAll() {
		try {
			return reviewRepository.findAll();
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
}	
