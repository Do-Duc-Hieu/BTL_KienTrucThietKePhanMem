<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="model.*, dao.*" %>
<%
    // Lấy thông tin QuanLi từ session
    QuanLi246 quanLi = (QuanLi246) session.getAttribute("quanLi");
    String action = request.getParameter("action");
    BienBao246DAO bienBao246DAO = new BienBao246DAO();
    if("add".equals(action)){
        BienBao246 bienBao = new BienBao246();
        bienBao.setTen(request.getParameter("ten"));
        bienBao.setTheLoai(request.getParameter("loai"));
        bienBao.setHinhAnh("Meta\\"+request.getParameter("hinhanh"));
        bienBao.setMoTa(request.getParameter("mota"));
        ArrayList<BienBao246> timKiem = bienBao246DAO.timKiemTheoTen(bienBao.getTen());
        if(timKiem.isEmpty()) {    
            bienBao246DAO.addBienBao(bienBao);
            response.sendRedirect("GDChinhQuanLi246.jsp");
        }
        else{
            out.println("<script>alert('Biển báo đã tồn tại!');</script>");
        }
    }
    if (quanLi != null) {
        // Lưu thông tin QuanLi vào session
        session.setAttribute("quanLi", quanLi);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Thêm biển báo</title>
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

        input[type="text"],
        select,
        textarea {
            width: calc(100% - 20px);
            padding: 8px;
            margin: 8px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        input[type="file"] {
            margin-top: 8px;
        }

        button[type="button"],
        button[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button[type="button"]:hover,
        button[type="submit"]:hover {
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
        <form action="GDThemBienBao246.jsp" method="post">
            <label for="ten">Tên biển báo:</label><br>
            <input type="text" id="ten" name="ten" required><br>
            
            <label for="loai">Loại biển báo:</label><br>
            <select id="loai" name="loai" required>
                <option value="Bien cam">Bien cam</option>
                <option value="Bien canh bao">Bien canh bao</option>
                <option value="Bien hieu lenh">Bien hieu lenh</option>
                <option value="Bien chi dan">Bien chi dan</option>
                <option value="Bien phu">Bien phu</option>
            </select><br>
            
            <label for="hinhanh">Chọn hình ảnh:</label><br>
            <input type="file" id="hinhanh" name="hinhanh" required onchange="previewFile()"><br>
            <img id="preview" height="200" alt="Hình ảnh biển báo"><br>
            <script>
                function previewFile() {
                    var preview = document.getElementById('preview');
                    var file = document.getElementById('hinhanh').files[0];
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
            
            <label for="mota">Mô tả:</label><br>
            <textarea id="mota" name="mota" required></textarea><br>
            
            <input type="hidden" name="action" value="add"/>
            <button type="button" onclick="if(confirm('Bạn có chắc chắn muốn thêm biển báo này không?')) this.form.submit();">Thêm biển báo</button>
        </form>
        <form action="GDChinhQuanLi246.jsp">
            <button type="submit">Trở về</button>
        </form>
    </div>
</body>
</html>
<%
    }
%>
