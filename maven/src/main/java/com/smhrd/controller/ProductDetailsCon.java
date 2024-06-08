package com.smhrd.controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.CertificationDAO;
import com.smhrd.model.CertificationDTO;
import com.smhrd.model.ProductDAO;
import com.smhrd.model.ProductDTO;

@WebServlet("/ProductDetailsCon")
public class ProductDetailsCon extends HttpServlet {

    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("ProductDetailsCon");

        request.setCharacterEncoding("UTF-8");

        String agri_name = request.getParameter("agri_name");
        String fh_name = request.getParameter("fh_name");

        System.out.println("Received agri_name: " + agri_name);

        if (agri_name != null && fh_name != null) {
            try {
                ProductDAO productDao = new ProductDAO();
                CertificationDAO certificationDao = new CertificationDAO();

                List<ProductDTO> productList = productDao.getProductsByFarmhouse(agri_name);
                List<CertificationDTO> certificationList = certificationDao.getCertifications(fh_name);

                request.setAttribute("productList", productList);
                request.setAttribute("certificationList", certificationList);

                RequestDispatcher rd = request.getRequestDispatcher("product_detail.jsp");
                rd.forward(request, response);
            } catch (Exception e) {
                e.printStackTrace();
                response.sendRedirect("error.jsp");
            }
        } else {
            System.out.println("agri_name 또는 fh_name 값이 null이거나 비어 있습니다.");
            response.sendRedirect("error.jsp");
        }
    }
}
