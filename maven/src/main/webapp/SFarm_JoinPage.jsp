<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>join</title>
    <style>
    .body{
        margin: 0px;
        font-size: 0px;       
    }
    .div{
        box-sizing: border-box;
    }
    .navbar-brand{
        padding: 10px;
        margin-left: 15px;
        font-size: 40px;
        font-family: Georgia, 'Times New Roman', Times, serif;
        color:cadetblue;
        text-decoration: none;
        float: left;   
    }
    .login-link{
        float: left;
        margin-left: 1700px;
        padding: 10px;
    }
    .login-link a{
        text-decoration: none;
        font-size: 20px;
        font-weight: bold;
    }
    div,input,textarea{
            box-sizing: border-box;
        }
        .sign-up_title{
            text-align: center;
        }

        .form-background{
            background-color:honeydew;
            padding: 30px;
           
        }
        .form-wite{
            background-image: url(./img/회원가입배너.jpg);
            border-radius: 15px;
            margin-left: 580px;
            background-repeat: no-repeat;
            background: cover;
            width: 50%;
            height: 800px;          
            font-size: 15px;
            margin-bottom: 15px;

        }
        .form-input{
            width: 60%;
            height: 50px;
            padding: 10px;
            font-size: 20px;
            border: 1px solid black;
            border-radius: 10px;
    
        }
        .fi{
            padding: 60px;
            border-radius:15px;
            border-color:aqua ;
        }
        .w-50{
            width: 60%; 
            padding: 10px;
            font-size: 10px;
            font-weight: bold;
            border-radius: 25px;
            
        }
        .btn input{
            border-radius: 15px;
            color:steelblue;
            background-color:ghostwhite;
            border-color:turquoise;
            padding: 10px;
            margin-top: 20px;
            margin-left: 5px;
        }
      
        .footer{
        width: 100%;
        height: 130px;
        background-color:darkcyan;
        }
        .acs-img{
          width: 200px;
          position: relative;
          top: 40px;
          left: 50px;
          border-radius: 30px;
        }



    </style>

</head>
<body>

    <!-- 네비바 -->
    <nav class="navbar bg-body-tertiary" style="background-color:mintcream;">
        <div class="container-fluid">
          <a href="#" class="navbar-brand">SFarm</a>
            <div class="login-link">
             Already a Member? <a href="">로그인 하기</a>
            </div>
        </div>
    </nav>

      <div style="clear: both;"></div>


    <div class="form-background">

            <div class="form-wite">
                <h2 class="sign-up_title">Please be a member of SFarm</h2>
                <form form action="S_JoinCon" method="post">
                    <fieldset class="fi">
                        <legend  class="w-100" style="text-align: center; font-weight: bold;" >회원가입 </legend>
                        <div class="w-50">
                            <p>회원 아이디</p>
                            <input class="w-50" type="text" name="mb_id" placeholder="아이디를 입력해주세요.">
                        </div>
                         <div class="w-50">
                            
                            <button type="button" id="btnCheck">아이디 중복 확인</button>
                        </div>
                        
                        <div class="w-50" >
                            <p>회원 비밀번호</p>
                            <input class="w-50" type="password" name="mb_pw" placeholder="비밀번호를 입력해주세요." >
                        </div>
                        <div class="w-50">
                            <p>회원 이름</p>
                            <input class="w-50" type="text" name="mb_name" placeholder="이름을 입력해주세요.">
                        </div>
                        <div class="w-50" >
                            <p>회원 연락처</p>
                            <input class="w-50" type="text" name="mb_phone" placeholder="번호를 입력해주세요." >
                        </div>
                        <div class="w-50">
                            <p>회원 구분</p>
                            <input class="w-50" type="text" name="mb_type" placeholder="농가회원 or 소비자">
                        </div>
                        <div class="w-50">
                            <p>농가 정보</p>
                            <input class="form-input" name="farm_info" type="text" placeholder="농가정보를 입력해주세요.">
                        </div>
                        <div class="btn">
                            <input type="submit" value="회원가입">
                        </div>
                    </fieldset>
                </form>
            </div>

            
    </div>


     <!-- footer -->
     <footer class="footer">
        <div class="footer-container">
          <img class="acs-img" src="./img/농림축산식품부_국_좌우.jpg" alt="농림축산이미지" >
        </div>
      </footer>
      <script>$('#btnCheck').on('click', function() {
			//1. 사용자가 입력한 id를 가져오기
			// name='email'인 input태그 값 가져옴, 인덱스 1번

			var mb_id = $('input[name=mb_id]').eq('0').val();
			console.log(mb_id);


			$.ajax({
				url : "idCheckCon", /* 요청할주소 */
				type : "get", /* 방식 */
				data : {
					mb_id : mb_id
				},
				dataType : "text",
				success : function(result) {
					console.log(result)
					alert(result)
					$('#idCheck').html(result)
				},
				error : function(e) {
					console.log(e)

				}

			});

		});</script>

</body>
</html>