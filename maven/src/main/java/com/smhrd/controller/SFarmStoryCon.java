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
import com.smhrd.model.ProductDAO;
import com.smhrd.model.ProductDTO;
import java.util.List;

@WebServlet("/SFarmStoryCon")
public class SFarmStoryCon extends HttpServlet {

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        System.out.println("StoryCon");

        request.setCharacterEncoding("UTF-8");

        String fh_name = request.getParameter("fh_name");
        FarmhouseDAO farmdao = new FarmhouseDAO();
        ArrayList<FarmhouseDTO> farmDTO = farmdao.FarmhouseDTO(fh_name);

        ProductDAO productDAO = new ProductDAO();
        List<ProductDTO> productList = null;

        // Check if a product name is provided for product details
        String productName = request.getParameter("productName");
        if (productName != null && !productName.isEmpty()) {
            productList = productDAO.getProductsByFarmhouse(productName);
        }

        request.setAttribute("farmDTO", farmDTO);
        request.setAttribute("productList", productList);

        RequestDispatcher rd = request.getRequestDispatcher("/StoryPage.jsp");
        rd.forward(request, response);
    }
}
