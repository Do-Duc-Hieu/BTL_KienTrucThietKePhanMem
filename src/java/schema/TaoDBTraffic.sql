CREATE database traffic;
use traffic;
CREATE TABLE ThanhVien246 (
    id INT auto_increment PRIMARY KEY,
    ten VARCHAR(255),
    taiKhoan VARCHAR(255),
    matKhau VARCHAR(255),
    ngaySinh DATE,
    diaChi VARCHAR(255),
    sdt VARCHAR(15),
    email VARCHAR(255),
    viTri VARCHAR(255)
);

CREATE TABLE KhachHang246 (
    id INT PRIMARY KEY,
    -- Thêm các trường riêng cho KhachHang246 nếu có
    FOREIGN KEY (id) REFERENCES ThanhVien246(id)
);

CREATE TABLE QuanLi246 (
    id INT PRIMARY KEY,
    FOREIGN KEY (id) REFERENCES ThanhVien246(id)
);

CREATE TABLE BienBao246 (
    id INT auto_increment PRIMARY KEY,
    ten VARCHAR(255),
    theloai VARCHAR(255),
    hinhanh VARCHAR(255),
    moTa varchar(10000)
);

create table MoHinh246(
    id INT auto_increment PRIMARY KEY,
    ten VARCHAR(255),
    duongdan varchar(255),
    dochinhxac int
);

create table LichSuNhanDang246(
    id int auto_increment PRIMARY KEY,
    ngayNhanDang Date,
    id_khachhang int,
    id_bienbao int,
    id_mohinh int,
    foreign key (id_khachhang) references KhachHang246(id),
    foreign key (id_bienbao) references BienBao246(id),
    foreign key (id_mohinh) references MoHinh246(id)
);