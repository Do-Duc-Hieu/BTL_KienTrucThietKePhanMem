package model;

import java.util.ArrayList;
import java.util.Date;

public class TKKhachHang246 extends KhachHang246{
    private int luotNhanDang;
    
    public TKKhachHang246(){
        
    }
    
    public TKKhachHang246(int id, String ten, String taiKhoan, String matKhau, Date ngaySinh, String diaChi, String sdt, String email, String viTri, int luotNhanDang){
        super(id, ten, taiKhoan, matKhau, ngaySinh, diaChi, sdt, email, viTri);
        
        this.luotNhanDang = luotNhanDang;
    }
    
    public int getLuotNhanDang() {
        return luotNhanDang;
    }
    
    public void setLuotNhanDang(int luotNhanDang) {
        this.luotNhanDang = luotNhanDang;
    }
    
}
