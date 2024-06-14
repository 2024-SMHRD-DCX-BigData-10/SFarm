<%@page import="com.smhrd.model.CertificationDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.FarmhouseDTO"%>
<%@page import="com.smhrd.model.CertificationDTO"%>
<%@page import="com.smhrd.model.ProductDTO"%>
<%@page import="com.smhrd.model.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>농가 홍보 포스터</title>
<style>
body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    background-color: #f4f4f4;
    color: #333333;
}

.container {
    padding: 20px;
    text-align: left;
    max-width: 800px;
    margin: 20px auto; /* 네비게이션 바 높이 만큼 마진 추가 */
    background-color: #ffffff;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    border-radius: 8px;
}

header {
    background-color: #2d6a4f;
    color: #ffffff;
    padding: 20px;
    border-bottom: 2px solid #1b4332;
}

header h1 {
    font-size: 36px;
    margin: 0;
}

.intro, .crops, .contact, .certification-info, .product-info,
    .product-detail {
    padding: 20px;
    margin: 20px 0;
    border-bottom: 1px solid #eaeaea;
}

.intro h2, .crops h2, .contact h2, .certification-info h2, .product-info h2,
    .product-detail h2 {
    font-size: 25px;
    margin-top: 0;
}

.intro p, .crops p, .contact p, .certification-info p, .product-info p,
    .product-detail p {
    font-size: 18px;
    line-height: 1.6;
    margin: 10px 0;
}

.crops ul {
    list-style: none;
    padding: 0;
}

.crops ul li {
    font-size: 18px;
    background-color: #e9ecef;
    padding: 10px;
    margin: 5px 0;
    border-radius: 5px;
}

.cert-item {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 20px;
}

.cert-item p {
    margin: 0;
    font-size: 18px;
}

.cert-item img {
    width: 60px;
    height: 60px;
}

.product-detail img {
    max-width: 100%;
    height: auto;
    margin: 10px 0;
    border-radius: 8px;
    box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
}

.footer {
    padding: 20px;
    background-color: #2d6a4f;
    color: #ffffff;
    text-align: center;
    margin-top: 20px;
    border-top: 2px solid #1b4332;
}

@media ( max-width : 600px) {
    .container {
        padding: 10px;
    }
    header h1 {
        font-size: 24px;
    }
    .intro h2, .crops h2, .contact h2, .certification-info h2, .product-info h2,
        .product-detail h2 {
        font-size: 22px;
    }
    .intro p, .crops p, .contact p, .certification-info p, .product-info p,
        .product-detail p {
        font-size: 16px;
    }
}
#productDetailBtn{
 
  position: fixed; /* 고정 위치 */
  top: 80px; /* 아래 여백 */
  right: 20px; /* 오른쪽 여백 */
  z-index: 9999; /* 다른 요소 위에 표시 */
  
  color: black; /* 글자색 */
  border: none; /* 테두리 없음 */
  border-radius: 50%; /* 원 모양 */
  cursor: pointer; /* 마우스 커서 */
  padding: 15px; /* 내부 여백 */
  font-size: 16px; /* 글자 크기 */
  transition: background-color 0.3s; /* 배경색 변화에 트랜지션 */
}

#scrollBtn{
  display: none; /* 초기에는 버튼을 숨깁니다. */
  position: fixed; /* 고정 위치 */
  bottom: 20px; /* 아래 여백 */
  right: 20px; /* 오른쪽 여백 */
  z-index: 9999; /* 다른 요소 위에 표시 */
  background-color: #ffffff; /* 배경색을 투명하게 설정 */
  border: none; /* 테두리 없음 */
  cursor: pointer; /* 마우스 커서 */
  padding: 15px; /* 내부 여백 */
  border-radius : 50px;
}
#scrollBtn img {
  width: 50px; /* 이미지 크기 */
  height: 50px;
 
}

#productDetailBtn img {
  width: 50px; /* 이미지 크기 */
  height: 50px;
 
}

#scrollBtn:hover, #productDetailBtn:hovoer img{
  background-color: #1b4332; /* 호버 시 배경색 변경 */
}
</style>
<script>
    function changeAgriIndex(newIndex) {
        document.getElementById('agriIndex').value = newIndex;
        document.getElementById('indexForm').submit();
    }

    function scrollToTop() {
        window.scrollTo({
            top: 0,
            behavior: 'smooth'
        });
    }

    function scrollToNextProductDetail() {
        const productDetails = document.querySelectorAll('.product-detail');
        if (currentIndex < productDetails.length) {
            const element = productDetails[currentIndex];
            const yOffset = -100; // 조정할 수 있는 스크롤 위치(y축)입니다.
            const y = element.getBoundingClientRect().top + window.pageYOffset + yOffset;
            window.scrollTo({ top: y, behavior: 'smooth' });
            currentIndex++; // 다음 요소로 인덱스를 증가시킵니다.
        } else {
            currentIndex = 0; // 끝에 도달하면 인덱스를 초기화합니다.
            scrollToNextProductDetail(); // 다시 첫 번째 요소로 스크롤합니다.
        }
    }
</script>
</head>
<body>

<%@ include file="navbar.jsp"%>

<div class="container">
    <% 
    ArrayList<FarmhouseDTO> farmDTO = (ArrayList<FarmhouseDTO>) request.getAttribute("farmDTO");
    int agriIndex = request.getParameter("agriIndex") != null ? Integer.parseInt(request.getParameter("agriIndex")) : 0;
    CertificationDAO certiDAO = new CertificationDAO();
    ArrayList<CertificationDTO> certificationList = new ArrayList<CertificationDTO>();
    if (farmDTO != null && !farmDTO.isEmpty()) {
        FarmhouseDTO x = farmDTO.get(0); // 첫 번째 농가 정보를 가져옵니다.
    %>
    <div class="intro">
        <h2><%=x.getFh_nick()%></h2>
        <p>
           <strong>"<%=x.getFh_owner()%>"</strong>님은 항상 자연과 소비자를 생각합니다.<br>
            &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<strong><%=x.getFh_nick()%></strong> 농장은
            "<%=x.getFh_intro()%>".
        </p>
    </div>

    <div class="crops">
       
        <p>
            저희 농장은
            "<%=x.getFh_region()%>"에서 
        </p>
        <P>
        <%for (FarmhouseDTO fD : farmDTO){ %>
       	 <%=fD.getAgri_name()%> &nbsp;&nbsp; 
        <%} %>를 재배하고 있습니다.</P>
        <% 
        for (int i = 0; i < farmDTO.size(); i++) {
            String productName = farmDTO.get(i).getAgri_name();
            ProductDAO dao = new ProductDAO();
            ProductDTO product = dao.getProductDetails(productName);
        %>
 
        <br>
        <div id="product-detail" class="product-detail">
            
            
            <% 
            // 현재 인덱스의 농산물 이름을 가져옵니다.

            
            
            
            
            if (product != null) {
                if (product.getAgri_name() != null) {
            %>
            <h3><%=product.getAgri_name()%> 제대로 먹는 TIP</h3>
            <br>
                        <% 
            }
            if (product.getTime_production() != null) {
            %>
            <p>
                <strong><%=product.getAgri_name()%></strong>는
                <%=product.getTime_production()%>에 제철로 즐길 수 있습니다.
            </p>
            <% 
            }
            if (product.getEffect() != null) {
            %>
            <p> 왜 먹을까요?<br><br>
                <strong><%=product.getAgri_name()%></strong>는
                <%=product.getEffect()%>
            </p>
             <% 
            }
            %>
                  <% 
            if (product.getPurchase_method() != null) {
            %>
            <p> <strong>어떻게 고르지?</strong><br>
            <%=product.getPurchase_method()%>
                
            </p>

            <% 
            }
            if (product.getTrimming() != null) {
            %>
            <p> <strong>어떻게 손질하나요?</strong><br>
            <%=product.getTrimming()%>
                
            </p>
            <br>
            <% 
            }
            %>

      
           
            <% 
            if (product.getRecipe() != null) {
            %>
            <p>
                <strong>어떻게 먹을까?</strong><br>
                <%=product.getRecipe()%>
            </p>
            <% 
            }
            if (product.getAgri_img1() != null || product.getAgri_img2() != null || product.getAgri_img3() != null) {
            %>
            <div>
                <% 
                if (product.getAgri_img1() != null) {
                %>
                <img src="<%=product.getAgri_img1()%>"
                    alt="<%=product.getAgri_name()%> 이미지1">
                <% 
                }
                %>
                <% 
                if (product.getAgri_img2() != null) {
                %>
                <img src="<%=product.getAgri_img2()%>"
                    alt="<%=product.getAgri_name()%> 이미지2">
                <% 
                }
                %>
                <% 
                if (product.getAgri_img3() != null) {
                %>
                <img src="<%=product.getAgri_img3()%>"
                    alt="<%=product.getAgri_name()%> 이미지3">
                <% 
                }
                %>
            </div>
            <% 
            }
            } else {
            %>
            <h3>농산품 정보를 찾을 수 없습니다.</h3>
            <% 
            }
            %>

            <br>
            <% 
            certificationList = certiDAO.getCertifications(x.getFh_name());
            ArrayList<String> displayedProducts = new ArrayList<>(); // 이미 출력된 인증 제품을 저장할 리스트
            if (certificationList != null && !certificationList.isEmpty()) {
                for (CertificationDTO cert : certificationList) {
                    if (cert.getCert_product() != null && !displayedProducts.contains(cert.getCert_product())
                    && cert.getCert_product().equals(farmDTO.get(i).getAgri_name())) {
                displayedProducts.add(cert.getCert_product()); // 출력된 인증 제품을 리스트에 추가
                String cert_img = "";
                if ("무농약농산물".equals(cert.getCert_type())) {
                    cert_img = request.getContextPath() + "/img/enviagro_logo_03.jpg";
                } else if ("유기농농산물".equals(cert.getCert_type())) {
                    cert_img = request.getContextPath() + "/img/enviagro_logo_01.jpg";
                }
            %>
            <div class="cert-item">
     
                <p>
                    우리 농장은
                    <%=cert.getCert_product()%>에 대해 <strong><%=cert.getCert_type()%></strong>
                    인증을 받았습니다. <br>이는 저희가 제공하는 모든 농산물이 최고 품질임을 보장합니다.
                </p>
                <img src="<%=cert_img%>" alt="인증 이미지">
            </div>
            <% 
            }
            }
            } else {
            %>
            <p>현재 인증 정보가 없습니다.</p>
            <% 
            }
            %>
        </div>

        <% 
        }
        %>

        <% 
        } else {
        %>
        <h3>농가 정보가 없습니다.</h3>
        <% 
        }
        %>
</div>
</div>
<div id="additional-info"></div>
    <!-- 추가 데이터 영역 -->

</div>


<div class="footer">
    <p>농가 스토리텔링 페이지 - 모든 권리 보유</p>
</div>
<button onclick="scrollToTop()" id="scrollBtn" title="위로 이동">
   <img src="img/위로.png" alt="Scroll to Top">
</button>
<button id="productDetailBtn" title="농산품 상세 정보로 이동"><img src="img/상세보기아이콘.png" alt="Scroll"><br>농산품 정보로</button>

<script>
document.addEventListener('DOMContentLoaded', function() {
    // 현재 요소 인덱스를 추적하는 변수
    let currentIndex = 0;

    // 스크롤 이벤트를 처리합니다.
    window.addEventListener('scroll', function() {
        var scrollBtn = document.getElementById('scrollBtn');
        if (window.scrollY > 20) {
            scrollBtn.style.display = 'block';
        } else {
            scrollBtn.style.display = 'none';
        }
    });

    // 버튼 클릭 시 페이지의 맨 위로 스크롤됩니다.
    function scrollToTop() {
        window.scrollTo({
            top: 0,
            behavior: 'smooth'
        });
    }

    // 버튼 클릭 시 다음 product-detail 위치로 스크롤됩니다.
    function scrollToNextProductDetail() {
        const productDetails = document.querySelectorAll('.product-detail');
        if (currentIndex < productDetails.length) {
            const element = productDetails[currentIndex];
            const yOffset = -100; // 조정할 수 있는 스크롤 위치(y축)입니다.
            const y = element.getBoundingClientRect().top + window.pageYOffset + yOffset;
            window.scrollTo({ top: y, behavior: 'smooth' });
            currentIndex++; // 다음 요소로 인덱스를 증가시킵니다.
        } else {
            currentIndex = 0; // 끝에 도달하면 인덱스를 초기화합니다.
            scrollToNextProductDetail(); // 다시 첫 번째 요소로 스크롤합니다.
        }
    }

    // 맨 위로 이동 버튼에 이벤트 리스너를 추가합니다.
    document.getElementById('scrollBtn').addEventListener('click', scrollToTop);
    
    // 추가적인 버튼을 클릭하여 다음 product-detail로 스크롤합니다.
    document.getElementById('productDetailBtn').addEventListener('click', scrollToNextProductDetail);
});
</script>


</body>
</html>

