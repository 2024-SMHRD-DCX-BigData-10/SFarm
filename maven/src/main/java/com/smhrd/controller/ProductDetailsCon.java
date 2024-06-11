package com.smhrd.controller;
import java.io.IOException;
import java.io.PrintWriter;
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

        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        if (productList != null) {
            for (ProductDTO pd : productList) {
                out.println("<h2>농산품 상세 정보</h2>");
                out.println("<p>농산품 명: " + pd.getAgri_name() + "</p>");
                out.println("<p>영양성분: " + pd.getNutrition_fact() + "</p>");
                out.println("<p>손질법: " + pd.getTrimming() + "</p>");
                out.println("<p>보관법: " + pd.getKeeping() + "</p>");
                out.println("<p>효능: " + pd.getEffect() + "</p>");
                out.println("<p>구입요령: " + pd.getPurchase_method() + "</p>");
                out.println("<p>사진1: <img src='" + pd.getAgri_img1() + "' alt='사진1'></p>");
                out.println("<p>사진2: <img src='" + pd.getAgri_img2() + "' alt='사진2'></p>");
                out.println("<p>사진3: <img src='" + pd.getAgri_img3() + "' alt='사진3'></p>");
            }
        } else {
            out.println("<p>농산물 정보를 찾을 수 없습니다.</p>");
        }
    }
}
