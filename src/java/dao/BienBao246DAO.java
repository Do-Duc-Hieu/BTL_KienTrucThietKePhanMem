package dao;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import model.*;

public class BienBao246DAO extends DAO{
    public BienBao246DAO() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    public ArrayList<BienBao246> timKiemTheoTen(String key){
        ArrayList<BienBao246> result = new ArrayList<BienBao246>();
        String sql = "SELECT * FROM bienbao246 WHERE ten LIKE ?";
        try{
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, "%" + key + "%");
            ResultSet rs = ps.executeQuery();
 
            while(rs.next()){
                BienBao246 rm = new BienBao246();
                rm.setId(rs.getInt("id"));
                rm.setTen(rs.getString("ten"));
                rm.setTheLoai(rs.getString("theloai"));
                rm.setHinhAnh(rs.getString("hinhanh"));
                rm.setMoTa(rs.getString("moTa"));
                result.add(rm);
            }
        }catch(Exception e){
            e.printStackTrace();
        }   
        return result;
    }
    
    // Hàm tìm biển báo bởi mã biến báo
    public BienBao246 getBienBaoByMa(int maBienBao) {
        PreparedStatement stmt = null;
        ResultSet rs = null;
        BienBao246 bienBao = null;

        try {
            // Truy vấn để lấy thông tin biển báo theo mã món ăn
            String query = "SELECT * FROM BienBao246 WHERE id = ?";
            stmt = con.prepareStatement(query);
            stmt.setInt(1, maBienBao);
            rs = stmt.executeQuery();

            if (rs.next()) {
                // Lấy thông tin biển báo từ kết quả truy vấn
                int id = rs.getInt("id");
                String ten = rs.getString("ten");
                String theLoai = rs.getString("theloai");
                String hinhAnh = rs.getString("hinhanh");
                String moTa = rs.getString("moTa");

                bienBao = new BienBao246(id, ten, theLoai, hinhAnh, moTa);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return bienBao;
    }
    
    public BienBao246 getBienBaoByTen(String tenBienBao) {
        PreparedStatement stmt = null;
        ResultSet rs = null;
        BienBao246 bienBao = null;

        try {
            // Truy vấn để lấy thông tin biển báo theo mã món ăn
            String query = "SELECT * FROM BienBao246 WHERE ten = ?";
            stmt = con.prepareStatement(query);
            stmt.setString(1, tenBienBao);
            rs = stmt.executeQuery();

            if (rs.next()) {
                // Lấy thông tin biển báo từ kết quả truy vấn
                int id = rs.getInt("id");
                String ten = rs.getString("ten");
                String theLoai = rs.getString("theloai");
                String hinhAnh = rs.getString("hinhanh");
                String moTa = rs.getString("moTa");

                bienBao = new BienBao246(id, ten, theLoai, hinhAnh, moTa);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return bienBao;
    }
    
    
    public boolean addBienBao(BienBao246 bienBao){
        PreparedStatement ps = null;
        boolean success = false;

        try {
            // Truy vấn để thêm mới biển báo vào cơ sở dữ liệu
            String query = "INSERT INTO bienbao246 (ten, theLoai, hinhAnh, moTa) VALUES (?, ?, ?, ?)";
            ps = con.prepareStatement(query);
            ps.setString(1, bienBao.getTen());
            ps.setString(2, bienBao.getTheLoai());
            ps.setString(3, bienBao.getHinhAnh());
            ps.setString(4, bienBao.getMoTa());

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

    
    public void deleteBienBaoById(int maBienBao) {
        PreparedStatement ps = null;

        try {
            // Xóa các bản ghi từ bảng con (lichsunhandang246) trước
            String deleteChildRecordsQuery = "DELETE FROM lichsunhandang246 WHERE id_bienbao = ?";
            ps = con.prepareStatement(deleteChildRecordsQuery);
            ps.setInt(1, maBienBao);
            ps.executeUpdate();
            ps.close();

            // Tiếp tục xóa bản ghi từ bảng cha (bienbao246)
            String deleteParentRecordQuery = "DELETE FROM bienbao246 WHERE id = ?";
            ps = con.prepareStatement(deleteParentRecordQuery);
            ps.setInt(1, maBienBao);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Đóng PreparedStatement sau khi thực thi xong
            try {
                if (ps != null) {
                    ps.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }


    
    public boolean editBienBaoById(int idBienBao, BienBao246 bienBao) {
        PreparedStatement ps = null;
        boolean success = false;

        try {
            // Truy vấn để cập nhật thông tin biển báo
            String query = "UPDATE BienBao246 SET ten = ?, theLoai = ?, hinhAnh = ?, moTa = ? WHERE id = ?";
            ps = con.prepareStatement(query);
            ps.setString(1, bienBao.getTen());
            ps.setString(2, bienBao.getTheLoai());
            ps.setString(3, bienBao.getHinhAnh());
            ps.setString(4, bienBao.getMoTa());
            ps.setInt(5, idBienBao);

            int rowsUpdated = ps.executeUpdate();
            if (rowsUpdated > 0) {
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

}
