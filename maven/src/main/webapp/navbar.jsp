<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        .nav-container {
            display: flex;
            height: 70px;
            align-items: center;
            padding: 5px;
            background-color: darkslategrey;
            border-bottom-left-radius: 10px;
            border-bottom-right-radius: 10px;
            position: fixed;
            width: 100%;
            top: 0;
            z-index: 1000;
        }
        .nav-item a {
            margin-right: 15px;
            color: beige;
            text-decoration: none;
        }
        .nav-but {
            border-radius: 10px;
            background-color: whitesmoke;
        }
    </style>
</head>
<body>
    <nav class="nav-container">
        <div style="flex-grow: 0.05;"></div>
        <div class="nav-item" style="margin-left:10px;"><a href="SFarm_main.jsp">SFarm</a></div>
        <div style="flex-grow: 0.1;"></div>
        <div class="nav-item"><a href="#">웹 소개</a></div>
        <div class="nav-item"><a href="#">지역 명소 추천</a></div>
        <div class="nav-item"><a href="#">고객 지원</a></div>
        <div style="flex-grow: 0.7;"></div>
        <a href="SFarm_JoinPage.jsp"><button class="nav-but">회원 가입</button></a>
        <a href="SFarm_LoginPage.jsp"><button class="nav-but" style="margin-left: 10px;">로그인</button></a>
    </nav>
</body>
</html>