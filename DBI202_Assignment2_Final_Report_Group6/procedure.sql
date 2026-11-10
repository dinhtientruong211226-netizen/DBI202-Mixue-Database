/*
Stored procedure bao cao gia tri don hang da thanh toan/hoan thanh theo ngay dat.
Trong pham vi do an, doanh thu duoc dinh nghia la TongTien cua don co TrangThai Da thanh toan/Hoan thanh; chua xu ly hoan tien/thanh toan mot phan.
*/
USE QuanLyMixue_Project;
GO
CREATE OR ALTER PROCEDURE dbo.sp_BaoCaoDoanhThu
    @TuNgay DATE,
    @DenNgay DATE
AS
BEGIN
    SET NOCOUNT ON;

    IF @TuNgay IS NULL OR @DenNgay IS NULL OR @TuNgay > @DenNgay
        THROW 50001, N'Khoang ngay khong hop le.', 1;

    SELECT CAST(NgayDat AS DATE) AS Ngay,
           COUNT(*) AS SoDon,
           SUM(TongTien) AS DoanhThu
    FROM dbo.DonHang
    WHERE NgayDat >= @TuNgay
      AND NgayDat < DATEADD(DAY, 1, @DenNgay)
      AND TrangThai IN (N'Da thanh toan', N'Hoan thanh')
    GROUP BY CAST(NgayDat AS DATE)
    ORDER BY Ngay;
END;
GO

-- Kiem thu procedure voi ngay co du lieu mau
EXEC dbo.sp_BaoCaoDoanhThu @TuNgay = '2026-10-13', @DenNgay = '2026-10-13';
GO
