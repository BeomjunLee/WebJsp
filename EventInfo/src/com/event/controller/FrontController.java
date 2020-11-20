package com.event.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public FrontController() {
    	super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}
	
	protected void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("====FrontController====");
		System.out.println("actionDo() ȣ��");
		
		request.setCharacterEncoding("UTF-8");
			
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String com = uri.substring(conPath.length());
		
		String viewPage = null;  // ��� �������� �������� (View)
		Command command = null;   // ��� ������ ��������
		
		// �׽�Ʈ ���
		System.out.println("uri: " + uri);
		System.out.println("conPath: " + conPath);
		System.out.println("com: " + com);
		System.out.println("=======================");
		
		switch(com) {
		case "/main.do":
			viewPage = "main.jsp";
			break;
		case "/login.do":
			viewPage = "login.jsp";
			break;
		case "/loginOk.do":
			command = new LoginCommand();
			command.excute(request, response);
			viewPage = "loginOk.jsp";
			break;
		}
		
		// response �� ���ؼ� 
		// ������ ������ viewPage �� forward ����
		if(viewPage != null) {
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);
		}
	}
}
