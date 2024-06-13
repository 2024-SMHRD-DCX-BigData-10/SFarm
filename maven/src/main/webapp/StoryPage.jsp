<%@page import="com.smhrd.model.CertificationDAO"%>
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
            background-color: #f4f4f4;
            color: #333333;
        }
        .container {
            padding: 20px;
            text-align: center;
            max-width: 800px;
            margin: 20px auto; /* 네비게이션 바 높이 만큼 마진 추가 */
            background-color: #ffffff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }
        header {
            background-color: #2d6a4f;
            color: #ffffff;
            padding: 20px;
            border-bottom: 2px solid #1b4332;
        }
        header h1 {
            font-size: 36px;
            margin: 0;
        }
        .intro, .crops, .contact, .certification-info, .product-info, .product-detail {
            padding: 20px;
            margin: 20px 0;
            border-bottom: 1px solid #eaeaea;
        }
        .intro h2, .crops h2, .contact h2, .certification-info h2, .product-info h2, .product-detail h2 {
            font-size: 28px;
            margin-top: 0;
        }
        .intro p, .crops p, .contact p, .certification-info p, .product-info p, .product-detail p {
            font-size: 18px;
            line-height: 1.6;
            margin: 10px 0;
        }
        .crops ul {
            list-style: none;
            padding: 0;
        }
        .crops ul li {
            font-size: 18px;
            background-color: #e9ecef;
            padding: 10px;
            margin: 5px 0;
            border-radius: 5px;
        }
        .cert-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }
        .cert-item p {
            margin: 0;
            font-size: 18px;
        }
        .cert-item img {
            width: 50px;
            height: 50px;
        }
        .product-detail img {
            max-width: 100%;
            height: auto;
            margin: 10px 0;
            border-radius: 8px;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
        }
        .footer {
            padding: 20px;
            background-color: #2d6a4f;
            color: #ffffff;
            text-align: center;
            margin-top: 20px;
            border-top: 2px solid #1b4332;
        }
        @media (max-width: 600px) {
            .container {
                padding: 10px;
            }
            header h1 {
                font-size: 24px;
            }
            .intro h2, .crops h2, .contact h2, .certification-info h2, .product-info h2, .product-detail h2 {
                font-size: 22px;
            }
            .intro p, .crops p, .contact p, .certification-info p, .product-info p, .product-detail p {
                font-size: 16px;
            }
        }
    </style>
</head>
<body>

<%@ include file="navbar.jsp" %>

<div class="container">
    <% 
        ArrayList<FarmhouseDTO> farmDTO = (ArrayList<FarmhouseDTO>) request.getAttribute("farmDTO");
        CertificationDAO certiDAO = new CertificationDAO();
        ArrayList<CertificationDTO> certificationList = new ArrayList<CertificationDTO>();
        if (farmDTO != null && !farmDTO.isEmpty()) { 
            FarmhouseDTO x = farmDTO.get(0); // 첫 번째 농가 정보를 가져옵니다.
    %>
        <div class="intro">
            <h2><%= x.getFh_nick() %></h2>
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
            <% certificationList = certiDAO.getCertifications(x.getFh_name());
                ArrayList<String> displayedProducts = new ArrayList<>(); // 이미 출력된 인증 제품을 저장할 리스트
                if (certificationList != null && !certificationList.isEmpty()) {
                    for (CertificationDTO cert : certificationList) {
                        if (cert.getCert_product() != null && !displayedProducts.contains(cert.getCert_product()) && cert.getCert_product().equals(x.getAgri_name())) {
                            displayedProducts.add(cert.getCert_product()); // 출력된 인증 제품을 리스트에 추가
                            String cert_img = "";
                            if ("무농약농산물".equals(cert.getCert_type())) {
                                cert_img = request.getContextPath() + "/img/enviagro_logo_03.jpg";
                            } else if ("유기농농산물".equals(cert.getCert_type())) {
                                cert_img = request.getContextPath() + "/img/enviagro_logo_01.jpg";
                            }
            %>
                            <div class="cert-item">
                                <p>우리 농장은 <%= cert.getCert_product() %>에 대해 <strong><%= cert.getCert_type() %></strong> 인증을 받았습니다. 이는 저희가 제공하는 모든 농산물이 최고 품질임을 보장합니다.</p>
                                <img src="<%= cert_img %>" alt="인증 이미지">
                            </div>
            <% 
                        }
                    }
                } else {
            %>
                    <p>현재 인증 정보가 없습니다.</p>
            <% } %>
        </div>

        <div id="product-detail" class="product-detail">
            <h2>농산품 상세 정보</h2>
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
                <p>우리 농장의 <strong><%= product.getAgri_name()%></strong>는 <%= product.getEffect() %>의 효능이 있습니다.</p>
            <% 
                    } if (product.getTime_production() != null) {
            %>
                <p>우리 농장의 <strong><%= product.getAgri_name() %></strong>는 <%= product.getTime_production() %>기간에 나며</p>
            <% 
                    } if (product.getTrimming() != null) { %>
                    <p><%= product.getTrimming() %> 방법으로 손질하면</p>
                <% } %>
                
                <% if (product.getPurchase_method() != null) { %>
                    <p><%= product.getPurchase_method() %> 방법으로 구입하시면 좋습니다.</p>
                <% } %>
                <% if (product.getRecipe() != null) { %>
                <p>이 농산품으로 만들 수 있는 레시피는 다음과 같습니다: <%= product.getRecipe() %>.</p>
            <% 
                    }
                    if (product.getAgri_img1() != null || product.getAgri_img2() != null || product.getAgri_img3() != null) {
            %>
                <div>
                    <% if (product.getAgri_img1() != null) { %>
                        <img src="<%= product.getAgri_img1() %>" alt="<%= product.getAgri_name() %> 이미지1">
                    <% } %>
                    <% if (product.getAgri_img2() != null) { %>
                        <img src="<%= product.getAgri_img2() %>" alt="<%= product.getAgri_name() %> 이미지2">
                    <% } %>
                    <% if (product.getAgri_img3() != null) { %>
                        <img src="<%= product.getAgri_img3() %>" alt="<%= product.getAgri_name() %> 이미지3">
                    <% } %>
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
