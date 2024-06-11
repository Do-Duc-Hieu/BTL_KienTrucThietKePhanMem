package dao;

import static dao.DAO.con;
import dao.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.*;


public class LichSuNhanDang246DAO extends DAO{
    
    BienBao246DAO bienBao246DAO = new BienBao246DAO();
    ThanhVien246DAO thanhVien246DAO = new ThanhVien246DAO();
    public LichSuNhanDang246DAO() {
        super();
        // TODO Auto-generated constructor stub
    }
    
     public boolean themLichSuNhanDang(LichSuNhanDang246 lsnd){
        PreparedStatement ps = null;
        boolean success = false;

        try {
            // Truy vấn để thêm mới biển báo vào cơ sở dữ liệu
            String query = "INSERT INTO lichsunhandang246 (ngayNhanDang, id_khachhang, id_bienbao, id_mohinh) VALUES (?, ?, ?, ?)";
            ps = con.prepareStatement(query);
            ps.setDate(1, lsnd.getNgayNhanDang());
            ps.setInt(2, lsnd.getKhachHang().getId());
            ps.setInt(3, lsnd.getBienBao().getId());
            ps.setInt(4, 1);

            int rowsInserted = ps.executeUpdate();
            if (rowsInserted > 0) {
                success = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Đóng tài nguyên
            try {
                if (ps != null) {
                    ps.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return success;
    }
    
    public ArrayList<LichSuNhanDang246> getByLichSuByIdKh(int idKh){
        ArrayList<LichSuNhanDang246> result = new ArrayList<LichSuNhanDang246>();
        String sql = "SELECT * FROM lichsunhandang246 WHERE id_khachhang LIKE ?";
        
        try{
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, idKh);
            ResultSet rs = ps.executeQuery();
 
            while(rs.next()){
                LichSuNhanDang246 rm = new LichSuNhanDang246();
                rm.setId(rs.getInt("id"));
                rm.setNgayNhanDang(rs.getDate("ngayNhanDang"));
                rm.setKhachHang(thanhVien246DAO.getThanhVienById(rs.getInt("id_khachhang")));
                rm.setBienBao246(bienBao246DAO.getBienBaoByMa(rs.getInt("id_bienbao")));
                result.add(rm);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return result;
    }
}
