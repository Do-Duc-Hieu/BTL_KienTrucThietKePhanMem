<%@page import="dao.BienBao246DAO"%>
<%@page import="java.time.ZoneId"%>
<%@page import="java.time.Instant"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="dao.LichSuNhanDang246DAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="model.*" %>
<%@ page import="java.io.*,java.util.*,java.net.*,javax.servlet.http.*,javax.servlet.annotation.*" %>
<%@ page import="java.nio.file.*,java.nio.*,java.net.http.*,java.net.http.HttpResponse.*" %>
<%@ page import="java.util.Base64" %>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.Comparator"%>
<%@page import="java.util.List"%>

<%
    KhachHang246 khachHang = (KhachHang246) session.getAttribute("khachHang");
    String classId = "";
    List<String> topResults = new ArrayList<>();

    if (khachHang != null) {
        session.setAttribute("khachHang", khachHang);
        if ("POST".equalsIgnoreCase(request.getMethod())) {
            InputStream fileContent = request.getInputStream();
            ByteArrayOutputStream buffer = new ByteArrayOutputStream();
            byte[] data = new byte[16384];
            int nRead;
            while ((nRead = fileContent.read(data, 0, data.length)) != -1) {
                buffer.write(data, 0, nRead);
            }
            buffer.flush();

            byte[] imageBytes = buffer.toByteArray();

            // Gửi byte[] image đến Flask API
            HttpClient client = HttpClient.newHttpClient();
            HttpRequest httpRequest = HttpRequest.newBuilder()
                    .uri(URI.create("http://localhost:5001"))
                    .POST(HttpRequest.BodyPublishers.ofByteArray(imageBytes))
                    .build();

            HttpResponse<String> httpResponse = client.send(httpRequest, HttpResponse.BodyHandlers.ofString());
            classId = httpResponse.body();

            // Giả định rằng phản hồi từ Flask API là một chuỗi JSON dạng: ["label1", "label2", "label1", ...]
            classId = classId.replaceAll("[\\[\\]\"]", ""); // Xóa các dấu ngoặc và dấu ngoặc kép
            String[] labels = classId.split(",");

            // Tính tần suất xuất hiện của từng kết quả
            Map<String, Integer> frequencyMap = new HashMap<>();
            for (String label : labels) {
                frequencyMap.put(label.trim(), frequencyMap.getOrDefault(label.trim(), 0) + 1);
            }

            // Sắp xếp các kết quả theo tần suất giảm dần
            List<Map.Entry<String, Integer>> sortedEntries = new ArrayList<>(frequencyMap.entrySet());
            sortedEntries.sort(new Comparator<Map.Entry<String, Integer>>() {
                @Override
                public int compare(Map.Entry<String, Integer> e1, Map.Entry<String, Integer> e2) {
                    return e2.getValue().compareTo(e1.getValue());
                }
            });

            // Lấy 4 kết quả có tần suất xuất hiện nhiều nhất
            for (int i = 0; i < Math.min(4, sortedEntries.size()); i++) {
                topResults.add(sortedEntries.get(i).getKey() + " (" + sortedEntries.get(i).getValue() + ")");
            }
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>GD chính khách hàng 246</title>
     <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        h1 {
            color: #333;
        }

        .logout-button {
            position: fixed;
            top: 10px;
            right: 10px;
        }

        form {
            margin-bottom: 20px;
        }

        input[type="file"] {
            margin-bottom: 10px;
        }

        button[type="submit"] {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
        }

        button[type="submit"]:hover {
            background-color: #0056b3;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            padding: 8px;
            text-align: left;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        img {
            margin-top: 10px;
            display: block;
            max-width: 500%;
            height: auto;
        }
    </style>
</head>
<body>
    <div style="position: fixed; top: 10px; right: 10px;">
        <form action="<%= request.getContextPath() %>/GDDangNhap246.jsp" method="post">
            <button type="submit">Đăng Xuất</button>
        </form>
    </div>
    <h1><%= khachHang.getTen() %></h1>
    <form action="GDHinhAnh246.jsp" method="get">
        <button type="submit">Nhận dạng bằng Hình ảnh</button>
    </form>
    
    <form action="GDChinhKhachHang246.jsp" method="post" enctype="multipart/form-data">
        <button type="submit">Nhận dạng bằng Camera</button>
    </form>

    <% if (!topResults.isEmpty()) { %>
        <h2>Kết quả nhận dạng từ camera:</h2>
        <ul>
            <% for (String result : topResults) { %>
                <li><%= result %></li>
            <% } %>
        </ul>
    <% } %>
</body>
</html>
