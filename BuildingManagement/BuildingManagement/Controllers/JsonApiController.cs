using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Models;
using Models.EF;

namespace BuildingManagement.Controllers
{
    public class JsonApiController : Controller
    {
        DreamBuildingDbContext db;
        // GET: JsonApi
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult CANHO()
        {
            db = new DreamBuildingDbContext();
            db.Configuration.ProxyCreationEnabled = false;
            return Json(from data in db.CANHOes
                        select data, JsonRequestBehavior.AllowGet);
        }
        public ActionResult CHUCVU()
        {
            db = new DreamBuildingDbContext();
            db.Configuration.ProxyCreationEnabled = false;
            return Json(from data in db.CANHOes
                        select data, JsonRequestBehavior.AllowGet);
        }
        public ActionResult DANTOC()
        {
            db = new DreamBuildingDbContext();
            db.Configuration.ProxyCreationEnabled = false;
            return Json(from data in db.DANTOCs
                        select data, JsonRequestBehavior.AllowGet);
        }
        public ActionResult DICHVU()
        {
            db = new DreamBuildingDbContext();
            db.Configuration.ProxyCreationEnabled = false;
            return Json(from data in db.DICHVUs
                        select data, JsonRequestBehavior.AllowGet);
        }
        public ActionResult LOAINGUOIDUNG()
        {
            db = new DreamBuildingDbContext();
            db.Configuration.ProxyCreationEnabled = false;
            return Json(from data in db.LOAINGUOIDUNGs
                        select data, JsonRequestBehavior.AllowGet);
        }
        public ActionResult NGUOIDAN()
        {
            db = new DreamBuildingDbContext();
            db.Configuration.ProxyCreationEnabled = false;
            return Json(from data in db.NGUOIDANs
                        select data, JsonRequestBehavior.AllowGet);
        }
        public ActionResult NGUOIDUNG()
        {
            db = new DreamBuildingDbContext();
            db.Configuration.ProxyCreationEnabled = false;
            return Json(from data in db.NGUOIDUNGs
                        select data, JsonRequestBehavior.AllowGet);
        }
        public ActionResult NHANVIEN()
        {
            db = new DreamBuildingDbContext();
            db.Configuration.ProxyCreationEnabled = false;
            return Json(from data in db.NHANVIENs
                        select data, JsonRequestBehavior.AllowGet);
        }
        public ActionResult QUYDINH()
        {
            db = new DreamBuildingDbContext();
            db.Configuration.ProxyCreationEnabled = false;
            return Json(from data in db.QUYDINHs
                        select data, JsonRequestBehavior.AllowGet);
        }
        public ActionResult THONGBAO()
        {
            db = new DreamBuildingDbContext();
            db.Configuration.ProxyCreationEnabled = false;
            return Json(from data in db.THONGBAOs
                        select data, JsonRequestBehavior.AllowGet);
        }
        public ActionResult TINNHAN()
        {
            db = new DreamBuildingDbContext();
            db.Configuration.ProxyCreationEnabled = false;
            return Json(from data in db.TINNHANs
                        select data, JsonRequestBehavior.AllowGet);
        }
        public ActionResult TONGIAO()
        {
            db = new DreamBuildingDbContext();
            db.Configuration.ProxyCreationEnabled = false;
            return Json(from data in db.TONGIAOs
                        select data, JsonRequestBehavior.AllowGet);
        }
        public ActionResult NGHENGHIEP()
        {
            db = new DreamBuildingDbContext();
            db.Configuration.ProxyCreationEnabled = false;
            return Json(from data in db.NGHENGHIEPs
                        select data, JsonRequestBehavior.AllowGet);
        }
    }
}