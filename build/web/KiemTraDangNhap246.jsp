<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="model.*" %>
<%@ page import="dao.*" %>
<%@ page import="java.io.IOException" %>

<%
    // Lấy thông tin tài khoản và mật khẩu từ trang đăng nhập (GDDangNhap246.jsp)
    String taiKhoan = request.getParameter("taiKhoan");
    String matKhau = request.getParameter("matKhau");

    // Kiểm tra xem tài khoản và mật khẩu có tồn tại trong cơ sở dữ liệu
    ThanhVien246DAO thanhVienDAO = new ThanhVien246DAO();
    boolean ketQua = thanhVienDAO.kiemTraDangNhap(taiKhoan, matKhau);

    if (ketQua) {
        // Nếu kiểm tra đăng nhập thành công
        ThanhVien246 thanhVien = thanhVienDAO.getThanhVienByTaiKhoan(taiKhoan, matKhau);
        if (thanhVien != null) {
            String viTri = thanhVien.getViTri();
            
            if ("KhachHang".equals(viTri)) {
                // Tạo đối tượng KhachHang246 từ ThanhVien246
                KhachHang246 khachHang = new KhachHang246(thanhVien.getId(), thanhVien.getTen(), thanhVien.getTaiKhoan(), thanhVien.getMatKhau(), thanhVien.getNgaySinh(), thanhVien.getDiaChi(), thanhVien.getSdt(), thanhVien.getEmail(), thanhVien.getViTri());
                session.setAttribute("khachHang", khachHang);
                // Lưu đối tượng KhachHang246 vào request
                request.setAttribute("khachHang", khachHang);
                // Nếu là Khách Hàng, chuyển đến trang GDChinhKhachHang246.jsp
                response.sendRedirect("KhachHang246/GDChinhKhachHang246.jsp");
            } else if ("QuanLi".equals(viTri)) {
                QuanLi246 quanLi = new QuanLi246(thanhVien.getId(), thanhVien.getTen(), thanhVien.getTaiKhoan(), thanhVien.getMatKhau(), thanhVien.getNgaySinh(), thanhVien.getDiaChi(), thanhVien.getSdt(), thanhVien.getEmail(), thanhVien.getViTri());
                session.setAttribute("quanLi", quanLi);
                // Nếu là quản lí , chuyển đến trang GDChinhQuanLi246.jsp
                response.sendRedirect("QuanLi246/GDChinhQuanLi246.jsp");
            }
        }
    } else {
        // Nếu kiểm tra đăng nhập không thành công, chuyển về trang GDDangNhap246.jsp
        response.sendRedirect("GDDangNhap246.jsp");
    }
%>
