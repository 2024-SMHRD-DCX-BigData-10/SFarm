package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.MemberDAO;
import com.smhrd.model.MemberDTO;

@WebServlet("/LoginCon")
public class LoginCon extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("[LoginCon]");
		// 1. post 방식 디코딩
		request.setCharacterEncoding("UTF-8");
		
		// 2. 데이터 꺼내오기
		String email=request.getParameter("email");
		String pw= request.getParameter("pw");

		System.out.println(email);
		System.out.println(pw);
		

		MemberDTO dto = new MemberDTO(email, pw);

		MemberDTO user_info = new MemberDAO().Login(dto);
		 
		 // 5. 실행한 결과에 따라 페이지 이동
		 String moveURL;
		 String logresult;
		
			if(user_info  != null) {
				logresult = "로그인성공.";
				
				// 1. Session 객체 생성
				
				
				
				 HttpSession session = request.getSession();
				//2. session에 저장
				session.setAttribute("user_info", user_info);
				session.setAttribute("logresult", logresult);
				
				//3. session의 유효기간 설정(초 단위)
				session.setMaxInactiveInterval(60*60);
		
				
				
				
			}
			else {
				
				logresult = "로그인 실패";

				 HttpSession session = request.getSession();
				
				session.setAttribute("logresult", logresult);
			}
			PrintWriter out = response.getWriter();
			out.print(logresult);
			response.setContentType("application/text; charset=utf-8");
			response.sendRedirect("Main.jsp");
		
		}

}
		
		
	