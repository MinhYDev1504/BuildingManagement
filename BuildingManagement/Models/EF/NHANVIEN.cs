namespace Models.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("NHANVIEN")]
    public partial class NHANVIEN
    {
        [Key]
        [StringLength(6)]
        public string MaNhanVien { get; set; }

        [StringLength(30)]
        public string TenNhanVien { get; set; }

        public bool? GioiTinh { get; set; }

        public DateTime? NgaySinh { get; set; }

        [StringLength(30)]
        public string DiaChi { get; set; }

        [StringLength(30)]
        public string DienThoai { get; set; }

        [StringLength(6)]
        public string MaChucVu { get; set; }

        public virtual CHUCVU CHUCVU { get; set; }
    }
}
