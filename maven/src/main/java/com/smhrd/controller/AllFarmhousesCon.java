package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.FarmhouseDAO;
import com.smhrd.model.FarmhouseDTO;
import com.smhrd.model.MemberDTO;

import java.util.ArrayList;

@WebServlet("/S_AllFarmhousesCon")
public class AllFarmhousesCon extends HttpServlet {

    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("AllFarmhousesCon");

        request.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession();
        MemberDTO user_info = (MemberDTO) session.getAttribute("user_info");

        if (user_info == null) {
            System.out.println("사용자가 로그인하지 않았습니다.");
            response.sendRedirect("Main.jsp");
        } else {
            FarmhouseDAO dao = new FarmhouseDAO();
            ArrayList<FarmhouseDTO> fh_dto_list = dao.getAllFarmhouses();

            if (fh_dto_list != null && !fh_dto_list.isEmpty()) {
                request.setAttribute("fh_dto_list", fh_dto_list);
                request.getRequestDispatcher("namecard_list.jsp").forward(request, response);
            } else {
                System.out.println("농가 정보가 없습니다.");
                response.sendRedirect("Main.jsp");
            }
        }
    }
}
