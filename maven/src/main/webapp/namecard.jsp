<%@page import="com.smhrd.model.FarmhouseDTO"%>
<%@page import="com.smhrd.model.FarmhouseDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>농가 정보</title>
</head>
<body>
    <%
        String mb_id = request.getParameter("mb_id");
        String fh_name = request.getParameter("fh_name");
        String qrCodePath = request.getParameter("qrCodePath");

        System.out.println("Received mb_id: " + mb_id);  // 디버깅용 출력
        System.out.println("Received fh_name: " + fh_name);  // 디버깅용 출력
        System.out.println("QR Code Path: " + qrCodePath);  // 디버깅용 출력

        FarmhouseDAO dao = new FarmhouseDAO();
        ArrayList<FarmhouseDTO> fh_dto = null;

        if (mb_id != null) {
            fh_dto = dao.getFarmhouseDTO(mb_id);
        } else {
            System.out.println("mb_id is null");
        }

        if (fh_dto != null && fh_dto.size() > 0) {
            FarmhouseDTO x = fh_dto.get(0);
    %>
        <h2>농가 정보</h2>
        <p>농가 이름: <%= x.getFh_name() %></p>
        <p>농장주: <%= x.getFh_owner() %></p>
        <p>품명: <%= x.getAgri_name() %></p>
        <p>농가 소개: <%= x.getFh_intro() %></p>
        <%
            if (qrCodePath != null) {
        %>
            <h3>QR 코드:</h3>
            <img src="<%= request.getContextPath() + qrCodePath %>" alt="QR Code">
        <%
            } else {
        %>
            <h3>QR없음</h3>
        <%
            }
        %>
        <form action="S_ProductDetailsCon" method="get">
            
            <button type="submit">자세히 보기</button>
        </form>
    <%
        } else {
    %>
        <h3>농가 정보가 없습니다.</h3>
    <%
        }
    %>
</body>
</html>
