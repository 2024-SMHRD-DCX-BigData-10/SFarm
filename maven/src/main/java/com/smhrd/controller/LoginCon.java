package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.MemberDAO;
import com.smhrd.model.MemberDTO;

@WebServlet("/S_LoginCon")
public class LoginCon extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("Login");

		request.setCharacterEncoding("UTF-8");

		String mb_id = request.getParameter("mb_id");
		String mb_pw = request.getParameter("mb_pw");

		MemberDTO dto = new MemberDTO(mb_id, mb_pw);
		MemberDTO user_info = new MemberDAO().Login(dto);
		String moveURL;
		String logresult;

		if (user_info != null) {
			logresult = "로그인성공.";
			System.out.println(logresult);

	 	HttpSession session = request.getSession();

			session.setAttribute("user_info", user_info);
			
		} else {

			logresult = "로그인 실패";
			System.out.println(logresult);
			HttpSession session = request.getSession();

		}
		PrintWriter out = response.getWriter();
		out.print(logresult);
		response.setContentType("application/text; charset=utf-8");
		response.sendRedirect("SFarm_main.jsp");
	}

}
