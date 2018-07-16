namespace Models.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("NGUOIDUNG")]
    public partial class NGUOIDUNG
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public NGUOIDUNG()
        {
            THONGBAOs = new HashSet<THONGBAO>();
            TINNHANs = new HashSet<TINNHAN>();
            TINNHANs1 = new HashSet<TINNHAN>();
        }

        [Key]
        [StringLength(6)]
        public string MaND { get; set; }

        [Required]
        [StringLength(6)]
        public string MaLoaiND { get; set; }

        [Required]
        [StringLength(30)]
        public string TenND { get; set; }

        [Required]
        [StringLength(20)]
        public string TenDangNhap { get; set; }

        [Required]
        [StringLength(30)]
        public string MatKhau { get; set; }

        public virtual LOAINGUOIDUNG LOAINGUOIDUNG { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<THONGBAO> THONGBAOs { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TINNHAN> TINNHANs { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TINNHAN> TINNHANs1 { get; set; }
    }
}
