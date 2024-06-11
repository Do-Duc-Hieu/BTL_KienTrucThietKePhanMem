package model;

import java.io.Serializable;
import java.util.Date;

public class ThanhVien246 {
    private int id;
    private String ten;
    private String taiKhoan;
    private String matKhau;
    private Date ngaySinh;
    private String diaChi;
    private String sdt;
    private String email;
    private String viTri;

    // Constructors
    public ThanhVien246() {
        // Mặc định constructor
    }

    public ThanhVien246(int id, String ten, String taiKhoan, String matKhau, Date ngaySinh, String diaChi, String sdt, String email, String viTri) {
        this.id = id;
        this.ten = ten;
        this.taiKhoan = taiKhoan;
        this.matKhau = matKhau;
        this.ngaySinh = ngaySinh;
        this.diaChi = diaChi;
        this.sdt = sdt;
        this.email = email;
        this.viTri = viTri;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTen() {
        return ten;
    }

    public void setTen(String ten) {
        this.ten = ten;
    }

    public String getTaiKhoan() {
        return taiKhoan;
    }

    public void setTaiKhoan(String taiKhoan) {
        this.taiKhoan = taiKhoan;
    }

    public String getMatKhau() {
        return matKhau;
    }

    public void setMatKhau(String matKhau) {
        this.matKhau = matKhau;
    }

    public Date getNgaySinh() {
        return ngaySinh;
    }

    public void setNgaySinh(Date ngaySinh) {
        this.ngaySinh = ngaySinh;
    }

    public String getDiaChi() {
        return diaChi;
    }

    public void setDiaChi(String diaChi) {
        this.diaChi = diaChi;
    }

    public String getSdt() {
        return sdt;
    }

    public void setSdt(String sdt) {
        this.sdt = sdt;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    public String getViTri() {
        return viTri;
    }

    public void setViTri(String ViTri) {
        this.viTri = ViTri;
    }
}
