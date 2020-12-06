package com.event.repository;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.event.domain.Review;

public class ReviewRepository {
	private static ReviewRepository reviewRepository = new ReviewRepository();
	
	//教臂沛
	public static ReviewRepository getInstance() {
		return reviewRepository;
	}
	
	Connection conn;
	PreparedStatement pstmt;
	Statement stmt;
	ResultSet rs;
	
	//按眉积己矫 DB CONNECTION积己
	private ReviewRepository() {
		System.out.println("MemberRepository 积己磊 积己");
		try {
			Class.forName(DB.DRIVER);
			System.out.println("MemberRepository积己, DB楷搬");
			System.out.println("========================");
		}catch(Exception e) {
			System.out.println("DB楷搬 角菩");
			System.out.println("========================");
			e.printStackTrace();
		}
	}
	
	public void close() throws SQLException{
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
		if(stmt != null) stmt.close();
		if(conn != null) conn.close();
	}
	
	public Review createReview(ResultSet rs) throws SQLException{
		Review review = new Review(
				rs.getLong("review_uid"),
				rs.getLong("event_uid"),
				rs.getLong("member_uid"),
				rs.getString("title"),
				rs.getString("content"),
				rs.getString("file"),
				rs.getInt("view_count")
		);
		return review;
	}
	
	
	//insert
	public int save(Review review) throws SQLException{
		int result = 0;
		try {
			conn = DriverManager.getConnection(DB.URL, DB.USERID, DB.USERPW);
			pstmt = conn.prepareStatement("insert into review values(review_seq.nextval, ?, ?, ?, ?, ?, ?)");
			pstmt.setLong(1, review.getEvent_uid());
			pstmt.setLong(2,  review.getMember_uid());
			pstmt.setString(3, review.getTitle());
			pstmt.setString(4, review.getContent());
			pstmt.setString(5, review.getFile());
			pstmt.setInt(6, review.getView_count());
			result = pstmt.executeUpdate();
			System.out.println(review.toString()); //府轰 肺弊
		}finally {
			close();
		}
		return result;
	}
	
	//select by category
	public Review findByCategory(String category) throws SQLException{
		Review review = null;
		try {
			conn = DriverManager.getConnection(DB.URL, DB.USERID, DB.USERPW);
			pstmt = conn.prepareStatement("select r.review_uid, r.event_uid, r.member_uid, r.title, r.content, r.file, r.view_count from review r event e where r.event_uid = e.event_uid and e.category = ?");
			pstmt.setString(1, category);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				review = createReview(rs);
			}
		}finally {
			close();
		}
		return review;
	}
	
	//select all
	public Review findByCategory() throws SQLException{
		Review review = null;
		try {
			conn = DriverManager.getConnection(DB.URL, DB.USERID, DB.USERPW);
			pstmt = conn.prepareStatement("select * from review");
			rs = pstmt.executeQuery();
			while(rs.next()) {
				review = createReview(rs);
			}
		}finally {
			close();
		}
		return review;
	}
	
	//update
	
	//delete
}
