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
		}catch(Exception e) {
			System.out.println("DB���� ����");
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
				rs.getString("phone_num"),
				rs.getInt("age"),
				rs.getString("gender")
		);
		return member;
	}
	
	
	//ȸ������	
	
	//�α���
	public Member findMember(String id) throws SQLException{
		Member member = null;
		try {
			conn = DriverManager.getConnection(DB.URL, DB.USERID, DB.USERPW);
			pstmt = conn.prepareStatement("select * from member where id = ?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				member = createMember(rs);
			}
		}finally {
			close();
		}
		return member;
	}
}
