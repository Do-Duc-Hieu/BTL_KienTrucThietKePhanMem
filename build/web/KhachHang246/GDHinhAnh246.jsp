<%@page import="dao.BienBao246DAO"%>
<%@page import="java.time.ZoneId"%>
<%@page import="java.time.Instant"%>
<%@page import="java.time.Instant"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="dao.LichSuNhanDang246DAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="model.*" %>
<%@ page import="java.io.*,java.util.*,java.net.*,javax.servlet.http.*,javax.servlet.annotation.*" %>
<%@ page import="java.nio.file.*,java.nio.*,java.net.http.*,java.net.http.HttpResponse.*" %>
<%@ page import="java.util.Base64" %>

<%
    KhachHang246 khachHang = (KhachHang246) session.getAttribute("khachHang");
    String imagePreview = (String) session.getAttribute("imagePreview");
    LichSuNhanDang246DAO lichSuNhanDang246DAO = new LichSuNhanDang246DAO();
    BienBao246DAO bienBao246DAO = new BienBao246DAO();
    ArrayList<LichSuNhanDang246> danhSachLichSu = new ArrayList<LichSuNhanDang246>();
    SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
    // Lấy ngày hiện tại
    LocalDate currentDate = LocalDate.now();

    // Chuyển LocalDate thành Date
    Instant instant = currentDate.atStartOfDay().atZone(ZoneId.systemDefault()).toInstant();
    Date date = Date.from(instant);
    int tt = 1;
    if (khachHang != null) {
        session.setAttribute("khachHang", khachHang);
        String classId = "";
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
                    .uri(URI.create("http://localhost:5000/classify"))
                    .POST(HttpRequest.BodyPublishers.ofByteArray(imageBytes))
                    .build();

            HttpResponse<String> httpResponse = client.send(httpRequest, HttpResponse.BodyHandlers.ofString());
            classId = httpResponse.body();

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
    <script>
        function previewFile() {
            var preview = document.querySelector('img');
            var file = document.querySelector('input[type=file]').files[0];
            var reader = new FileReader();

            reader.onloadend = function () {
                preview.src = reader.result;
            }

            if (file) {
                reader.readAsDataURL(file);
            } else {
                preview.src = "";
            }
        }
    </script>
</head>
<body>
    <form action="GDChinhKhachHang246.jsp">
            <button type="submit">Quay lại</button>
    </form>
    <h1><%= khachHang.getTen() %></h1>
    <div style="position: fixed; top: 10px; right: 10px;">
        <form action="<%= request.getContextPath() %>/GDDangNhap246.jsp" method="post">
            <button type="submit">Đăng Xuất</button>
        </form>
    </div>
    
    <form action="GDHinhAnh246.jsp" method="post">
        <h2>Chọn ảnh để nhận dạng:</h2>
        <input type="file" name="file" required onchange="previewFile()"/>
        <br>
        <img src="<%= imagePreview %>" height="1000" alt="Image preview...">
        <br>
        <button type="submit">Upload</button>
    </form>
    
    <% if ("POST".equalsIgnoreCase(request.getMethod())) { 
        LichSuNhanDang246 lsnd = new LichSuNhanDang246();
        lsnd.setKhachHang(khachHang);
        lsnd.setNgayNhanDang();
        BienBao246 bienBao246 = bienBao246DAO.getBienBaoByTen(classId.split("hieu")[0].substring(1));
        lsnd.setBienBao(bienBao246);
        lichSuNhanDang246DAO.themLichSuNhanDang(lsnd);
        danhSachLichSu = lichSuNhanDang246DAO.getByLichSuByIdKh(khachHang.getId());
        
    %>
        <h1>Result: <%= classId.split("hieu")[0].substring(1) %></h1>
        <%-- Mở hình ảnh với đường dẫn tuyệt đối --%>
        <% String imagePath = "Test\\" + classId.split("hieu")[1].substring(0, classId.split("hieu")[1].length() - 2); %>
        <img src= "<%= imagePath %>" height="1000" alt="Uploaded image">
    <% } %>
    
    <h1>Lịch sử nhận dạng:</h1>
    <h1>Mo hinh: Nhan dien bien bao bang hinh anh</h1>
    <table border="1">
        <thead>
            <tr>
                <th>Tt</th>
                <th>Id</th>
                <th>Ngày nhận dạng</th>
                <th>Id biển báo</th>
            </tr>
        </thead>
        <tbody>
            <% 
                danhSachLichSu = lichSuNhanDang246DAO.getByLichSuByIdKh(khachHang.getId());
                
                for (LichSuNhanDang246 lichSu : danhSachLichSu) {
            %>
            <tr>
                <td><%= tt++ %></td>
                <td><%= lichSu.getId() %></td>
                <td><%= dateFormat.format(lichSu.getNgayNhanDang()) %></td>
                <td><%= lichSu.getBienBao246().getTen() %></td>
            </tr>
            <% } %>
        </tbody>
    </table>
</body>
</html>
<%
    } 
%>
