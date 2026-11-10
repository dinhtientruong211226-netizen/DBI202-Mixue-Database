/*
10 truy van theo 5 nhom bat buoc trong Assignment DBI202. Doanh thu trong cac truy van duoc hieu la gia tri don da thanh toan/hoan thanh.
Chay sau khi da chay createDB.sql, constraints.sql va insert.sql.
*/
USE QuanLyMixue_Project;
GO

-- Q1 - INNER JOIN: Don hang, nhan vien lap don
SELECT DH.MaDon, DH.NgayDat, NV.TenNV, DH.TrangThai, DH.TongTien
FROM dbo.DonHang DH
INNER JOIN dbo.NhanVien NV ON NV.MaNV = DH.MaNV
ORDER BY DH.NgayDat, DH.MaDon;
GO

-- Q2 - INNER JOIN: Chi tiet san pham trong don hang
SELECT DH.MaDon, SP.TenSP, CT.SoLuong, CT.DonGia, CT.ThanhTien
FROM dbo.DonHang DH
INNER JOIN dbo.ChiTietDonHang CT ON CT.MaDon = DH.MaDon
INNER JOIN dbo.SanPham SP ON SP.MaSP = CT.MaSP
ORDER BY DH.MaDon;
GO

-- Q3 - OUTER JOIN: Tat ca danh muc, ke ca danh muc chua co san pham
SELECT DM.MaDM, DM.TenDM, COUNT(SP.MaSP) AS SoSanPham
FROM dbo.DanhMuc DM
LEFT JOIN dbo.SanPham SP ON SP.MaDM = DM.MaDM
GROUP BY DM.MaDM, DM.TenDM
ORDER BY SoSanPham DESC, DM.MaDM;
GO

-- Q4 - OUTER JOIN: Tat ca khach hang, ke ca khach chua dat don
SELECT KH.MaKH, KH.TenKH, COUNT(DH.MaDon) AS SoDon
FROM dbo.KhachHang KH
LEFT JOIN dbo.DonHang DH ON DH.MaKH = KH.MaKH
GROUP BY KH.MaKH, KH.TenKH
ORDER BY KH.MaKH;
GO

-- Q5 - Subquery trong WHERE: san pham co gia cao hon gia trung binh
SELECT MaSP, TenSP, GiaBan
FROM dbo.SanPham
WHERE GiaBan > (SELECT AVG(GiaBan) FROM dbo.SanPham)
ORDER BY GiaBan DESC;
GO

-- Q6 - Subquery trong WHERE: don hang co tong tien cao hon muc trung binh
SELECT MaDon, TongTien, TrangThai
FROM dbo.DonHang
WHERE TongTien > (SELECT AVG(TongTien) FROM dbo.DonHang)
ORDER BY TongTien DESC;
GO

-- Q7 - Subquery trong FROM: gia tri don hang da thanh toan/hoan thanh theo nhan vien
SELECT X.MaNV, X.TenNV, X.SoDon, X.DoanhThu
FROM (
    SELECT NV.MaNV, NV.TenNV, COUNT(DH.MaDon) AS SoDon,
           ISNULL(SUM(DH.TongTien), 0) AS DoanhThu
    FROM dbo.NhanVien NV
    LEFT JOIN dbo.DonHang DH ON DH.MaNV = NV.MaNV
        AND DH.TrangThai IN (N'Da thanh toan', N'Hoan thanh')
    GROUP BY NV.MaNV, NV.TenNV
) AS X
ORDER BY X.DoanhThu DESC, X.MaNV;
GO

-- Q8 - Subquery trong FROM: tong so luong san pham trong don da thanh toan/hoan thanh
SELECT SP.MaSP, SP.TenSP, ISNULL(X.TongSoLuong, 0) AS TongSoLuong
FROM dbo.SanPham SP
LEFT JOIN (
    SELECT CT.MaSP, SUM(CT.SoLuong) AS TongSoLuong
    FROM dbo.ChiTietDonHang CT
    INNER JOIN dbo.DonHang DH ON DH.MaDon = CT.MaDon
    WHERE DH.TrangThai IN (N'Da thanh toan', N'Hoan thanh')
    GROUP BY CT.MaSP
) AS X ON X.MaSP = SP.MaSP
ORDER BY TongSoLuong DESC, SP.MaSP;
GO

-- Q9 - GROUP BY va aggregate: so don, gia tri don theo nhan vien
SELECT NV.MaNV, NV.TenNV, COUNT(DH.MaDon) AS SoDon,
       SUM(DH.TongTien) AS TongDoanhThu, AVG(DH.TongTien) AS TrungBinhDon
FROM dbo.NhanVien NV
INNER JOIN dbo.DonHang DH ON DH.MaNV = NV.MaNV
WHERE DH.TrangThai IN (N'Da thanh toan', N'Hoan thanh')
GROUP BY NV.MaNV, NV.TenNV
ORDER BY TongDoanhThu DESC, NV.MaNV;
GO

-- Q10 - GROUP BY va aggregate: thong ke san pham theo danh muc
SELECT DM.MaDM, DM.TenDM, COUNT(SP.MaSP) AS SoSanPham,
       AVG(SP.GiaBan) AS GiaTrungBinh, MAX(SP.GiaBan) AS GiaCaoNhat
FROM dbo.DanhMuc DM
LEFT JOIN dbo.SanPham SP ON SP.MaDM = DM.MaDM
GROUP BY DM.MaDM, DM.TenDM
ORDER BY SoSanPham DESC, DM.MaDM;
GO
