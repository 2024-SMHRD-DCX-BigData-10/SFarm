<%@ page import="com.smhrd.model.ProductDAO" %>
<%@ page import="com.smhrd.model.ProductDTO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.smhrd.model.FarmhouseDTO" %>
<%@ page import="com.smhrd.model.FarmhouseDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>농가 정보</title>
</head>
<body>
    <%
        String mb_id = request.getParameter("mb_id");
        String fh_name = request.getParameter("fh_name");
        String qrCodePath = request.getParameter("qrCodePath");

        FarmhouseDAO farmhouseDAO = new FarmhouseDAO();
        ArrayList<FarmhouseDTO> farmhouseList = farmhouseDAO.getFarmhouseDTO(mb_id);

        FarmhouseDTO farmhouse = null;
        if (farmhouseList != null && !farmhouseList.isEmpty()) {
            farmhouse = farmhouseList.get(0);
        }

        // 농산물 정보 가져오기
        ProductDAO productDAO = new ProductDAO();
        ArrayList<ProductDTO> productList = productDAO.getProductsByFarmhouse(mb_id);
    %>
    <h2>농가 정보</h2>
    <p>농가 이름: <%= farmhouse.getFh_name() %></p>
    <p>농장주: <%= farmhouse.getFh_owner() %></p>
    <p>농가 소개: <%= farmhouse.getFh_intro() %></p>

    <h3>농산물 정보</h3>
    <%
        for (ProductDTO product : productList) {
    %>
        <p>품명: <%= product.getAgri_name() %></p>
        <p>영양성분: <%= product.getNutrition_fact() %></p>
        <p>손질법: <%= product.getTrimming() %></p>
        <p>보관법: <%= product.getKeeping() %></p>
        <p>효능: <%= product.getEffect() %></p>
        <p>구입요령: <%= product.getPurchase_method() %></p>
        <img src="<%= request.getContextPath() + "/images/" + product.getAgri_img1() %>" alt="Image 1">
        <img src="<%= request.getContextPath() + "/images/" + product.getAgri_img2() %>" alt="Image 2">
        <img src="<%= request.getContextPath() + "/images/" + product.getAgri_img3() %>" alt="Image 3">
        <hr>
    <%
        }
    %>

    <% if (qrCodePath != null) { %>
        <h3>QR 코드:</h3>
        <img src="<%= request.getContextPath() + qrCodePath %>" alt="QR Code">
    <% } else { %>
        <h3>QR없음</h3>
    <% } %>
</body>
</html>
