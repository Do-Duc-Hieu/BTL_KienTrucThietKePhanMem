package model;

public class MoHinh246 {
    private int id;
    private String ten;
    private String duongDan;
    private int doChinhXac;
    
    public MoHinh246() {
    }

    public MoHinh246(int id, String ten, String duongDan, int doChinhXac) {
        this.id = id;
        this.ten = ten;
        this.duongDan = duongDan;
        this.doChinhXac = doChinhXac;
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

    public String getDuongDan() {
        return duongDan;
    }

    public void setDuongDan(String duongDan) {
        this.duongDan = duongDan;
    }

    public int getDoChinhXac() {
        return doChinhXac;
    }

    public void setDoChinhXac(int doChinhXac) {
        this.doChinhXac = doChinhXac;
    }
}

