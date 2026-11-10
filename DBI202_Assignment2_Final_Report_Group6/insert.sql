/*
Du lieu mau: moi bang co toi thieu 10 ban ghi. SoLuongTon trong NguyenLieu la ton dau ky; phieu nhap mau la lich su tham khao truoc khi bat dau theo doi trigger.
Chay sau createDB.sql va constraints.sql.
*/
USE QuanLyMixue_Project;
GO

INSERT INTO dbo.DanhMuc (MaDM, TenDM, MoTa) VALUES
('DM01',N'Kem',N'Cac san pham kem'),
('DM02',N'Tra sua',N'Cac loai tra sua'),
('DM03',N'Tra hoa qua',N'Tra va do uong trai cay'),
('DM04',N'Hong tra',N'Cac loai hong tra'),
('DM05',N'Do uong dac biet',N'Do uong dac biet'),
('DM06',N'Topping',N'Topping them vao do uong'),
('DM07',N'Sundae',N'Kem Sundae'),
('DM08',N'Tra chanh',N'Do uong vi chanh'),
('DM09',N'Tra mat ong',N'Do uong mat ong'),
('DM10',N'San pham theo mua',N'San pham gia lap theo mua');
GO
INSERT INTO dbo.SanPham (MaSP,TenSP,MaDM,GiaBan,TrangThai) VALUES
('SP01',N'Kem oc que','DM01',10000,N'Dang ban'),
('SP02',N'Super Sundae Socola','DM07',25000,N'Dang ban'),
('SP03',N'Super Sundae Dau Tay','DM07',25000,N'Dang ban'),
('SP04',N'Tra sua tran chau','DM02',25000,N'Dang ban'),
('SP05',N'Tra sua thach dua','DM02',25000,N'Dang ban'),
('SP06',N'Tra sua Ba Vuong','DM05',30000,N'Dang ban'),
('SP07',N'Nuoc chanh tuoi lanh','DM08',15000,N'Dang ban'),
('SP08',N'Tra dao bon mua','DM03',25000,N'Dang ban'),
('SP09',N'Hong tra mat ong','DM09',20000,N'Dang ban'),
('SP10',N'Duong Chi Cam Lo','DM05',35000,N'Dang ban');
GO
INSERT INTO dbo.KhachHang (MaKH,TenKH,SDT,NgayDangKy) VALUES
('KH01',N'Nguyen Van An','0901234567','2026-10-01'),
('KH02',N'Tran Thi Binh','0912345678','2026-10-02'),
('KH03',N'Le Minh Anh','0923456789','2026-10-03'),
('KH04',N'Pham Duc Long','0934567890','2026-10-04'),
('KH05',N'Hoang Thu Ha','0945678901','2026-10-05'),
('KH06',N'Vu Tuan Kiet','0956789012','2026-10-06'),
('KH07',N'Do Ngoc Mai','0967890123','2026-10-07'),
('KH08',N'Bui Thanh Tung','0978901234','2026-10-08'),
('KH09',N'Nguyen Thu Trang','0989012345','2026-10-09'),
('KH10',N'Pham Quoc Bao','0990123456','2026-10-10');
GO
INSERT INTO dbo.NhanVien (MaNV,TenNV,SDT,ChucVu,Luong) VALUES
('NV01',N'Nguyen Minh Duc','0881111111',N'Quan ly',9000000),
('NV02',N'Tran Thu Trang','0882222222',N'Thu ngan',6500000),
('NV03',N'Le Quang Huy','0883333333',N'Pha che',6000000),
('NV04',N'Pham Ngoc Linh','0884444444',N'Thu ngan',6500000),
('NV05',N'Hoang Anh Tuan','0885555555',N'Pha che',6000000),
('NV06',N'Bui Khanh Vy','0886666666',N'Nhan vien',5800000),
('NV07',N'Do Duc Manh','0887777777',N'Nhan vien',5800000),
('NV08',N'Vu Hai Yen','0888888888',N'Thu ngan',6500000),
('NV09',N'Nguyen Bao Chau','0889999999',N'Pha che',6000000),
('NV10',N'Tran Gia Bao','0871111111',N'Nhan vien',5800000);
GO
INSERT INTO dbo.NguyenLieu (MaNL,TenNL,DonVi,SoLuongTon,MucTonToiThieu) VALUES
('NL01',N'Bot tra',N'kg',10,2),
('NL02',N'Sua',N'lit',20,5),
('NL03',N'Duong',N'kg',15,3),
('NL04',N'Tran chau',N'kg',8,2),
('NL05',N'Thach dua',N'kg',6,2),
('NL06',N'Chanh',N'kg',10,2),
('NL07',N'Dao',N'kg',8,2),
('NL08',N'Mat ong',N'lit',5,1),
('NL09',N'Kem',N'lit',15,3),
('NL10',N'Coc nhua',N'cai',500,100);
GO
INSERT INTO dbo.DonHang (MaDon,MaKH,MaNV,NgayDat,LoaiDon,TrangThai) VALUES
('DH01','KH01','NV02','2026-10-13T09:00:00',N'Tai quay',N'Hoan thanh'),
('DH02','KH02','NV04','2026-10-13T09:15:00',N'Mang di',N'Hoan thanh'),
('DH03','KH03','NV03','2026-10-13T10:00:00',N'Tai quay',N'Hoan thanh'),
('DH04','KH01','NV05','2026-10-13T10:30:00',N'Giao hang',N'Da thanh toan'),
('DH05','KH04','NV02','2026-10-13T11:00:00',N'Mang di',N'Hoan thanh'),
('DH06','KH05','NV08','2026-10-13T11:30:00',N'Tai quay',N'Hoan thanh'),
('DH07','KH06','NV06','2026-10-13T12:00:00',N'Mang di',N'Da thanh toan'),
('DH08','KH07','NV04','2026-10-13T13:00:00',N'Tai quay',N'Hoan thanh'),
('DH09','KH08','NV09','2026-10-13T14:00:00',N'Giao hang',N'Da thanh toan'),
('DH10','KH09','NV10','2026-10-13T15:00:00',N'Mang di',N'Hoan thanh');
GO
INSERT INTO dbo.ChiTietDonHang (MaDon,MaSP,SoLuong,DonGia) VALUES
('DH01','SP01',2,10000),('DH02','SP02',1,25000),('DH03','SP04',2,25000),
('DH04','SP06',1,30000),('DH05','SP03',2,25000),('DH06','SP07',2,15000),
('DH07','SP08',1,25000),('DH08','SP09',2,20000),('DH09','SP10',1,35000),
('DH10','SP05',2,25000),('DH01','SP07',1,15000),('DH03','SP02',1,25000),('DH05','SP01',1,10000);
GO
INSERT INTO dbo.ThanhToan (MaDon,PhuongThuc,SoTien,NgayTT,TrangThai) VALUES
('DH01',N'Tien mat',35000,'2026-10-13T09:01:00',N'Thanh cong'),
('DH02',N'Vi dien tu',25000,'2026-10-13T09:16:00',N'Thanh cong'),
('DH03',N'Chuyen khoan',75000,'2026-10-13T10:01:00',N'Thanh cong'),
('DH04',N'Chuyen khoan',30000,'2026-10-13T10:31:00',N'Thanh cong'),
('DH05',N'Tien mat',60000,'2026-10-13T11:01:00',N'Thanh cong'),
('DH06',N'Vi dien tu',30000,'2026-10-13T11:31:00',N'Thanh cong'),
('DH07',N'Tien mat',25000,'2026-10-13T12:01:00',N'Thanh cong'),
('DH08',N'Chuyen khoan',40000,'2026-10-13T13:01:00',N'Thanh cong'),
('DH09',N'Vi dien tu',35000,'2026-10-13T14:01:00',N'Thanh cong'),
('DH10',N'Tien mat',50000,'2026-10-13T15:01:00',N'Thanh cong');
GO
INSERT INTO dbo.CongThuc (MaSP,MaNL,DinhLuong) VALUES
('SP04','NL01',0.020),('SP04','NL02',0.150),('SP04','NL04',0.050),
('SP05','NL01',0.020),('SP05','NL02',0.100),('SP05','NL05',0.050),
('SP07','NL06',0.100),('SP08','NL07',0.100),('SP09','NL01',0.020),
('SP09','NL08',0.020);
GO
INSERT INTO dbo.PhieuNhap (MaPN,MaNV,NgayNhap,NhaCungCap) VALUES
('PN01','NV01','2026-10-01T08:00:00',N'Nha cung cap A'),
('PN02','NV02','2026-10-02T08:00:00',N'Nha cung cap B'),
('PN03','NV03','2026-10-03T08:00:00',N'Nha cung cap C'),
('PN04','NV04','2026-10-04T08:00:00',N'Nha cung cap A'),
('PN05','NV05','2026-10-05T08:00:00',N'Nha cung cap B'),
('PN06','NV06','2026-10-06T08:00:00',N'Nha cung cap C'),
('PN07','NV07','2026-10-07T08:00:00',N'Nha cung cap A'),
('PN08','NV08','2026-10-08T08:00:00',N'Nha cung cap B'),
('PN09','NV09','2026-10-09T08:00:00',N'Nha cung cap C'),
('PN10','NV10','2026-10-10T08:00:00',N'Nha cung cap A');
GO
INSERT INTO dbo.ChiTietPhieuNhap (MaPN,MaNL,SoLuongNhap,GiaNhap) VALUES
('PN01','NL01',1,200000),('PN02','NL02',2,30000),('PN03','NL03',3,25000),
('PN04','NL04',1,80000),('PN05','NL05',2,60000),('PN06','NL06',1,35000),
('PN07','NL07',2,70000),('PN08','NL08',1,90000),('PN09','NL09',2,50000),
('PN10','NL10',100,1000);
GO

-- Kiem tra so ban ghi; moi bang phai co >= 10 dong.
SELECT N'DanhMuc' AS TenBang, COUNT(*) AS SoBanGhi FROM dbo.DanhMuc
UNION ALL SELECT N'SanPham',COUNT(*) FROM dbo.SanPham
UNION ALL SELECT N'KhachHang',COUNT(*) FROM dbo.KhachHang
UNION ALL SELECT N'NhanVien',COUNT(*) FROM dbo.NhanVien
UNION ALL SELECT N'DonHang',COUNT(*) FROM dbo.DonHang
UNION ALL SELECT N'ChiTietDonHang',COUNT(*) FROM dbo.ChiTietDonHang
UNION ALL SELECT N'ThanhToan',COUNT(*) FROM dbo.ThanhToan
UNION ALL SELECT N'NguyenLieu',COUNT(*) FROM dbo.NguyenLieu
UNION ALL SELECT N'CongThuc',COUNT(*) FROM dbo.CongThuc
UNION ALL SELECT N'PhieuNhap',COUNT(*) FROM dbo.PhieuNhap
UNION ALL SELECT N'ChiTietPhieuNhap',COUNT(*) FROM dbo.ChiTietPhieuNhap;
GO
