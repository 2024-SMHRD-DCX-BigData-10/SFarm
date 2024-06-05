package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.smhrd.model.BoardDAO;
import com.smhrd.model.BoardVO;

@WebServlet("/BoardService")
public class BoardService extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 파일 업로드를 하기 위한 변수 설정.
		// 1. request 객체 
		// 2. 파일을 저장할 경로(String)
		
			String savePath = request.getServletContext().getRealPath("./file");
			System.out.println("svaePath : " +savePath);
			
			//3. 파일 최대크기 지정(int)
			int maxSize = 1024*1024*10;
			
			// 4. 인코딩 방식 (String)
			String encoding="UTF-8";
			//5. 파일 이름 중복제거
			DefaultFileRenamePolicy rename = new DefaultFileRenamePolicy();
			
			//파일 업로드 객체-> multipart
			try { 
				MultipartRequest multi;
			multi = new MultipartRequest(request, savePath, maxSize, encoding, rename);
			
		 String title	=  multi.getParameter("title");
		 String writer =  multi.getParameter("writer");
		 String filename =  multi.getFilesystemName("filename");
		 String content =  multi.getParameter("content");
		 
		 System.out.println(title);
		 System.out.println(writer);
		 System.out.println(filename);
		 System.out.println(content);
		 
		 
		 BoardVO vo = new BoardVO(title,writer,filename,content); 
		 System.out.println(vo.toString());
		 
		 int cnt = new BoardDAO().writeBoard(vo);
		 if(cnt>0) {
			 System.out.println("게시글 작성 성공");
		 }else {
			 System.out.println("게시글 작성 실패");
		 }
		 
		 

		
		
			
		} catch (Exception e) {
			e.printStackTrace();
		}
			response.sendRedirect("BoardMain.jsp");
		

}}
