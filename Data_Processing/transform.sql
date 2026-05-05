
create database BAOHIEM

-----------------------------------------------
--DIM_KHACH_HANG
select * from KhachHang
SELECT 
    kh.MA_KH, 
    kh.TUOI, 
    dt.NHOM_TUOI, 
    kh.GIOI_TINH, 
    kh.NGHENGHIEP AS TEN_NGHENGHIEP, 
    kh.XHKH, 
    xh.NHOMHANG_KH
INTO DIM_KHACH_HANG
FROM [dbo].[KhachHang] kh
LEFT JOIN DoTuoi dt ON kh.TUOI = dt.TUOI
left join [dbo].[XepHangKH] xh on kh.XHKH = xh.XHKH;

--gán khóa
ALTER TABLE DIM_KHACH_HANG
ADD CONSTRAINT PK_DIM_KHACH_HANG PRIMARY KEY (MA_KH);

select * from DIM_KHACH_HANG

--------------------------------------------------------------------------------------------
--DIM_SAN_PHAM
IF OBJECT_ID('Dim_SanPham', 'U') IS NOT NULL DROP TABLE Dim_SanPham;

SELECT 
    gsp.MA_GOISANPHAM AS MA_GSP, 
    gsp.TENGOISANPHAM AS TEN_GSP, 
    gsp.MA_NHOMSANPHAM AS MA_NHOMSP, 
    nsp.NHOMSANPHAM AS TEN_NHOMSP, 
    bh.MA_BH,
    bh.TENBH AS LOAI_BH
  
INTO DIM_SAN_PHAM
FROM [dbo].[GoiSanPham] gsp
LEFT JOIN [dbo].[NhomSanPham] nsp ON gsp.MA_NHOMSANPHAM = nsp.MA_NHOMSANPHAM
LEFT JOIN BaoHiem bh ON nsp.MABH = bh.MA_BH;

ALTER TABLE DIM_SAN_PHAM ADD CONSTRAINT PK_DIM_SAN_PHAM PRIMARY KEY (MA_GSP);

select * from DIM_SAN_PHAM
--------------------------------------------------------------------------------------------
--DIM_NHAN_VIEN
IF OBJECT_ID('Dim_ToChuc_NhanVien', 'U') IS NOT NULL DROP TABLE Dim_ToChuc_NhanVien;

SELECT 
    mnv.MA_NV, 
    mnv.MA_GOCNV,
    nv.HO_TEN AS TEN_NV,
    nv.TUOI AS TUOI_NV,
    nv.SDT,
    pb.MA_PB,
    pb.TEN_PHONGBAN,
    cn.MA_CN,
    cn.TEN_CN,
    ct.MA_CONGTY,
    ct.TEN_CONGTY
INTO DIM_NHAN_VIEN
FROM [dbo].[MaNhanVien] mnv
LEFT JOIN [dbo].[NhanVien] nv ON mnv.MA_GOCNV = nv.MA_GOCNV
left join [dbo].[PhongBan] pb on mnv.MA_PB = pb.MA_PB
left join [dbo].[ChiNhanh] cn on mnv.MA_CN=cn.MA_CN
left join [dbo].[CongTy] ct on mnv.MA_CONGTY=ct.MA_CONGTY
ALTER TABLE DIM_NHAN_VIEN ADD CONSTRAINT PK_DIM_NHAN_VIEN PRIMARY KEY (MA_NV);
--------------------------------------------------------------------------------------------
--DIM_KENH_PHAN_PHOI
IF OBJECT_ID('Dim_KenhPhanPhoi', 'U') IS NOT NULL DROP TABLE Dim_KenhPhanPhoi;

SELECT 
    kbct.MA_KENHBANCHITIET,
    kbct.TENKENHBANCHITIET,
    kb.MA_KENHBAN,
    kb.TENKENHBAN
INTO DIM_KENH_PHAN_PHOI
FROM KenhBanCT kbct
LEFT JOIN KenhBan kb ON kbct.MA_KENHBAN = kb.MA_KENHBAN;

ALTER TABLE DIM_KENH_PHAN_PHOI ADD CONSTRAINT PK_DIM_KENH_PHAN_PHOI PRIMARY KEY (MA_KENHBANCHITIET);

select * from DIM_KENH_PHAN_PHOI
----------------------------------------------------------------------------------------------
--DIM_XE_XO_GIOI
IF OBJECT_ID('Dim_XeCoGioi', 'U') IS NOT NULL DROP TABLE Dim_XeCoGioi;

SELECT 
    ttx.MA_HD,
    ttx.BIEN_SO_XE,
    xcg.TEN_DONG_XE,
    xcg.NAM_SX,
    xcg.GIA_TIEN AS GIA_TIEN_XE,
    xcg.TRONG_TAI_XE,
    hx.TEN_HANG_XE,
    lx.TEN_LOAI_XE,
    ttdk.TEN_DANH_MUC_LOAI_XE
INTO DIM_XE_XO_GIOI
FROM ThongTinXe ttx
LEFT JOIN XeCoGioi xcg ON ttx.MA_DONG_XE = xcg.MA_DONG_XE
LEFT JOIN HangXe hx ON xcg.MA_HANG_XE = hx.MA_HANG_XE
LEFT JOIN LoaiXe lx ON ttx.MA_LOAIXE = lx.MA_LOAI_XE
LEFT JOIN TrangThai ttdk ON lx.MA_DANH_MUC_LOAI_XE = ttdk.MA_DANH_MUC_LOAI_XE;

ALTER TABLE DIM_XE_XO_GIOI ADD CONSTRAINT PK_DIM_XE_XO_GIOI PRIMARY KEY (MA_HD);
----------------------------------------------------------------------------------

--DIM_DATE
IF OBJECT_ID('DIM_DATE', 'U') IS NOT NULL DROP TABLE DIM_DATE;
GO
DECLARE @StartDate DATE = '2023-01-01';
DECLARE @EndDate DATE = '2026-12-31';

WITH DateCTE AS (
    SELECT @StartDate AS [DATE]
    UNION ALL
    SELECT DATEADD(day, 1, [DATE])
    FROM DateCTE
    WHERE [DATE] < @EndDate
)
SELECT 
    [DATE],
    YEAR([DATE]) AS [YEAR],
    DATEPART(QUARTER, [DATE]) AS [QUARTER],
    MONTH([DATE]) AS [MONTH],
    FORMAT([DATE], 'yyyy-MM') AS [YEAR_MONTH]
INTO DIM_DATE
FROM DateCTE
OPTION (MAXRECURSION 0); -- Cần thiết để vòng lặp vượt qua 100 lần
GO
select * from DIM_DATE

--drop table DIM_DATE
--------------------------------------------------------------------------------------------
--FACT_DON_HANG
IF OBJECT_ID('FACT_DON_HANG', 'U') IS NOT NULL DROP TABLE FACT_DON_HANG;
SELECT 
    dh.MA_DON, 
    dh.MA_HD,
    LOAI_HD,
    CAST(dh.NGAY_KY_HD AS DATE) AS NGAY_KY_HD, 
    CAST(dh.NGAY_HIEU_LUC AS DATE) AS NGAY_HIEU_LUC,  
    CAST(dh.NGAY_HET_HAN AS DATE) AS NGAY_HET_HAN,    
    dh.MA_KH, 
    dh.MA_NV, 
    dh.MA_KENHBANCHITIET,
    dh.MA_GSP, 
    GIA_BH,
    GIA_TIEN,
    PHIBH,
    CTY,
    dh.THOI_HAN_THANG
INTO FACT_DON_HANG
FROM [dbo].[Đơn Hàng] dh
ALTER TABLE FACT_DON_HANG ADD CONSTRAINT PK_FACT_DON_HANG PRIMARY KEY (MA_DON);
--------------------------------------------------------------------------------------------
--FACT_KPI
SELECT 
    -- Tạo ID_KPI duy nhất bằng cách kết hợp các mã và thời gian
    CONCAT(k.MA_KENHBAN, '_', k.MA_PB, '_', k.MA_GOISANPHAM, '_', k.NAM, k.THANG) AS ID_KPI,
    -- Chuyển đổi Thắng/Năm sang định dạng Date (Ngày đầu tháng) để khớp với DIM_DATE
    CAST(CONCAT(k.NAM, '-', k.THANG, '-01') AS DATE) AS THANGNAM,
    k.MA_KENHBAN,
    k.MA_PB,
    k.MA_GOISANPHAM AS MA_GSP,
    k.SLHD,
    k.DOANH_THU
INTO FACT_KPI
FROM KPI k
-- Join với các bảng Dimension để đảm bảo mã tồn tại (Inner Join)
INNER JOIN [PhongBan] pb ON k.MA_PB = pb.MA_PB
INNER JOIN [dbo].[DIM_SAN_PHAM] sp ON k.MA_GOISANPHAM = sp.MA_GSP
INNER JOIN KenhBan kban ON k.MA_KENHBAN = kban.MA_KENHBAN

--drop table FACT_KPI
--------------------------------------------------------------------------------------------
--DIM_DATE
IF OBJECT_ID('DIM_DATE', 'U') IS NOT NULL DROP TABLE DIM_DATE;

-- Dùng CTE đệ quy để tự sinh ngày
WITH DateCTE AS (
    SELECT CAST('2023-01-01' AS DATE) AS DateKey
    UNION ALL
    SELECT DATEADD(DAY, 1, DateKey)
    FROM DateCTE
    WHERE DATEADD(DAY, 1, DateKey) <= '2027-12-31'
)
SELECT 
    DateKey,
    YEAR(DateKey) AS [Year],
    'Q' + CAST(DATEPART(QUARTER, DateKey) AS VARCHAR(1)) AS [Quarter],
    MONTH(DateKey) AS [Month],
    FORMAT(DateKey, 'yyyyMM') AS [Month_Year] -- Định dạng này nối hoàn hảo với Fact_KPI
INTO DIM_DATE
FROM DateCTE
OPTION (MAXRECURSION 0); -- Cho phép vòng lặp chạy vô hạn để quét hết số ngày
select * from DIM_DATE
------------------------------------
select * from DIM_KHACH_HANG
select * from DIM_SAN_PHAM
select * from DIM_NHAN_VIEN
select * from DIM_XE_XO_GIOI
select * from DIM_KENH_PHAN_PHOI
select * from DIM_DATE
select * from FACT_DON_HANG
select * from FACT_KPI

