package com.smhrd.controller;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.FarmhouseDAO;
import com.smhrd.model.FarmhouseDTO;

@WebServlet("/AllNameCards")
public class S_AllNameCardsCon extends HttpServlet {

    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("AllNameCardsServlet");

        request.setCharacterEncoding("UTF-8");

        FarmhouseDAO dao = new FarmhouseDAO();
        ArrayList<FarmhouseDTO> allFarmhouses = dao.getAllFarmhouses();

        request.setAttribute("allFarmhouses", allFarmhouses);
        request.getRequestDispatcher("all_namecards.jsp").forward(request, response);
    }
}
