package model;

import java.io.Serializable;
import java.util.Date;

public class QuanLi246 extends ThanhVien246 {

    public QuanLi246() {
        // Mặc định constructor
    }

    public QuanLi246(int id, String ten, String taiKhoan, String matKhau, Date ngaySinh, String diaChi, String sdt, String email, String viTri) {
        super(id, ten, taiKhoan, matKhau, ngaySinh, diaChi, sdt, email, viTri);
    }
}
