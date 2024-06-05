package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.MemberDAO;
import com.smhrd.model.MemberDTO;

@WebServlet("/JoinCon")
public class JoinCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		System.out.println("[JoinCon]");
		// 1. post 방식 디코딩
		request.setCharacterEncoding("UTF-8");
		
		// 2. 데이터 꺼내오기
		String email=request.getParameter("email");
		String pw= request.getParameter("pw");
		String tel=request.getParameter("tel");
		String address=request.getParameter("address");
		
		System.out.println(email);
		System.out.println(pw);
		System.out.println(tel);
		System.out.println(address);
		
		// 3. 데이터 캡슐화
		MemberDTO dto = new MemberDTO(email, pw, tel, address);
		
		//4. DB에 회원정보 입력 (메소드 호출)
		 int row = new MemberDAO().join(dto);
		 
		 // 5. 실행한 결과에 따라 페이지 이동
		 String moveURL;
		 if(row> 0) {
			 System.out.println("회원가입 성공");
			 moveURL="JoinSuccess.jsp";
			 request.setAttribute("email",email);
		 }
		 else {
			 System.out.println("회원가입 실패");
			 moveURL = "Main.jsp";
		 }
		
		 //페이지 이동
		 RequestDispatcher rd = request.getRequestDispatcher(moveURL);
		 rd.forward(request, response);
		
		
	}

}
