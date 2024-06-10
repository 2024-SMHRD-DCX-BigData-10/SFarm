<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.smhrd.model.FarmhouseDTO"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>문서</title>
    <style>
        body {
            margin: 0px;
        }
        .main-background {
            padding: 1px;
            width: 100%;
            height: 900px;
            background-image: url(./img/farm.jpg);
            background-repeat: no-repeat;
            background-size: cover;
            background-position: left;
            background-attachment: fixed;
            filter: brightness(80%);
            margin-top: 70px; /* 고정된 네비게이션 바와 겹치지 않도록 마진 추가 */
        }
        .main-title {
            color: white;
            font-size: 80px;
            margin-top: 350px;
            text-align: center;
        }
        .main-content {
            color: #eee;
            font-size: 30px;
            font-style: italic;
            text-align: center;
        }
        .main-button {
            padding: 1px;
            font-size: 20px;
            background: white;
            border-radius: 8px;
            position: absolute;
            left: 0;
            right: 0;
            margin: auto;
            width: 140px;           
        }
        .explain-box {
            width: 80%;
            max-width: 600px;
            padding: 10px;
            margin: auto;
            text-align: center;
            background-color: #eee;
            position: relative;
            top: 50px;
        }
        .footer {
            width: 100%;
            height: 100px;
            background-color: darkslategray;
        }
        /* 미디어 쿼리는 맨 밑에 있어야 작동이 잘 됩니다 */
        @media screen and (max-width:1200px) {
            .main-background h4, p {
                font-size: 20px;
            }  
        }
        /* 태블릿 사이즈 */
        @media screen and (max-width:768px) {
            .main-background h4, p {
                font-size: 20px;
            }  
        }
        /* 모바일 사이즈 */
        @media screen and (max-width:576px) {
            .main-background h4, p {
                font-size: 20px;
                width: 100%;
            }  
        }
    </style>
</head>
<body>
    <%@ include file="nav.html" %>

    <div class="main-background"> 
        <h4 class="main-title">스토리텔링</h4>
        <p class="main-content">건강한 로컬푸드의<br>농가 스토리텔링을 소개합니다</p>
        <button class="main-button">농가 목록</button>
        <div class="explain-box">
            <h4>Farm!</h4>
            <p>안녕하세요, 저희 웹사이트에 오신 것을 환영합니다~</p>
        </div>
    </div>
    <footer>
        <div class="footer"></div>
    </footer>
</body>
</html>
