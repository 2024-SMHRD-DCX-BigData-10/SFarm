<%@page import="com.smhrd.model.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>농산품 상세 정보</title>
</head>
<body>
    <%
        ProductDTO product = (ProductDTO) request.getAttribute("product");
        if (product != null) {
    %>
    <h2>농산품 상세 정보</h2>
    <p>농산품 명: <%= product.getAgri_name() %></p>
    <p>영양성분: <%= product.getNutrition_fact() %></p>
    <p>손질법: <%= product.getTrimming() %></p>
    <p>보관법: <%= product.getKeeping() %></p>
    <p>효능: <%= product.getEffect() %></p>
    <p>구입요령: <%= product.getPurchase_method() %></p>
    <p>사진1: <img src="<%= product.getAgri_img1() %>" alt="사진1"></p>
    <p>사진2: <img src="<%= product.getAgri_img2() %>" alt="사진2"></p>
    <p>사진3: <img src="<%= product.getAgri_img3() %>" alt="사진3"></p>
    <%
        } else {
    %>
    <h3>농산품 정보를 찾을 수 없습니다.</h3>
    <%
        }
    %>
</body>
</html>
