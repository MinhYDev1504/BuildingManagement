namespace Models.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("NGUOIDAN")]
    public partial class NGUOIDAN
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public NGUOIDAN()
        {
            CANHOes = new HashSet<CANHO>();
        }

        [Key]
        [StringLength(6)]
        public string MaNguoiDan { get; set; }

        [Required]
        [StringLength(30)]
        public string TenNguoiDan { get; set; }

        public bool? GioiTinh { get; set; }

        public DateTime? NgaySinh { get; set; }

        [StringLength(6)]
        public string MaDanToc { get; set; }

        [StringLength(6)]
        public string MaTonGiao { get; set; }

        [StringLength(6)]
        public string MaNgheNghiep { get; set; }

        public virtual DANTOC DANTOC { get; set; }

        public virtual NGHENGHIEP NGHENGHIEP { get; set; }

        public virtual TONGIAO TONGIAO { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<CANHO> CANHOes { get; set; }
    }
}
