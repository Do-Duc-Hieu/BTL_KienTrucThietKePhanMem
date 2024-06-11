<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="dao.*, model.*, java.time.format.DateTimeFormatter, java.time.LocalDate, java.text.SimpleDateFormat, java.util.Date" %>

<%
    // Lấy thông tin quản lí từ session
    QuanLi246 quanLi = (QuanLi246) session.getAttribute("quanLi");

    // Lấy ngày hiện tại
    LocalDate currentDate = LocalDate.now();
    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
    String formattedDate = currentDate.format(formatter);
    
    TKKhachHang246DAO tKKhachHang246DAO = new TKKhachHang246DAO();
    
    // Danh sách TKKhachHang246 (giả sử đã có)
    ArrayList<TKKhachHang246> danhSachTK = new ArrayList<TKKhachHang246>();
    danhSachTK = tKKhachHang246DAO.getThongKeKeKhachHang();
    int stt = 1;
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Thống kê lượt nhận dạng</title>
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
            margin-bottom: 20px;
        }

        table {
            border-collapse: collapse;
            width: 100%;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #ddd;
        }

        a {
            text-decoration: none;
            color: #007bff;
        }

        button {
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
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
        <h1>Quản lí <%= quanLi.getTen() %></h1>
        <p>Ngày Thống kê: <%= formattedDate %></p>
        <!-- Bảng danh sách TKKhachHang246 -->
        <h2>Danh sách thống kê lượt nhận dạng:</h2>
        <table>
            <thead>
                <tr>
                    <th>Tt</th>
                    <th>Tên khách hàng</th>
                    <th>Tổng lượt nhận dạng</th>
                </tr>
            </thead>
            <tbody>
                <% for (TKKhachHang246 tk : danhSachTK) { %>
                    <tr>
                        <td><%= stt++ %></td>
                        <td><a href="GDThongTinNhanDangChiTiet246.jsp?id=<%= tk.getId() %>"><%= tk.getTen() %></a></td>
                        <td><%= tk.getLuotNhanDang() %></td>
                    </tr>
                <% } %>
            </tbody>
        </table><br><br>
        <form action="GDChinhQuanLi246.jsp">
            <button type="submit">Quay lại</button>
        </form>
    </div>
</body>
</html>
