/*
DBI202 - Quan ly cua hang Mixue
SQL Server / SSMS.
Chay mot lan tren database moi. Database rieng QuanLyMixue_Project de tranh ghi de database khac.
SoLuongTon la ton dau ky tai thoi diem bat dau theo doi; trigger chi cap nhat cac phieu nhap phat sinh sau khi trigger duoc tao.
*/
IF DB_ID(N'QuanLyMixue_Project') IS NULL
    CREATE DATABASE QuanLyMixue_Project;
GO
USE QuanLyMixue_Project;
GO

CREATE TABLE dbo.DanhMuc (
    MaDM VARCHAR(10) NOT NULL CONSTRAINT PK_DanhMuc PRIMARY KEY,
    TenDM NVARCHAR(100) NOT NULL,
    MoTa NVARCHAR(255) NULL
);
GO
CREATE TABLE dbo.SanPham (
    MaSP VARCHAR(10) NOT NULL CONSTRAINT PK_SanPham PRIMARY KEY,
    TenSP NVARCHAR(150) NOT NULL,
    MaDM VARCHAR(10) NOT NULL,
    GiaBan DECIMAL(12,2) NOT NULL,
    TrangThai NVARCHAR(20) NOT NULL,
    CONSTRAINT FK_SanPham_DanhMuc FOREIGN KEY (MaDM) REFERENCES dbo.DanhMuc(MaDM)
);
GO
CREATE TABLE dbo.KhachHang (
    MaKH VARCHAR(10) NOT NULL CONSTRAINT PK_KhachHang PRIMARY KEY,
    TenKH NVARCHAR(100) NOT NULL,
    SDT VARCHAR(15) NULL,
    NgayDangKy DATE NOT NULL
);
GO
CREATE TABLE dbo.NhanVien (
    MaNV VARCHAR(10) NOT NULL CONSTRAINT PK_NhanVien PRIMARY KEY,
    TenNV NVARCHAR(100) NOT NULL,
    SDT VARCHAR(15) NULL,
    ChucVu NVARCHAR(50) NOT NULL,
    Luong DECIMAL(12,2) NOT NULL
);
GO
CREATE TABLE dbo.DonHang (
    MaDon VARCHAR(10) NOT NULL CONSTRAINT PK_DonHang PRIMARY KEY,
    MaKH VARCHAR(10) NULL,
    MaNV VARCHAR(10) NOT NULL,
    NgayDat DATETIME2 NOT NULL,
    LoaiDon NVARCHAR(20) NOT NULL,
    TrangThai NVARCHAR(20) NOT NULL,
    TongTien DECIMAL(12,2) NOT NULL CONSTRAINT DF_DonHang_TongTien DEFAULT (0),
    CONSTRAINT FK_DonHang_KhachHang FOREIGN KEY (MaKH) REFERENCES dbo.KhachHang(MaKH),
    CONSTRAINT FK_DonHang_NhanVien FOREIGN KEY (MaNV) REFERENCES dbo.NhanVien(MaNV)
);
GO
CREATE TABLE dbo.ChiTietDonHang (
    MaDon VARCHAR(10) NOT NULL,
    MaSP VARCHAR(10) NOT NULL,
    SoLuong INT NOT NULL,
    DonGia DECIMAL(12,2) NOT NULL,
    ThanhTien AS (SoLuong * DonGia) PERSISTED,
    CONSTRAINT PK_ChiTietDonHang PRIMARY KEY (MaDon, MaSP),
    CONSTRAINT FK_CTDH_DonHang FOREIGN KEY (MaDon) REFERENCES dbo.DonHang(MaDon),
    CONSTRAINT FK_CTDH_SanPham FOREIGN KEY (MaSP) REFERENCES dbo.SanPham(MaSP)
);
GO
CREATE TABLE dbo.ThanhToan (
    MaTT INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_ThanhToan PRIMARY KEY,
    MaDon VARCHAR(10) NOT NULL,
    PhuongThuc NVARCHAR(30) NOT NULL,
    SoTien DECIMAL(12,2) NOT NULL,
    NgayTT DATETIME2 NOT NULL,
    TrangThai NVARCHAR(20) NOT NULL,
    CONSTRAINT FK_ThanhToan_DonHang FOREIGN KEY (MaDon) REFERENCES dbo.DonHang(MaDon)
);
GO
CREATE TABLE dbo.NguyenLieu (
    MaNL VARCHAR(10) NOT NULL CONSTRAINT PK_NguyenLieu PRIMARY KEY,
    TenNL NVARCHAR(100) NOT NULL,
    DonVi NVARCHAR(20) NOT NULL,
    SoLuongTon DECIMAL(12,3) NOT NULL,
    MucTonToiThieu DECIMAL(12,3) NOT NULL
);
GO
CREATE TABLE dbo.CongThuc (
    MaSP VARCHAR(10) NOT NULL,
    MaNL VARCHAR(10) NOT NULL,
    DinhLuong DECIMAL(12,3) NOT NULL,
    CONSTRAINT PK_CongThuc PRIMARY KEY (MaSP, MaNL),
    CONSTRAINT FK_CongThuc_SanPham FOREIGN KEY (MaSP) REFERENCES dbo.SanPham(MaSP),
    CONSTRAINT FK_CongThuc_NguyenLieu FOREIGN KEY (MaNL) REFERENCES dbo.NguyenLieu(MaNL)
);
GO
CREATE TABLE dbo.PhieuNhap (
    MaPN VARCHAR(10) NOT NULL CONSTRAINT PK_PhieuNhap PRIMARY KEY,
    MaNV VARCHAR(10) NOT NULL,
    NgayNhap DATETIME2 NOT NULL,
    NhaCungCap NVARCHAR(150) NOT NULL,
    CONSTRAINT FK_PhieuNhap_NhanVien FOREIGN KEY (MaNV) REFERENCES dbo.NhanVien(MaNV)
);
GO
CREATE TABLE dbo.ChiTietPhieuNhap (
    MaPN VARCHAR(10) NOT NULL,
    MaNL VARCHAR(10) NOT NULL,
    SoLuongNhap DECIMAL(12,3) NOT NULL,
    GiaNhap DECIMAL(12,2) NOT NULL,
    ThanhTien AS (SoLuongNhap * GiaNhap) PERSISTED,
    CONSTRAINT PK_ChiTietPhieuNhap PRIMARY KEY (MaPN, MaNL),
    CONSTRAINT FK_CTPN_PhieuNhap FOREIGN KEY (MaPN) REFERENCES dbo.PhieuNhap(MaPN),
    CONSTRAINT FK_CTPN_NguyenLieu FOREIGN KEY (MaNL) REFERENCES dbo.NguyenLieu(MaNL)
);
GO
PRINT N'Da tao database va 11 bang. Tiep tuc chay constraints.sql, insert.sql, function.sql, trigger.sql, procedure.sql va queries.sql theo README.';
GO
