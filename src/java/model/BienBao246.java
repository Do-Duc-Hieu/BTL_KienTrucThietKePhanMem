package model;

import java.io.Serializable;

public class BienBao246 {
    private int id;
    private String ten;
    private String theLoai;
    private String hinhAnh;
    private String moTa;
    
    public BienBao246() {
    }

    public BienBao246(int id, String ten, String theLoai, String hinhAnh, String moTa) {
        this.id = id;
        this.ten = ten;
        this.theLoai = theLoai;
        this.hinhAnh = hinhAnh;
        this.moTa = moTa;
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

    public String getTheLoai() {
        return theLoai;
    }

    public void setTheLoai(String theLoai) {
        this.theLoai = theLoai;
    }

    public String getHinhAnh() {
        return hinhAnh;
    }

    public void setHinhAnh(String hinhAnh) {
        this.hinhAnh = hinhAnh;
    }

    public String getMoTa() {
        return moTa;
    }

    public void setMoTa(String moTa) {
        this.moTa = moTa;
    }
}