package com.smhrd.controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.FarmhouseDAO;
import com.smhrd.model.FarmhouseDTO;
import com.smhrd.model.MemberDAO;
import com.smhrd.model.MemberDTO;

@WebServlet("/S_JoinFarmCon")
public class JoinFarmCon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("JoinFarmCon");

		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		MemberDTO user_info = (MemberDTO) session.getAttribute("user_info");
	
		String mb_id = user_info.getMb_id();
		String fh_name=request.getParameter("fh_name");
		String fh_owner=request.getParameter("fh_owner");
		String[] agri_names=request.getParameterValues("agri_names");
		
		
		// 3. 데이터 캡슐화
		int num=0;
		 String moveURL=null;
		for(String agri_name : agri_names ) {
		FarmhouseDTO dto = new FarmhouseDTO(mb_id,fh_name,fh_owner,agri_name);
		 int row = new FarmhouseDAO().fh_join(dto);
		
		 if(row> 0) {
			 num++;
			 if(num==(agri_names.length)) {
			 System.out.println("등록 성공");
			 moveURL="Main.jsp";
			}
			 
			
		 else {
			 System.out.println("등록 실패");
			 moveURL = "Main.jsp";
			 request.setAttribute("mb_id","fail");
		 } }
		
		 //페이지 이동
		 RequestDispatcher rd = request.getRequestDispatcher(moveURL);
		 rd.forward(request, response);
	}}}


