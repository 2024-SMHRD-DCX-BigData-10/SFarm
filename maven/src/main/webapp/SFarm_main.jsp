<%@page import="com.smhrd.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        body{
            margin: 0px;
            
        }
        div{
            box-sizing: border-box;
        }
        .nav-container{
            display: flex;
            height: 70px;
            align-items: center;
            padding: 5px;
            background-color:darkslategrey;
            border-bottom-left-radius:10px ;
            border-bottom-right-radius:10px ;
        }
        .nav-item a{
            margin-right: 15px;
            color: beige;
            text-decoration: none;

        }
        .nav-but{         
            border-radius: 10px;
            background-color:whitesmoke;
        }
        .main-backgronund{
            padding: 1px;
            width:800x;
            height:900px;
            background-image: url(./img/farm.jpg);
            background-repeat: no-repeat;
            background: cover;
            background-position: left;
            background-attachment: fixed;
            filter: brightness(80%);
        }
        .main-title{
            color: white;
            font-size: 80px;
            margin-top:350px;
            text-align: center;
        }
        .main-content{
            color: #eee;
            font-size: 30px;
            font-style: italic;
            text-align: center;
        }
        .main-button{
            
            padding: 1px;
            font-size: 20px;
            background: white;
            border-radius: 8px;
            position: absolute;
            left: 0;
            right: 0;
            margin: auto;
            width: 140px           
        }
        .explain-box{
            width: 80%;
            max-width: 600px;
            padding: 10px;
            margin: auto;
            text-align: center;
            background-color: #eee;
            position: relative;
            top: 50px;
        }
        .footer{
            width: 100%;
            height: 100px;
            background-color: darkslategray;
        }
        /* 미디어 쿼리는 맨밑에 있어야 작동잘됨! */
        @media screen and (max-width:1200px) {
         .main-backgronund h4,p{
            font-size: 20px;
         }  
        }
        /* 태블릿 사이즈 */
        @media screen and (max-width:768px) {
         .main-backgronund h4,p{
            font-size: 20px;
         }  
        }
        /* 모바일 사이즈 */
        @media screen and (max-width:576px) {
         .main-backgronund h4,p{
            font-size: 20px;
            width: 100%;
         }  
        }
    </style>
</head>
<body >

    

    <nav class="nav-container">
        <div style="flex-grow: 0.05;"></div>
        <div class="nav-item" style="margin-left:10px ;"><a href="#">SFarm</a></div>
        <div style="flex-grow: 0.1;"></div>
        <div class="nav-item"><a href="#">웹 소개</a></div>
        <div class="nav-item"><a href="#">지역 명소 추천</a></div>
        <div class="nav-item"><a href="#">고객 지원</a></div>
        <div style="flex-grow: 0.7;"></div>
        <a href="SFarm_JoinPage.jsp"><button class="nav-but">회원 가입</button></a>
        <a href="SFarm_LoginPage.jsp"><button class="nav-but" style="margin-left: 10px;">로그인</button></a>
    </nav>

    <div class="main-backgronund"> 
        <h4 class="main-title"> storytelling</h4>
        <p class="main-content">건강한 로컬푸드 의<br>농가 스토리 텔링을 소개합니다</p>
        <button class="main-button">농가 목록</button>
        <div class="explain-box">
            <h4>Farm!</h4>
            <p>hi our web site wellcome~</p>
        </div>
    </div>
    <footer>
        <div class="footer"></div>
    </footer>

</body>
</html>
