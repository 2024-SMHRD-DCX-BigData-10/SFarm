<%@page import="java.util.ArrayList"%>
<%@page import="com.smhrd.model.FarmhouseDAO"%>
<%@page import="com.smhrd.model.CertificationDTO"%>
<%@page import="com.smhrd.model.FarmhouseDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.MemberDTO"%>
<%@page import="com.smhrd.model.ProductDTO"%>
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
        .intro, .crops, .contact, .certification-info, .product-info {
            padding: 20px;
        }
        .intro h2, .crops h2, .contact h2, .certification-info h2, .product-info h2 {
            font-size: 20px;
            margin-top: 0;
        }
        .intro p, .crops p, .contact p, .certification-info p, .product-info p {
            font-size: 16px;
            line-height: 1.5;
            margin: 10px 0;
        }
        .crops img, .product-info img {
            max-width: 100%;
            height: auto;
        }
        @media (min-width: 600px) {
            header h1 {
                font-size: 36px;
            }
            .intro, .crops, .contact, .certification-info, .product-info {
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
    </style>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function() {
            $('.link-button').click(function(event) {
                event.preventDefault();
                var productName = $(this).data('product-name');
                var fhName = $(this).data('fh-name');
                $.ajax({
                    url: 'ProductDetailsCon',
                    type: 'POST',
                    data: { productName: productName, fh_name: fhName },
                    success: function(response) {
                        $('#additional-info').empty().append(response);
                    },
                    error: function(xhr, status, error) {
                        console.error('AJAX 요청 실패: ' + error);
                    }
                });
            });
        });
    </script>
</head>
<body>

<%@ include file="navbar.jsp" %>

<div class="container">
    <% 
        ArrayList<FarmhouseDTO> farmDTO = (ArrayList<FarmhouseDTO>) request.getAttribute("farmDTO");
        if (farmDTO != null && !farmDTO.isEmpty()) { 
    %>
        <div class="intro">
            <%
                FarmhouseDTO x = farmDTO.get(0); // 첫 번째 농가 정보를 가져옵니다.
            %>
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
    <% } else { %>
        <h3>농가 정보가 없습니다.</h3>
    <% } %>

    <div class="button-container">
        <% if (farmDTO != null && !farmDTO.isEmpty()) {
            for (FarmhouseDTO dto : farmDTO) { %>
                <button class="link-button" data-product-name="<%= dto.getAgri_name() %>" data-fh-name="<%= dto.getFh_name() %>">우리 농가의 <%= dto.getAgri_name() %> 더 알아보기</button>
        <% }} %>
    </div>

    <% if (request.getAttribute("productList") != null) { %>
        <div class="product-info">
            <h2>농산품 소개</h2>
            <%
                List<ProductDTO> productList = (List<ProductDTO>) request.getAttribute("productList");
                for (ProductDTO pd : productList) {
            %>
                <h3><%= pd.getAgri_name() %></h3>
                <p>우리 농장의 <strong><%= pd.getAgri_name() %></strong>는 <%= pd.getEffect() %>를 함유하고 있어 건강에 매우 유익합니다. <%= pd.getTrimming() %> 방법으로 손질하면, <%= pd.getTime_production() %> 방법으로 오랫동안 보관할 수 있습니다. <%= pd.getPurchase_method() %> 방법으로 구입하시면 좋습니다.</p>
                <p>이 농산품으로 만들 수 있는 레시피는 다음과 같습니다: <%= pd.getRecipe() %>.</p>
                <div>
                    <img src="<%= pd.getAgri_img1() %>" alt="<%= pd.getAgri_name() %> 이미지1">
                    <img src="<%= pd.getAgri_img2() %>" alt="<%= pd.getAgri_name() %> 이미지2">
                    <img src="<%= pd.getAgri_img3() %>" alt="<%= pd.getAgri_name() %> 이미지3">
                </div>
            <% } %>
        </div>
    <% } else if (request.getParameter("productName") != null) { %>
        <h3>농산품 정보를 찾을 수 없습니다.</h3>
    <% } %>

    <div id="additional-info"></div> <!-- AJAX 요청으로 추가할 데이터 영역 -->

</div>

<div class="footer">
    <p>농가 스토리텔링 페이지 - 모든 권리 보유</p>
</div>

</body>
</html>
