package com.event.repository;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.event.domain.Reply;
import com.event.domain.Review;

public class ReplyRepository {
	private static ReplyRepository replyRepository = new ReplyRepository();
	
	//싱글톤
	public static ReplyRepository getInstance() {
		return replyRepository;
	}

	Connection conn;
	PreparedStatement pstmt;
	Statement stmt;
	ResultSet rs;
	
	//객체생성시 DB CONNECTION생성
	private ReplyRepository() {
		System.out.println("MemberRepository 생성자 생성");
		try {
			Class.forName(DB.DRIVER);
			System.out.println("MemberRepository생성, DB연결");
			System.out.println("========================");
		}catch(Exception e) {
			System.out.println("DB연결 실패");
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
	
	public Reply createReply(ResultSet rs) throws SQLException{
		Reply reply = new Reply(
				rs.getLong("reply_uid"),
				rs.getLong("review_uid"),
				rs.getLong("member_uid"),
				rs.getLong("group_id"),
				rs.getString("writer"),
				rs.getString("content"),
				rs.getString("regdate")
		);
		return reply;
	}
	
	//insert
	public int save(Reply reply) throws SQLException{
		int result = 0;
		try {
			conn = DriverManager.getConnection(DB.URL, DB.USERID, DB.USERPW);
			pstmt = conn.prepareStatement("insert into reply values(reply_seq.nextval, ?, ?, ?, ?, ?, ?)");
			pstmt.setLong(1, reply.getReview_uid());
			pstmt.setLong(2, reply.getMember_uid());
			pstmt.setLong(3, reply.getGroup_id());
			pstmt.setString(4, reply.getWriter());
			pstmt.setString(5, reply.getContent());
			pstmt.setString(6, reply.getRegdate());
			result = pstmt.executeUpdate();
			System.out.println(reply.toString()); //리뷰 로그
		}finally {
			close();
		}
		return result;
	}
	
	//select all
	public List<Reply> findAll(Long review_uid) throws SQLException{
		List<Reply> replys = new ArrayList<>();
		try {
			conn = DriverManager.getConnection(DB.URL, DB.USERID, DB.USERPW);
			pstmt = conn.prepareStatement("select * from reply where review_uid = ? order by reply_uid, group_id asc");
			pstmt.setLong(1, review_uid);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				replys.add(createReply(rs));
			}
		}finally {
			close();
		}
		return replys;
	}
	
	//현재 시퀀스 값 찾기(저장예정 시퀀스값)
	public Long sequence() throws SQLException{
		Long result = 0L;
		try {
			conn = DriverManager.getConnection(DB.URL, DB.USERID, DB.USERPW);
			pstmt = conn.prepareStatement("select reply_seq.currval from dual");
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getLong(1);
			}
		}finally {
			close();
		}
		return result;
	}
	
	//시퀀스 때문에 group id만 업데이트 해주는 쿼리
	public int updateGroupId(Long groupId, Long reply_uid) throws SQLException{
		int result = 0;
		try {
			conn = DriverManager.getConnection(DB.URL, DB.USERID, DB.USERPW);
			pstmt = conn.prepareStatement("update reply set group_id = ? where reply_uid = ?");
			pstmt.setLong(1, groupId);
			pstmt.setLong(2, reply_uid);
			result = pstmt.executeUpdate();
		}finally {
			close();
		}
		return result;
	}
	
	//delete 
	public int delete(Long replyuid, Long member_uid) throws SQLException {
		int result = 0;
		try {
			conn = DriverManager.getConnection(DB.URL, DB.USERID, DB.USERPW);
			pstmt = conn.prepareStatement("delete from reply where reply_uid = ? and member_uid = ?");
			pstmt.setLong(1, replyuid);
			pstmt.setLong(2, member_uid);
			result = pstmt.executeUpdate();
		}finally {
			close();
		}
		return result;
	}
}
