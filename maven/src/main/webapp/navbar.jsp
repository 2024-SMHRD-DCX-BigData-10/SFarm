<%@page import="com.smhrd.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
</head>
<body>
    <%
        MemberDTO user_info = (MemberDTO) session.getAttribute("user_info");
    %>
    <nav class="nav-container">
        <div class="nav-title"><a href="SFarm_main.jsp">SFarm</a></div>
        <div class="nav-item"><a href="#">웹 소개</a></div>
        <div class="nav-item"><a href="#">지역 명소 추천</a></div>
        <div class="nav-item"><a href="#">고객 지원</a></div>
        <div class="nav-item"><a href="AllNameCards">농가 목록</a></div>
        <% if (request.getAttribute("showSearchBar") != null && (boolean)request.getAttribute("showSearchBar")) { %>
            <div class="search-container">
                <form class="search-bar" method="get" action="namecard_list.jsp">
                    <select name="filterType">
                        <option value="fh_name">농장명</option>
                        <option value="agri_name">품목명</option>
                    </select>
                    <input type="search" name="searchKeyword" placeholder="검색어를 입력해주세요." aria-label="Search">
                    <button type="submit">Search</button>
                </form>
            </div>
        <% } %>
        <div style="flex-grow: 1;"></div>
        <% if (user_info != null) { %>
            <div class="nav-join"><%= user_info.getMb_name() %>님 환영합니다.</div>
            <a href="S_LogoutCon"><button class="nav-but">로그아웃</button></a>
        <% } else { %>
            <a href="SFarm_JoinPage.jsp"><button class="nav-but">회원 가입</button></a>
            <a href="SFarm_LoginPage.jsp"><button class="nav-but" style="margin-left: 10px;">로그인</button></a>
        <% } %>
    </nav>
</body>
</html>
