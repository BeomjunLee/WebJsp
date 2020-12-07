package com.event.repository;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.event.domain.Member;

public class MemberRepository {
	
	private static MemberRepository memberRepository = new MemberRepository();
	
	//�̱���
	public static MemberRepository getInstance() {
		return memberRepository;
	}
	
	Connection conn;
	PreparedStatement pstmt;
	Statement stmt;
	ResultSet rs;
	
	//��ü������ DB CONNECTION����
	private MemberRepository() {
		System.out.println("MemberRepository ������ ����");
		try {
			Class.forName(DB.DRIVER);
			System.out.println("MemberRepository����, DB����");
			System.out.println("========================");
		}catch(Exception e) {
			System.out.println("DB���� ����");
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
	
	public Member createMember(ResultSet rs) throws SQLException{
		Member member = new Member(
				rs.getLong("member_uid"),
				rs.getString("id"),
				rs.getString("pw"),
				rs.getString("name"),
				rs.getString("phoneNum"),
				rs.getInt("age"),
				rs.getString("gender")
		);
		return member;
	}
	
	
	//insert
	public int save(Member member) throws SQLException{
		int result = 0;
		try {
			conn = DriverManager.getConnection(DB.URL, DB.USERID, DB.USERPW);
			pstmt = conn.prepareStatement("insert into member values(member_seq.nextval, ?, ?, ?, ?, ?, ?)");
			pstmt.setString(1, member.getId());
			pstmt.setString(2,  member.getPw());
			pstmt.setString(3, member.getName());
			pstmt.setString(4, member.getPhoneNum());
			pstmt.setInt(5, member.getAge());
			pstmt.setString(6, member.getGender());
			result = pstmt.executeUpdate();
			System.out.println(member.toString()); //ȸ�� �α�
		}finally {
			close();
		}
		return result;
	}
	
	//select by id
	public Member findById(String id) throws SQLException{
		Member member = null;
		try {
			conn = DriverManager.getConnection(DB.URL, DB.USERID, DB.USERPW);
			pstmt = conn.prepareStatement("select * from member where id = ?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				member = createMember(rs);
			}
		}finally {
			close();
		}
		return member;
	}
	
	//select by uid
	public Member findByUid(Long member_uid) throws SQLException{
		Member member = null;
		try {
			conn = DriverManager.getConnection(DB.URL, DB.USERID, DB.USERPW);
			pstmt = conn.prepareStatement("select * from member where member_uid = ?");
			pstmt.setLong(1, member_uid);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				member = createMember(rs);
			}
		}finally {
			close();
		}
		return member;
	}
	
	//update
	public int update(Long member_uid) throws SQLException{
		int result = 0;
		
		return result;
	}
}
