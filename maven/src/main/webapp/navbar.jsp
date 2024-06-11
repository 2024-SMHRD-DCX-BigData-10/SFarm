<%@page import="com.smhrd.model.MemberDTO"%>
<%@page import="com.smhrd.model.FarmhouseDTO"%>
<%@page import="com.smhrd.model.CertificationDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>농가 및 농산품 정보</title>
    <style>
        * {
            margin: 0;
            padding: 0;
        }
        body {
            margin: 0;
        }
        .nav-container {
            position: fixed;
            display: flex;
            height: 70px;
            align-items: center;
            padding: 5px;
            background-color: white;
            border: 1px solid #154726;
            width: 100%;
            z-index: 1000;
        }
        .nav-title a {
            margin-right: 35px;
            font-size: 40px;
            font-family: 'impact';
            color: #154726;
            text-decoration: none;
        }
        .nav-item a {
            margin-right: 15px;
            font-weight: bolder;
            font-size: 18px;
            color: #154726;
            text-decoration: none;
        }
        .nav-but {
        	margin: 20px;
            width: 120px;
            height: 40px;
            border-radius: 20px;
            background-color: #154726;
            color: white;
            border: none;
            cursor: pointer;
        }
        .nav-but:hover {
            background-color: #123d2e;
            transform: scale(1.1);
        }
        .main-backgronund {
            width: 100%;
            height: 1000px;
            background-image: url(./img/main-banner.png);
            background-repeat: no-repeat;
            background-size: cover;
            filter: brightness(85%);
        }
        .main-title {
            color: white;
            font-weight: lighter;
            font-size: 20px;
            margin-top: 300px;
            margin-left: 30px;
        }
        .main-content {
            color: white;
            font-size: 50px;
            font-weight: bold;
            font-style: italic;
            margin-bottom: 25px;
            text-align: left;
            margin-left: 30px;
        }
        .main-button {
            padding: 7px;
            width: 130px;
            height: 70px;
            border-radius: 30px;
            background-color: #154726;
            color: white;
            border: none;
            cursor: pointer;
            margin-left: 30px;
            transition: background-color 0.3s, transform 0.3s;
        }
        .main-button:hover {
            background-color: #123d2e;
            transform: scale(1.1);
        }
        .footer {
            width: 100%;
            height: 150px;
            background-color: #154726;
        }
        .acs-img {
            width: 200px;
            position: relative;
            top: 60px;
            left: 50px;
            border-radius: 30px;
        }
        @media screen and (max-width: 1200px) {
            .nav-title a {
                font-size: 30px;
            }
            .nav-item a {
                font-size: 16px;
            }
            .main-content {
                font-size: 40px;
            }
            .main-button {
                width: 110px;
                height: 60px;
            }
        }
        @media screen and (max-width: 768px) {
            .nav-title a {
                font-size: 25px;
            }
            .nav-item a {
                font-size: 14px;
            }
            .main-content {
                font-size: 30px;
            }
            .main-button {
                width: 100px;
                height: 50px;
            }
        }
        @media screen and (max-width: 576px) {
            .nav-title a {
                font-size: 20px;
            }
            .nav-item a {
                font-size: 12px;
            }
            .main-title {
                font-size: 16px;
                margin-top: 200px;
            }
            .main-content {
                font-size: 24px;
            }
            .main-button {
                width: 90px;
                height: 40px;
                font-size: 16px;
            }
        }
    </style>
<script>
    function moveToPoster(fhName) {
        window.location.href = "농가상세포스터.html?fh_name=" + encodeURIComponent(fhName);
    }
</script>
</head>
<body>
   <%
        // session에 user_info가 있는지 없는지 확인 
        MemberDTO user_info = (MemberDTO) session.getAttribute("user_info");
    %>
        <nav class="nav-container">
            <div style="flex-grow: 0.05;"></div>
            <div class="nav-title" style="margin-left:10px ;"><a href="SFarm_main.jsp">SFarm</a></div>
            <div style="flex-grow: 0.1;"></div>
            <div class="nav-item"><a href="#">웹 소개</a></div>
            <div class="nav-item"><a href="#">지역 명소 추천</a></div>
            <div class="nav-item"><a href="#">고객 지원</a></div>
            <div class="nav-item"><a href="AllNameCards">농가 목록</a></div>
            <div style="flex-grow: 0.7;"></div>
            <% if (user_info != null) { %>
                <div class="nav-join"><%= user_info.getMb_name() %>님 환영합니다.</div>
                <a href="S_LogoutCon"><button class="nav-but">로그아웃</button></a>
            <% } else { %>
                <a href="SFarm_JoinPage.jsp"><button class="nav-but">회원 가입</button></a>
                <a href="SFarm_LoginPage.jsp"><button class="nav-but" style="margin-left: 10px;">로그인</button></a>
            <% } %>
        </nav>

    </body>
    </html>