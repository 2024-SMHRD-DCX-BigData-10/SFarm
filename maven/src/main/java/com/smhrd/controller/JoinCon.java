package com.smhrd.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

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

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("[JoinCon]");
		// 1. post 방식 디코딩
		request.setCharacterEncoding("UTF-8");
		
		// 2. 데이터 꺼내오기
		String mb_id=request.getParameter("mb_id");
		String mb_pw=request.getParameter("mb_pw");
		String mb_name=request.getParameter("mb_name");
		String mb_phone=request.getParameter("mb_phone");
		String farm_info=request.getParameter("farm_info");
		Date join_at=new Date(request.getParameter("join_at"));
		String mb_type=request.getParameter("mb_type");
		
		// 3. 데이터 캡슐화
		MemberDTO dto = new MemberDTO(mb_id,mb_pw,mb_name,mb_phone,farm_info,join_at,mb_type);
		
		//4. DB에 회원정보 입력 (메소드 호출)
		 int row = new MemberDAO().join(dto);
		 
		 // 5. 실행한 결과에 따라 페이지 이동
		 String moveURL;
		 if(row> 0) {
			 System.out.println("회원가입 성공");
			 moveURL="Main.jsp";
			 request.setAttribute("mb_id",mb_id);
		 }
		 else {
			 System.out.println("회원가입 실패");
			 moveURL = "Main.jsp";
			 request.setAttribute("mb_id","fail");
		 }
		
		 //페이지 이동
		 RequestDispatcher rd = request.getRequestDispatcher(moveURL);
		 rd.forward(request, response);
	}

}
