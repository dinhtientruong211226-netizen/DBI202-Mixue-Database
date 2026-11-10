/*
Function tinh tong tien mot don hang tu chi tiet don hang.
*/
USE QuanLyMixue_Project;
GO
CREATE OR ALTER FUNCTION dbo.fn_TinhTongTien (@MaDon VARCHAR(10))
RETURNS DECIMAL(18,2)
AS
BEGIN
    DECLARE @Tong DECIMAL(18,2);
    SELECT @Tong = ISNULL(SUM(ThanhTien), 0)
    FROM dbo.ChiTietDonHang
    WHERE MaDon = @MaDon;
    RETURN @Tong;
END;
GO

-- Kiem thu function
SELECT dbo.fn_TinhTongTien('DH01') AS TongTien_DH01;
GO
