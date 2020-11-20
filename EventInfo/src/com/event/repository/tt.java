package com.event.repository;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class tt {
	public static void main(String[] args) {
		Connection conn = null;
		Boolean connect = false;

	try{
		InitialContext initCtx = new InitialContext();
		Context envContext = (Context)initCtx.lookup("java:/comp/env");
		DataSource ds = (DataSource)envContext.lookup("jdbc/EventInfo");
		conn = ds.getConnection();
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select version();");
		while(rs.next()) {
			System.out.println(rs.getString("version()"));
		}
		connect = true;
		rs.close();
		stmt.close();
		conn.close();
		initCtx.close();
	}catch(Exception e){
		connect = false;
		e.printStackTrace();
	}

	if(connect == true) System.out.println("연결됨");
	else System.out.println("연결 오류");
		

	}

}
