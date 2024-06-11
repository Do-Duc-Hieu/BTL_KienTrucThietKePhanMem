use traffic;
INSERT INTO ThanhVien246 (ten, taiKhoan, matKhau, ngaySinh, diaChi, sdt, email, viTri)
VALUES
  ('Nguyen Van A', 'user1', 'password1', '1990-01-01', '123 Main St', '1234567890', 'email1@example.com', 'KhachHang'),
  ('Tran Thi B', 'user2', 'password2', '1995-02-15', '456 Elm St', '9876543210', 'email2@example.com', 'QuanLi'),
  ('Le Van C', 'user3', 'password3', '1987-08-30', '789 Oak St', '5556667777', 'email3@example.com', 'KhachHang'),
  ('Pham Thi D', 'user4', 'password4', '1992-12-20', '101 Pine St', '1112223333', 'email4@example.com', 'KhachHang'),
  ('Hoang Van E', 'user5', 'password5', '1985-05-05', '222 Cedar St', '4447779999', 'email5@example.com', 'QuanLi');

INSERT INTO KhachHang246 (id)
VALUES
  (1),
  (3),
  (4);

INSERT INTO QuanLi246 (id)
VALUES
  (2),
  (5);

-- Bảng BienBao246 ở phần hình ảnh có đường dẫn là C:\rac\traffic\src\train\Meta
INSERT INTO BienBao246 (ten, theloai, hinhanh, moTa)
VALUES 
('Speed limit (20km/h)', 'Bien bao cam', 'Meta\\0.png', 'Biển báo giới hạn tốc độ 20km/h'),
('Speed limit (30km/h)', 'Bien bao cam', 'Meta\\1.png', 'Biển báo giới hạn tốc độ 30km/h'),
('Speed limit (50km/h)', 'Bien bao cam', 'Meta\\2.png', 'Biển báo giới hạn tốc độ 50km/h'),
('Speed limit (60km/h)', 'Bien bao cam', 'Meta\\3.png', 'Biển báo giới hạn tốc độ 60km/h'),
('Speed limit (70km/h)', 'Bien bao cam', 'Meta\\4.png', 'Biển báo giới hạn tốc độ 70km/h'),
('Speed limit (80km/h)', 'Bien bao cam', 'Meta\\5.png', 'Biển báo giới hạn tốc độ 80km/h'),
('End of speed limit (80km/h)', 'Bien bao cam', 'Meta\\6.png', 'Biển báo kết thúc giới hạn tốc độ 80km/h'),
('Speed limit (100km/h)', 'Bien bao cam', 'Meta\\7.png', 'Biển báo giới hạn tốc độ 100km/h'),
('Speed limit (120km/h)', 'Bien bao cam', 'Meta\\8.png', 'Biển báo giới hạn tốc độ 120km/h'),
('No passing', 'Bien bao cam', 'Meta\\9.png', 'Biển báo cấm vượt'),
('No passing veh over 3.5 tons', 'Bien bao cam', 'Meta\\10.png', 'Biển báo cấm vượt xe trọng tải trên 3.5 tấn'),
('Right-of-way at intersection', 'Bien chi dan', 'Meta\\11.png', 'Biển báo ưu tiên tại giao lộ'),
('Priority road', 'Bien chi dan', 'Meta\\12.png', 'Biển báo đường ưu tiên'),
('Yield', 'Bien chi dan', 'Meta\\13.png', 'Biển báo nhường đường'),
('Stop', 'Bien chi dan', 'Meta\\14.png', 'Biển báo dừng lại'),
('No vehicles', 'Bien chi dan', 'Meta\\15.png', 'Biển báo cấm xe cộ'),
('Veh > 3.5 tons prohibited', 'Bien phu', 'Meta\\16.png', 'Biển báo cấm xe trọng tải trên 3.5 tấn'),
('No entry', 'Bien bao cam', 'Meta\\17.png', 'Biển báo cấm đi'),
('General caution', 'Bien phu', 'Meta\\18.png', 'Biển báo cảnh báo chung'),
('Dangerous curve left', 'Bien phu', 'Meta\\19.png', 'Biển báo cua nguy hiểm bên trái'),
('Dangerous curve right', 'Bien phu', 'Meta\\20.png', 'Biển báo cua nguy hiểm bên phải'),
('Double curve', 'Bien phu', 'Meta\\21.png', 'Biển báo cua nguy hiểm đường cong kép'),
('Bumpy road', 'Bien phu', 'Meta\\22.png', 'Biển báo đường gồ ghề'),
('Slippery road', 'Bien phu', 'Meta\\23.png', 'Biển báo đường trơn trượt'),
('Road narrows on the right', 'Bien phu', 'Meta\\24.png', 'Biển báo đường hẹp bên phải'),
('Road work', 'Bien phu', 'Meta\\25.png', 'Biển báo đường đang thi công'),
('Traffic signals', 'Bien phu', 'Meta\\26.png', 'Biển báo tín hiệu giao thông'),
('Pedestrians', 'Bien phu', 'Meta\\27.png', 'Biển báo đi bộ'),
('Children crossing', 'Bien phu', 'Meta\\28.png', 'Biển báo qua đường có trẻ em'),
('Bicycles crossing', 'Bien phu', 'Meta\\29.png', 'Biển báo qua đường có xe đạp'),
('Beware of ice/snow', 'Bien phu', 'Meta\\30.png', 'Biển báo cảnh báo đường trơn trượt do băng tuyết'),
('Wild animals crossing', 'Bien phu', 'Meta\\32.png', 'Biển báo qua đường có động vật hoang dã'),
('End speed + passing limits', 'Bien hieu lenh', 'Meta\\32.png', 'Biển báo kết thúc giới hạn tốc độ và vượt'),
('Turn right ahead', 'Bien hieu lenh', 'Meta\\33.png', 'Biển báo rẽ phải phía trước'),
('Turn left ahead', 'Bien hieu lenh', 'Meta\\34.png', 'Biển báo rẽ trái phía trước'),
('Ahead only', 'Bien hieu lenh', 'Meta\\35.png', 'Biển báo chỉ được đi thẳng'),
('Go straight or right', 'Bien hieu lenh', 'Meta\\36.png', 'Biển báo đi thẳng hoặc rẽ phải'),
('Go straight or left', 'Bien hieu lenh', 'Meta\\37.png', 'Biển báo đi thẳng hoặc rẽ trái'),
('Keep right', 'Bien hieu lenh', 'Meta\\38.png', 'Biển báo giữ bên phải'),
('Keep left', 'Bien hieu lenh', 'Meta\\39.png', 'Biển báo giữ bên trái'),
('Roundabout mandatory', 'Bien hieu lenh', 'Meta\\40.png', 'Biển báo buộc phải đi vòng xuyến'),
('End of no passing', 'Bien hieu lenh', 'Meta\\41.png', 'Biển báo kết thúc cấm vượt'),
('End no passing veh > 3.5 tons', 'Bien phu', 'Meta\\42.png', 'Biển báo kết thúc cấm vượt xe trọng tải trên 3.5 tấn');


INSERT INTO MoHinh246 (ten, duongdan, dochinhxac) 
VALUES 
('Nhan dien bien bao bang hinh anh', 'model1.pth', 89);

INSERT INTO LichSuNhanDang246 (ngayNhanDang, id_khachhang, id_bienbao, id_mohinh) 
VALUES 
('2023-01-15', 1, 1, 1),
('2023-02-20', 1, 2, 1),
('2023-03-25', 3, 3, 1),
('2023-04-24', 4, 4, 1),
('2023-05-30', 4, 5, 1);