<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.ProductDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.smhrd.model.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <%
    ProductDAO dao = new ProductDAO();
    String agri_name=request.getParameter("agri_name");
    List<ProductDTO> productList = dao.getProductsByFarmhouse(agri_name);
    	System.out.println(agri_name+productList.size());
        if (productList != null) {
        	for(ProductDTO pd : productList) { %>
            <h2>농산품 상세 정보</h2>
            <p>농산품 명: <%= pd.getAgri_name() %></p>
            <p>영양성분: <%= pd.getNutrition_fact() %></p>
            <p>손질법: <%= pd.getTrimming() %></p>
            <p>보관법: <%= pd.getKeeping() %></p>
            <p>효능: <%= pd.getEffect() %></p>
            <p>구입요령: <%= pd.getPurchase_method() %></p>
            <p>사진1: <img src="<%= pd.getAgri_img1() %>" alt="사진1"></p>
            <p>사진2: <img src="<%= pd.getAgri_img2() %>" alt="사진2"></p>
            <p>사진3: <img src="<%= pd.getAgri_img3() %>" alt="사진3"></p>
    <%
    }} else if(productList ==null){System.out.print("null");}
    else{
    %>
    <h3>농산품 정보를 찾을 수 없습니다.</h3>
    <%
        }
    %>
</body>
</html>
