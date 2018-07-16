namespace Models.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("DANTOC")]
    public partial class DANTOC
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public DANTOC()
        {
            NGUOIDANs = new HashSet<NGUOIDAN>();
        }

        [Key]
        [StringLength(6)]
        public string MaDanToc { get; set; }

        [Required]
        [StringLength(30)]
        public string TenDanToc { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<NGUOIDAN> NGUOIDANs { get; set; }
    }
}
