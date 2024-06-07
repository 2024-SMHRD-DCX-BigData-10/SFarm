package com.smhrd.controller;

import java.io.IOException;
import java.nio.file.FileSystems;
import java.nio.file.Path;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;

public class LinkCon {

    public static void main(String[] args) {
    	
    	
    	String value1 = "aa";
    	String value2 = "bb";
        String baseUrl = "https://www.example.com";
        String queryString = "?param1=" + value1 + "&param2"+value2;
        String qrCodeText = baseUrl + queryString;
        String filePath = "qrcode.png";
        int width = 300;
        int height = 300;
        
        try {
            generateQRCodeImage(qrCodeText, width, height, filePath);
            System.out.println("QR 코드가 성공적으로 생성되었습니다!");
        } catch (WriterException | IOException e) {
            System.err.println("QR 코드를 생성하는 동안 오류가 발생했습니다: " + e.getMessage());
        }
    }

    private static void generateQRCodeImage(String text, int width, int height, String filePath)
            throws WriterException, IOException {
        QRCodeWriter qrCodeWriter = new QRCodeWriter();
        BitMatrix bitMatrix = qrCodeWriter.encode(text, BarcodeFormat.QR_CODE, width, height);

        Path path = FileSystems.getDefault().getPath(filePath);
        MatrixToImageWriter.writeToPath(bitMatrix, "PNG", path);
    }
}
