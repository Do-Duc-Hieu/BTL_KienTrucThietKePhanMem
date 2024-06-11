package dao;

import static dao.DAO.con;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import model.*;


public class TKKhachHang246DAO extends DAO{
    public TKKhachHang246DAO() {
        super();
        // TODO Auto-generated constructor stub
    }
    
   public ArrayList<TKKhachHang246> getThongKeKeKhachHang(){
        ArrayList<TKKhachHang246> result = new ArrayList<TKKhachHang246>();
        String selectKhachHang = "SELECT * FROM thanhvien246 WHERE viTri = 'KhachHang'";
        String selectLichSu = "SELECT * FROM lichsunhandang246 WHERE id_khachhang = ?";
        try{
            PreparedStatement ps = con.prepareStatement(selectKhachHang);
            ResultSet rs = ps.executeQuery();
 
            while(rs.next()){
                TKKhachHang246 tKKhachHang = new TKKhachHang246();
                tKKhachHang.setId(rs.getInt("id"));
                tKKhachHang.setTen(rs.getString("ten"));
                tKKhachHang.setTaiKhoan(rs.getString("taiKhoan"));
                tKKhachHang.setMatKhau(rs.getString("matKhau"));
                tKKhachHang.setNgaySinh(rs.getDate("ngaySinh"));
                tKKhachHang.setDiaChi(rs.getString("diaChi"));
                tKKhachHang.setSdt(rs.getString("sdt"));
                tKKhachHang.setEmail(rs.getString("email"));
                tKKhachHang.setViTri(rs.getString("viTri"));
                tKKhachHang.setLuotNhanDang(0);
     
                result.add(tKKhachHang);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        
        for(TKKhachHang246 tkkh: result){
            int count = 0;
            try{
                PreparedStatement ps = con.prepareStatement(selectLichSu);
                ps.setInt(1, tkkh.getId());
                ResultSet rs = ps.executeQuery();

                while(rs.next()){
                    count+=1;
                }
            }catch(Exception e){
                e.printStackTrace();
            }
            tkkh.setLuotNhanDang(count);
        }       
        
        return result;
   }
}
