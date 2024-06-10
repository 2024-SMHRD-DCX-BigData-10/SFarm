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
            background-image: url(./img/ȸ�����Թ��.jpg);
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

    <!-- �׺�� -->
    <nav class="navbar bg-body-tertiary" style="background-color:mintcream;">
        <div class="container-fluid">
          <a href="#" class="navbar-brand">SFarm</a>
            <div class="login-link">
             Already a Member? <a href="">�α��� �ϱ�</a>
            </div>
        </div>
    </nav>

      <div style="clear: both;"></div>


    <div class="form-background">

            <div class="form-wite">
                <h2 class="sign-up_title">Please be a member of SFarm</h2>
                <form form action="S_JoinCon" method="post">
                    <fieldset class="fi">
                        <legend  class="w-100" style="text-align: center; font-weight: bold;" >ȸ������ </legend>
                        <div class="w-50">
                            <p>ȸ�� ���̵�</p>
                            <input class="w-50" type="text" name="mb_id" placeholder="���̵� �Է����ּ���.">
                        </div>
                         <div class="w-50">
                            
                            <button type="button" id="btnCheck">���̵� �ߺ� Ȯ��</button>
                        </div>
                        
                        <div class="w-50" >
                            <p>ȸ�� ��й�ȣ</p>
                            <input class="w-50" type="password" name="mb_pw" placeholder="��й�ȣ�� �Է����ּ���." >
                        </div>
                        <div class="w-50">
                            <p>ȸ�� �̸�</p>
                            <input class="w-50" type="text" name="mb_name" placeholder="�̸��� �Է����ּ���.">
                        </div>
                        <div class="w-50" >
                            <p>ȸ�� ����ó</p>
                            <input class="w-50" type="text" name="mb_phone" placeholder="��ȣ�� �Է����ּ���." >
                        </div>
                        <div class="w-50">
                            <p>ȸ�� ����</p>
                            <input class="w-50" type="text" name="mb_type" placeholder="��ȸ�� or �Һ���">
                        </div>
                        <div class="w-50">
                            <p>�� ����</p>
                            <input class="form-input" name="farm_info" type="text" placeholder="�������� �Է����ּ���.">
                        </div>
                        <div class="btn">
                            <input type="submit" value="ȸ������">
                        </div>
                    </fieldset>
                </form>
            </div>

            
    </div>


     <!-- footer -->
     <footer class="footer">
        <div class="footer-container">
          <img class="acs-img" src="./img/������ǰ��_��_�¿�.jpg" alt="������̹���" >
        </div>
      </footer>
      <script>$('#btnCheck').on('click', function() {
			//1. ����ڰ� �Է��� id�� ��������
			// name='email'�� input�±� �� ������, �ε��� 1��

			var mb_id = $('input[name=mb_id]').eq('0').val();
			console.log(mb_id);


			$.ajax({
				url : "idCheckCon", /* ��û���ּ� */
				type : "get", /* ��� */
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