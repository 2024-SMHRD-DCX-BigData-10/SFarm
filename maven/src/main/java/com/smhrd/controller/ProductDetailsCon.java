package com.smhrd.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.smhrd.model.ProductDAO;
import com.smhrd.model.ProductDTO;
import com.smhrd.model.FarmhouseDAO;
import com.smhrd.model.FarmhouseDTO;

@WebServlet("/ProductDetailsCon")
public class ProductDetailsCon extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productName = request.getParameter("productName");

        ProductDAO productDAO = new ProductDAO();
        List<ProductDTO> productList = productDAO.getProductsByFarmhouse(productName);

        String fh_name = request.getParameter("fh_name");
        FarmhouseDAO farmdao = new FarmhouseDAO();
        ArrayList<FarmhouseDTO> farmDTO = farmdao.FarmhouseDTO(fh_name);

        request.setAttribute("productList", productList);
        request.setAttribute("farmDTO", farmDTO);

        RequestDispatcher rd = request.getRequestDispatcher("/StoryPage.jsp");
        rd.forward(request, response);
    }
}
