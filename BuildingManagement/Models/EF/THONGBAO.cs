namespace Models.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("THONGBAO")]
    public partial class THONGBAO
    {
        [Key]
        public int PostID { get; set; }

        [StringLength(6)]
        public string ID_NguoiDang { get; set; }

        public DateTime? NgayDang { get; set; }

        [StringLength(1000)]
        public string NoiDung { get; set; }

        [StringLength(200)]
        public string GhiChu { get; set; }

        public virtual NGUOIDUNG NGUOIDUNG { get; set; }
    }
}
