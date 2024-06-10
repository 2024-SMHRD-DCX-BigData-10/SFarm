<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.ProductDAO"%>
<%@page import="com.smhrd.model.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>농산품 상세 정보</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <style>
        body {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            background: #f8f9fa;
        }
        .navbar-brand {
            font-size: 24px;
            color: #007bff;
        }
        .container {
            margin-top: 30px;
        }
        .card {
            margin-bottom: 20px;
        }
        .card img {
            width: 100%;
            height: auto;
        }
        .footer {
            width: 100%;
            height: 130px;
            background-color: darkcyan;
            text-align: center;
            padding: 20px;
            position: fixed;
            bottom: 0;
        }
        .footer img {
            width: 200px;
            border-radius: 30px;
        }
    </style>
</head>
<body>

    <!-- 네비바 -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">SFarm</a>
        </div>
    </nav>

    <div class="container">
        <%
            ProductDAO dao = new ProductDAO();
            String agri_name = request.getParameter("agri_name");
            List<ProductDTO> productList = dao.getProductsByFarmhouse(agri_name);

            if (productList != null && !productList.isEmpty()) {
                for (ProductDTO pd : productList) {
        %>
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">농산품 명: <%= pd.getAgri_name() %></h5>
                <p class="card-text">영양성분: <%= pd.getNutrition_fact() %></p>
                <p class="card-text">손질법: <%= pd.getTrimming() %></p>
                <p class="card-text">보관법: <%= pd.getKeeping() %></p>
                <p class="card-text">효능: <%= pd.getEffect() %></p>
                <p class="card-text">구입요령: <%= pd.getPurchase_method() %></p>
                <div class="card-img">
                    <p>사진1: <img src="<%= pd.getAgri_img1() %>" alt="사진1"></p>
                    <p>사진2: <img src="<%= pd.getAgri_img2() %>" alt="사진2"></p>
                    <p>사진3: <img src="<%= pd.getAgri_img3() %>" alt="사진3"></p>
                </div>
            </div>
        </div>
        <%
                }
            } else {
        %>
        <h3>농산품 정보를 찾을 수 없습니다.</h3>
        <%
            }
        %>
    </div>

    <!-- footer -->
    <footer class="footer">
        <div class="footer-container">
            <img src="./img/농림축산식품부_국_좌우.jpg" alt="농림축산이미지">
        </div>
    </footer>
</body>
</html>
