/*
DBI202 - Mixue
Chay sau createDB.sql va truoc insert.sql.
Cac rang buoc CHECK, DEFAULT, UNIQUE duoc tao bang ALTER TABLE.
SDT la tuy chon; unique filtered indexes chi ap dung khi SDT khong NULL.
*/
USE QuanLyMixue_Project;
GO

ALTER TABLE dbo.SanPham
ADD CONSTRAINT CK_SanPham_GiaHopLe CHECK (GiaBan > 0);
GO
ALTER TABLE dbo.SanPham
ADD CONSTRAINT CK_SanPham_TrangThaiHopLe CHECK (TrangThai IN (N'Dang ban', N'Ngung ban'));
GO
ALTER TABLE dbo.KhachHang
ADD CONSTRAINT CK_KhachHang_SDTHopLe
CHECK (SDT IS NULL OR (LEN(SDT) BETWEEN 10 AND 15 AND SDT NOT LIKE '%[^0-9]%'));
GO
ALTER TABLE dbo.KhachHang
ADD CONSTRAINT DF_KhachHang_NgayDangKy DEFAULT (CONVERT(date, SYSDATETIME())) FOR NgayDangKy;
GO
ALTER TABLE dbo.NhanVien
ADD CONSTRAINT CK_NhanVien_SDTHopLe
CHECK (SDT IS NULL OR (LEN(SDT) BETWEEN 10 AND 15 AND SDT NOT LIKE '%[^0-9]%'));
GO
ALTER TABLE dbo.NhanVien
ADD CONSTRAINT CK_NhanVien_LuongHopLe CHECK (Luong >= 0);
GO
ALTER TABLE dbo.DonHang
ADD CONSTRAINT DF_DonHang_Ngay DEFAULT (SYSDATETIME()) FOR NgayDat;
GO
ALTER TABLE dbo.DonHang
ADD CONSTRAINT DF_DonHang_Loai DEFAULT (N'Tai quay') FOR LoaiDon;
GO
ALTER TABLE dbo.DonHang
ADD CONSTRAINT CK_DonHang_LoaiHopLe CHECK (LoaiDon IN (N'Tai quay', N'Mang di', N'Giao hang'));
GO
ALTER TABLE dbo.DonHang
ADD CONSTRAINT CK_DonHang_TrangThaiHopLe
CHECK (TrangThai IN (N'Moi tao', N'Da thanh toan', N'Dang lam', N'Hoan thanh', N'Da huy'));
GO
ALTER TABLE dbo.DonHang
ADD CONSTRAINT CK_DonHang_TongTienKhongAm CHECK (TongTien >= 0);
GO
ALTER TABLE dbo.ChiTietDonHang
ADD CONSTRAINT CK_CTDH_SoLuongHopLe CHECK (SoLuong > 0);
GO
ALTER TABLE dbo.ChiTietDonHang
ADD CONSTRAINT CK_CTDH_DonGiaHopLe CHECK (DonGia > 0);
GO
ALTER TABLE dbo.ThanhToan
ADD CONSTRAINT CK_ThanhToan_SoTienHopLe CHECK (SoTien > 0);
GO
ALTER TABLE dbo.ThanhToan
ADD CONSTRAINT CK_ThanhToan_PhuongThucHopLe CHECK (PhuongThuc IN (N'Tien mat', N'Chuyen khoan', N'Vi dien tu'));
GO
ALTER TABLE dbo.ThanhToan
ADD CONSTRAINT CK_ThanhToan_TrangThaiHopLe CHECK (TrangThai IN (N'Thanh cong', N'That bai', N'Hoan tien'));
GO
ALTER TABLE dbo.DanhMuc
ADD CONSTRAINT UQ_DanhMuc_Ten UNIQUE (TenDM);
GO
ALTER TABLE dbo.NguyenLieu
ADD CONSTRAINT UQ_NguyenLieu_Ten UNIQUE (TenNL);
GO
ALTER TABLE dbo.NguyenLieu
ADD CONSTRAINT CK_NguyenLieu_TonHopLe CHECK (SoLuongTon >= 0 AND MucTonToiThieu >= 0);
GO
ALTER TABLE dbo.CongThuc
ADD CONSTRAINT CK_CongThuc_DinhLuongHopLe CHECK (DinhLuong > 0);
GO
ALTER TABLE dbo.ChiTietPhieuNhap
ADD CONSTRAINT CK_CTPN_SoLuongHopLe CHECK (SoLuongNhap > 0);
GO
ALTER TABLE dbo.ChiTietPhieuNhap
ADD CONSTRAINT CK_CTPN_GiaNhapHopLe CHECK (GiaNhap > 0);
GO

CREATE UNIQUE INDEX UX_KhachHang_SDT_NotNull
ON dbo.KhachHang(SDT) WHERE SDT IS NOT NULL;
GO
CREATE UNIQUE INDEX UX_NhanVien_SDT_NotNull
ON dbo.NhanVien(SDT) WHERE SDT IS NOT NULL;
GO
PRINT N'Da tao CHECK, DEFAULT, UNIQUE va unique filtered index cho SDT khong NULL.';
GO
