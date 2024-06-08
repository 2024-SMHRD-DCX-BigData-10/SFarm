<%@page import="com.smhrd.model.FarmhouseDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>농가 목록</title>
    <script>
        // 농가 목록을 필터링하는 함수
        const filterFarmhouses = () => {
            const filterType = document.getElementById("filterType").value;
            const filterValue = document.getElementById("filterValue").value.toLowerCase();
            const farmhouseList = document.querySelectorAll(".farmhouse");

            farmhouseList.forEach(farmhouse => {
                const farmhouseName = farmhouse.querySelector(".fh_name").textContent.toLowerCase();
                const agriName = farmhouse.querySelector(".agri_name").textContent.toLowerCase();

                if ((filterType === "agri_name" && agriName.includes(filterValue)) ||
                    (filterType === "fh_name" && farmhouseName.includes(filterValue))) {
                    farmhouse.style.display = "";
                } else {
                    farmhouse.style.display = "none";
                }
            });
        };
    </script>
</head>
<body>
    <h2>농가 목록</h2>
    <label for="filterType">필터링 기준: </label>
    <select id="filterType">
        <option value="agri_name">품명</option>
        <option value="fh_name">농가명</option>
    </select>
    <input type="text" id="filterValue" placeholder="검색어 입력">
    <button onclick="filterFarmhouses()">필터링</button>

    <br><br>
    <%
        ArrayList<FarmhouseDTO> fh_dto_list = (ArrayList<FarmhouseDTO>) request.getAttribute("fh_dto_list");

        if (fh_dto_list != null) {
            for (FarmhouseDTO dto : fh_dto_list) {
                String mb_id = dto.getMb_id();
                String fh_name = dto.getFh_name();
                String fh_owner = dto.getFh_owner();
                String agri_name = dto.getAgri_name();
    %>
                <div class="farmhouse">
                    <p class="fh_name">농가 이름: <%= fh_name %></p>
                    <p class="fh_owner">농장주: <%= fh_owner %></p>
                    <p class="agri_name">품명: <%= agri_name %></p>
                    <hr>
                </div>
               
    <%
            }
        } else {
    %>
            <p>농가 정보가 없습니다.</p>
    <%
        }
    %>
</body>
</html>
