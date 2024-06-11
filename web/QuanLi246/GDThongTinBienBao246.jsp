<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="dao.*, model.*" %>
<%
    Integer maBienBao = Integer.parseInt(request.getParameter("id"));
    session.setAttribute("idbien", maBienBao);
    String action = request.getParameter("action");
    
    BienBao246DAO bienBao246DAO = new BienBao246DAO();
    BienBao246 bienBao = bienBao246DAO.getBienBaoByMa(maBienBao);
    session.setAttribute("bienBao", bienBao);
    QuanLi246 quanLi = (QuanLi246) session.getAttribute("quanLi");
    if ("delete".equals(action)) {
        bienBao246DAO.deleteBienBaoById(maBienBao);
        response.sendRedirect("GDTimKiemBienBao246.jsp");
    }

    if (bienBao != null) {
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Thông tin biển báo</title>
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

        h1, h2 {
            text-align: center;
            color: #333;
        }

        p {
            margin-bottom: 10px;
        }

        img {
            display: block;
            margin: 0 auto;
        }

        form {
            margin-top: 20px;
            text-align: center;
        }

        button {
            padding: 8px 20px;
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
        <h1><%= quanLi.getTen() %></h1>
        <h1>Tìm kiếm thông tin biển báo</h1>    
        <h2>Thông tin biển báo</h2>
        <p>ID: <%= bienBao.getId() %></p>
        <p>Tên: <%= bienBao.getTen() %></p>
        <p>Thể loại: <%= bienBao.getTheLoai() %></p>
        <p>Hình ảnh:</p>
        <img src="<%= bienBao.getHinhAnh() %>" height="100" alt="hinh anh">
        <p>Mô tả: <%= bienBao.getMoTa() %></p>
        <hr>

        <!-- Form Xóa sử dụng POST để an toàn hơn -->
        <form method="POST">
            <input type="hidden" name="id" value="<%= maBienBao %>"/>
            <input type="hidden" name="action" value="delete"/>
            <button type="button" onclick="if(confirm('Bạn có chắc chắn muốn xóa biển báo này không?')) this.form.submit();">Xóa</button>
        </form>
        <form action="GDChinhSuaBienBao246.jsp">
            <button type="submit">Chỉnh sửa</button>
        </form>
        <form action="GDTimKiemBienBao246.jsp">
            <button type="submit">Trở về</button>
        </form>
    </div>
</body>
</html>
<%
    }
%>
