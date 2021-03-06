USE [QLDienMay]
GO
/****** Object:  DatabaseRole [MSmerge_2D26872E89084CBD8056D59193EFCFEF]    Script Date: 11/8/2021 7:27:21 PM ******/
CREATE ROLE [MSmerge_2D26872E89084CBD8056D59193EFCFEF]
GO
/****** Object:  DatabaseRole [MSmerge_AFD669B7B09141CA948BF805BDFB71DA]    Script Date: 11/8/2021 7:27:21 PM ******/
CREATE ROLE [MSmerge_AFD669B7B09141CA948BF805BDFB71DA]
GO
/****** Object:  DatabaseRole [MSmerge_PAL_role]    Script Date: 11/8/2021 7:27:21 PM ******/
CREATE ROLE [MSmerge_PAL_role]
GO
ALTER ROLE [MSmerge_PAL_role] ADD MEMBER [MSmerge_2D26872E89084CBD8056D59193EFCFEF]
GO
ALTER ROLE [MSmerge_PAL_role] ADD MEMBER [MSmerge_AFD669B7B09141CA948BF805BDFB71DA]
GO
/****** Object:  Schema [MSmerge_PAL_role]    Script Date: 11/8/2021 7:27:21 PM ******/
CREATE SCHEMA [MSmerge_PAL_role]
GO
/****** Object:  Table [dbo].[ChiTietDonHang]    Script Date: 11/8/2021 7:27:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietDonHang](
	[MaDonHang] [char](10) NOT NULL,
	[MaSanPham] [char](10) NOT NULL,
	[SoLuong] [int] NULL,
	[DonGia] [decimal](18, 2) NULL,
	[ThanhTien] [decimal](18, 2) NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_ChiTietDonHang] PRIMARY KEY CLUSTERED 
(
	[MaDonHang] ASC,
	[MaSanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietKho]    Script Date: 11/8/2021 7:27:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietKho](
	[MaKho] [char](5) NOT NULL,
	[MaSanPham] [char](10) NOT NULL,
	[SoLuong] [int] NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_ChiTietKho] PRIMARY KEY CLUSTERED 
(
	[MaKho] ASC,
	[MaSanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietLoai]    Script Date: 11/8/2021 7:27:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietLoai](
	[MaSanPham] [char](10) NOT NULL,
	[MaLoai] [char](5) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_ChiTietLoai] PRIMARY KEY CLUSTERED 
(
	[MaSanPham] ASC,
	[MaLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietPhieuNhap]    Script Date: 11/8/2021 7:27:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietPhieuNhap](
	[MaPhieuNhap] [char](10) NOT NULL,
	[MaSanPham] [char](10) NOT NULL,
	[SoLuong] [int] NULL,
	[DonGiaNhap] [decimal](18, 2) NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_ChiTietPhieuNhap] PRIMARY KEY CLUSTERED 
(
	[MaPhieuNhap] ASC,
	[MaSanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietPhieuXuat]    Script Date: 11/8/2021 7:27:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietPhieuXuat](
	[MaPhieuXuat] [char](10) NOT NULL,
	[MaSanPham] [char](10) NOT NULL,
	[SoLuong] [int] NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_ChiTietPhieuXuat] PRIMARY KEY CLUSTERED 
(
	[MaPhieuXuat] ASC,
	[MaSanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChucVu]    Script Date: 11/8/2021 7:27:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChucVu](
	[MaChucVu] [char](5) NOT NULL,
	[TenChucVu] [nvarchar](50) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_ChucVu] PRIMARY KEY CLUSTERED 
(
	[MaChucVu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CuaHang]    Script Date: 11/8/2021 7:27:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CuaHang](
	[MaCuaHang] [char](5) NOT NULL,
	[DiaChi] [nvarchar](100) NULL,
	[CuaHangTruong] [char](10) NULL,
	[NgayThanhLap] [datetime] NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_CuaHang] PRIMARY KEY CLUSTERED 
(
	[MaCuaHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DacDiemNoiBat]    Script Date: 11/8/2021 7:27:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DacDiemNoiBat](
	[MaSanPham] [char](10) NOT NULL,
	[TenDacDiem] [nvarchar](100) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_DacDiemNoiBat] PRIMARY KEY CLUSTERED 
(
	[MaSanPham] ASC,
	[TenDacDiem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DanhMuc]    Script Date: 11/8/2021 7:27:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhMuc](
	[MaDanhMuc] [char](5) NOT NULL,
	[TenDanhMuc] [nvarchar](50) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_DM] PRIMARY KEY CLUSTERED 
(
	[MaDanhMuc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DonHang]    Script Date: 11/8/2021 7:27:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonHang](
	[MaDonHang] [char](10) NOT NULL,
	[NhanVienPhuTrach] [char](10) NULL,
	[MaKhachHang] [char](10) NULL,
	[MaCuaHang] [char](5) NULL,
	[ThoiGianTao] [datetime] NULL,
	[MaVoucher] [char](10) NULL,
	[Loai] [bit] NULL,
	[TinhTrangXacNhan] [bit] NULL,
	[TinhTrangThanhToan] [bit] NULL,
	[TinhTrangGiaoHang] [bit] NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[TongGiaTri] [decimal](18, 2) NULL,
 CONSTRAINT [PK_DonHang] PRIMARY KEY CLUSTERED 
(
	[MaDonHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HangTichDiem]    Script Date: 11/8/2021 7:27:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HangTichDiem](
	[MaHang] [char](5) NOT NULL,
	[TenHang] [nvarchar](20) NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_HangTichDiem] PRIMARY KEY CLUSTERED 
(
	[MaHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 11/8/2021 7:27:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKhachHang] [char](10) NOT NULL,
	[TenKhachHang] [nvarchar](50) NOT NULL,
	[SDT] [char](10) NOT NULL,
	[DiaChi] [nvarchar](100) NOT NULL,
	[Email] [char](50) NOT NULL,
	[TaiKhoan] [char](50) NULL,
	[MatKhau] [char](50) NULL,
	[TrangThai] [bit] NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[MaKhachHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[SDT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[TaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kho]    Script Date: 11/8/2021 7:27:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kho](
	[MaKho] [char](5) NOT NULL,
	[MaCuaHang] [char](5) NOT NULL,
	[DiaChi] [nvarchar](100) NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[TruongKho] [char](10) NULL,
 CONSTRAINT [PK_Kho] PRIMARY KEY CLUSTERED 
(
	[MaKho] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhuyenMai]    Script Date: 11/8/2021 7:27:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhuyenMai](
	[MaKhuyenMai] [char](10) NOT NULL,
	[TenKM] [nvarchar](50) NOT NULL,
	[PhanTramKhuyenMai] [float] NOT NULL,
	[NgayBatDau] [datetime] NOT NULL,
	[NgayKetThuc] [datetime] NOT NULL,
	[MoTa] [nvarchar](50) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_KM] PRIMARY KEY CLUSTERED 
(
	[MaKhuyenMai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Loai]    Script Date: 11/8/2021 7:27:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Loai](
	[MaLoai] [char](5) NOT NULL,
	[TenLoai] [nvarchar](50) NOT NULL,
	[MaDanhMuc] [char](5) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_LOAI] PRIMARY KEY CLUSTERED 
(
	[MaLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhaCungCap]    Script Date: 11/8/2021 7:27:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaCungCap](
	[MaNCC] [char](5) NOT NULL,
	[TenNCC] [nvarchar](50) NOT NULL,
	[MaSoThue] [char](10) NOT NULL,
	[DiaChi] [nvarchar](100) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_NCC] PRIMARY KEY CLUSTERED 
(
	[MaNCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[MaSoThue] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 11/8/2021 7:27:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[MaNhanVien] [char](10) NOT NULL,
	[TenNhanVien] [nvarchar](50) NOT NULL,
	[NgaySinh] [datetime] NOT NULL,
	[SDT] [char](10) NOT NULL,
	[Email] [char](50) NOT NULL,
	[DiaChi] [nvarchar](100) NOT NULL,
	[GioiTinh] [bit] NOT NULL,
	[ChucVu] [char](5) NOT NULL,
	[CuaHang] [char](5) NOT NULL,
	[HinhThuc] [bit] NOT NULL,
	[TaiKhoan] [char](50) NOT NULL,
	[MatKhau] [char](50) NOT NULL,
	[TrangThai] [bit] NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_NhanVien] PRIMARY KEY CLUSTERED 
(
	[MaNhanVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[SDT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[TaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhanHoi]    Script Date: 11/8/2021 7:27:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhanHoi](
	[MaPhanHoi] [char](10) NOT NULL,
	[MaKhachHang] [char](10) NULL,
	[NoiDung] [nvarchar](300) NULL,
	[TrangThai] [bit] NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_PhanHoi] PRIMARY KEY CLUSTERED 
(
	[MaPhanHoi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhieuBaoHanh]    Script Date: 11/8/2021 7:27:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuBaoHanh](
	[MaPhieuBH] [char](10) NOT NULL,
	[MaSanPham] [char](10) NULL,
	[MaKhachHang] [char](10) NULL,
	[MaDonHang] [char](10) NULL,
	[NgayTao] [datetime] NULL,
	[NgayHetHan] [datetime] NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[TrangThai] [bit] NULL,
 CONSTRAINT [PK_PhieuBaoHanh] PRIMARY KEY CLUSTERED 
(
	[MaPhieuBH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhieuNhap]    Script Date: 11/8/2021 7:27:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuNhap](
	[MaPhieuNhap] [char](10) NOT NULL,
	[NhaCungCap] [char](5) NULL,
	[NhanVienTrucKho] [char](10) NULL,
	[MaKho] [char](5) NULL,
	[ThoiGianTao] [datetime] NULL,
	[TongGiaTri] [decimal](18, 2) NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[TrangThai] [bit] NULL,
 CONSTRAINT [PK_PhieuNhap] PRIMARY KEY CLUSTERED 
(
	[MaPhieuNhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhieuXuat]    Script Date: 11/8/2021 7:27:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuXuat](
	[MaPhieuXuat] [char](10) NOT NULL,
	[NhanVienTaoPhieu] [char](10) NULL,
	[NhanVienTruongKho] [char](10) NULL,
	[MaKho] [char](5) NOT NULL,
	[MaDonHang] [char](10) NULL,
	[ThoiGianTao] [datetime] NULL,
	[TongGiaTri] [decimal](18, 2) NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[TrangThai] [bit] NULL,
 CONSTRAINT [PK_PhieuXuat] PRIMARY KEY CLUSTERED 
(
	[MaPhieuXuat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 11/8/2021 7:27:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSanPham] [char](10) NOT NULL,
	[TenSanPham] [nvarchar](100) NOT NULL,
	[MaThuongHieu] [char](5) NOT NULL,
	[AnhMinhHoa] [varchar](100) NULL,
	[DonGia] [decimal](18, 2) NOT NULL,
	[MaKhuyenMai] [char](10) NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_SP] PRIMARY KEY CLUSTERED 
(
	[MaSanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThanhPho]    Script Date: 11/8/2021 7:27:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThanhPho](
	[MaThanhPho] [char](5) NOT NULL,
	[TenThanhPho] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_TP] PRIMARY KEY CLUSTERED 
(
	[MaThanhPho] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TheTichDiem]    Script Date: 11/8/2021 7:27:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TheTichDiem](
	[MaThe] [char](10) NOT NULL,
	[MaKhachHang] [char](10) NULL,
	[Hang] [char](5) NULL,
	[NgayTao] [datetime] NULL,
	[Diem] [int] NULL,
	[TrangThai] [bit] NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_TheTichDiem] PRIMARY KEY CLUSTERED 
(
	[MaThe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThongSoKiThuat]    Script Date: 11/8/2021 7:27:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThongSoKiThuat](
	[MaSanPham] [char](10) NOT NULL,
	[TenThongSo] [nvarchar](50) NOT NULL,
	[MoTa] [nvarchar](100) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_ThongSoKiThuat] PRIMARY KEY CLUSTERED 
(
	[MaSanPham] ASC,
	[TenThongSo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TinhNang]    Script Date: 11/8/2021 7:27:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TinhNang](
	[MaSanPham] [char](10) NOT NULL,
	[TenTinhNang] [nvarchar](100) NOT NULL,
	[MoTa] [nvarchar](400) NOT NULL,
	[HinhAnh] [varchar](100) NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_TinhNang] PRIMARY KEY CLUSTERED 
(
	[MaSanPham] ASC,
	[TenTinhNang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Voucher]    Script Date: 11/8/2021 7:27:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Voucher](
	[MaVoucher] [char](10) NOT NULL,
	[TenVoucher] [nvarchar](50) NOT NULL,
	[PhanTramKhuyenMai] [float] NOT NULL,
	[NgayBatDau] [datetime] NOT NULL,
	[NgayKetThuc] [datetime] NOT NULL,
	[MoTa] [nvarchar](50) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_Voucher] PRIMARY KEY CLUSTERED 
(
	[MaVoucher] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ChiTietDonHang] ADD  CONSTRAINT [MSmerge_df_rowguid_097F4A90A11C4245A6DF217E4375954D]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[ChiTietKho] ADD  CONSTRAINT [MSmerge_df_rowguid_2B437E525A7048BA864AF9300ACBD72B]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[ChiTietLoai] ADD  CONSTRAINT [MSmerge_df_rowguid_2B755B7A39414D9883505DC05D8847F6]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[ChiTietPhieuNhap] ADD  CONSTRAINT [MSmerge_df_rowguid_0D4C0AACFA394C109F44D85CD07AE181]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[ChiTietPhieuXuat] ADD  CONSTRAINT [MSmerge_df_rowguid_2D0B88F0914A4243867A618B46757BCF]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[ChucVu] ADD  CONSTRAINT [MSmerge_df_rowguid_0CC08CB0C56343108E9575A492D4D94E]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[CuaHang] ADD  CONSTRAINT [MSmerge_df_rowguid_22DE676718A741C1A3837A7D562CF8D9]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[DacDiemNoiBat] ADD  CONSTRAINT [MSmerge_df_rowguid_F943E50C1D6945B68EDA8446D1A1531C]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[DanhMuc] ADD  CONSTRAINT [MSmerge_df_rowguid_CAAD18E8DED641A7959F737491C14EB8]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[DonHang] ADD  CONSTRAINT [MSmerge_df_rowguid_3D28B681FEC4438EB4C797A95BEC1260]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[HangTichDiem] ADD  CONSTRAINT [MSmerge_df_rowguid_89366F3D4E334933B51E443998B3FC0D]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[KhachHang] ADD  CONSTRAINT [MSmerge_df_rowguid_C4BCDF599E91480AAD07577AF674811A]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[Kho] ADD  CONSTRAINT [MSmerge_df_rowguid_FD043C545B0C454BAA0DD0E2238D3DE5]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[KhuyenMai] ADD  CONSTRAINT [MSmerge_df_rowguid_E87E53EE8D994E349C192BA79633ED2D]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[Loai] ADD  CONSTRAINT [MSmerge_df_rowguid_416445A63533478DBCFA56E919A8D302]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[NhaCungCap] ADD  CONSTRAINT [MSmerge_df_rowguid_32DB76B014744F05A07DF37797ECC25C]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[NhanVien] ADD  CONSTRAINT [MSmerge_df_rowguid_BCABDFAE70CE40A1890424552F8089DF]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[PhanHoi] ADD  CONSTRAINT [MSmerge_df_rowguid_81847B858CF240BFB05758BCC391573F]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[PhieuBaoHanh] ADD  CONSTRAINT [MSmerge_df_rowguid_087FB9F3013D4295BECFD5A1BACC2CB0]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[PhieuNhap] ADD  DEFAULT ((0)) FOR [TongGiaTri]
GO
ALTER TABLE [dbo].[PhieuNhap] ADD  CONSTRAINT [MSmerge_df_rowguid_57931079A87141F0B7EABFAD0D569A39]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[PhieuXuat] ADD  CONSTRAINT [MSmerge_df_rowguid_AAA1D6C159A14C4CAF19EDB20371B3D0]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[SanPham] ADD  CONSTRAINT [MSmerge_df_rowguid_3878BB5CAA7B491AB7B95509CA2DAE0C]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[TheTichDiem] ADD  CONSTRAINT [MSmerge_df_rowguid_5951821F2FFD44D98419DD2F8587C56C]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[ThongSoKiThuat] ADD  CONSTRAINT [MSmerge_df_rowguid_82890B76A179482C9500B95A3E51DB46]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[TinhNang] ADD  CONSTRAINT [MSmerge_df_rowguid_BE4C3C9BAE734711B5AD54548F80DABA]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[Voucher] ADD  CONSTRAINT [MSmerge_df_rowguid_523FFEF3C4BC43E8AC2A08D7898D6B99]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD  CONSTRAINT [FK_DonHang_ChiTietDonHang] FOREIGN KEY([MaDonHang])
REFERENCES [dbo].[DonHang] ([MaDonHang])
GO
ALTER TABLE [dbo].[ChiTietDonHang] CHECK CONSTRAINT [FK_DonHang_ChiTietDonHang]
GO
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_ChiTietDonHang] FOREIGN KEY([MaSanPham])
REFERENCES [dbo].[SanPham] ([MaSanPham])
GO
ALTER TABLE [dbo].[ChiTietDonHang] CHECK CONSTRAINT [FK_SanPham_ChiTietDonHang]
GO
ALTER TABLE [dbo].[ChiTietKho]  WITH CHECK ADD  CONSTRAINT [FK_Kho_ChiTietKho] FOREIGN KEY([MaKho])
REFERENCES [dbo].[Kho] ([MaKho])
GO
ALTER TABLE [dbo].[ChiTietKho] CHECK CONSTRAINT [FK_Kho_ChiTietKho]
GO
ALTER TABLE [dbo].[ChiTietKho]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_ChiTietKho] FOREIGN KEY([MaSanPham])
REFERENCES [dbo].[SanPham] ([MaSanPham])
GO
ALTER TABLE [dbo].[ChiTietKho] CHECK CONSTRAINT [FK_SanPham_ChiTietKho]
GO
ALTER TABLE [dbo].[ChiTietLoai]  WITH CHECK ADD  CONSTRAINT [FK_Loai_ChiTietLoai] FOREIGN KEY([MaLoai])
REFERENCES [dbo].[Loai] ([MaLoai])
GO
ALTER TABLE [dbo].[ChiTietLoai] CHECK CONSTRAINT [FK_Loai_ChiTietLoai]
GO
ALTER TABLE [dbo].[ChiTietLoai]  WITH CHECK ADD  CONSTRAINT [FK_SP_ChiTietLoai] FOREIGN KEY([MaSanPham])
REFERENCES [dbo].[SanPham] ([MaSanPham])
GO
ALTER TABLE [dbo].[ChiTietLoai] CHECK CONSTRAINT [FK_SP_ChiTietLoai]
GO
ALTER TABLE [dbo].[ChiTietPhieuNhap]  WITH CHECK ADD  CONSTRAINT [FK_PhieuNhap_ChiTietPhieuNhap] FOREIGN KEY([MaPhieuNhap])
REFERENCES [dbo].[PhieuNhap] ([MaPhieuNhap])
GO
ALTER TABLE [dbo].[ChiTietPhieuNhap] CHECK CONSTRAINT [FK_PhieuNhap_ChiTietPhieuNhap]
GO
ALTER TABLE [dbo].[ChiTietPhieuNhap]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_ChiTietPhieuNhap] FOREIGN KEY([MaSanPham])
REFERENCES [dbo].[SanPham] ([MaSanPham])
GO
ALTER TABLE [dbo].[ChiTietPhieuNhap] CHECK CONSTRAINT [FK_SanPham_ChiTietPhieuNhap]
GO
ALTER TABLE [dbo].[ChiTietPhieuXuat]  WITH CHECK ADD  CONSTRAINT [FK_PhieuXuat_CTPhieuXuat] FOREIGN KEY([MaPhieuXuat])
REFERENCES [dbo].[PhieuXuat] ([MaPhieuXuat])
GO
ALTER TABLE [dbo].[ChiTietPhieuXuat] CHECK CONSTRAINT [FK_PhieuXuat_CTPhieuXuat]
GO
ALTER TABLE [dbo].[ChiTietPhieuXuat]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_CTPhieuXuat] FOREIGN KEY([MaSanPham])
REFERENCES [dbo].[SanPham] ([MaSanPham])
GO
ALTER TABLE [dbo].[ChiTietPhieuXuat] CHECK CONSTRAINT [FK_SanPham_CTPhieuXuat]
GO
ALTER TABLE [dbo].[CuaHang]  WITH CHECK ADD  CONSTRAINT [FK_NhanVien_CuaHang] FOREIGN KEY([CuaHangTruong])
REFERENCES [dbo].[NhanVien] ([MaNhanVien])
GO
ALTER TABLE [dbo].[CuaHang] CHECK CONSTRAINT [FK_NhanVien_CuaHang]
GO
ALTER TABLE [dbo].[DacDiemNoiBat]  WITH CHECK ADD  CONSTRAINT [FK_SP_DacDiemNoiBat] FOREIGN KEY([MaSanPham])
REFERENCES [dbo].[SanPham] ([MaSanPham])
GO
ALTER TABLE [dbo].[DacDiemNoiBat] CHECK CONSTRAINT [FK_SP_DacDiemNoiBat]
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD  CONSTRAINT [FK_CuaHang_DonHang] FOREIGN KEY([MaCuaHang])
REFERENCES [dbo].[CuaHang] ([MaCuaHang])
GO
ALTER TABLE [dbo].[DonHang] CHECK CONSTRAINT [FK_CuaHang_DonHang]
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD  CONSTRAINT [FK_KH_DonHang] FOREIGN KEY([MaKhachHang])
REFERENCES [dbo].[KhachHang] ([MaKhachHang])
GO
ALTER TABLE [dbo].[DonHang] CHECK CONSTRAINT [FK_KH_DonHang]
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD  CONSTRAINT [FK_NV_DonHang] FOREIGN KEY([NhanVienPhuTrach])
REFERENCES [dbo].[NhanVien] ([MaNhanVien])
GO
ALTER TABLE [dbo].[DonHang] CHECK CONSTRAINT [FK_NV_DonHang]
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD  CONSTRAINT [FK_Voucher_DonHang] FOREIGN KEY([MaVoucher])
REFERENCES [dbo].[Voucher] ([MaVoucher])
GO
ALTER TABLE [dbo].[DonHang] CHECK CONSTRAINT [FK_Voucher_DonHang]
GO
ALTER TABLE [dbo].[Kho]  WITH CHECK ADD  CONSTRAINT [FK_CuaHang_Kho] FOREIGN KEY([MaCuaHang])
REFERENCES [dbo].[CuaHang] ([MaCuaHang])
GO
ALTER TABLE [dbo].[Kho] CHECK CONSTRAINT [FK_CuaHang_Kho]
GO
ALTER TABLE [dbo].[Loai]  WITH CHECK ADD  CONSTRAINT [FK_DM_LOAI] FOREIGN KEY([MaDanhMuc])
REFERENCES [dbo].[DanhMuc] ([MaDanhMuc])
GO
ALTER TABLE [dbo].[Loai] CHECK CONSTRAINT [FK_DM_LOAI]
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD FOREIGN KEY([CuaHang])
REFERENCES [dbo].[CuaHang] ([MaCuaHang])
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD  CONSTRAINT [FK_ChucVu_NhanVien] FOREIGN KEY([ChucVu])
REFERENCES [dbo].[ChucVu] ([MaChucVu])
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [FK_ChucVu_NhanVien]
GO
ALTER TABLE [dbo].[PhanHoi]  WITH CHECK ADD  CONSTRAINT [FK_KH_PhanHoi] FOREIGN KEY([MaKhachHang])
REFERENCES [dbo].[KhachHang] ([MaKhachHang])
GO
ALTER TABLE [dbo].[PhanHoi] CHECK CONSTRAINT [FK_KH_PhanHoi]
GO
ALTER TABLE [dbo].[PhieuBaoHanh]  WITH CHECK ADD  CONSTRAINT [FK_DH_BaoHanh] FOREIGN KEY([MaDonHang])
REFERENCES [dbo].[DonHang] ([MaDonHang])
GO
ALTER TABLE [dbo].[PhieuBaoHanh] CHECK CONSTRAINT [FK_DH_BaoHanh]
GO
ALTER TABLE [dbo].[PhieuBaoHanh]  WITH CHECK ADD  CONSTRAINT [FK_KH_BaoHanh] FOREIGN KEY([MaKhachHang])
REFERENCES [dbo].[KhachHang] ([MaKhachHang])
GO
ALTER TABLE [dbo].[PhieuBaoHanh] CHECK CONSTRAINT [FK_KH_BaoHanh]
GO
ALTER TABLE [dbo].[PhieuBaoHanh]  WITH CHECK ADD  CONSTRAINT [FK_SP_BaoHanh] FOREIGN KEY([MaSanPham])
REFERENCES [dbo].[SanPham] ([MaSanPham])
GO
ALTER TABLE [dbo].[PhieuBaoHanh] CHECK CONSTRAINT [FK_SP_BaoHanh]
GO
ALTER TABLE [dbo].[PhieuNhap]  WITH CHECK ADD  CONSTRAINT [FK_Kho_PhieuNhap] FOREIGN KEY([MaKho])
REFERENCES [dbo].[Kho] ([MaKho])
GO
ALTER TABLE [dbo].[PhieuNhap] CHECK CONSTRAINT [FK_Kho_PhieuNhap]
GO
ALTER TABLE [dbo].[PhieuNhap]  WITH CHECK ADD  CONSTRAINT [FK_NCC_PhieuNhap] FOREIGN KEY([NhaCungCap])
REFERENCES [dbo].[NhaCungCap] ([MaNCC])
GO
ALTER TABLE [dbo].[PhieuNhap] CHECK CONSTRAINT [FK_NCC_PhieuNhap]
GO
ALTER TABLE [dbo].[PhieuNhap]  WITH CHECK ADD  CONSTRAINT [FK_NhanVien_NVPhuTrach] FOREIGN KEY([NhanVienTrucKho])
REFERENCES [dbo].[NhanVien] ([MaNhanVien])
GO
ALTER TABLE [dbo].[PhieuNhap] CHECK CONSTRAINT [FK_NhanVien_NVPhuTrach]
GO
ALTER TABLE [dbo].[PhieuXuat]  WITH CHECK ADD  CONSTRAINT [FK_DonHang_PhieuXuat] FOREIGN KEY([MaDonHang])
REFERENCES [dbo].[DonHang] ([MaDonHang])
GO
ALTER TABLE [dbo].[PhieuXuat] CHECK CONSTRAINT [FK_DonHang_PhieuXuat]
GO
ALTER TABLE [dbo].[PhieuXuat]  WITH CHECK ADD  CONSTRAINT [FK_Kho_PhieuXuat] FOREIGN KEY([MaKho])
REFERENCES [dbo].[Kho] ([MaKho])
GO
ALTER TABLE [dbo].[PhieuXuat] CHECK CONSTRAINT [FK_Kho_PhieuXuat]
GO
ALTER TABLE [dbo].[PhieuXuat]  WITH CHECK ADD  CONSTRAINT [FK_NVTaoPhieu_PhieuXuat] FOREIGN KEY([NhanVienTaoPhieu])
REFERENCES [dbo].[NhanVien] ([MaNhanVien])
GO
ALTER TABLE [dbo].[PhieuXuat] CHECK CONSTRAINT [FK_NVTaoPhieu_PhieuXuat]
GO
ALTER TABLE [dbo].[PhieuXuat]  WITH CHECK ADD  CONSTRAINT [FK_NVTruongKho_PhieuXuat] FOREIGN KEY([NhanVienTruongKho])
REFERENCES [dbo].[NhanVien] ([MaNhanVien])
GO
ALTER TABLE [dbo].[PhieuXuat] CHECK CONSTRAINT [FK_NVTruongKho_PhieuXuat]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_KM_SP] FOREIGN KEY([MaKhuyenMai])
REFERENCES [dbo].[KhuyenMai] ([MaKhuyenMai])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_KM_SP]
GO
ALTER TABLE [dbo].[TheTichDiem]  WITH CHECK ADD  CONSTRAINT [FK_HangThe_TheTichDiem] FOREIGN KEY([Hang])
REFERENCES [dbo].[HangTichDiem] ([MaHang])
GO
ALTER TABLE [dbo].[TheTichDiem] CHECK CONSTRAINT [FK_HangThe_TheTichDiem]
GO
ALTER TABLE [dbo].[TheTichDiem]  WITH CHECK ADD  CONSTRAINT [FK_KH_TheTichDiem] FOREIGN KEY([MaKhachHang])
REFERENCES [dbo].[KhachHang] ([MaKhachHang])
GO
ALTER TABLE [dbo].[TheTichDiem] CHECK CONSTRAINT [FK_KH_TheTichDiem]
GO
ALTER TABLE [dbo].[ThongSoKiThuat]  WITH CHECK ADD  CONSTRAINT [FK_SP_ThongSoKiThuat] FOREIGN KEY([MaSanPham])
REFERENCES [dbo].[SanPham] ([MaSanPham])
GO
ALTER TABLE [dbo].[ThongSoKiThuat] CHECK CONSTRAINT [FK_SP_ThongSoKiThuat]
GO
ALTER TABLE [dbo].[TinhNang]  WITH CHECK ADD  CONSTRAINT [FK_SP_TinhNang] FOREIGN KEY([MaSanPham])
REFERENCES [dbo].[SanPham] ([MaSanPham])
GO
ALTER TABLE [dbo].[TinhNang] CHECK CONSTRAINT [FK_SP_TinhNang]
GO
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD CHECK  (([DonGia]>=(0)))
GO
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD CHECK  (([SoLuong]>=(0)))
GO
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD CHECK  (([ThanhTien]>=(0)))
GO
ALTER TABLE [dbo].[ChiTietKho]  WITH CHECK ADD CHECK  (([SoLuong]>=(0)))
GO
ALTER TABLE [dbo].[ChiTietPhieuNhap]  WITH CHECK ADD CHECK  (([SoLuong]>=(0)))
GO
ALTER TABLE [dbo].[KhuyenMai]  WITH CHECK ADD  CONSTRAINT [CHECK_NGAY] CHECK  (([NgayBatDau]<[NgayKetThuc]))
GO
ALTER TABLE [dbo].[KhuyenMai] CHECK CONSTRAINT [CHECK_NGAY]
GO
ALTER TABLE [dbo].[KhuyenMai]  WITH CHECK ADD CHECK  (([PhanTramKhuyenMai]>(0) AND [PhanTramKhuyenMai]<=(1)))
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD CHECK  (([DonGia]>=(0)))
GO
ALTER TABLE [dbo].[TheTichDiem]  WITH CHECK ADD CHECK  (([Diem]>=(0)))
GO
ALTER TABLE [dbo].[Voucher]  WITH CHECK ADD  CONSTRAINT [CHECK_NGAY2] CHECK  (([NgayBatDau]<[NgayKetThuc]))
GO
ALTER TABLE [dbo].[Voucher] CHECK CONSTRAINT [CHECK_NGAY2]
GO
ALTER TABLE [dbo].[Voucher]  WITH CHECK ADD CHECK  (([PhanTramKhuyenMai]>(0) AND [PhanTramKhuyenMai]<=(1)))
GO
/****** Object:  StoredProcedure [dbo].[Cap_Nhat_Tinh_Trang_Giao_Hang]    Script Date: 11/8/2021 7:27:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Cap_Nhat_Tinh_Trang_Giao_Hang] @ma_don_hang CHAR(10), @ma_nhan_vien CHAR(10), @tinh_trang_giao_hang BIT AS
BEGIN
	DECLARE @tinh_trang_hien_tai BIT = (SELECT TinhTrangGiaoHang FROM DonHang WHERE MaDonHang = @ma_don_hang)
	IF(@tinh_trang_hien_tai IS NULL AND @ma_don_hang IS NOT NULL AND @ma_nhan_vien IS NOT NULL AND @tinh_trang_giao_hang IS NOT NULL)
	BEGIN
		DECLARE @ERRORMESS VARCHAR(2000)
		IF(@tinh_trang_giao_hang = 0)
		BEGIN
			BEGIN TRAN
			BEGIN TRY
				DECLARE @MAKH CHAR(10) = (SELECT MaKhachHang FROM DonHang WHERE MaDonHang = @ma_don_hang)
				IF EXISTS((SELECT MaThe FROM TheTichDiem WHERE MaKhachHang = @MAKH))
					UPDATE TheTichDiem SET Diem = Diem + ((SELECT TongGiaTri FROM DonHang WHERE MaDonHang = @ma_don_hang) / 1000) WHERE MaKhachHang = @MAKH
				UPDATE DonHang SET TinhTrangGiaoHang = @tinh_trang_giao_hang, NhanVienPhuTrach = @ma_nhan_vien WHERE MaDonHang = @ma_don_hang
				
				DECLARE @CTDH_TEMP TABLE(STT INT,MaSanPham CHAR(10), SoLuong INT)
				INSERT INTO @CTDH_TEMP(STT,MaSanPham,SoLuong)
				(SELECT ROW_NUMBER() OVER (ORDER BY MaSanPham) AS dong
					   , MaSanPham
					   , SoLuong
				 FROM ChiTietDonHang WHERE MaDonHang = @ma_don_hang)

				DECLARE @I INT = 1
				DECLARE @J INT
				DECLARE @SL_SP INT
				DECLARE @TEMP_LEN INT = (SELECT COUNT(STT) FROM @CTDH_TEMP)
				DECLARE @MASP CHAR(10)

				WHILE(@I <= @TEMP_LEN)
				BEGIN
					SET @MASP = (SELECT MaSanPham FROM @CTDH_TEMP WHERE STT = @I)
					SET @J = 1
					SET @SL_SP = (SELECT SoLuong FROM @CTDH_TEMP WHERE STT = @I)
					WHILE(@J <= @SL_SP)
					BEGIN
						INSERT INTO PhieuBaoHanh(MaPhieuBH,MaSanPham,MaKhachHang,MaDonHang,NgayTao,NgayHetHan,TrangThai)
						VALUES('1',@MASP,@MAKH,@ma_don_hang,GETDATE(),DATEADD(year, 1, GETDATE()),0)
						SET @J += 1
					END 
					SET @I += 1
				END
				COMMIT
			END TRY
			BEGIN CATCH
				ROLLBACK
				SET @ERRORMESS = 'Lỗi: ' + ERROR_MESSAGE()
				RAISERROR(@ERRORMESS,16,1)
			END CATCH
		END
		ELSE IF(@tinh_trang_giao_hang = 1)
		BEGIN
			BEGIN TRAN
			BEGIN TRY
				UPDATE DonHang SET TinhTrangGiaoHang = @tinh_trang_giao_hang, NhanVienPhuTrach = @ma_nhan_vien WHERE MaDonHang = @ma_don_hang
				UPDATE PhieuXuat SET TrangThai = 1 WHERE MaDonHang = @ma_don_hang
				DECLARE @CTPX_TEMP TABLE(STT INT, MaKho CHAR(5), MaSP CHAR(10), SL INT)

				INSERT INTO @CTPX_TEMP SELECT ROW_NUMBER() OVER (ORDER BY MaKho, MaSanPham) AS dong
					   , PhieuXuat.MaKho
					   , ChiTietPhieuXuat.MaSanPham
					   , ChiTietPhieuXuat.SoLuong
				 FROM ChiTietPhieuXuat INNER JOIN PhieuXuat ON PhieuXuat.MaDonHang = @ma_don_hang AND PhieuXuat.MaPhieuXuat = ChiTietPhieuXuat.MaPhieuXuat

				 DECLARE @COUNT INT = (SELECT COUNT(STT) FROM @CTPX_TEMP)
				 DECLARE @M INT = 1

				 DECLARE @MAKHOTRAVE CHAR(5)
				 DECLARE @MASPTRAVE CHAR(10)
				 DECLARE @SLTRAVE INT

				 WHILE(@M <= @COUNT)
				 BEGIN
					SET @MAKHOTRAVE = (SELECT MaKho FROM @CTPX_TEMP WHERE STT = @M)
					SET @MASPTRAVE = (SELECT MaSP FROM @CTPX_TEMP WHERE STT = @M)
					SET @SLTRAVE = (SELECT SL FROM @CTPX_TEMP WHERE STT = @M)
					UPDATE ChiTietKho SET SoLuong = SoLuong + @SLTRAVE WHERE MaKho = @MAKHOTRAVE AND MaSanPham = @MASPTRAVE
					SET @M += 1
				 END
				 COMMIT
			END TRY
			BEGIN CATCH
				ROLLBACK
				SET @ERRORMESS = 'Lỗi: ' + ERROR_MESSAGE()
				RAISERROR(@ERRORMESS,16,1)
			END CATCH
		END
	END
	ELSE
		RAISERROR(N'Lỗi: Tình trạng giao hàng đã được cập nhật từ trước hoặc input null !',16,1)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_DangNhap]    Script Date: 11/8/2021 7:27:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_DangNhap] @TaiKhoan char(50),@MatKhau char(50), @type int
as
begin
	if(@type=1)
		if exists(select * from LINK1.QLDienMay.DBO.NHANVIEN where TaiKhoan=@TaiKhoan and MatKhau=@MatKhau)
			select MaNhanVien from NhanVien where TaiKhoan=@TaiKhoan
		else
			raiserror('Tên đăng nhập hoặc mật khẩu sai',16,1)
	if(@type=2)
		if exists(select * from LINK2.QLDienMay.DBO.NHANVIEN where TaiKhoan=@TaiKhoan and MatKhau=@MatKhau)
			select MaNhanVien from NhanVien where TaiKhoan=@TaiKhoan
		else
			raiserror('Tên đăng nhập hoặc mật khẩu sai',16,1)

end
GO
/****** Object:  StoredProcedure [dbo].[Tao_The_Cho_Khach_Hang]    Script Date: 11/8/2021 7:27:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Tao_The_Cho_Khach_Hang] @ma_khach_hang CHAR(10) AS
BEGIN
	IF(@ma_khach_hang IS NOT NULL)
		INSERT INTO TheTichDiem(MaThe,MaKhachHang,Hang,NgayTao,Diem,TrangThai)
		VALUES('1',@ma_khach_hang,'H0001',GETDATE(),0,0)
	ELSE
		RAISERROR(N'Lỗi: Input không được null !',16,1)
END
GO
/****** Object:  StoredProcedure [dbo].[test]    Script Date: 11/8/2021 7:27:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[test]
as
begin
	select * from CuaHang
end
GO
/****** Object:  StoredProcedure [dbo].[Thanh_Toan_Don_Hang]    Script Date: 11/8/2021 7:27:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Thanh_Toan_Don_Hang] @ma_don_hang CHAR(10), @ma_nhan_vien CHAR(10), @tinh_trang_thanh_toan BIT AS
BEGIN
	DECLARE @tinh_trang_hien_tai BIT = (SELECT TinhTrangThanhToan FROM DonHang WHERE MaDonHang = @ma_don_hang)
	IF(@tinh_trang_hien_tai IS NULL AND @ma_don_hang IS NOT NULL AND @ma_nhan_vien IS NOT NULL AND @tinh_trang_thanh_toan IS NOT NULL)
	BEGIN
		IF(@tinh_trang_thanh_toan = 0)
		BEGIN
			BEGIN TRAN
			UPDATE DonHang SET TinhTrangThanhToan = @tinh_trang_thanh_toan, NhanVienPhuTrach = @ma_nhan_vien WHERE MaDonHang = @ma_don_hang
			COMMIT
		END
		ELSE IF(@tinh_trang_thanh_toan = 1)
		BEGIN
			BEGIN TRAN
			UPDATE DonHang SET TinhTrangThanhToan = @tinh_trang_thanh_toan, TinhTrangGiaoHang = @tinh_trang_thanh_toan, NhanVienPhuTrach = @ma_nhan_vien WHERE MaDonHang = @ma_don_hang
		END
	END
	ELSE
		RAISERROR(N'Lỗi: Tình trạng xác nhận đã được cập nhật từ trước hoặc input null !',16,1)
END
GO
/****** Object:  StoredProcedure [dbo].[Xac_Nhan_Don_Hang]    Script Date: 11/8/2021 7:27:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Xac_Nhan_Don_Hang] @ma_don_hang CHAR(10), @ma_nhan_vien CHAR(10), @tinh_trang_xac_nhan BIT AS
BEGIN
	DECLARE @tinh_trang_hien_tai BIT = (SELECT TinhTrangXacNhan FROM DonHang WHERE MaDonHang = @ma_don_hang)
	IF(@tinh_trang_hien_tai IS NULL AND @ma_don_hang IS NOT NULL AND @ma_nhan_vien IS NOT NULL AND @tinh_trang_xac_nhan IS NOT NULL)
	BEGIN
		IF(@tinh_trang_xac_nhan = 0)
		BEGIN
			BEGIN TRAN
			UPDATE DonHang SET TinhTrangXacNhan = @tinh_trang_xac_nhan, NhanVienPhuTrach = @ma_nhan_vien WHERE MaDonHang = @ma_don_hang
			COMMIT
		END
		ELSE IF(@tinh_trang_xac_nhan = 1)
		BEGIN
			BEGIN TRAN
			UPDATE DonHang SET TinhTrangXacNhan = @tinh_trang_xac_nhan, TinhTrangThanhToan = @tinh_trang_xac_nhan, TinhTrangGiaoHang = @tinh_trang_xac_nhan, NhanVienPhuTrach = @ma_nhan_vien WHERE MaDonHang = @ma_don_hang
			COMMIT
		END
	END
	ELSE
		RAISERROR(N'Lỗi: Tình trạng xác nhận đã được cập nhật từ trước hoặc input null !',16,1)
END
GO
