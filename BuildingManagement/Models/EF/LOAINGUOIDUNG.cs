namespace Models.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("LOAINGUOIDUNG")]
    public partial class LOAINGUOIDUNG
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public LOAINGUOIDUNG()
        {
            NGUOIDUNGs = new HashSet<NGUOIDUNG>();
        }

        [Key]
        [StringLength(6)]
        public string MaLoaiND { get; set; }

        [Required]
        [StringLength(30)]
        public string TenLoaiND { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<NGUOIDUNG> NGUOIDUNGs { get; set; }
    }
}
