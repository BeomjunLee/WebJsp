package com.event.repository;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.event.domain.Member;
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
				rs.getLong("member_uid"),
				rs.getString("writer"),
				rs.getString("category"),
				rs.getString("title"),
				rs.getString("content"),
				rs.getString("img"),
				rs.getInt("view_count"),
				rs.getInt("recommend"),
				rs.getString("regdate")
		);
		return review;
	}
		
	//insert
	public int save(Review review) throws SQLException{
		int result = 0;
		try {
			conn = DriverManager.getConnection(DB.URL, DB.USERID, DB.USERPW);
			pstmt = conn.prepareStatement("insert into review values(review_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
			pstmt.setLong(1,  review.getMember_uid());
			pstmt.setString(2, review.getWriter());
			pstmt.setString(3, review.getCategory());
			pstmt.setString(4, review.getTitle());
			pstmt.setString(5, review.getContent());
			pstmt.setString(6, review.getImg());
			pstmt.setInt(7, review.getView_count());
			pstmt.setInt(8, review.getRecommend());
			pstmt.setString(9, review.getRegdate());
			result = pstmt.executeUpdate();
			System.out.println(review.toString()); //府轰 肺弊
		}finally {
			close();
		}
		return result;
	}
	
	//select by uid
		public Review findByUid(Long review_uid) throws SQLException{
			Review review = null;
			try {
				conn = DriverManager.getConnection(DB.URL, DB.USERID, DB.USERPW);
				pstmt = conn.prepareStatement("select * from review where review_uid = ?");
				pstmt.setLong(1, review_uid);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					review = createReview(rs);
				}
			}finally {
				close();
			}
			return review;
		}
	
	//select by category
	public List<Review> findByCategory(String category) throws SQLException{
		List<Review> reviews = new ArrayList<>();
		try {
			conn = DriverManager.getConnection(DB.URL, DB.USERID, DB.USERPW);
			pstmt = conn.prepareStatement("select * from review where category = ?");
			rs = pstmt.executeQuery();
			while(rs.next()) {
				reviews.add(createReview(rs));
			}
		}finally {
			close();
		}
		return reviews;
	}
	
	//select all
	public List<Review> findAll(int startIndex, int endIndex) throws SQLException{
		List<Review> reviews = new ArrayList<>();
		try {
			conn = DriverManager.getConnection(DB.URL, DB.USERID, DB.USERPW);
			//pstmt = conn.prepareStatement("select * from review order by review_uid desc OFFSET ? ROWS FETCH FIRST ? ROWS ONLY");
			pstmt = conn.prepareStatement("select * from " + 
					"(select rownum as rnum, t.* from (select * from review order by review_uid desc) t) " + 
					"where rnum >= ? and rnum <= ?");
			pstmt.setInt(1, startIndex);
			pstmt.setInt(2, endIndex);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				reviews.add(createReview(rs));
			}
		}finally {
			close();
		}
		return reviews;
	}
	
	//update
	public int updateViewCount(Long review_uid) throws SQLException{
		int result = 0;
		try {
			conn = DriverManager.getConnection(DB.URL, DB.USERID, DB.USERPW);
			pstmt = conn.prepareStatement("update review set view_count = view_count + 1 where review_uid = ?");
			pstmt.setLong(1, review_uid);
			result = pstmt.executeUpdate();
		}finally {
			close();
		}
		return result;
	}
	
	//update view_count
		public int update(Review review) throws SQLException{
			int result = 0;
			try {
				conn = DriverManager.getConnection(DB.URL, DB.USERID, DB.USERPW);
				pstmt = conn.prepareStatement("update review set title = ?, content = ?, img = ?  where review_uid = ? and member_uid = ?");
				pstmt.setString(1, review.getTitle());
				pstmt.setString(2, review.getContent());
				pstmt.setString(3, review.getImg());
				pstmt.setLong(4, review.getReview_uid());
				pstmt.setLong(5, review.getMember_uid());
				result = pstmt.executeUpdate();
			}finally {
				close();
			}
			return result;
		}
	
	//delete
	public int delete(Long review_uid, Long member_uid) throws SQLException {
		int result = 0;
		try {
			conn = DriverManager.getConnection(DB.URL, DB.USERID, DB.USERPW);
			pstmt = conn.prepareStatement("delete from review where review_uid = ? and member_uid = ?");
			pstmt.setLong(1, review_uid);
			pstmt.setLong(2, member_uid);
			result = pstmt.executeUpdate();
		}finally {
			close();
		}
		return result;
	}
	
	//select totalListCount
	public int totalListCount() throws SQLException{
		int result = 0;
		try {
			conn = DriverManager.getConnection(DB.URL, DB.USERID, DB.USERPW);
			pstmt = conn.prepareStatement("select count(*) from review");
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
			}
		}finally {
			close();
		}
		return result;
	}
}
