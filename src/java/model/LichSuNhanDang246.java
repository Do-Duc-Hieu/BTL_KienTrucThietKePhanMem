package model;

import java.sql.Date;
import java.util.ArrayList;

public class LichSuNhanDang246 {
    private int id;
    private Date ngayNhanDang;
    private MoHinh246 moHinh246;
    private ThanhVien246 khachHang246;   
    private BienBao246 bienBao246;
    
    public LichSuNhanDang246() {
    }

    public LichSuNhanDang246(int id, Date ngayNhanDang, ThanhVien246 khachHang246, BienBao246 bienBao246, MoHinh246 moHinh246) {
        this.id = id;
        this.ngayNhanDang = ngayNhanDang;
        this.khachHang246 = khachHang246;
        this.bienBao246 = bienBao246;
        this.moHinh246 = moHinh246;
    }
    
    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getNgayNhanDang() {
        return ngayNhanDang;
    }

    public void setNgayNhanDang(Date ngayNhanDang) {
        this.ngayNhanDang = ngayNhanDang;
    }
    
    public void setNgayNhanDang() {
        this.ngayNhanDang = new Date(System.currentTimeMillis());
    }
    
    public ThanhVien246 getKhachHang() {
        return khachHang246;
    }

    public void setKhachHang(ThanhVien246 khachHang) {
        this.khachHang246 = khachHang;
    }
    
    public BienBao246 getBienBao() {
        return bienBao246;
    }

    public void setBienBao(BienBao246 bienBao) {
        this.bienBao246 = bienBao;
    }

    public MoHinh246 getMoHinh() {
        return moHinh246;
    }

    public void setMoHinh(MoHinh246 moHinh) {
        this.moHinh246 = moHinh;
    }
   
    public BienBao246 getBienBao246(){
        return bienBao246;
    }
    public void setBienBao246(BienBao246 bienBao246){
        this.bienBao246 = bienBao246;
    }
}
