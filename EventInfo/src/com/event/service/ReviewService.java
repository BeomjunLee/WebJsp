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
	
	//���� ���ε�
	public void uploadFile(HttpServletRequest request, String img1, String img2) {
		// request.getRealPath("�����") �� ���� ������ ������ ���� ��θ� ���ؿ´�.
	    // �ü�� �� ������Ʈ�� ��ġ�� ȯ�濡 ���� ��ΰ� �ٸ��� ������ �Ʒ�ó�� ���ؿ��°� ����
	    String uploadPath = request.getRealPath("/front/img");
	  	System.out.println("������ : " + uploadPath +"<br/>");
	     
	    int maxSize =1024 *1024 *10;// �ѹ��� �ø� �� �ִ� ���� �뷮 : 10M�� ����
     
	    String fileName1 ="";// �ߺ�ó���� �̸�
	    String originalName1 ="";// �ߺ� ó���� ���� ���� �̸�
	    long fileSize =0;// ���� ������
	    String fileType ="";// ���� Ÿ��
	     
	    MultipartRequest multi =null;
	     
	    try{
	        // request,����������,�뷮,���ڵ�Ÿ��,�ߺ����ϸ� ���� �⺻ ��å
	        multi =new MultipartRequest(request,uploadPath,maxSize,"utf-8",new DefaultFileRenamePolicy());
	        
	        img1 = multi.getParameter("img1");
	        img2 = multi.getParameter("img2");
	         
	        // ������ ��ü �����̸����� ������
	        Enumeration<String> files = multi.getFileNames();
	         
	        while(files.hasMoreElements()){
	            // form �±׿��� <input type="file" name="���⿡ ������ �̸�" />�� �����´�.
	            String file1 = (String)files.nextElement();// ���� input�� ������ �̸��� ������
	            // �׿� �ش��ϴ� ���� ���� �̸��� ������
	            originalName1 = multi.getOriginalFileName(file1);
	            // ���ϸ��� �ߺ��� ��� �ߺ� ��å�� ���� �ڿ� 1,2,3 ó�� �پ� unique�ϰ� ���ϸ��� �����ϴµ�
	            // �̶� ������ �̸��� filesystemName�̶� �Ͽ� �� �̸� ������ �����´�.(�ߺ��� ���� ó��)
	            fileName1 = multi.getFilesystemName(file1);
	            // ���� Ÿ�� ������ ������
	            fileType = multi.getContentType(file1);
	            // input file name�� �ش��ϴ� ���� ������ ������
	            File file = multi.getFile(file1);
	            // �� ���� ��ü�� ũ�⸦ �˾Ƴ�
	            fileSize = file.length();
	        }
	    }catch(Exception e){
	        e.printStackTrace();
	    }


	}
	
	//��õ 
	public void recommend(){
		
	}
	
	//��ȸ��
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
