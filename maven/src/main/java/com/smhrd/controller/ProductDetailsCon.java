package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.ProductDTO;
import com.smhrd.model.ProductDAO;

@WebServlet("/ProductDetailsCon")
public class ProductDetailsCon extends HttpServlet {

    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("ProductDetailsCon");

        request.setCharacterEncoding("UTF-8");

        String agriIdxStr = request.getParameter("agri_idx");

        if (agriIdxStr != null && !agriIdxStr.trim().isEmpty()) {
            try {
                double agri_idx = Double.parseDouble(agriIdxStr.trim());
                ProductDAO dao = new ProductDAO();
                ProductDTO product = dao.getProductDetails(agri_idx);

                request.setAttribute("product", product);
                request.getRequestDispatcher("product_details.jsp").forward(request, response);
            } catch (NumberFormatException e) {
                e.printStackTrace();
                response.sendRedirect("error.jsp");
            }
        } else {
            System.out.println("agri_idx 값이 null이거나 비어 있습니다.");
            response.sendRedirect("error.jsp");
        }
    }
}
