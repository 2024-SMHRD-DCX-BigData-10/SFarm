<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.smhrd.model.FarmhouseDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.smhrd.model.FarmhouseDAO"%>
<%@page import="com.smhrd.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" type="text/css" href="CSS/navbar.css">
    <style>
        * {
            margin: 0;
            padding: 0;
        }
        body {
            margin: 0;
        }
        .main-background {
            padding: 1px;
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
            padding: 10px;
            font-size: 20px;
            margin-top: 300px;
            margin-left: 30px;
            padding-top: 30px;
            text-align: left;
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
            padding: 1px;
            font-size: 20px;
            background: white;
            border-radius: 30px;
            position: absolute;
            margin: auto;
            padding: 7px;
            width: 130px;
            height: 70px;
            background-color: #154726;
            color: white;
            border-color: aliceblue;
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
</head>
<body>

<%@ include file="navbar.jsp" %>

<div class="main-background">
    <div class="main-expainbox">
        <h4 class="main-title">storytelling</h4>
        <p class="main-content">건강한 로컬푸드의<br>농가 이야기를 소개합니다.</p>
        <div><a href="AllNameCards"><button class="main-button">농가<br>알아보기</button></a></div>
    </div>
    <br><br><br><br>
    <%
         user_info = (MemberDTO) session.getAttribute("user_info");
        if (user_info != null) {
            FarmhouseDAO f_dao = new FarmhouseDAO();
            String mb_id = user_info.getMb_id();
            System.out.println("메인페이지" + mb_id);
    %>
        <div><a href="S_NameCardCon?mb_id=<%= mb_id %>"><button class="main-button">명함<br> 발급하기</button></a></div>
        <br><br><br><br>
        <div><a href="SFarm_registerPage.jsp"><button class="main-button">농장<br> 등록하기</button></a></div>
    <%
        }
    %>
</div>
<!-- footer -->
<footer class="footer">
    <div class="footer-container">
        <img class="acs-img" src="./img/농림축산식품부_국_좌우.jpg" alt="농림축산이미지">
    </div>
</footer>
</body>
</html>
