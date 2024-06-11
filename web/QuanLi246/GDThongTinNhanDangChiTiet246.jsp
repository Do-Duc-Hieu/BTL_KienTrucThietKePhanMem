<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="dao.LichSuNhanDang246DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="model.*,java.util.*,java.text.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
    QuanLi246 quanLi = (QuanLi246) session.getAttribute("quanLi");
    Integer maKhachHang = Integer.parseInt(request.getParameter("id"));
    LichSuNhanDang246DAO lichSuNhanDang246DAO = new LichSuNhanDang246DAO();
    ArrayList<LichSuNhanDang246> danhSachLichSu = lichSuNhanDang246DAO.getByLichSuByIdKh(maKhachHang);
    // Lấy ngày hiện tại
    LocalDate currentDate = LocalDate.now();
    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
    String formattedDate = currentDate.format(formatter);
    
    SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
    int tt = 1;
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Thông tin nhận dạng chi tiết</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h1, h2 {
            text-align: center;
            color: #333;
        }

        p {
            text-align: center;
            margin-bottom: 10px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 10px;
            border: 1px solid #ccc;
        }

        th {
            background-color: #f2f2f2;
        }

        th:first-child, td:first-child {
            text-align: center;
        }

        form {
            text-align: center;
            margin-top: 20px;
        }

        button {
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            margin: 0 10px;
        }

        button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div style="position: fixed; top: 10px; right: 10px;">
        <form action="<%= request.getContextPath() %>/GDDangNhap246.jsp" method="post">
            <button type="submit">Đăng Xuất</button>
        </form>
    </div>
    <div class="container">
        <h1>Quản lí: <%= quanLi.getTen() %></h1>
        <h2>Khách hàng: <%= maKhachHang %></h2>
        <p>Ngày Thống kê: <%= formattedDate %></p>
        <h3>Mô hình: Nhan dien bien bao bang hinh anh</h3>

        <table>
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
                    for (LichSuNhanDang246 lichSu : danhSachLichSu) {
                %>
                <tr>
                    <td><%= tt++ %></td>
                    <td><%= lichSu.getId() %></td>
                    <td><%= dateFormat.format(lichSu.getNgayNhanDang()) %></td>
                    <td><%= lichSu.getBienBao().getTen() %></td>
                </tr>
                <% } %>
            </tbody>
        </table>
        <form action="GDThongKeLuotNhanDang246.jsp">
            <button type="submit">Quay lại</button>
        </form>
    </div>
</body>
</html>
