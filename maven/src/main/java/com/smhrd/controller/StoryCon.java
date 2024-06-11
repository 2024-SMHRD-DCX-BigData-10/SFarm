package com.smhrd.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.FarmhouseDAO;
import com.smhrd.model.FarmhouseDTO;

@WebServlet("/StroyCon")
public class StoryCon {
	
	 protected void service(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	    	
	        System.out.println("StroyCon");

	        request.setCharacterEncoding("UTF-8");
	       
	        String fh_name = request.getParameter("fh_name");
	        FarmhouseDAO farmdao = new FarmhouseDAO();
	        ArrayList<FarmhouseDTO> farmDTO = farmdao.FarmhouseDTO(fh_name);
	        request.setAttribute("farmDTO",farmDTO);
	        RequestDispatcher rd = request.getRequestDispatcher("StroyPage.jsp");
            rd.forward(request, response);
	    }
	}
