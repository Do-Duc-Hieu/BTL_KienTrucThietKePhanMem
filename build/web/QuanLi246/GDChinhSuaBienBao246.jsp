<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="dao.*, model.*" %>
<%
    Integer maBienBao = (Integer) session.getAttribute("idbien");
    String action = request.getParameter("action");
    BienBao246DAO bienBao246DAO = new BienBao246DAO();
    BienBao246 bienBao = bienBao246DAO.getBienBaoByMa(maBienBao);
    session.setAttribute("bienBao", bienBao);
    QuanLi246 quanLi = (QuanLi246) session.getAttribute("quanLi");
    if ("edit".equals(action)) {
        bienBao.setTen(request.getParameter("ten"));
        bienBao.setTheLoai(request.getParameter("theLoai"));
        bienBao.setHinhAnh("Meta\\"+request.getParameter("hinhAnh"));
        bienBao.setMoTa(request.getParameter("moTa"));
        bienBao246DAO.editBienBaoById(maBienBao, bienBao);
        response.sendRedirect("GDTimKiemBienBao246.jsp");
    }
    
    if (bienBao != null) {
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Chỉnh sửa thông tin biển báo</title>
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

        form {
            margin-top: 20px;
            text-align: center;
        }

        label {
            display: block;
            margin-bottom: 10px;
            font-weight: bold;
        }

        input[type="text"],
        input[type="file"],
        select,
        textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        textarea {
            height: 150px;
            resize: none;
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

        img {
            display: block;
            margin: 0 auto;
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
        <h2>Chỉnh sửa thông tin biển báo:</h2>

        <form action="GDChinhSuaBienBao246.jsp" method="POST">
            <label for="ten">Tên biển báo:</label>
            <input type="text" name="ten" id="ten" value="<%= bienBao.getTen() %>" required />

            <label for="theLoai">Thể loại:</label>
            <select name="theLoai" id="theLoai" required>
                <option value="Bien cam" <%= bienBao.getTheLoai().equals("Bien cam") ? "selected" : "" %>>Bien cam</option>
                <option value="Bien canh bao" <%= bienBao.getTheLoai().equals("Bien canh bao") ? "selected" : "" %>>Bien canh bao</option>
                <option value="Bien hieu lenh" <%= bienBao.getTheLoai().equals("Bien hieu lenh") ? "selected" : "" %>>Bien hieu lenh</option>
                <option value="Bien chi dan" <%= bienBao.getTheLoai().equals("Bien chi dan") ? "selected" : "" %>>Bien chi dan</option>
                <option value="Bien phu" <%= bienBao.getTheLoai().equals("Bien phu") ? "selected" : "" %>>Bien phu</option>
            </select>

            <label for="hinhAnh">Hình ảnh:</label>
            <input type="file" name="hinhAnh" id="hinhAnh" required onchange="previewFile()" />
            <img src="<%= bienBao.getHinhAnh() %>" height="100" alt="hinh anh" />

            <label for="moTa">Mô tả:</label>
            <textarea name="moTa" id="moTa" required><%= bienBao.getMoTa() %></textarea>

            <input type="hidden" name="id" value="<%= maBienBao %>" />
            <input type="hidden" name="action" value="edit" />
            <!-- Gọi hàm JavaScript khi bấm vào nút "Chỉnh sửa" -->
            <button type="button" onclick="if(confirm('Bạn có chắc chắn muốn sửa biển báo này không?')) {this.form.submit(); }">Chỉnh sửa</button>
        </form>

        <form action="GDTimKiemBienBao246.jsp">
            <button type="submit">Trở về</button>
        </form>
    </div>

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
</body>
</html>
<%
    }
%>
