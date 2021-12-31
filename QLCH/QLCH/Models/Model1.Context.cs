﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace QLCH.Models
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    using System.Data.Entity.Core.Objects;
    using System.Linq;
    
    public partial class QLDienMayEntities : DbContext
    {
        public QLDienMayEntities()
            : base("name=QLDienMayEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<ChiTietDonHang> ChiTietDonHangs { get; set; }
        public virtual DbSet<ChiTietKho> ChiTietKhoes { get; set; }
        public virtual DbSet<ChiTietLoai> ChiTietLoais { get; set; }
        public virtual DbSet<ChiTietPhieuNhap> ChiTietPhieuNhaps { get; set; }
        public virtual DbSet<ChiTietPhieuXuat> ChiTietPhieuXuats { get; set; }
        public virtual DbSet<ChucVu> ChucVus { get; set; }
        public virtual DbSet<CuaHang> CuaHangs { get; set; }
        public virtual DbSet<DacDiemNoiBat> DacDiemNoiBats { get; set; }
        public virtual DbSet<DanhMuc> DanhMucs { get; set; }
        public virtual DbSet<DonHang> DonHangs { get; set; }
        public virtual DbSet<HangTichDiem> HangTichDiems { get; set; }
        public virtual DbSet<KhachHang> KhachHangs { get; set; }
        public virtual DbSet<Kho> Khoes { get; set; }
        public virtual DbSet<KhuyenMai> KhuyenMais { get; set; }
        public virtual DbSet<Loai> Loais { get; set; }
        public virtual DbSet<MSdynamicsnapshotview> MSdynamicsnapshotviews { get; set; }
        public virtual DbSet<MSmerge_dynamic_snapshots> MSmerge_dynamic_snapshots { get; set; }
        public virtual DbSet<MSmerge_partition_groups> MSmerge_partition_groups { get; set; }
        public virtual DbSet<NhaCungCap> NhaCungCaps { get; set; }
        public virtual DbSet<NhanVien> NhanViens { get; set; }
        public virtual DbSet<PhanHoi> PhanHois { get; set; }
        public virtual DbSet<PhieuBaoHanh> PhieuBaoHanhs { get; set; }
        public virtual DbSet<PhieuNhap> PhieuNhaps { get; set; }
        public virtual DbSet<PhieuXuat> PhieuXuats { get; set; }
        public virtual DbSet<SanPham> SanPhams { get; set; }
        public virtual DbSet<sysdiagram> sysdiagrams { get; set; }
        public virtual DbSet<sysreplserver> sysreplservers { get; set; }
        public virtual DbSet<ThanhPho> ThanhPhoes { get; set; }
        public virtual DbSet<TheTichDiem> TheTichDiems { get; set; }
        public virtual DbSet<ThongSoKiThuat> ThongSoKiThuats { get; set; }
        public virtual DbSet<ThuongHieu> ThuongHieux { get; set; }
        public virtual DbSet<TinhNang> TinhNangs { get; set; }
        public virtual DbSet<Voucher> Vouchers { get; set; }
        public virtual DbSet<MSdynamicsnapshotjob> MSdynamicsnapshotjobs { get; set; }
        public virtual DbSet<MSmerge_agent_parameters> MSmerge_agent_parameters { get; set; }
        public virtual DbSet<MSmerge_altsyncpartners> MSmerge_altsyncpartners { get; set; }
        public virtual DbSet<MSmerge_articlehistory> MSmerge_articlehistory { get; set; }
        public virtual DbSet<MSmerge_conflict_CN2_QLDM_ChiTietDonHang> MSmerge_conflict_CN2_QLDM_ChiTietDonHang { get; set; }
        public virtual DbSet<MSmerge_conflict_CN2_QLDM_ChiTietKho> MSmerge_conflict_CN2_QLDM_ChiTietKho { get; set; }
        public virtual DbSet<MSmerge_conflict_CN2_QLDM_ChiTietLoai> MSmerge_conflict_CN2_QLDM_ChiTietLoai { get; set; }
        public virtual DbSet<MSmerge_conflict_CN2_QLDM_ChiTietPhieuNhap> MSmerge_conflict_CN2_QLDM_ChiTietPhieuNhap { get; set; }
        public virtual DbSet<MSmerge_conflict_CN2_QLDM_ChiTietPhieuXuat> MSmerge_conflict_CN2_QLDM_ChiTietPhieuXuat { get; set; }
        public virtual DbSet<MSmerge_conflict_CN2_QLDM_ChucVu> MSmerge_conflict_CN2_QLDM_ChucVu { get; set; }
        public virtual DbSet<MSmerge_conflict_CN2_QLDM_CuaHang> MSmerge_conflict_CN2_QLDM_CuaHang { get; set; }
        public virtual DbSet<MSmerge_conflict_CN2_QLDM_DacDiemNoiBat> MSmerge_conflict_CN2_QLDM_DacDiemNoiBat { get; set; }
        public virtual DbSet<MSmerge_conflict_CN2_QLDM_DanhMuc> MSmerge_conflict_CN2_QLDM_DanhMuc { get; set; }
        public virtual DbSet<MSmerge_conflict_CN2_QLDM_DonHang> MSmerge_conflict_CN2_QLDM_DonHang { get; set; }
        public virtual DbSet<MSmerge_conflict_CN2_QLDM_HangTichDiem> MSmerge_conflict_CN2_QLDM_HangTichDiem { get; set; }
        public virtual DbSet<MSmerge_conflict_CN2_QLDM_KhachHang> MSmerge_conflict_CN2_QLDM_KhachHang { get; set; }
        public virtual DbSet<MSmerge_conflict_CN2_QLDM_Kho> MSmerge_conflict_CN2_QLDM_Kho { get; set; }
        public virtual DbSet<MSmerge_conflict_CN2_QLDM_KhuyenMai> MSmerge_conflict_CN2_QLDM_KhuyenMai { get; set; }
        public virtual DbSet<MSmerge_conflict_CN2_QLDM_Loai> MSmerge_conflict_CN2_QLDM_Loai { get; set; }
        public virtual DbSet<MSmerge_conflict_CN2_QLDM_NhaCungCap> MSmerge_conflict_CN2_QLDM_NhaCungCap { get; set; }
        public virtual DbSet<MSmerge_conflict_CN2_QLDM_NhanVien> MSmerge_conflict_CN2_QLDM_NhanVien { get; set; }
        public virtual DbSet<MSmerge_conflict_CN2_QLDM_PhanHoi> MSmerge_conflict_CN2_QLDM_PhanHoi { get; set; }
        public virtual DbSet<MSmerge_conflict_CN2_QLDM_PhieuBaoHanh> MSmerge_conflict_CN2_QLDM_PhieuBaoHanh { get; set; }
        public virtual DbSet<MSmerge_conflict_CN2_QLDM_PhieuNhap> MSmerge_conflict_CN2_QLDM_PhieuNhap { get; set; }
        public virtual DbSet<MSmerge_conflict_CN2_QLDM_PhieuXuat> MSmerge_conflict_CN2_QLDM_PhieuXuat { get; set; }
        public virtual DbSet<MSmerge_conflict_CN2_QLDM_SanPham> MSmerge_conflict_CN2_QLDM_SanPham { get; set; }
        public virtual DbSet<MSmerge_conflict_CN2_QLDM_ThanhPho> MSmerge_conflict_CN2_QLDM_ThanhPho { get; set; }
        public virtual DbSet<MSmerge_conflict_CN2_QLDM_TheTichDiem> MSmerge_conflict_CN2_QLDM_TheTichDiem { get; set; }
        public virtual DbSet<MSmerge_conflict_CN2_QLDM_ThongSoKiThuat> MSmerge_conflict_CN2_QLDM_ThongSoKiThuat { get; set; }
        public virtual DbSet<MSmerge_conflict_CN2_QLDM_ThuongHieu> MSmerge_conflict_CN2_QLDM_ThuongHieu { get; set; }
        public virtual DbSet<MSmerge_conflict_CN2_QLDM_TinhNang> MSmerge_conflict_CN2_QLDM_TinhNang { get; set; }
        public virtual DbSet<MSmerge_conflict_CN2_QLDM_Voucher> MSmerge_conflict_CN2_QLDM_Voucher { get; set; }
        public virtual DbSet<MSmerge_conflict_CN3_QLDM_ChiTietDonHang> MSmerge_conflict_CN3_QLDM_ChiTietDonHang { get; set; }
        public virtual DbSet<MSmerge_conflict_CN3_QLDM_ChiTietKho> MSmerge_conflict_CN3_QLDM_ChiTietKho { get; set; }
        public virtual DbSet<MSmerge_conflict_CN3_QLDM_ChiTietLoai> MSmerge_conflict_CN3_QLDM_ChiTietLoai { get; set; }
        public virtual DbSet<MSmerge_conflict_CN3_QLDM_ChiTietPhieuNhap> MSmerge_conflict_CN3_QLDM_ChiTietPhieuNhap { get; set; }
        public virtual DbSet<MSmerge_conflict_CN3_QLDM_ChiTietPhieuXuat> MSmerge_conflict_CN3_QLDM_ChiTietPhieuXuat { get; set; }
        public virtual DbSet<MSmerge_conflict_CN3_QLDM_ChucVu> MSmerge_conflict_CN3_QLDM_ChucVu { get; set; }
        public virtual DbSet<MSmerge_conflict_CN3_QLDM_CuaHang> MSmerge_conflict_CN3_QLDM_CuaHang { get; set; }
        public virtual DbSet<MSmerge_conflict_CN3_QLDM_DacDiemNoiBat> MSmerge_conflict_CN3_QLDM_DacDiemNoiBat { get; set; }
        public virtual DbSet<MSmerge_conflict_CN3_QLDM_DanhMuc> MSmerge_conflict_CN3_QLDM_DanhMuc { get; set; }
        public virtual DbSet<MSmerge_conflict_CN3_QLDM_DonHang> MSmerge_conflict_CN3_QLDM_DonHang { get; set; }
        public virtual DbSet<MSmerge_conflict_CN3_QLDM_HangTichDiem> MSmerge_conflict_CN3_QLDM_HangTichDiem { get; set; }
        public virtual DbSet<MSmerge_conflict_CN3_QLDM_KhachHang> MSmerge_conflict_CN3_QLDM_KhachHang { get; set; }
        public virtual DbSet<MSmerge_conflict_CN3_QLDM_Kho> MSmerge_conflict_CN3_QLDM_Kho { get; set; }
        public virtual DbSet<MSmerge_conflict_CN3_QLDM_KhuyenMai> MSmerge_conflict_CN3_QLDM_KhuyenMai { get; set; }
        public virtual DbSet<MSmerge_conflict_CN3_QLDM_Loai> MSmerge_conflict_CN3_QLDM_Loai { get; set; }
        public virtual DbSet<MSmerge_conflict_CN3_QLDM_NhaCungCap> MSmerge_conflict_CN3_QLDM_NhaCungCap { get; set; }
        public virtual DbSet<MSmerge_conflict_CN3_QLDM_NhanVien> MSmerge_conflict_CN3_QLDM_NhanVien { get; set; }
        public virtual DbSet<MSmerge_conflict_CN3_QLDM_PhanHoi> MSmerge_conflict_CN3_QLDM_PhanHoi { get; set; }
        public virtual DbSet<MSmerge_conflict_CN3_QLDM_PhieuBaoHanh> MSmerge_conflict_CN3_QLDM_PhieuBaoHanh { get; set; }
        public virtual DbSet<MSmerge_conflict_CN3_QLDM_PhieuNhap> MSmerge_conflict_CN3_QLDM_PhieuNhap { get; set; }
        public virtual DbSet<MSmerge_conflict_CN3_QLDM_PhieuXuat> MSmerge_conflict_CN3_QLDM_PhieuXuat { get; set; }
        public virtual DbSet<MSmerge_conflict_CN3_QLDM_SanPham> MSmerge_conflict_CN3_QLDM_SanPham { get; set; }
        public virtual DbSet<MSmerge_conflict_CN3_QLDM_ThanhPho> MSmerge_conflict_CN3_QLDM_ThanhPho { get; set; }
        public virtual DbSet<MSmerge_conflict_CN3_QLDM_TheTichDiem> MSmerge_conflict_CN3_QLDM_TheTichDiem { get; set; }
        public virtual DbSet<MSmerge_conflict_CN3_QLDM_ThongSoKiThuat> MSmerge_conflict_CN3_QLDM_ThongSoKiThuat { get; set; }
        public virtual DbSet<MSmerge_conflict_CN3_QLDM_ThuongHieu> MSmerge_conflict_CN3_QLDM_ThuongHieu { get; set; }
        public virtual DbSet<MSmerge_conflict_CN3_QLDM_TinhNang> MSmerge_conflict_CN3_QLDM_TinhNang { get; set; }
        public virtual DbSet<MSmerge_conflict_CN3_QLDM_Voucher> MSmerge_conflict_CN3_QLDM_Voucher { get; set; }
        public virtual DbSet<MSmerge_conflicts_info> MSmerge_conflicts_info { get; set; }
        public virtual DbSet<MSmerge_contents> MSmerge_contents { get; set; }
        public virtual DbSet<MSmerge_current_partition_mappings> MSmerge_current_partition_mappings { get; set; }
        public virtual DbSet<MSmerge_errorlineage> MSmerge_errorlineage { get; set; }
        public virtual DbSet<MSmerge_generation_partition_mappings> MSmerge_generation_partition_mappings { get; set; }
        public virtual DbSet<MSmerge_genhistory> MSmerge_genhistory { get; set; }
        public virtual DbSet<MSmerge_history> MSmerge_history { get; set; }
        public virtual DbSet<MSmerge_identity_range> MSmerge_identity_range { get; set; }
        public virtual DbSet<MSmerge_log_files> MSmerge_log_files { get; set; }
        public virtual DbSet<MSmerge_metadataaction_request> MSmerge_metadataaction_request { get; set; }
        public virtual DbSet<MSmerge_past_partition_mappings> MSmerge_past_partition_mappings { get; set; }
        public virtual DbSet<MSmerge_replinfo> MSmerge_replinfo { get; set; }
        public virtual DbSet<MSmerge_sessions> MSmerge_sessions { get; set; }
        public virtual DbSet<MSmerge_settingshistory> MSmerge_settingshistory { get; set; }
        public virtual DbSet<MSmerge_supportability_settings> MSmerge_supportability_settings { get; set; }
        public virtual DbSet<MSmerge_tombstone> MSmerge_tombstone { get; set; }
        public virtual DbSet<MSrepl_errors> MSrepl_errors { get; set; }
        public virtual DbSet<sysmergearticle> sysmergearticles { get; set; }
        public virtual DbSet<sysmergepartitioninfo> sysmergepartitioninfoes { get; set; }
        public virtual DbSet<sysmergepublication> sysmergepublications { get; set; }
        public virtual DbSet<sysmergeschemaarticle> sysmergeschemaarticles { get; set; }
        public virtual DbSet<sysmergeschemachange> sysmergeschemachanges { get; set; }
        public virtual DbSet<sysmergesubscription> sysmergesubscriptions { get; set; }
        public virtual DbSet<sysmergesubsetfilter> sysmergesubsetfilters { get; set; }
    
        public virtual int sp_CTHD_Online(string maDH, string maSP, Nullable<int> sl, Nullable<decimal> dongia)
        {
            var maDHParameter = maDH != null ?
                new ObjectParameter("maDH", maDH) :
                new ObjectParameter("maDH", typeof(string));
    
            var maSPParameter = maSP != null ?
                new ObjectParameter("maSP", maSP) :
                new ObjectParameter("maSP", typeof(string));
    
            var slParameter = sl.HasValue ?
                new ObjectParameter("sl", sl) :
                new ObjectParameter("sl", typeof(int));
    
            var dongiaParameter = dongia.HasValue ?
                new ObjectParameter("dongia", dongia) :
                new ObjectParameter("dongia", typeof(decimal));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_CTHD_Online", maDHParameter, maSPParameter, slParameter, dongiaParameter);
        }
    
        public virtual int sp_DatHang_Online(string maKH, string maCH, Nullable<bool> loai, Nullable<bool> tTXacNhan, Nullable<bool> tTThanhToan, Nullable<bool> tTGiaoHang, Nullable<decimal> tongGT)
        {
            var maKHParameter = maKH != null ?
                new ObjectParameter("MaKH", maKH) :
                new ObjectParameter("MaKH", typeof(string));
    
            var maCHParameter = maCH != null ?
                new ObjectParameter("MaCH", maCH) :
                new ObjectParameter("MaCH", typeof(string));
    
            var loaiParameter = loai.HasValue ?
                new ObjectParameter("Loai", loai) :
                new ObjectParameter("Loai", typeof(bool));
    
            var tTXacNhanParameter = tTXacNhan.HasValue ?
                new ObjectParameter("TTXacNhan", tTXacNhan) :
                new ObjectParameter("TTXacNhan", typeof(bool));
    
            var tTThanhToanParameter = tTThanhToan.HasValue ?
                new ObjectParameter("TTThanhToan", tTThanhToan) :
                new ObjectParameter("TTThanhToan", typeof(bool));
    
            var tTGiaoHangParameter = tTGiaoHang.HasValue ?
                new ObjectParameter("TTGiaoHang", tTGiaoHang) :
                new ObjectParameter("TTGiaoHang", typeof(bool));
    
            var tongGTParameter = tongGT.HasValue ?
                new ObjectParameter("TongGT", tongGT) :
                new ObjectParameter("TongGT", typeof(decimal));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_DatHang_Online", maKHParameter, maCHParameter, loaiParameter, tTXacNhanParameter, tTThanhToanParameter, tTGiaoHangParameter, tongGTParameter);
        }
    }
}
