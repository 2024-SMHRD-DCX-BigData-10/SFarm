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

import com.smhrd.model.FarmhouseDAO;
import com.smhrd.model.FarmhouseDTO;
import com.smhrd.model.MemberDTO;

@WebServlet("/S_NameCardCon")
public class NameCardCon extends HttpServlet {

    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("NameCardCon");

        request.setCharacterEncoding("UTF-8");
        String moveURL = "Main.jsp";

        HttpSession session = request.getSession();
        MemberDTO user_info = (MemberDTO) session.getAttribute("user_info");
        System.out.println(user_info.getMb_id());
        if (user_info != null) {
            String mb_id = user_info.getMb_id();
            
            moveURL = "namecard.jsp";
          
        } 
        
        RequestDispatcher rd = request.getRequestDispatcher(moveURL);
        rd.forward(request, response);
    }
}
