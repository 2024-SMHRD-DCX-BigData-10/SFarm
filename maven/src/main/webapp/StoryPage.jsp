<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.FarmhouseDTO"%>
<%@page import="com.smhrd.model.CertificationDTO"%>
<%@page import="com.smhrd.model.ProductDTO"%>
<%@page import="com.smhrd.model.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>농가 홍보 포스터</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            background-color: #ffffff;
            color: #333333;
        }
        .container {
            padding: 20px;
            text-align: center;
        }
        header {
            background-color: #f8f9fa;
            padding: 20px;
            border-bottom: 1px solid #eaeaea;
        }
        header h1 {
            font-size: 24px;
            margin: 0;
        }
        .eco-mark {
            max-width: 50px;
            margin: 20px auto;
        }
        .intro, .crops, .contact, .certification-info, .product-info, .product-detail {
            padding: 20px;
        }
        .intro h2, .crops h2, .contact h2, .certification-info h2, .product-info h2, .product-detail h2 {
            font-size: 20px;
            margin-top: 0;
        }
        .intro p, .crops p, .contact p, .certification-info p, .product-info p, .product-detail p {
            font-size: 16px;
            line-height: 1.5;
            margin: 10px 0;
        }
        .crops img, .product-info img, .product-detail img {
            max-width: 100%;
            height: auto;
        }
        @media (min-width: 600px) {
            header h1 {
                font-size: 36px;
            }
            .intro, .crops, .contact, .certification-info, .product-info, .product-detail {
                padding: 20px 40px;
            }
        }
        .link-button {
            padding: 10px 20px;
            margin: 5px;
            border: none;
            background: none;
            color: #007BFF;
            text-decoration: underline;
            cursor: pointer;
            font-size: 16px;
        }
        .link-button:hover {
            color: #0056b3;
        }
        .product-detail {
            display: block; /* 항상 보이도록 설정 */
        }
    </style>
</head>
<body>

<%@ include file="navbar.jsp" %>

<div class="container">
    <% 
        ArrayList<FarmhouseDTO> farmDTO = (ArrayList<FarmhouseDTO>) request.getAttribute("farmDTO");
        if (farmDTO != null && !farmDTO.isEmpty()) { 
            FarmhouseDTO x = farmDTO.get(0); // 첫 번째 농가 정보를 가져옵니다.
    %>
        <div class="intro">
            <h2><%= x.getFh_name() %></h2>
            <p>농장주 <strong><%= x.getFh_owner() %></strong>님은 항상 자연을 생각하며 농사를 지으십니다. <strong><%= x.getFh_name() %></strong> 농장은 <%= x.getFh_intro() %>.</p>
        </div>

        <div class="crops">
            <h2>주요 농산물</h2>
            <p>저희 농장에서 재배하는 농산물은 다음과 같습니다:</p>
            <ul>
                <% for (FarmhouseDTO dto : farmDTO) { %>
                    <li><%= dto.getAgri_name() %></li>
                <% } %>
            </ul>
        </div>

        <div class="certification-info">
            <h2>인증 정보</h2>
            <%
                List<CertificationDTO> certificationList = (List<CertificationDTO>) request.getAttribute("certificationList");
                if (certificationList != null && !certificationList.isEmpty()) {
                    for (CertificationDTO cert : certificationList) {
                        if (cert.getFh_name().equals(x.getFh_name())) {
            %>
                            <p>우리 농장은 <strong><%= cert.getCert_type() %></strong> 인증을 받았습니다. 이는 저희가 제공하는 모든 농산물이 최고 품질임을 보장합니다.</p>
                            <img src="<%= cert.getCert_img() %>" alt="인증 이미지">
            <% 
                        }
                    }
                } else {
            %>
                    <p>현재 인증 정보가 없습니다.</p>
            <% } %>
        </div>

        <div id="product-detail" class="product-detail">
            <%
                // 첫 번째 농산물 이름을 가져옵니다.
                String productName = farmDTO.get(0).getAgri_name();
                ProductDAO dao = new ProductDAO();
                ProductDTO product = dao.getProductDetails(productName);
                if (product != null) {
                    if (product.getAgri_name() != null) {
            %>
                <h3><%= product.getAgri_name() %></h3>
            <% 
                    }
                    if (product.getEffect() != null) {
            %>
                <p>우리 농장의 <strong><%= product.getAgri_name() %></strong>는 <%= product.getEffect() %>를 함유하고 있어 건강에 매우 유익합니다.</p>
            <% 
                    }
                    if (product.getTrimming() != null && product.getTime_production() != null && product.getPurchase_method() != null) {
            %>
                <p><%= product.getTrimming() %> 방법으로 손질하면, <%= product.getTime_production() %> 방법으로 오랫동안 보관할 수 있습니다. <%= product.getPurchase_method() %> 방법으로 구입하시면 좋습니다.</p>
            <% 
                    }
                    if (product.getRecipe() != null) {
            %>
                <p>이 농산품으로 만들 수 있는 레시피는 다음과 같습니다: <%= product.getRecipe() %>.</p>
            <% 
                    }
                    if (product.getAgri_img1() != null) {
            %>
                <div>
                    <img src="<%= product.getAgri_img1() %>" alt="<%= product.getAgri_name() %> 이미지1">
            <% 
                    }
                    if (product.getAgri_img2() != null) {
            %>
                    <img src="<%= product.getAgri_img2() %>" alt="<%= product.getAgri_name() %> 이미지2">
            <% 
                    }
                    if (product.getAgri_img3() != null) {
            %>
                    <img src="<%= product.getAgri_img3() %>" alt="<%= product.getAgri_name() %> 이미지3">
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
    <% } else { %>
        <h3>농가 정보가 없습니다.</h3>
    <% } %>

    <div id="additional-info"></div> <!-- 추가 데이터 영역 -->

</div>

<div class="footer">
    <p>농가 스토리텔링 페이지 - 모든 권리 보유</p>
</div>

</body>
</html>