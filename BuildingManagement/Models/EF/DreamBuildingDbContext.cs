namespace Models.EF
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class DreamBuildingDbContext : DbContext
    {
        public DreamBuildingDbContext()
            : base("name=DreamBuildingDbContext")
        {
        }

        public virtual DbSet<CANHO> CANHOes { get; set; }
        public virtual DbSet<CHUCVU> CHUCVUs { get; set; }
        public virtual DbSet<DANTOC> DANTOCs { get; set; }
        public virtual DbSet<DICHVU> DICHVUs { get; set; }
        public virtual DbSet<LOAINGUOIDUNG> LOAINGUOIDUNGs { get; set; }
        public virtual DbSet<NGHENGHIEP> NGHENGHIEPs { get; set; }
        public virtual DbSet<NGUOIDAN> NGUOIDANs { get; set; }
        public virtual DbSet<NGUOIDUNG> NGUOIDUNGs { get; set; }
        public virtual DbSet<NHANVIEN> NHANVIENs { get; set; }
        public virtual DbSet<THONGBAO> THONGBAOs { get; set; }
        public virtual DbSet<TINNHAN> TINNHANs { get; set; }
        public virtual DbSet<TONGIAO> TONGIAOs { get; set; }
        public virtual DbSet<QUYDINH> QUYDINHs { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<CANHO>()
                .Property(e => e.MaCanHo)
                .IsUnicode(false);

            modelBuilder.Entity<CANHO>()
                .HasMany(e => e.DICHVUs)
                .WithMany(e => e.CANHOes)
                .Map(m => m.ToTable("CANHO_DICHVU").MapLeftKey("MaCanHo").MapRightKey("MaDichVu"));

            modelBuilder.Entity<CANHO>()
                .HasMany(e => e.NGUOIDANs)
                .WithMany(e => e.CANHOes)
                .Map(m => m.ToTable("CANHO_NGUOIDAN").MapLeftKey("MaCanHo").MapRightKey("MaNguoiDan"));

            modelBuilder.Entity<CHUCVU>()
                .Property(e => e.MaChucVu)
                .IsUnicode(false);

            modelBuilder.Entity<DANTOC>()
                .Property(e => e.MaDanToc)
                .IsUnicode(false);

            modelBuilder.Entity<DICHVU>()
                .Property(e => e.MaDichVu)
                .IsUnicode(false);

            modelBuilder.Entity<LOAINGUOIDUNG>()
                .Property(e => e.MaLoaiND)
                .IsUnicode(false);

            modelBuilder.Entity<LOAINGUOIDUNG>()
                .HasMany(e => e.NGUOIDUNGs)
                .WithRequired(e => e.LOAINGUOIDUNG)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<NGHENGHIEP>()
                .Property(e => e.MaNgheNghiep)
                .IsUnicode(false);

            modelBuilder.Entity<NGUOIDAN>()
                .Property(e => e.MaNguoiDan)
                .IsUnicode(false);

            modelBuilder.Entity<NGUOIDAN>()
                .Property(e => e.MaDanToc)
                .IsUnicode(false);

            modelBuilder.Entity<NGUOIDAN>()
                .Property(e => e.MaTonGiao)
                .IsUnicode(false);

            modelBuilder.Entity<NGUOIDAN>()
                .Property(e => e.MaNgheNghiep)
                .IsUnicode(false);

            modelBuilder.Entity<NGUOIDUNG>()
                .Property(e => e.MaND)
                .IsUnicode(false);

            modelBuilder.Entity<NGUOIDUNG>()
                .Property(e => e.MaLoaiND)
                .IsUnicode(false);

            modelBuilder.Entity<NGUOIDUNG>()
                .Property(e => e.TenDangNhap)
                .IsUnicode(false);

            modelBuilder.Entity<NGUOIDUNG>()
                .Property(e => e.MatKhau)
                .IsUnicode(false);

            modelBuilder.Entity<NGUOIDUNG>()
                .HasMany(e => e.THONGBAOs)
                .WithOptional(e => e.NGUOIDUNG)
                .HasForeignKey(e => e.ID_NguoiDang);

            modelBuilder.Entity<NGUOIDUNG>()
                .HasMany(e => e.TINNHANs)
                .WithOptional(e => e.NGUOIDUNG)
                .HasForeignKey(e => e.ID_NguoiDangTN);

            modelBuilder.Entity<NGUOIDUNG>()
                .HasMany(e => e.TINNHANs1)
                .WithOptional(e => e.NGUOIDUNG1)
                .HasForeignKey(e => e.ID_NguoiNhanTN);

            modelBuilder.Entity<NHANVIEN>()
                .Property(e => e.MaNhanVien)
                .IsUnicode(false);

            modelBuilder.Entity<NHANVIEN>()
                .Property(e => e.MaChucVu)
                .IsUnicode(false);

            modelBuilder.Entity<THONGBAO>()
                .Property(e => e.ID_NguoiDang)
                .IsUnicode(false);

            modelBuilder.Entity<TINNHAN>()
                .Property(e => e.ID_NguoiDangTN)
                .IsUnicode(false);

            modelBuilder.Entity<TINNHAN>()
                .Property(e => e.ID_NguoiNhanTN)
                .IsUnicode(false);

            modelBuilder.Entity<TONGIAO>()
                .Property(e => e.MaTonGiao)
                .IsUnicode(false);
        }
    }
}
