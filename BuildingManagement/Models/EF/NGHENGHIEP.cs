namespace Models.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("NGHENGHIEP")]
    public partial class NGHENGHIEP
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public NGHENGHIEP()
        {
            NGUOIDANs = new HashSet<NGUOIDAN>();
        }

        [Key]
        [StringLength(6)]
        public string MaNgheNghiep { get; set; }

        [Required]
        [StringLength(30)]
        public string TenNgheNghiep { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<NGUOIDAN> NGUOIDANs { get; set; }
    }
}
