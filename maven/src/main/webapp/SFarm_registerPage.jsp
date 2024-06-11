<%@page import="com.smhrd.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        * {
            margin: 0;
            padding: 0;
        }
        body {
            background-image: url(./img/농장등록이미지.jpg);
            background-size: cover;
            background-repeat: no-repeat;
            
        }
        .wrap {
            width: 60%;
            background: #fff;
            margin: 0 auto;
            margin-top: 200px;
            padding: 50px;
            box-sizing: border-box;
        }
        .wrap h1 {
            font-size: 32px;
            padding-bottom: 12px;
            border-bottom: 3px solid #000;
            letter-spacing: -2px;
        }
        .wrap form {
            margin-top: 20px;
        }
        .wrap dl {
            display: flex;
            align-items: center;
            margin-top: 20px;
        }
        .wrap dt {
            width: 20%;
            font-size: 14px;
        }
        .wrap dd {
            width: 75%;
            margin-left: 10px;
        }
        .wrap input[type="text"] {
            padding: 10px;
            border-radius: 5px;
            width: 100%;
            box-sizing: border-box;
        }
        .wrap input[type="button"] {
            padding: 5px 10px;
            border: 0;
            background: #325cb2;
            color: #fff;
            font-weight: 600;
            cursor: pointer;
        }
        .wrap textarea {
            width: 100%;
            padding: 10px;
            box-sizing: border-box;
            resize: vertical;
            border-radius: 5px;
        }
        .wrap input[type="submit"] {
            display: block;
            margin: 30px auto 0 auto;
            padding: 16px 50px;
            border-radius: 100px;
            background: #325cb2;
            font-weight: 600;
            color: #fff;
            cursor: pointer;  
        }
        .added-dl {
            margin-top: 10px; /* 추가된 항목 간격 */
        }
    </style>
</head>
<body>
<%
    // session에 user_info가 있는지 없는지 확인 
    MemberDTO user_info = (MemberDTO) session.getAttribute("user_info");
%>
    <div>
        <form action="S_JoinFarmCon" method="post" class="wrap">
            <h1>농장등록</h1>
            <dl>
                <dt>농가명</dt>
                <dd><input name="fh_name" type="text" placeholder="농가 이름을 입력해주세요."></dd>
            </dl>
            <dl>
                <dt>대표자</dt>
                <dd><input name="fh_owner" type="text" placeholder="대표자 이름을 입력해주세요."></dd>
            </dl>
            <dl>
                <dt>농작물<br><input id="addButton" type="button" value="추가"></dt>
                <dd id="agriContainer"><input name="agri_names" type="text" placeholder="품명을 입력하세요"></dd>
            </dl>
            <dl>
                <dt class="mg">소개메세지</dt>
                <dd><textarea name="fh_intro" type="text" placeholder="간단히 소개해주세요"></textarea></dd>
            </dl>
            <input type="submit" value="등록하기" class="button fit">
        </form>
    </div>
    <script>
        document.addEventListener("DOMContentLoaded", () => {
            const addButton = document.getElementById('addButton');
            const agriContainer = document.getElementById('agriContainer');
            const logoutButton = document.getElementById('LogoutButton'); // 로그아웃 버튼
            const nameCardButton = document.getElementById('namecard'); // 명함 발급 버튼
            const allNamecardsButton = document.getElementById('allNamecards'); // 모든 명함 보기 버튼

            addButton.addEventListener('click', (event) => {
                event.preventDefault();
                const newInput = document.createElement('input');
                newInput.name = 'agri_names';
                newInput.type = 'text';
                newInput.placeholder = '품명을 입력하세요';
                newInput.style.marginTop = '10px'; // 새로 추가된 input 간의 간격을 줄입니다.
                agriContainer.appendChild(newInput);
            });

            logoutButton.addEventListener('click', () => { // 로그아웃 버튼 클릭 이벤트
                window.location.href = 'S_LogoutCon';
            });

            nameCardButton.addEventListener('click', () => { // 명함 발급 버튼 클릭 이벤트
                const mb_id = '<%= user_info != null ? user_info.getMb_id() : "" %>';
                const fh_name = '<%= user_info != null ? user_info.getMb_id() : "" %>'; // 예시로 사용자 ID를 사용
                if (mb_id && fh_name) {
                    window.location.href = 'S_NameCardCon?mb_id=' + mb_id + '&fh_name=' + fh_name;
                } else {
                    alert('로그인 후 이용해 주세요.');
                }
            });

            allNamecardsButton.addEventListener('click', () => { // 모든 명함 보기 버튼 클릭 이벤트
                window.location.href = 'AllNameCards';
            });
        });
    </script>
</body>
</html>
