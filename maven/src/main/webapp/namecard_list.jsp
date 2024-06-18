<%@page import="com.smhrd.model.MemberDAO"%>
<%@page import="com.smhrd.model.ProductDAO"%>
<%@page import="com.smhrd.model.ProductDTO"%>
<%@page import="com.smhrd.model.FarmhouseDTO"%>
<%@page import="com.smhrd.model.FarmhouseDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <!-- 아이콘 링크 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <title>농가 목록</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="CSS/navbar.css">
    <style>
        * {
            margin: 0;
            padding: 0;
        }
        .body {
            margin: 0px;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }
        .wrap {
            width: 100%;
            background-color: white;
            padding: 20px 0;
        }
        .container {
            padding: 1px;
            display: flex;
            margin-top: 100px;
            flex-wrap: wrap;
            justify-content: center;
        }
        .col-md-4 {
            flex: 1 1 30%;
            max-width: 35%;
            box-sizing: border-box;
            padding: 15px;
        }
        .card {
            width: 100%;
            padding: 8px;
            border: 1px solid darkgray;
            border-radius: 5px;
            background-color: white;
        }
        .card-body {
            border-radius: 5px 5px 0 0;
            width: 100%;
            height: 240px; /* 높이 지정 */
            background-color: #f0f0f0; /* 빈 박스 배경색 */
            display: block; /* 박스가 보이도록 설정 */
            padding-top: 5px;
        }
        .card img {
            border-radius: 5px 5px 0 0;
            width: 100%;
            height: auto;
        }
        .card-body {
            padding: 10px;
        }
        .card-body h5 {
            font-size: 18px;
            font-weight: bold;
            margin: 10px 0;
        }
        .card-body p {
            margin: 5px 0;
        }
        .qr-img {
            width: 30px; /* QR 코드 크기를 줄입니다 */
            height: 30px; /* QR 코드 크기를 줄입니다 */
            float: left;
            margin-right: 10px;
            object-fit: contain; /* 이미지가 주어진 영역에 맞춰지도록 합니다 */
        }
        .footer {
            background-color: #154726;
            width: 100%;
            height: 130px;
            position: relative;
            bottom: 0;
            left: 0;
        }
        .footer img {
            width: 200px;
            position: relative;
            top: 60px;
            left: 50px;
            border-radius: 30px;
        }

        .card-img-top {
            max-width: 700px;
            max-height: 190px;
            padding: 5px;
        }
        .img_box {
            width: 100%;
            height: 200px;
            border-radius: 5px 5px 0 0;
            display: flex;
            align-items: center;
            justify-content: center;
            overflow: hidden;
        }
        @media (max-width: 1200px) {
            .col-md-4 {
                flex: 1 1 45%;
                max-width: 45%;
            }
        }
        @media (max-width: 768px) {
            .col-md-4 {
                flex: 1 1 100%;
                max-width: 100%;
            }
        }
        .col-md-4 {
            margin: 20px;
        }
    </style>
</head>
<body>
    <%
        request.setAttribute("showSearchBar", true);
    %>
    <!-- 네비바 -->
    <%@ include file="navbar.jsp" %>

    <div class="wrap">
        <div class="container">
            <%	MemberDAO mDAO = new MemberDAO();
                String filterType = request.getParameter("filterType");
                String searchKeyword = request.getParameter("searchKeyword");
                FarmhouseDAO dao = new FarmhouseDAO();
                ArrayList<FarmhouseDTO> fh_dto_list = dao.getAllFarmhouses();
                ArrayList<FarmhouseDTO> filteredList = new ArrayList<>();

                if (fh_dto_list != null && filterType != null && searchKeyword != null) {
                    searchKeyword = searchKeyword.toLowerCase(); // 검색어를 소문자로 변환
                    for (FarmhouseDTO dto : fh_dto_list) {
                        if (filterType.equals("fh_name") && dto.getFh_name().toLowerCase().contains(searchKeyword)) {
                            filteredList.add(dto);
                        } else if (filterType.equals("agri_name") && dto.getAgri_name().toLowerCase().contains(searchKeyword)) {
                            filteredList.add(dto);
                        }
                    }
                } else {
                    filteredList = fh_dto_list;
                }

                if (filteredList != null && !filteredList.isEmpty()) {
                    String currentFhName = "";
                    ArrayList<String> agriNamesList = new ArrayList<>();
                    FarmhouseDTO currentFarmhouse = null;

                    for (FarmhouseDTO dto : filteredList) {
                        if (!dto.getFh_name().equals(currentFhName)) {
                            if (currentFarmhouse != null) {
                                ProductDAO pd_dao = new ProductDAO();
                                ProductDTO pd = pd_dao.getProductDetails(agriNamesList.get(0));
            %>
            <div class="col-md-4 bg-light bg-opacity-75">
                <div class="card">
                    <div class="img_box">
                        <% if (pd != null && pd.getAgri_img1() != null) { %>
                            <img src="<%=pd.getAgri_img1() %>" class="card-img-top" alt="농장이미지">
                        <% } else { %>
                            <img src="./img/이미지준비중.png" class="card-img-top" alt="농장이미지">
                        <% } %>
                    </div>
                    <div class="card-body">
                        <h5 class="card-title"><%= currentFarmhouse.getFh_nick() %></h5>
                        <p class="card-text"><%= currentFarmhouse.getFh_intro() %></p>
                        <p>대 표  <%= currentFarmhouse.getFh_owner() %>  &emsp;&emsp;    지 역  <%= currentFarmhouse.getFh_region() %></p>
                         <p>Tell <%= mDAO.getPhone(currentFhName).getMb_phone()%></p>
                        <p>농산물 <%= String.join(", ", agriNamesList) %></p> <!-- 농산물 이름들 표시 -->
           <br>
                        <a href="SFarmStoryCon?mb_id=<%= currentFarmhouse.getMb_id() %>&fh_name=<%= currentFarmhouse.getFh_name() %>" class="btn btn-dark rounded-pill">포스터 보기</a>
                        <a href="#" class="btn btn-primary rounded-pill"><i class="bi bi-share-fill"></i></a>
                        <a href="#" class="btn btn-primary rounded-pill"><i class="bi bi-copy"></i></a>
                        <a href="#" class="btn btn-warning rounded-pill"><i class="bi bi-download"></i></a>
                    </div>
                </div>
            </div>
            <%
                            }
                            currentFhName = dto.getFh_name();
                            currentFarmhouse = dto;
                            agriNamesList.clear();
                        }
                        agriNamesList.add(dto.getAgri_name());
                    }
                    if (currentFarmhouse != null) {
                        ProductDAO pd_dao = new ProductDAO();
                        ProductDTO pd = pd_dao.getProductDetails(agriNamesList.get(0));
            %>
            <div class="col-md-4 bg-light bg-opacity-75">
                <div class="card">
                    <div class="img_box">
                        <% if (pd != null && pd.getAgri_img1() != null) { %>
                            <img src="<%=pd.getAgri_img1() %>" class="card-img-top" alt="농장이미지">
                        <% } else { %>
                            <img src="./img/이미지준비중.png" class="card-img-top" alt="농장이미지">
                        <% } %>
                    </div>
                    <div class="card-body">
                        <h5 class="card-title"><%= currentFarmhouse.getFh_nick() %></h5>
                        <p class="card-text"><%= currentFarmhouse.getFh_intro() %></p>
                        <p>대 표  <%= currentFarmhouse.getFh_owner() %>   &emsp;&emsp;   지 역  <%= currentFarmhouse.getFh_region() %></p>
                        <p>Tell <%= mDAO.getPhone(currentFhName).getMb_phone()%></p>
                        <p>농산물 <%= String.join(", ", agriNamesList) %></p> <!-- 농산물 이름들 표시 -->
                       
                        <a href="SFarmStoryCon?mb_id=<%= currentFarmhouse.getMb_id() %>&fh_name=<%= currentFarmhouse.getFh_name() %>" class="btn btn-dark rounded-pill">포스터 보기</a>
                        <a href="#" class="btn btn-primary rounded-pill"><i class="bi bi-share-fill"></i></a>
                        <a href="#" class="btn btn-primary rounded-pill"><i class="bi bi-copy"></i></a>
                        <a href="#" class="btn btn-warning rounded-pill"><i class="bi bi-download"></i></a>
                    </div>
                </div>
            </div>
            <%
                    }
                } else {
            %>
            <p>농가 정보가 없습니다.</p>
            <%
                }
            %>
        </div>
    </div>
    
    <div class="content-area" id="main-content">
        <!-- 여기에 AJAX 요청으로 로드된 내용이 삽입됩니다. -->
    </div>

    <!-- footer -->
    <footer class="footer">
        <img class="acs-img" src="./img/농림축산식품부_국_좌우.jpg" alt="농림축산이미지">
    </footer>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    
</body>
</html>
