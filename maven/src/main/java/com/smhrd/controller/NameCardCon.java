package com.smhrd.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;
import com.smhrd.model.FarmhouseDAO;
import com.smhrd.model.FarmhouseDTO;
import com.smhrd.model.MemberDTO;

import java.util.ArrayList;

@WebServlet("/S_NameCardCon")
public class NameCardCon extends HttpServlet {

    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("NameCardCon");

        request.setCharacterEncoding("UTF-8");
        
        String mb_id = request.getParameter("mb_id");
        String fh_name = request.getParameter("fh_name");

        if (mb_id == null || fh_name == null) {
            System.out.println("명함 발급을 위한 필요한 정보가 없습니다.");
            response.sendRedirect("Main.jsp");
        } else {
            FarmhouseDAO dao = new FarmhouseDAO();
            ArrayList<FarmhouseDTO> fh_dto = dao.getFarmhouseDTO(mb_id);

            if (fh_dto.size() > 0) {
                String url = "http://192.168.0.25:8081/maven/namecard.jsp?mb_id=" + mb_id + "&fh_name=" + fh_name;

                ServletContext context = getServletContext();
                
                String qr_path = "/images/" + fh_name + ".png";
                String realPath = context.getRealPath(qr_path);

                // Ensure the directory exists
                Path imagePath = Paths.get(context.getRealPath("/images"));
                if (!Files.exists(imagePath)) {
                    Files.createDirectories(imagePath);
                }

                try {
                    generateQRCodeImage(url, 300, 300, realPath);
                    // QR 코드 경로를 쿼리 스트링에 추가
                    String redirectUrl = "http://192.168.0.25:8081/maven/namecard.jsp?mb_id=" + mb_id + "&fh_name=" + fh_name + "&qrCodePath=" + qr_path;
                    response.sendRedirect(redirectUrl);
                } catch (WriterException e) {
                    e.printStackTrace();
                    response.sendRedirect("Main.jsp");
                }
            } else {
                System.out.println("농가 정보가 없습니다.");
                response.sendRedirect("Main.jsp");
            }
        }
    }

    private void generateQRCodeImage(String text, int width, int height, String filePath)
            throws WriterException, IOException {
        QRCodeWriter qrCodeWriter = new QRCodeWriter();
        BitMatrix bitMatrix = qrCodeWriter.encode(text, BarcodeFormat.QR_CODE, width, height);

        Path path = Paths.get(filePath);
        MatrixToImageWriter.writeToPath(bitMatrix, "PNG", path);
    }
}
