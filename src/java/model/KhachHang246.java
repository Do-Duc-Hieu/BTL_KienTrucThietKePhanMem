package model;

import java.io.Serializable;
import java.util.Date;

public class KhachHang246 extends ThanhVien246 {
    public KhachHang246() {
        // Mặc định constructor
    }

    public KhachHang246(int id, String ten, String taiKhoan, String matKhau, Date ngaySinh, String diaChi, String sdt, String email, String viTri) {
        super(id, ten, taiKhoan, matKhau, ngaySinh, diaChi, sdt, email, viTri);
    }
}
