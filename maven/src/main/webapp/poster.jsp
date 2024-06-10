<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.ProductDAO"%>
<%@page import="com.smhrd.model.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <style>
        body{
            margin: 0px;
            
        }
        div{
            box-sizing: border-box;
        }
        .navbar-brand{
          padding: 10px;
          margin-left: 15px;
          font-size: 40px;
          font-family: Georgia, 'Times New Roman', Times, serif;
          color:cadetblue;
        }
        .nav-img img{
            width: 50px;
            
        }
        .cope-text{
            font-size: 11px;
            color:darkslategray;
            font-weight: bolder;
            padding: 5px;
            font-family: Georgia, 'Times New Roman', Times, serif;
            text-align: left;
            position: relative;
            right: 12px;
        }
        .nav-img{
            margin: 15px;
            width: 76px;  
        }
        .wrap{
            width: 100%;
        }
        .col-md-4{
            width: 100%;
        }
        .card-title{
          float:left;
          position: relative;
          padding: 1px;
          top: 40px;
        }
       
        .qr-img{
          float: left;
          padding: 6px;
          width: 100px;
          height: 100px;
        }
        .card-body1{
          float: left;
          height: 425px; 
          
        }
        .col-10 h4{
          font-size: 30px;
          color: slategrey;
          padding: 2px;
        }
        .col-10 h5{
          padding: 7px;
          margin-top: 30px;
          font-size: 20px;
        }
        .video-container{
          width: 100px;
          height: 50px;
        }
        #video-iframe {
          width: 50%;
          height: 600px;
          position: relative;
          left: 1300px;
          bottom: 450px;
          display: none;
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
        @media (max-width: 768px) {
          #video-iframe {
            width: 100%;
            height: auto;
          }
        } 
    </style>
</head>
<body>

     <!-- 네비바 -->
     <nav class="navbar bg-body-tertiary" style="background-color:mintcream; margin-bottom: 20px;">
      <div class="container-fluid">
        <a href="#" class="navbar-brand">SFarm</a>
        <div class="nav-img">
          <img src="./img/복사하기.png" >
          <h4 class="cope-text">포스터 복사</h4>
        </div>
      </div>
    </nav>
  
    <!-- ---------------------------------------------------------- -->
      
    <div class="wrap">

      <!-- 농가명함 시작 -->
        <div class="col">
            <div class="card" style=" border-color:black; width: 18rem; float:left; padding: 5px; margin-top: 90px; margin-left: 10px; margin-right: 10px;">
                
              <img src="./img/수박포도.jpg" class="card-img-top" alt="...">
              <div class="card-body">
                <h5 class="card-title">우천이네 농장</h5>
                <div>
                  <img class="qr-img" src="./img/qr.png">
                </div>
                <div style="clear: both;"></div>
                <p class="card-text">우리 농장은 사과/배/마늘 등을 재배하는 농장입니다(간단소개) 
                </p>
                <p>Tell.010-0000-0000</p>
              </div>
            </div>
          </div>
    <!-- 농가명함 끝 -->
     
    <!-- 정보 카드틀 시작 -->
        <div class="card mb-3" style=" border-color:teal; padding:10px; max-width: 1280px; height: 600px;  ">
          <div class="col-12">
              <div>
                <h4 style="float: left; margin-left: 520px; padding: 10px;">농가:</h4>
                <pre style="float: left;  font-size:30px;">선우네 농장</pre>
              </div>
              <div style="clear: both;"></div>
              <div>
                <h5 style="float: left;">품목:</h5>
                <pre style="float: left;  font-size: 20px;">마늘</pre>
              </div>
              <div style="clear: both;"></div>
              <div>
                <h5 style="float: left;">식품번호:</h5>
                <pre style="float: left; font-size: 20px;">00151121</pre>
              </div>
              <div style="clear: both;"></div>
              <div>
                <h5 style="float: left; margin-top: 30px;">영양성분:</h5>
                <pre style="float: left; font-size: 20px;">단백질:50% 무기질 60% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                </pre>
              </div>
              <div style="clear: both;"></div>
              <div>
                <h5 style="float: left;">생산시기:</h5>
                <pre style="float: left;  font-size: 20px;">7,8월</pre>
              </div>
              <div style="clear: both;"></div>
              <div>
                <h5 style="float: left;">구입요령:</h5>
                <pre style="float: left;  font-size: 20px;">앞에 수분을 제거하고 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~</pre>
              </div>
              <div style="clear: both;"></div>
              <div>
                <h5 style="float: left;">인증마크:</h5>
                <pre style="float: left;  font-size: 20px;">cap cap cap cap</pre>
              </div>
              <div style="clear: both;"></div>
              <div id="video-container" style="padding: 60px;">
                <button type="button" class="btn btn-outline-info" id="video-button">농장video</button>
                <iframe id="video-iframe" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
              </div>    
            </div><!--col-12-->      
        </div> <!--card mb-3-->
      <!-- 정보 카드틀 끝 -->

   
        
      <!-- 농가 전환 페이지(손질/보관) -->
      <div class="card text-center" style="max-width: 1580px; border-color:teal; margin-left: 10px;">
        <div class="card-header">
          <ul class="nav nav-tabs card-header-tabs">
            <li class="nav-item">
              <button  id="effect-btn" class="nav-link active">효능</button>
            </li>
            <li class="nav-item">
              <button id="hand-btn" class="nav-link active">손질법</button>
            </li>
            <li class="nav-item">
              <button id="cook-btn" class="nav-link active">조리법</button>
            </li>
          </ul>
        </div>
        <div class="card-body">
          <pre id="effect-content">효능에 대한 내용</pre>
          <pre id="hand-content" style="display:none;">손질법에 대한 내용</pre>
          <pre id="cook-content" style="display:none;">조리법에 대한 내용</pre>
        </div>
      </div>
      <!-- 농가 전환 끝 -->
     

    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous">
    </script>


       <!-- 버튼클릭시 나오는 스크립트 -->
       <script>
        document.getElementById('video-button').addEventListener('click', function() {
          var videoIframe = document.getElementById('video-iframe');
          if (videoIframe.style.display === 'none' || videoIframe.style.display === '') {
            videoIframe.src = '//www.youtube.com/embed/-Oi_oAR6A5I?si=WmeScurZOGA0fKFT';
            videoIframe.style.display = 'block';
          } else {
            videoIframe.style.display = 'none';
          }
        });
        
        // 효능 버튼 요소를 가져옴
        var effectBtn = document.getElementById('effect-btn');
        // 손질법 버튼 요소를 가져옴
        var handBtn = document.getElementById('hand-btn');
        // 조리법 버튼 요소를 가져옴
        var cookBtn = document.getElementById('cook-btn');
        // 효능 내용 요소를 가져옴
        var effectContent = document.getElementById('effect-content');
        // 손질법 내용 요소를 가져옴
        var handContent = document.getElementById('hand-content');
        // 조리법 내용 요소를 가져옴
        var cookContent = document.getElementById('cook-content');

       // 효능 버튼 클릭 시 실행할 함수
        effectBtn.addEventListener('click', function() {
        // 효능 버튼을 활성화 상태로 변경
        effectBtn.classList.add('active');
        // 손질법, 조리법 버튼의 활성화 상태 제거
        handBtn.classList.remove('active');
        cookBtn.classList.remove('active');
        // 효능 내용을 보이도록 변경
        effectContent.style.display = 'block';
        // 손질법, 조리법 내용을 숨김
        handContent.style.display = 'none';
        cookContent.style.display = 'none';
    });

       // 손질법 버튼 클릭 시 실행할 함수
        handBtn.addEventListener('click', function() {
        // 손질법 버튼을 활성화 상태로 변경
        handBtn.classList.add('active');
        // 효능, 조리법 버튼의 활성화 상태 제거
        effectBtn.classList.remove('active');
        cookBtn.classList.remove('active');
        // 손질법 내용을 보이도록 변경
        handContent.style.display = 'block';
        // 효능, 조리법 내용을 숨김
        effectContent.style.display = 'none';
        cookContent.style.display = 'none';
    });

        // 조리법 버튼 클릭 시 실행할 함수
        cookBtn.addEventListener('click', function() {
        // 조리법 버튼을 활성화 상태로 변경
        cookBtn.classList.add('active');
        // 효능, 손질법 버튼의 활성화 상태 제거
        effectBtn.classList.remove('active');
        handBtn.classList.remove('active');
        // 조리법 내용을 보이도록 변경
        cookContent.style.display = 'block';
        // 효능, 손질법 내용을 숨김
        effectContent.style.display = 'none';
        handContent.style.display = 'none';
    });
      </script>

   <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

      <!-- footer -->
      <footer class="footer">
        <div class="footer-container">
          <img class="acs-img" src="./img/농림축산식품부_국_좌우.jpg" alt="농림축산이미지" >
        </div>
      </footer>  

</body>
</html>