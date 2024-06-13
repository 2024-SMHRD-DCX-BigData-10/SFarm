<%@page import="com.smhrd.model.CertificationDAO"%>
<%@page import="com.smhrd.model.FarmhouseDTO"%>
<%@page import="com.smhrd.model.CertificationDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>농가 및 농산품 정보</title>
<link rel="stylesheet" type="text/css" href="CSS/navbar.css">
<style>
    * {
        margin: 0;
        padding: 0;
    }
    body {
        margin: 0px;
        box-sizing: border-box;
        font-family: Arial, sans-serif;
        background-color: #f8f9fa;
    }
    .container {
        padding: 1px;
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
        padding-top: 100px; /* 상단 패딩을 줄임 */
    }
    .card {
        width: 600px; /* 카드의 너비를 조정 */
        height: auto;
        margin: 10px 30px 30px 30px; /* 상단 마진을 줄이고 하단 마진을 늘림 */
        border: 1px solid #ddd;
        padding: 30px; /* 패딩을 늘려서 카드의 높이 증가 */
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        border-radius: 15px;
        background-color: #ffffff;
        box-sizing: border-box;
        transition: transform 0.3s;
        display: flex;
        flex-direction: column;
        cursor: pointer;
    }
    .card:hover {
        transform: scale(1.05);
        background: -webkit-gradient(linear, left bottom, right top, from(#92b5db), to(#1d466c));
        background: -webkit-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
        background: -moz-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
        background: -o-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
        background: linear-gradient(to top right, #92b5db 0%, #1d466c 100%);
    }
    .card-content {
        flex: 1;
    }
    .card-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 10px; /* 여백 감소 */
    }
    .card h5 {
        font-size: 21px;
        font-weight: bold;
        margin-bottom: 5px; /* 여백 감소 */
        
    }
        .card h6 {
        font-size: 19px;
        font-weight: bold;
        margin-bottom: 5px; /* 여백 감소 */
        
    }
    .card p {
        margin: 5px 0;
        font-size: 16px;
    }
    .card ul {
        list-style-type: none;
        padding-left: 0;
        margin: 5px 0;
    }
    .card ul li {
        display: inline-block;
        margin-right: 5px;
        font-size: 16px;
    }
    .certification {
        margin-top: 10px; /* 여백 감소 */
    }
    .certification-list {
        display: flex;
        flex-wrap: wrap;
        justify-content: space-between;
    }
    .cert-item {
        display: flex;
        justify-content: space-between;
        align-items: center;
        width: 48%; /* 인증 정보를 두 개씩 배치하기 위해 너비 조정 */
        margin-bottom: 10px;
    }
    .cert-item p {
        flex: 1;
        margin: 0;
    }
    .cert-item img {
        width: 50px; /* 인증 이미지 크기 조정 */
        height: 50px;
        margin-left: 10px;
    }
    .nav-join {
        font-size: 23px;
        color: rgb(90, 90, 90);
        font-family: fantasy;
        margin-left: 130px;
    }
    .nav-but {
        margin-left: 50px;
        margin-right: 50px;
    }
    .right-section {
        display: flex;
        align-items: center;
        justify-content: center;
        margin-top: 20px;
    }
    .qr-code {
        width: 100px; /* QR 코드 크기 조정 */
        height: 100px;
        object-fit: contain;
    }
</style>
<script>
    function moveToPoster(fhName) {
        window.location.href = "SFarmStoryCon?fh_name=" + encodeURIComponent(fhName);
    }
</script>
</head>
<body>
<%@ include file="navbar.jsp" %>
<div class="container">
    <%
        List<FarmhouseDTO> farm_name = (List<FarmhouseDTO>) request.getAttribute("farm_name");
        List<String> qrPaths = (List<String>) request.getAttribute("qrPaths");
        CertificationDAO certiDAO = new CertificationDAO();
        ArrayList<CertificationDTO> certificationList = new ArrayList<CertificationDTO>();

        if (farm_name != null && qrPaths != null) {
            for (int i = 0; i < farm_name.size(); i++) {
                FarmhouseDTO x = farm_name.get(i);
                String qrCodePath = qrPaths.get(i);
    %>
                <div class="card" onclick="moveToPoster('<%= x.getFh_name() %>')">
                    <div class="card-content">
                        <div class="card-header">
                            <h5 class="card-title"><%= x.getFh_nick() %></h5>
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
                        <p>대표: <%= x.getFh_owner() %></p>
                        <p>Tell <%= user_info.getMb_phone()%></p>
                        <ul>품목: 
                        <%
                            for (FarmhouseDTO dto : farm_name) {
                                if (dto.getFh_name().equals(x.getFh_name())) {
                                    String agri_name = dto.getAgri_name();
                        %>
                                    <li><%= agri_name %></li>
                        <%
                                }
                            }
                        %>
                        </ul>
                        <p class="card-text"><%= x.getFh_intro() %></p>
                        <div class="certification">
                        <% certificationList = certiDAO.getCertifications(x.getFh_name());
                        ArrayList<String> displayedProducts = new ArrayList<>(); // 이미 출력된 인증 제품을 저장할 리스트
                        if (certificationList != null && !certificationList.isEmpty()) { %>
                        <br>
                            <h6>인증 정보</h6>
                            <div class="certification-list">
                                <% 
                                   
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
                                                    <p><%= cert.getCert_type() %> <%= cert.getCert_product() %></p>
                                                    <img src="<%= cert_img %>" alt="인증 이미지">
                                                </div>
                                <%
                                            }
                                        }
                                    } else {
                                %>
                                        <br>
                            <h6> </h6>
                            <div class="certification-list">
                               <Br><br>
                                                <div class="cert-item">
                                                    <p></p>
                                                    
                                                </div>
                                <%
                                    }
                                %>
                            </div>
                        </div>
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
</body>
</html>
