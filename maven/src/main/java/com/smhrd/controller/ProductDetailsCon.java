package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.ProductDAO;
import com.smhrd.model.ProductDTO;

@WebServlet("/ProductDetailsCon")
public class ProductDetailsCon extends HttpServlet {

    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("ProductDetailsCon");

        request.setCharacterEncoding("UTF-8");
        String agri_idx_str = request.getParameter("agri_idx");
        Double agri_idx = Double.parseDouble(agri_idx_str);

        ProductDAO dao = new ProductDAO();
        ProductDTO product = dao.getProductDetails(agri_idx);

        if (product != null) {
            request.setAttribute("product", product);
            request.getRequestDispatcher("product_details.jsp").forward(request, response);
        } else {
            System.out.println("농산품 정보를 찾을 수 없습니다.");
            response.sendRedirect("Main.jsp");
        }
    }
}
