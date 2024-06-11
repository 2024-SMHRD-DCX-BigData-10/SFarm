package com.smhrd.controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.smhrd.model.ProductDAO;
import com.smhrd.model.ProductDTO;

@WebServlet("/ProductDetailsCon")
public class ProductDetailsCon extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productName = request.getParameter("productName");

        ProductDAO dao = new ProductDAO();
        List<ProductDTO> productList = dao.getProductsByFarmhouse(productName);

        request.setAttribute("productList", productList);
        request.getRequestDispatcher("/StroyPage.jsp").forward(request, response);
    }
}
