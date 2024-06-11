package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ProductDetailsCon")
public class ProductDetailsCon extends HttpServlet {

    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
        System.out.println("ProductDetailsCon");

        request.setCharacterEncoding("UTF-8");

        String agri_name = request.getParameter("agri_name");

        System.out.println("Received agri_name: " + agri_name);  // 디버깅용 출력
        if (agri_name != null && !agri_name.isEmpty()) {
            try {
                request.setAttribute("agri_name", agri_name);
                System.out.println("detailcon end");

                RequestDispatcher rd = request.getRequestDispatcher("product_detail.jsp");
                rd.forward(request, response);
            } catch (NumberFormatException e) {
                e.printStackTrace();
                response.sendRedirect("error.jsp");
            }
        } else {
            System.out.println("agri_name 값이 null이거나 비어 있습니다.");
            response.sendRedirect("error.jsp");
        }
    }
}
