package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.MemberDAO;

@WebServlet("/idCheckCon")
public class idCheckCon extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// email 받아오기
		String email = request.getParameter("email");
		System.out.println(email+"check");
		
		// IdCheck 할 메소드 
		boolean idCheck= new MemberDAO().idCheck(email);{
			
			//true : 중복0,  false: 중복x
			String result;
			if( idCheck ==true) {
				result = "사용할 수 없는 아이디 입니다.";
			}
			else {
				result = "사용 가능한 아이디입니다.";
			}
			response.setContentType("application/text; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print(result);
		}
	}

}
