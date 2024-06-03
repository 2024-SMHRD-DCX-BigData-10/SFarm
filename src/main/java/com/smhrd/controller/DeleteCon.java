package com.smhrd.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.MemberDAO;
import com.smhrd.model.MemberDTO;

@WebServlet("/DeleteCon")
public class DeleteCon extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("[DelCon]");

		request.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();
		 ArrayList<MemberDTO> memList = (ArrayList)MemberDAO.selectMember();
		 System.out.println(request.getParameter("in"));
		int i= Integer.parseInt(request.getParameter("in"));
		MemberDTO del = memList.get(i);
		System.out.println(i);
		System.out.println(del);
		
		
		
		String moveURL = "ShowMember.jsp";
		int row = new MemberDAO().Delete(del);
		if (row >0) {
			System.out.println("정보 삭제 성공");
			
	
		

		} else {
			System.out.println("정보 삭제 실패");
		
		}

		// 페이지 이동
		RequestDispatcher rd = request.getRequestDispatcher(moveURL);
		rd.forward(request, response);
	}

}
