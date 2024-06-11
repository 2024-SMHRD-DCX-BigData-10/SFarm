<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.smhrd.model.FarmhouseDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.smhrd.model.FarmhouseDAO"%>
<%@page import="com.smhrd.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<<<<<<< HEAD
    <title>Document</title>
=======

    <title>Document</title>


  
>>>>>>> branch 'master' of https://github.com/2024-SMHRD-DCX-BigData-10/SFarm.git

    <style>
        * {
            margin: 0;
            padding: 0;
        }
<<<<<<< HEAD
        body {

            margin: 0px;


			}

  

      
=======
        body {
            margin: 0px;
			}
>>>>>>> branch 'master' of https://github.com/2024-SMHRD-DCX-BigData-10/SFarm.git
        .div {

            box-sizing: border-box;
            border: none;
        }
        .nav-container {
            position: fixed;
            display: flex;
            height: 70px;
            align-items: center;
            padding: 5px;
            background-color: white;
            border: 1px solid #154726;
<<<<<<< HEAD
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
            width: 120px;
            height: 40px;
            border-radius: 20px;
            background-color: #154726;
            color: white;
            border-color: cornflowerblue;
            box-shadow: 1px 5px whitesmoke;
            cursor: pointer;
        }
        .nav-but:hover {
            background-color: #123d2e; /* 호버 시 색상 변경 */
            transform: scale(1.1); /* 호버 시 크기 확대 */
        }
        .main-backgronund {
            padding:1px;
=======

        .main-background {
            padding: 1px;
>>>>>>> branch 'master' of https://github.com/2024-SMHRD-DCX-BigData-10/SFarm.git
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
            margin-top:300px;
            margin-left:30px;
            padding-top:30px;
            text-align:left;
            
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
            border-radius: 8px;
            position: absolute;
            margin: auto;
            padding: 7px;
            width: 130px;
            height: 70px;
            border-radius: 30px;
            background-color: #154726;
            color: white;
            border-color: aliceblue;
            cursor: pointer;
            margin-left: 30px;
            transition: background-color 0.3s, transform 0.3s; /* 트랜지션 추가 */
        }
        .main-button:hover {
            background-color: #123d2e; /* 호버 시 색상 변경 */
            transform: scale(1.1); /* 호버 시 크기 확대 */
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
        /* 미디어 쿼리는 맨밑에 있어야 작동잘됨! */
        @media screen and (max-width: 1200px) {
            .main-backgronund h4, p {
                font-size: 20px;
            }
        }
        /* 태블릿 사이즈 */
        @media screen and (max-width: 768px) {
            .main-backgronund h4, p {
                font-size: 20px;
            }
        }
        /* 모바일 사이즈 */
        @media screen and (max-width: 576px) {
            .main-backgronund h4, p {
                font-size: 20px;
                width: 100%;
            }
        }
    </style>
</head>
<body>
<<<<<<< HEAD
    <%
        // session에 user_info가 있는지 없는지 확인 
        MemberDTO user_info = (MemberDTO) session.getAttribute("user_info");
=======

<%@ include file="navbar.jsp" %>

<div class="main-background">
    <div class="main-expainbox">
        <h4 class="main-title">storytelling</h4>
        <p class="main-content">건강한 로컬푸드의<br>농가 이야기를 소개합니다.</p>
        <div><a href="AllNameCards"><button class="main-button">농가<br>알아보기</button></a></div>
    </div>
    <br><br><br><br>
    <%MemberDTO user_info = (MemberDTO) session.getAttribute("user_info");
 
    if (user_info != null) {
        FarmhouseDAO f_dao = new FarmhouseDAO();
        String mb_id = user_info.getMb_id();
        System.out.println("메인페이지" + mb_id);
>>>>>>> branch 'master' of https://github.com/2024-SMHRD-DCX-BigData-10/SFarm.git
    %>
<div class="wrap" style="display: block;">
    <nav class="nav-container">
        <div style="flex-grow: 0.05;"></div>
        <div class="nav-title" style="margin-left:10px ;"><a href="#">SFarm</a></div>
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

    <div class="main-backgronund">
        <div class="main-expainbox">
            <h4 class="main-title">storytelling</h4>
            <p class="main-content">건강한 로컬푸드 의<br>농가 이야기 를 소개합니다.</p>
            <div><a href="AllNameCards"><button class="main-button">농가<br>알아보기</button></a></div>
        </div>
        <br><br><br><br>
<<<<<<< HEAD
        <% if (user_info != null) {
            FarmhouseDAO f_dao = new FarmhouseDAO();
            String mb_id = user_info.getMb_id();
            System.out.println("메인페이지" + mb_id);
        %>
            <div><a href="S_NameCardCon?mb_id=<%= mb_id %>"><button class="main-button">명함<br> 발급하기</button></a></div>
            <br><br><br><br>
            <div><a href="SFarm_registerPage.jsp"><button class="main-button">농장<br> 등록하기</button></a></div>
        <% } %>
=======
        <div><a href="SFarm_registerPage.jsp"><button class="main-button">농장<br> 등록하기</button></a></div>
    <% } %>
</div>


<!-- footer -->
<footer class="footer">
    <div class="footer-container">
        <img class="acs-img" src="./img/농림축산식품부_국_좌우.jpg" alt="농림축산이미지">
>>>>>>> branch 'master' of https://github.com/2024-SMHRD-DCX-BigData-10/SFarm.git
    </div>
    <!-- footer -->
    <footer class="footer">
        <div class="footer-container">
            <img class="acs-img" src="./img/농림축산식품부_국_좌우.jpg" alt="농림축산이미지">
        </div>
    </footer>
    
</div>
</body>
</html>
