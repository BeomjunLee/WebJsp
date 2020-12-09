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
	
	//���� ����
	public int writeReview(Long member_uid, Review review) {
		int result = 0;
		try {
			return reviewRepository.save(review);
		} catch (SQLException e) {
			e.printStackTrace();
			return result;
		}
	}
	
	//���� ����
	public int updateReview(Review review) {
		int result = 0;
		try {
			return reviewRepository.update(review);
		} catch (SQLException e) {
			e.printStackTrace();
			return result;
		}
	}
	
	//���� ����
	public int deleteReview(Long review_uid, Long member_uid) {
		int result = 0;
		try {
			return reviewRepository.delete(review_uid, member_uid);
		} catch (SQLException e) {
			e.printStackTrace();
			return result;
		}
	}
	
	//��ȸ�� ����
	public int updateViewCount(Long review_uid) {
		int result = 0;
		try {
			return reviewRepository.updateViewCount(review_uid);
		} catch (SQLException e) {
			e.printStackTrace();
			return result;
		}
	}
	
	
	//���� ����
	public Review findByUid(Long review_uid) {
		try {
			return reviewRepository.findByUid(review_uid);
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	//��ü �˻�
	public List<Review> findAll(int startIndex, int endIndex) {
		try {
			return reviewRepository.findAll(startIndex, endIndex);
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	//��ü �� ��
	public int totalListCount() {
		try {
			return reviewRepository.totalListCount();
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		}
	}
}	
