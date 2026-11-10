/*
Trigger 1: cap nhat TongTien cua don hang khi chi tiet thay doi.
Trigger 2: cap nhat ton kho theo chenh lech INSERT/UPDATE/DELETE chi tiet phieu nhap.
Ton kho trong insert.sql la ton dau ky; trigger chi ap dung voi cac thay doi chi tiet phieu nhap sau khi trigger duoc tao.
*/
USE QuanLyMixue_Project;
GO

CREATE OR ALTER TRIGGER dbo.TR_CapNhatTongTien
ON dbo.ChiTietDonHang
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON;

    ;WITH DonBiAnhHuong AS (
        SELECT MaDon FROM inserted
        UNION
        SELECT MaDon FROM deleted
    )
    UPDATE DH
    SET TongTien = ISNULL((
        SELECT SUM(CT.ThanhTien)
        FROM dbo.ChiTietDonHang CT
        WHERE CT.MaDon = DH.MaDon
    ), 0)
    FROM dbo.DonHang DH
    INNER JOIN DonBiAnhHuong A ON A.MaDon = DH.MaDon;
END;
GO

-- Dong bo tong tien cua du lieu mau da co truoc khi tao trigger.
UPDATE DH
SET TongTien = ISNULL((
    SELECT SUM(CT.ThanhTien)
    FROM dbo.ChiTietDonHang CT
    WHERE CT.MaDon = DH.MaDon
), 0)
FROM dbo.DonHang DH;
GO

CREATE OR ALTER TRIGGER dbo.TR_CapNhatTonKhoNhap
ON dbo.ChiTietPhieuNhap
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON;

    ;WITH ThayDoi AS (
        SELECT MaNL, SUM(SoLuongNhap) AS SoLuongThayDoi
        FROM (
            SELECT MaNL, SoLuongNhap FROM inserted
            UNION ALL
            SELECT MaNL, -SoLuongNhap FROM deleted
        ) AS D
        GROUP BY MaNL
    )
    UPDATE NL
    SET SoLuongTon = NL.SoLuongTon + T.SoLuongThayDoi
    FROM dbo.NguyenLieu NL
    INNER JOIN ThayDoi T ON T.MaNL = NL.MaNL
    WHERE T.SoLuongThayDoi <> 0;
END;
GO

-- Kiem thu: xem tong tien da dong bo va ton kho hien tai
SELECT MaDon, TongTien, dbo.fn_TinhTongTien(MaDon) AS TongTienTinhLai
FROM dbo.DonHang
ORDER BY MaDon;
GO
SELECT MaNL, TenNL, SoLuongTon FROM dbo.NguyenLieu ORDER BY MaNL;
GO
