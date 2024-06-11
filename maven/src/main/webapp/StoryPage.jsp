<%@page import="java.util.ArrayList"%>
<%@page import="com.smhrd.model.FarmhouseDAO"%>
<%@page import="com.smhrd.model.CertificationDTO"%>
<%@page import="com.smhrd.model.FarmhouseDTO"%>
<%@page import="com.smhrd.model.ProductDAO"%>
<%@page import="com.smhrd.model.ProductDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>농가 및 농산품 스토리텔링</title>
    <style>
        .container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
        }
        .card {
            width: 300px;
            height: auto;
            margin: 10px;
            border: 1px solid darkgray;
            padding: 10px;
            box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
            background-color: white;
            box-sizing: border-box;
        }
        .section-title {
            width: 100%;
            text-align: center;
            font-size: 24px;
            margin: 20px 0;
        }
    </style>
</head>
<body>

<%@ include file="navbar.jsp" %>

<div class="container">
        <%
            List<FarmhouseDTO> farm_name = (List<FarmhouseDTO>) request.getAttribute("fh_name");
           
            List<CertificationDTO> certificationList = (List<CertificationDTO>) request.getAttribute("certificationList");
			ArrayList<String> agri_list = new ArrayList<>();
            if (farm_name != null ) {
                for (int i = 0; i < farm_name.size(); i++) {
                    FarmhouseDTO x = farm_name.get(i);
                   
        %>
                    <div class="card" onclick="moveToPoster('<%= x.getFh_name() %>')">
                        <h5 class="card-title"><%= x.getFh_name() %></h5>
                        <p>농장주: <%= x.getFh_owner() %></p>
                        <ul>
                        <%
                            for (FarmhouseDTO dto : farm_name) {
                                if (dto.getFh_name().equals(x.getFh_name())) {
                                    String agri_name = dto.getAgri_name();
                                    agri_list.add(agri_name);
                        %>			
                                    <li><%= agri_name %></li>
                        <%
                                }
                            }
                        %>
                        </ul>
                        <div>
                        <%
                            if (qrCodePath != null) {
                        %>
                                <img src="<%= request.getContextPath() + qrCodePath %>" alt="QR Code" class="qr-code">
                        <%
                            } else {
                        %>
                                <h3>QR 없음</h3>
                        <%
                            }
                        %>
                        </div>
                        <p class="card-text"><%= x.getFh_intro() %></p>
                        <div class="certification">
                            <h5>인증 정보</h5>
                            <%
                                if (certificationList != null && !certificationList.isEmpty()) {
                                    for (CertificationDTO cert : certificationList) {
                                        if (cert.getFh_name().equals(x.getFh_name())) {
                            %>
                                            <p>인증 종류: <%= cert.getCert_type() %></p>
                                            <img src="<%= cert.getCert_img() %>" alt="인증 이미지">
                            <%
                                        }
                                    }
                                } else {
                            %>
                                    <p>인증 정보를 찾을 수 없습니다.</p>
                            <%
                                }
                            %>
                        </div>
                    </div>
        <%
                }
            } else {
        %>
                <h3>농가 정보가 없습니다.</h3>
        <%
            }
        %>
    </div>

    <!-- 농산물 정보 섹션 -->
    <div class="section-title">농산물 정보</div>
    <%
        if (!agri_list.isEmpty()) {
            ProductDAO dao = new ProductDAO();
            List<ProductDTO> productList = dao.getProductsByFarmhouse(agri_list.get(0));
            if (productList != null && !productList.isEmpty()) {
                for (ProductDTO pd : productList) {
    %>
    <div class="card">
        <h2>농산품 상세 정보</h2>
        <p>농산품 명: <%= pd.getAgri_name() %></p>
        <p>영양성분: <%= pd.getNutrition_fact() %></p>
        <p>손질법: <%= pd.getTrimming() %></p>
        <p>보관법: <%= pd.getKeeping() %></p>
        <p>효능: <%= pd.getEffect() %></p>
        <p>구입요령: <%= pd.getPurchase_method() %></p>
        <p>사진1: <img src="<%= pd.getAgri_img1() %>" alt="사진1"></p>
        <p>사진2: <img src="<%= pd.getAgri_img2() %>" alt="사진2"></p>
        <p>사진3: <img src="<%= pd.getAgri_img3() %>" alt="사진3"></p>
    </div>
    <%
                }
            } else {
    %>
                <h3>농산품 정보를 찾을 수 없습니다.</h3>
    <%
            }
        } else {
    %>
        <h3>농산물 목록이 비어 있습니다.</h3>
    <%
        }
    %>

</div>

<div class="footer">
    <p>농가 스토리텔링 페이지 - 모든 권리 보유</p>
</div>

</body>
</html>
