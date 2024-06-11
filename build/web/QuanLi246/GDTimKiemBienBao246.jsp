<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList,dao.*,model.*, java.util.List"%>
<%
    // Lấy thông tin KhachHang từ thuộc tính ẩn
    QuanLi246 quanLi = (QuanLi246) session.getAttribute("quanLi");

    List<BienBao246> danhSachBienBao = new ArrayList<BienBao246>(); // Thay thế bằng danh sách thực tế

    String tenBienBao = request.getParameter("ten");

    if (tenBienBao != null && !tenBienBao.isEmpty()) {
        // Nếu người dùng đã nhập và gửi form tìm kiếm, thì đặt giá trị tenMonAn vào session.
        session.setAttribute("tenBienBao", tenBienBao);
    } else {
        // Nếu tenMonAn không tồn tại trong session, kiểm tra xem có trong request parameter không.
        String tenBienBaoFromSession = (String) session.getAttribute("tenBienBao");
        if (tenBienBaoFromSession != null) {
            // Sử dụng giá trị tenMonAn lấy từ session.
            tenBienBao = tenBienBaoFromSession;
        }
    }

    if (quanLi != null) {
        if (tenBienBao != null && !tenBienBao.isEmpty()) {
            // Thực hiện tìm kiếm món ăn dựa trên tên
            BienBao246DAO bienBao246DAO = new BienBao246DAO();
            danhSachBienBao = bienBao246DAO.timKiemTheoTen(tenBienBao); // Thay thế bằng cách tìm kiếm thực tế
        }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>GD tìm kiếm biển báo 246</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 600px;
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

        label {
            font-weight: bold;
        }

        input[type="text"] {
            width: calc(100% - 120px);
            padding: 8px;
            margin: 8px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        button[type="submit"] {
            padding: 8px 20px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button[type="submit"]:hover {
            background-color: #0056b3;
        }

        ul {
            list-style-type: none;
            padding: 0;
        }

        li {
            margin-bottom: 10px;
        }

        li a {
            text-decoration: none;
            color: #333;
        }

        li a:hover {
            color: #007bff;
            text-decoration: underline;
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
        <h1>Tìm kiếm thông tin biển báo</h1>
        <h1><%= quanLi.getTen() %></h1>
        <form action="GDTimKiemBienBao246.jsp" method="post">
            <label for="ten">Nhập từ khóa:</label>
            <input type="text" id="ten" name="ten">
            <button type="submit">Tìm kiếm</button>
        </form>
        
        <ul>
            <% for (BienBao246 bienBao : danhSachBienBao) { %>
            <li><a href="GDThongTinBienBao246.jsp?id=<%= bienBao.getId() %>"><u><%= bienBao.getTen() %></u></a></li>
            <% } %>
        </ul>
        
        <form action="GDChinhQuanLi246.jsp">
            <button type="submit">Trở về</button>
        </form>
    </div>
</body>
</html>
<%
    } 
%>
