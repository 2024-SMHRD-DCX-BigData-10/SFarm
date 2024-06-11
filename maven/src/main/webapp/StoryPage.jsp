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
    <link rel="stylesheet" type="text/css" href="CSS/navbar.css">
    <style>
        body {
            margin: 0;
            padding-top: 80px; /* 네비게이션 바 높이 만큼의 패딩 추가 */
            font-family: Arial, sans-serif;
        }
        .container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
        }
        .card {
            width: 300px;
            height: auto;
            margin-top: 50px;
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
        ArrayList<FarmhouseDTO> farmDTO = (ArrayList<FarmhouseDTO>) request.getAttribute("farmDTO");
        List<CertificationDTO> certificationList = (List<CertificationDTO>) request.getAttribute("certificationList");

        if (farmDTO != null) {
            for (int i = 0; i < farmDTO.size(); i++) {
                FarmhouseDTO x = farmDTO.get(i);
    %>
                <div class="card" onclick="moveToPoster('<%= x.getFh_name() %>')">
                    <h5 class="card-title"><%= x.getFh_name() %></h5>
                    <p>농장주: <%= x.getFh_owner() %></p>
                    <ul>
                    <%
                        for (FarmhouseDTO dto : farmDTO) {
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

<div class="footer">
    <p>농가 스토리텔링 페이지 - 모든 권리 보유</p>
</div>

</body>
</html>
