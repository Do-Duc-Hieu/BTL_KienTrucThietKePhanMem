<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="model.QuanLi246" %>
<%
    // Lấy thông tin KhachHang từ thuộc tính ẩn
    QuanLi246 quanLi = (QuanLi246) session.getAttribute("quanLi");

    if (quanLi != null) {
        session.setAttribute("quanLi", quanLi);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>GD chính quản lí 246</title>
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

        h1 {
            text-align: center;
            color: #333;
        }

        form {
            margin-bottom: 20px;
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

        button[type="submit"] {
            width: 100%;
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
        <form action="GDTimKiemBienBao246.jsp">
            <button type="submit">Tìm kiếm thông tin biển báo</button><br>
        </form>
        <form action="GDThemBienBao246.jsp">
            <button type="submit">Thêm biển báo</button><br>
        </form>
        <form action="GDThongKeLuotNhanDang246.jsp">
            <button type="submit">Xem thống kê lượt nhận dạng</button><br>
        </form>
    </div>
</body>
</html>
<%
    }
%>
