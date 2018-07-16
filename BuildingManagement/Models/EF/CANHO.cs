namespace Models.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("CANHO")]
    public partial class CANHO
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public CANHO()
        {
            DICHVUs = new HashSet<DICHVU>();
            NGUOIDANs = new HashSet<NGUOIDAN>();
        }

        [Key]
        [StringLength(6)]
        public string MaCanHo { get; set; }

        public int? TangLau { get; set; }

        public int? SoNguoi { get; set; }

        public int? TongPhiDichVu { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<DICHVU> DICHVUs { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<NGUOIDAN> NGUOIDANs { get; set; }
    }
}
