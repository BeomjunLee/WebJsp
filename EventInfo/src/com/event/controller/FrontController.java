package com.event.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		System.out.println("actionDo() 호출");
		
		request.setCharacterEncoding("UTF-8");
			
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String com = uri.substring(conPath.length());
		
		String viewPage = null;  // 어떠한 페이지에 보여줄지 (View)
		Command command = null;   // 어떠한 로직을 수행할지
		
		// 테스트 출력
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
		case "/logout.do":
			command = new LogoutCommand();
			command.excute(request, response);
			viewPage = "logout.jsp";
			break;
		case "/findId.do":
			viewPage = "findId.jsp";
			break;
		case "/findPw.do":
			viewPage = "findPw.jsp";
			break;
		case "/sendEmailOk.do":
			command = new sendEmailCommand();
			command.excute(request, response);
			viewPage = "sendEmailOk.jsp";
			break;
		case "/inputPwCode.do":
			command = new InputPwCodeCommand();
			command.excute(request, response);
			viewPage = "inputPwCode.jsp";
			break;
		case "/inputPwCodeOk.do":
			command = new InputPwCodeOkCommand();
			command.excute(request, response);
			viewPage = "inputPwCodeOk.jsp";
			break;
		case "/inputNewPw.do":
			command = new InputNewPwCommand();
			command.excute(request, response);
			viewPage = "inputNewPw.jsp";
			break;
		case "/inputNewPwOk.do":
			command = new InputNewPwOkCommand();
			command.excute(request, response);
			viewPage = "inputNewPwOk.jsp";
			break;	
		case "/signUp.do":
			viewPage = "signUp.jsp";
			break;
		case "/signUpOk.do":
			command = new SignUpCommand();
			command.excute(request, response);
			viewPage = "signUpOk.jsp";
			break;
		case "/idDuplicated.do":
			command = new IdDuplicatedCommand();
			command.excute(request, response);
			viewPage = "idDuplicated.jsp";
			break;
		case "/review.do":
			command = new ReviewCommand();
			command.excute(request, response);
			viewPage = "review.jsp";
			break;
		case "/readReview.do":
			command = new ReadReviewCommand();
			command.excute(request, response);
			viewPage = "readReview.jsp";
			break;
		case "/writeReview.do":
			viewPage = "writeReview.jsp";
			break;
		case "/writeReviewOk.do":
			command = new WriteReviewCommand();
			command.excute(request, response);
			viewPage = "writeReviewOk.jsp";
			break;
		case "/updateReview.do":
			command = new UpdateReviewCommand();
			command.excute(request, response);
			viewPage = "updateReview.jsp";
			break;
		case "/updateReviewOk.do":
			command = new UpdateReviewOkCommand();
			command.excute(request, response);
			viewPage = "updateReviewOk.jsp";
			break;
		case "/myPage.do":
			command = new MyPageCommand();
			command.excute(request, response);
			viewPage = "myPage.jsp";
			break;
		case "/updateMyPage.do":
			command = new UpdateMyPageCommand();
			command.excute(request, response);
			viewPage = "updateMyPage.jsp";
			break;
		case "/updateMyPageOk.do":
			command = new UpdateMyPageOkCommand();
			command.excute(request, response);
			viewPage = "updateMyPageOk.jsp";
			break;
		case "/event1.do":
			viewPage = "event1.jsp";
			break;
		}
		
		// response 를 위해서 
		// 위에서 결정된 viewPage 에 forward 해줌
		if(viewPage != null) {
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);
		}
//		RequestDispatcher dispatcher = context.getRequestDispatcher("/hello");
	}
}
