<%@page import="com.smhrd.model.MemberDTO"%>
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
        String mb_id = (String) request.getAttribute("mb_id");
        System.out.println("Received mb_id: " + mb_id);  // 디버깅용 출력
        FarmhouseDAO dao = new FarmhouseDAO();
        ArrayList<FarmhouseDTO> fh_dto = dao.getFarmhouseDTO(mb_id);
        System.out.println("Fetched FarmhouseDTO size: " + fh_dto.size());  // 디버깅용 출력

        // 이전 값을 저장할 변수
        String prevMbId = "";
        String prevFhName = "";
        String prevFhOwner = "";
        String prevAgriName = "";
    %>
    <h2>농가 정보</h2>
    <% for(FarmhouseDTO x : fh_dto) { %>
        
        <p>농가 이름: <%= x.getFh_name().equals(prevFhName) ? "" : x.getFh_name() %></p>
        <p>농장주: <%= x.getFh_owner().equals(prevFhOwner) ? "" : x.getFh_owner() %></p>
        <p>품명: <%= x.getAgri_name().equals(prevAgriName) ? "" : x.getAgri_name() %></p>
        <hr/>
        <%
            // 현재 값을 이전 값 변수에 저장
            
            prevFhName = x.getFh_name();
            prevFhOwner = x.getFh_owner();
            prevAgriName = x.getAgri_name();
        %>
    <% } %>
</body>
</html>
