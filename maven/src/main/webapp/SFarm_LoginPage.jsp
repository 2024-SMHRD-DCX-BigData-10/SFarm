<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap');
        /* css 변수 */
        :root{
            --basis-font-color:rgb(243,105,7);
        }
        *{margin: 0; padding: 0; box-sizing: border-box;}

        .longin-form h1{
            position: relative;
            text-align: center;
            font-size:2rem;
            font-family:'impact';
            color:#154726;
            padding-bottom: 25px;
        }
        
        .longin-form{
        
        background-color: rgba(255, 255, 255, 0.8);
        border-radius:10px;
        font-family: "Noto Sans KR", sans-serif;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        background-size: cover;
        }
        .int-area{
            width: 100%;
            position: relative;
        }
        .int-area input{
            width: 100%;
            padding: 20px 10px 10px;
            background-color:transparent;
            border: none;
            border-bottom: 1px solid #999;
            font-size: 1.2rem;
            color:black;
            outline: none;
        }
        .int-area label{
            position: absolute;
            left: 10px;
            top: 15px;
            font-size: 1.2rem;
            color: #999;
            transition: 0.5s;
        }
        .int-area input:focus + label{
        	
            top: 0;
            font-size: 1rem;
            color: var(--basis-font-color);
        }
        .int-area input:valid + label{
            top: 0;
            font-size: 1rem;
           	color: var(--basis-font-color);
        }
        .btn-area {
            margin-top: 30px;
        }
        .btn-area button{
            width: 100%;
            height: 50px;
            background-color: #154726;
            color: white;
            font-size: 1.5rem;
            border-radius: 25px;
        }
        .caption {
            margin-top: 20px;
            text-align: center;
        }
        .caption a{
            font-size: 0.9rem;
            color: var(--basis-font-color);
            text-decoration: none;
        }
        .login-form{
        	width : 100px;
        	height : 500px;
        	box-sizing: content-box;
        	}
  		form{
        	width : 80%;
    
        	}
        
    </style>
</head>
<body>
    <section class="longin-form">
       
        <form action="S_LoginCon" method="post">
            <h1>SFarm</h1>
            <div class="int-area">
                <input name="mb_id" type="text"  required>
                <label for="id" style="color: black;">아이디</label>
            </div>
            <div class="int-area">
            
                <input name="mb_pw" type="password" id="password" required>
                <label for="password" style="color: black;">비밀번호</label>
            </div>
            <div class="btn-area">
                <button type="submit" id="btn">로그인</button>
            </div>
            <div class="caption">
                <a class="surch" href="">비밀번호 찾기</a>
            </div>
        </form>       
    </section>

    <script>
        const id = document.querySelector('#id');
        const password = document.querySelector('#password');
        const btn = document.querySelector('#btn');

        function form_checking(){
            if(id.value == ""){
                alert('아이디를 입력바랍니다.');
                id.focus();
                return false;
            }
            if(password.value == ""){
                alert('비밀번호를 입력바랍니다.');
                password.focus();
                return false;
            }
        }

        btn.addEventListener("click",form_checking);

    </script>
</body>
</html>