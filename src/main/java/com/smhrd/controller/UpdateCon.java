package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.MemberDAO;
import com.smhrd.model.MemberDTO;

@WebServlet("/UpdateCon")
public class UpdateCon extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("[upCon]");

		request.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();
		

		String email = request.getParameter("email");
		String pw = request.getParameter("pw");
		String tel = request.getParameter("tel");
		String address = request.getParameter("address");

		System.out.println(email);
		System.out.println(pw);
		System.out.println(tel);
		System.out.println(address);
		MemberDTO dto = new MemberDTO(email, pw, tel, address);

		String moveURL = "";
		int row = new MemberDAO().Update(dto);
		if (row > 0) {
			System.out.println("정보 수정 성공");
			request.getSession().setAttribute("user_info", dto);
	
			moveURL = "Main.jsp";

		} else {
			System.out.println("정보 수정 실패");
			moveURL = "";
		}

		// 페이지 이동
		RequestDispatcher rd = request.getRequestDispatcher(moveURL);
		rd.forward(request, response);


	}
}
