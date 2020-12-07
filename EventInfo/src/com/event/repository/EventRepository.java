package com.event.repository;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.event.domain.Event;
import com.event.domain.Member;
import com.event.domain.Review;

public class EventRepository {
	private static EventRepository eventRepository = new EventRepository();
	
	public static EventRepository getInstance() {
		return eventRepository;
	}
	
	Connection conn;
	PreparedStatement pstmt;
	Statement stmt;
	ResultSet rs;
	
	//��ü������ DB CONNECTION����
	private EventRepository() {
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
	
	public Event createEvent(ResultSet rs) throws SQLException{
		Event event = new Event(
				rs.getLong("event_uid"),
				rs.getString("category"),
				rs.getString("title"),
				rs.getString("content"),
				rs.getString("img"),
				rs.getInt("view_count"),
				rs.getInt("recommend"),
				rs.getString("regdate")
		);
		return event;
	}
	
	//select all
	public List<Event> findAll(String category, int startIndex, int pageSize) throws SQLException{
		List<Event> events = new ArrayList<>();
		try {
			conn = DriverManager.getConnection(DB.URL, DB.USERID, DB.USERPW);
			pstmt = conn.prepareStatement("select * from event where category = ? order by recommend desc OFFSET ? ROWS FETCH FIRST ? ROWS ONLY");
			pstmt.setString(1,  category);
			pstmt.setInt(2, startIndex);
			pstmt.setInt(3, pageSize);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				events.add(createEvent(rs));
			}
		}finally {
			close();
		}
		return events;
	}
	
	//select totalListCount
		public int totalListCount(String category) throws SQLException{
			int result = 0;
			try {
				conn = DriverManager.getConnection(DB.URL, DB.USERID, DB.USERPW);
				pstmt = conn.prepareStatement("select count(*) from event where category = ?");
				pstmt.setString(1, category);
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
