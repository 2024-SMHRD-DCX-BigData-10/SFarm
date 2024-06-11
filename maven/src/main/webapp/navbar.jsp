<%@page import="com.smhrd.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
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
            transition: color 0.3s, transform 0.3s;
        }
        .nav-title a:hover {
            color: #123d2e;
            transform: scale(1.1);
        }
        .nav-item a {
            margin-right: 15px;
            font-weight: bolder;
            font-size: 18px;
            color: #154726;
            text-decoration: none;
            transition: color 0.3s, transform 0.3s;
        }
        .nav-item a:hover {
            color: #123d2e;
            transform: scale(1.1);
        }
        .nav-but {
            width: 120px;
            height: 40px;
            border-radius: 20px;
            background-color: #154726;
            color: white;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.3s;
        }
        .nav-but:hover {
            background-color: #123d2e;
            transform: scale(1.1);
        }
    </style>
</head>
<body>
    <%
        MemberDTO user_info = (MemberDTO) session.getAttribute("user_info");
    %>
    <nav class="nav-container">
        <div style="flex-grow: 0.05;"></div>
        <div class="nav-title" style="margin-left:10px;"><a href="SFarm_main.jsp">SFarm</a></div>
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
