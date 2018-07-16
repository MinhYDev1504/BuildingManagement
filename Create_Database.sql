/*Webconfig.xml
<?xml version="1.0" encoding="utf-8"?>
<configuration>
	<connectionStrings>
		<add name="freeaspconnection" connectionString="Server=sql.freeasphost.net\MSSQL2016;Database=nguyenminhy_dreambuilding;uid=nguyenminhy;pwd=123456;" providerName="System.Data.SqlClient" />
	</connectionStrings>
</configuration>
*/
/*-----------QUẢN LÝ CHUNG CƯ---------------------*/
--
--
-----------CREATE DATABASE DreamBuilding-----------
--CREATE DATABASE DreamBuilding
--ON 
--     PRIMARY (NAME = DreamBuilding_Data, 
--     FILENAME = 'G:\MiniProject_Website_QuanLyChungCu\Database\DreamBuilding.MDF' , 
--     SIZE = 20MB , 
--     MAXSIZE = 200MB , 
--     FILEGROWTH = 10MB) 
--LOG ON (NAME = DreamBuilding_Log , 
--     FILENAME = 'G:\MiniProject_Website_QuanLyChungCu\Database\DreamBuilding.LDB' , 
--     SIZE = 10MB, 
--     FILEGROWTH = 5MB) 
--GO 
--
--USE DreamBuilding
--GO
------------Loại Người dùng --------------------
CREATE TABLE LOAINGUOIDUNG
(
	MaLoaiND	VARCHAR (6)		NOT NULL	PRIMARY KEY,
	TenLoaiND	NVARCHAR(30)	NOT NULL
)
INSERT INTO LOAINGUOIDUNG VALUES('LND001','Giam Doc');		--Giám đốc
INSERT INTO LOAINGUOIDUNG VALUES('LND002','Pho Giam Doc');	--Phó Giám Đốc
INSERT INTO LOAINGUOIDUNG VALUES('LND003','Quan Ly');		--Quản Lý
INSERT INTO LOAINGUOIDUNG VALUES('LND004','Nguoi Dan');		--Người Dân (Đã Đăng Ký Phòng)
INSERT INTO LOAINGUOIDUNG VALUES('LND005','Nguoi Moi');		--Người Mới (Chưa Đăng Ký Phòng)
GO
---------------------Người dùng---------------------
CREATE TABLE  NGUOIDUNG
(
	MaND 		VARCHAR (6) 	NOT NULL	PRIMARY KEY,
	MaLoaiND	VARCHAR (6)		NOT NULL,
	TenND		NVARCHAR (30)	NOT NULL,
	TenDangNhap	VARCHAR (20)	NOT NULL,
	MatKhau		VARCHAR (30)	NOT NULL,
	
	CONSTRAINT FK_MaLoaiND FOREIGN KEY(MaLoaiND) 	REFERENCES LOAINGUOIDUNG(MaLoaiND)
)
INSERT INTO NGUOIDUNG VALUES('US0001','LND001','Admin','admin','admin')
INSERT INTO NGUOIDUNG VALUES('US0002','LND002','User01','user01','user01')
INSERT INTO NGUOIDUNG VALUES('US0003','LND003','User03','user03','user03')
INSERT INTO NGUOIDUNG VALUES('US0004','LND004','User04','user04','user04')
INSERT INTO NGUOIDUNG VALUES('US0005','LND005','User05','user05','user05')

--------------------------------Dân Tộc----------------------------
CREATE TABLE DANTOC
(
	MaDanToc	VARCHAR (6)		NOT NULL	PRIMARY KEY,
	TenDanToc	NVARCHAR (30)	NOT NULL
)

INSERT INTO DANTOC VALUES('DT0001',N'Kinh')
INSERT INTO DANTOC VALUES('DT0002',N'Chăm')
INSERT INTO DANTOC VALUES('DT0003',N'Thái')
INSERT INTO DANTOC VALUES('DT0004',N'Tày')
INSERT INTO DANTOC VALUES('DT0005',N'Nùng')
INSERT INTO DANTOC VALUES('DT0006',N'Mèo')

--------------------------------Tôn Giáo--------------------------
CREATE TABLE TONGIAO
(
	MaTonGiao	VARCHAR (6)		NOT NULL	PRIMARY KEY,
	TenTonGiao	NVARCHAR (30)	NOT NULL
)

INSERT INTO TONGIAO VALUES('TG0001',N'Thiên Chúa')
INSERT INTO TONGIAO VALUES('TG0002',N'Phật Giáo')
INSERT INTO TONGIAO VALUES('TG0003',N'Hồi Giáo')
INSERT INTO TONGIAO VALUES('TG0004',N'Tin Lành')
INSERT INTO TONGIAO VALUES('TG0005',N'Cao Đài')
INSERT INTO TONGIAO VALUES('TG0006',N'Không Tôn Giáo')

---------------------Nghe nghiep------------------------
CREATE TABLE NGHENGHIEP
(
	MaNgheNghiep		VARCHAR (6)		NOT NULL	PRIMARY KEY,
	TenNgheNghiep		NVARCHAR (30)	NOT NULL
)
INSERT INTO NGHENGHIEP VALUES('NN0001',N'Nội trợ')
INSERT INTO NGHENGHIEP VALUES('NN0002',N'Giáo viên')
INSERT INTO NGHENGHIEP VALUES('NN0003',N'Công nhân')
INSERT INTO NGHENGHIEP VALUES('NN0004',N'Nông dân')
INSERT INTO NGHENGHIEP VALUES('NN0005',N'Cán bộ')
INSERT INTO NGHENGHIEP VALUES('NN0006',N'Doanh nhân')

-----------------Người dân---------------------------
CREATE TABLE NGUOIDAN
(
	MaNguoiDan		VARCHAR (6)		NOT NULL	PRIMARY KEY,
	TenNguoiDan		NVARCHAR(30)	NOT NULL,   
	GioiTinh		BIT, --0: Nam, 1: Nữ
	NgaySinh		DATETIME,
	MaDanToc		VARCHAR (6),
	MaTonGiao		VARCHAR (6),
	MaNgheNghiep	VARCHAR (6),

	CONSTRAINT FK_MaNgheNghiep	FOREIGN KEY(MaNgheNghiep)		REFERENCES NGHENGHIEP(MaNgheNghiep),
	CONSTRAINT FK_MaDanToc		FOREIGN KEY(MaDanToc)			REFERENCES DANTOC(MaDanToc),
	CONSTRAINT FK_MaTonGiao		FOREIGN KEY(MaTonGiao)			REFERENCES TONGIAO(MaTonGiao)
)

INSERT INTO NGUOIDAN VALUES ('ND0001',N'Nguyễn Văn Tèo',	0,'01/02/1989','DT0001','TG0001','NN0001')
INSERT INTO NGUOIDAN VALUES ('ND0002',N'Đặng Thị Tươi',		1,'12/03/1990','DT0002','TG0002','NN0002')
INSERT INTO NGUOIDAN VALUES ('ND0003',N'Trần Văn Tí',		0,'02/28/2002','DT0003','TG0003','NN0003')
INSERT INTO NGUOIDAN VALUES ('ND0004',N'Đào Thị Mơ',		1,'07/04/1998','DT0004','TG0004','NN0004')
INSERT INTO NGUOIDAN VALUES ('ND0005',N'Trần Thị Tuyền',	1,'12/08/1978','DT0005','TG0005','NN0005')
INSERT INTO NGUOIDAN VALUES ('ND0006',N'Lâm Tuấn Hưng',		0,'04/14/1990','DT0006','TG0006','NN0006')
INSERT INTO NGUOIDAN VALUES ('ND0007',N'Bầu Văn Bí',		0,'05/26/1968','DT0003','TG0005','NN0004')
INSERT INTO NGUOIDAN VALUES ('ND0008',N'Lý Đại Sung',		0,'07/07/1987','DT0002','TG0002','NN0002')
INSERT INTO NGUOIDAN VALUES ('ND0009',N'Lã Quan Phùng',		0,'01/09/1975','DT0004','TG0004','NN0005')

INSERT INTO NGUOIDAN VALUES ('ND0010',N'Lê Quang Hải',		0,'10/10/1986','DT0005','TG0001','NN0001')
INSERT INTO NGUOIDAN VALUES ('ND0011',N'Bùi Minh Tuấn',		0,'10/10/1986','DT0005','TG0001','NN0001')
INSERT INTO NGUOIDAN VALUES ('ND0012',N'Phan Tấn Đạt',		0,'10/10/1986','DT0005','TG0001','NN0001')
INSERT INTO NGUOIDAN VALUES ('ND0013',N'Đặng Thanh Cang',	0,'10/10/1986','DT0005','TG0001','NN0001')
INSERT INTO NGUOIDAN VALUES ('ND0014',N'Nguyễn Anh Đức',	0,'10/10/1986','DT0005','TG0001','NN0001')
INSERT INTO NGUOIDAN VALUES ('ND0015',N'Nguyễn Tâm Hậu',	0,'10/10/1986','DT0005','TG0001','NN0001')
INSERT INTO NGUOIDAN VALUES ('ND0016',N'Hoàng Văn Hiếu',	0,'10/10/1986','DT0005','TG0001','NN0001')
INSERT INTO NGUOIDAN VALUES ('ND0017',N'Trần Thế Hoàn',		0,'10/10/1986','DT0005','TG0001','NN0001')
INSERT INTO NGUOIDAN VALUES ('ND0018',N'Nguyễn Quang Huy',	0,'10/10/1986','DT0005','TG0001','NN0001')
INSERT INTO NGUOIDAN VALUES ('ND0019',N'Nguyễn Hữu Minh',	0,'10/10/1986','DT0005','TG0001','NN0001')
INSERT INTO NGUOIDAN VALUES ('ND0020',N'Vương Trần Nguyên',	0,'10/10/1986','DT0005','TG0001','NN0001')

-----------------Căn hộ---------------------------
CREATE TABLE CANHO
(
	MaCanHo			VARCHAR (6)		NOT NULL	PRIMARY KEY,
	TangLau			INT,
	SoNguoi			INT				DEFAULT 0,
	TongPhiDichVu	INT				DEFAULT 0,	
)

INSERT INTO CANHO	(MaCanHo, TangLau)
VALUES				('CH0101',1)
INSERT INTO CANHO	(MaCanHo, TangLau)
VALUES				('CH0102',1)
INSERT INTO CANHO	(MaCanHo, TangLau)
VALUES				('CH0103',1)
INSERT INTO CANHO	(MaCanHo, TangLau)
VALUES				('CH0104',1)
INSERT INTO CANHO	(MaCanHo, TangLau)
VALUES				('CH0105',1)
INSERT INTO CANHO	(MaCanHo, TangLau)
VALUES				('CH0106',1)
INSERT INTO CANHO	(MaCanHo, TangLau)
VALUES				('CH0107',1)
INSERT INTO CANHO	(MaCanHo, TangLau)
VALUES				('CH0108',1)
INSERT INTO CANHO	(MaCanHo, TangLau)
VALUES				('CH0109',1)
INSERT INTO CANHO	(MaCanHo, TangLau)
VALUES				('CH0110',1)

INSERT INTO CANHO	(MaCanHo, TangLau)
VALUES				('CH0201',2)
INSERT INTO CANHO	(MaCanHo, TangLau)
VALUES				('CH0202',2)
INSERT INTO CANHO	(MaCanHo, TangLau)
VALUES				('CH0203',2)
INSERT INTO CANHO	(MaCanHo, TangLau)
VALUES				('CH0204',2)
INSERT INTO CANHO	(MaCanHo, TangLau)
VALUES				('CH0205',2)
INSERT INTO CANHO	(MaCanHo, TangLau)
VALUES				('CH0206',2)
INSERT INTO CANHO	(MaCanHo, TangLau)
VALUES				('CH0207',2)
INSERT INTO CANHO	(MaCanHo, TangLau)
VALUES				('CH0208',2)
INSERT INTO CANHO	(MaCanHo, TangLau)
VALUES				('CH0209',2)
INSERT INTO CANHO	(MaCanHo, TangLau)
VALUES				('CH0210',2)

INSERT INTO CANHO	(MaCanHo, TangLau)
VALUES				('CH0301',3)
INSERT INTO CANHO	(MaCanHo, TangLau)
VALUES				('CH0302',3)
INSERT INTO CANHO	(MaCanHo, TangLau)
VALUES				('CH0303',3)
INSERT INTO CANHO	(MaCanHo, TangLau)
VALUES				('CH0304',3)
INSERT INTO CANHO	(MaCanHo, TangLau)
VALUES				('CH0305',3)
INSERT INTO CANHO	(MaCanHo, TangLau)
VALUES				('CH0306',3)
INSERT INTO CANHO	(MaCanHo, TangLau)
VALUES				('CH0307',3)
INSERT INTO CANHO	(MaCanHo, TangLau)
VALUES				('CH0308',3)
INSERT INTO CANHO	(MaCanHo, TangLau)
VALUES				('CH0309',3)
INSERT INTO CANHO	(MaCanHo, TangLau)
VALUES				('CH0310',3)

INSERT INTO CANHO	(MaCanHo, TangLau)
VALUES				('CH0401',4)
INSERT INTO CANHO	(MaCanHo, TangLau)
VALUES				('CH0402',4)
INSERT INTO CANHO	(MaCanHo, TangLau)
VALUES				('CH0403',4)
INSERT INTO CANHO	(MaCanHo, TangLau)
VALUES				('CH0404',4)
INSERT INTO CANHO	(MaCanHo, TangLau)
VALUES				('CH0405',4)
INSERT INTO CANHO	(MaCanHo, TangLau)
VALUES				('CH0406',4)
INSERT INTO CANHO	(MaCanHo, TangLau)
VALUES				('CH0407',4)
INSERT INTO CANHO	(MaCanHo, TangLau)
VALUES				('CH0408',4)
INSERT INTO CANHO	(MaCanHo, TangLau)
VALUES				('CH0409',4)
INSERT INTO CANHO	(MaCanHo, TangLau)
VALUES				('CH0410',4)


-----------------Căn hộ - Người dân---------------------------
CREATE TABLE CANHO_NGUOIDAN
(
	MaNguoiDan		VARCHAR (6)		NOT NULL,
	MaCanHo			VARCHAR (6)		NOT NULL,
	
	CONSTRAINT PK_CANHO_NGUOIDAN	PRIMARY KEY(MaNguoiDan ,	MaCanHo),
	CONSTRAINT FK_MaNguoiDan		FOREIGN KEY(MaNguoiDan)		REFERENCES NGUOIDAN(MaNguoiDan) ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT FK_MaCanHo			FOREIGN KEY(MaCanHo)		REFERENCES CANHO(MaCanHo)
)
GO

--TRIGGER tg_CANHO_NGUOIDAN_insert
CREATE TRIGGER tg_CANHO_NGUOIDAN_insert ON CANHO_NGUOIDAN
FOR INSERT
AS
	DECLARE @MaCanHo VARCHAR(6)
	SELECT @MaCanHo=MaCanHo FROM INSERTED

	UPDATE CANHO
	SET SoNguoi=SoNguoi+1
	WHERE MaCanHo=@MaCanHo
GO

--TRIGGER tg_CANHO_NGUOIDAN_delete 
CREATE TRIGGER tg_CANHO_NGUOIDAN_delete ON CANHO_NGUOIDAN
FOR DELETE
AS
	DECLARE @MaCanHo VARCHAR(6), @dem INT
	DECLARE @MaNguoiDan VARCHAR(6)

	SELECT @MaCanHo=MaCanHo FROM DELETED
	SELECT @dem=(SELECT COUNT(*) FROM DELETED WHERE MaCanHo=@MaCanHo)
	SELECT @MaNguoiDan=MaNguoiDan FROM DELETED

	UPDATE CANHO
	SET SoNguoi=SoNguoi-@dem
	WHERE MaCanHo=@MaCanHo

	--DELETE FROM NGUOIDAN
	--WHERE MaNguoiDan=@MaNguoiDan
GO


INSERT INTO CANHO_NGUOIDAN VALUES ('ND0001','CH0101')
INSERT INTO CANHO_NGUOIDAN VALUES ('ND0002','CH0101')
INSERT INTO CANHO_NGUOIDAN VALUES ('ND0003','CH0102')
INSERT INTO CANHO_NGUOIDAN VALUES ('ND0004','CH0102')
INSERT INTO CANHO_NGUOIDAN VALUES ('ND0005','CH0103')
INSERT INTO CANHO_NGUOIDAN VALUES ('ND0006','CH0103')

INSERT INTO CANHO_NGUOIDAN VALUES ('ND0007','CH0104')
INSERT INTO CANHO_NGUOIDAN VALUES ('ND0008','CH0104')
INSERT INTO CANHO_NGUOIDAN VALUES ('ND0009','CH0105')
INSERT INTO CANHO_NGUOIDAN VALUES ('ND0010','CH0105')
INSERT INTO CANHO_NGUOIDAN VALUES ('ND0011','CH0106')
INSERT INTO CANHO_NGUOIDAN VALUES ('ND0012','CH0106')

INSERT INTO CANHO_NGUOIDAN VALUES ('ND0013','CH0107')
INSERT INTO CANHO_NGUOIDAN VALUES ('ND0014','CH0107')
INSERT INTO CANHO_NGUOIDAN VALUES ('ND0015','CH0108')
INSERT INTO CANHO_NGUOIDAN VALUES ('ND0016','CH0108')
INSERT INTO CANHO_NGUOIDAN VALUES ('ND0017','CH0109')
INSERT INTO CANHO_NGUOIDAN VALUES ('ND0018','CH0109')




-----------------Dịch vụ---------------------------
CREATE TABLE DICHVU
(
	MaDichVu	VARCHAR (6)		NOT NULL	PRIMARY KEY,
	TenDichVu 	NVARCHAR (10)	NOT NULL,
	DonGia		INT				NOT NULL,
)

INSERT INTO DICHVU VALUES('DV0001',N'Gửi xe'	,20000)
INSERT INTO DICHVU VALUES('DV0002',N'Đổ rác'	,25000)
INSERT INTO DICHVU VALUES('DV0003',N'Dọn dẹp'	,25000)
INSERT INTO DICHVU VALUES('DV0004',N'An ninh'	,30000)
INSERT INTO DICHVU VALUES('DV0005',N'Hồ bơi'	,35000)
INSERT INTO DICHVU VALUES('DV0006',N'Y tế'		,25000)



-----------------Căn hộ - Dịch vụ---------------------------
CREATE TABLE CANHO_DICHVU
(
	MaCanHo			VARCHAR (6)		NOT NULL,
	MaDichVu		VARCHAR (6)		NOT NULL,
	
	CONSTRAINT PK_CANHO_DICHVU	PRIMARY KEY(MaCanHo, MaDichVu),
	CONSTRAINT FK_MaDichVu2		FOREIGN KEY(MaDichVu)	REFERENCES DICHVU(MaDichVu),
	CONSTRAINT FK_MaCanHo2		FOREIGN KEY(MaCanHo)	REFERENCES CANHO(MaCanHo)
)

GO


CREATE TRIGGER tgCANHO_DICHVU_insert ON CANHO_DICHVU
FOR INSERT
AS
	DECLARE @MaCanHo VARCHAR(6)
	DECLARE @MaDichVu VARCHAR(6)
	DECLARE @DonGia INT

	SELECT @MaCanHo = MaCanHo FROM INSERTED
	SELECT @MaDichVu = MaDichVu FROM INSERTED
	SELECT @DonGia = DonGia FROM INSERTED INNER JOIN DICHVU ON INSERTED.MaDichVu=DICHVU.MaDichVu

	UPDATE CANHO
	SET TongPhiDichVu=TongPhiDichVu + @DonGia
	WHERE MaCanHo=@MaCanHo
GO

--DROP TRIGGER tg_CANHO_DICHVU_delete

CREATE TRIGGER tg_CANHO_DICHVU_delete ON CANHO_DICHVU
FOR DELETE
AS
	DECLARE @MaCanHo VARCHAR(6)
	DECLARE @MaDichVu VARCHAR(6)
	DECLARE @DonGia INT

	SELECT @MaCanHo=MaCanHo FROM DELETED
	SELECT @MaDichVu=MaDichVu FROM DELETED
	SELECT @DonGia = DonGia FROM DELETED INNER JOIN DICHVU ON DELETED.MaDichVu=DICHVU.MaDichVu
	
	UPDATE CANHO
	SET TongPhiDichVu=TongPhiDichVu - @DonGia
	WHERE MaCanHo=@MaCanHo

GO


INSERT INTO CANHO_DICHVU	(MaCanHo, MaDichVu)
VALUES						('CH0101','DV0001')

INSERT INTO CANHO_DICHVU	(MaCanHo, MaDichVu)
VALUES						('CH0102','DV0002')

INSERT INTO CANHO_DICHVU	(MaCanHo, MaDichVu)
VALUES						('CH0103','DV0003')

INSERT INTO CANHO_DICHVU	(MaCanHo, MaDichVu)
VALUES						('CH0104','DV0004')

INSERT INTO CANHO_DICHVU	(MaCanHo, MaDichVu)
VALUES						('CH0105','DV0005')

INSERT INTO CANHO_DICHVU	(MaCanHo, MaDichVu)
VALUES						('CH0106','DV0006')


-----------------Chức vụ---------------------------
CREATE TABLE CHUCVU
(
	MaChucVu	VARCHAR(6)	PRIMARY KEY,
	TenChucVu	NVARCHAR(30)
)

INSERT INTO CHUCVU VALUES ('CV0001',N'NV Thu Phí')
INSERT INTO CHUCVU VALUES ('CV0002',N'NV An Ninh')
INSERT INTO CHUCVU VALUES ('CV0003',N'NV Đổ Rác')
INSERT INTO CHUCVU VALUES ('CV0004',N'NV Bảo Vệ')
INSERT INTO CHUCVU VALUES ('CV0005',N'NV Tạp Vụ')
INSERT INTO CHUCVU VALUES ('CV0006',N'NV Tưới Cây')

-----------------Nhân viên---------------------------
CREATE TABLE NHANVIEN
(
	MaNhanVien	VARCHAR(6) PRIMARY KEY,
	TenNhanVien	NVARCHAR(30),
	GioiTinh	BIT,
	NgaySinh	DATETIME,
	DiaChi		NVARCHAR(30),
	DienThoai	NVARCHAR(30),
	MaChucVu	VARCHAR(6),

	CONSTRAINT FK_MaChucVu FOREIGN KEY (MaChucVu) REFERENCES CHUCVU(MaChucVu)
)

INSERT INTO NHANVIEN VALUES('NV0001',N'Nguyễn Văn Toàn'	,0,'12/12/1984',N'TP.HCM'	,'0941234567','CV0001')
INSERT INTO NHANVIEN VALUES('NV0002',N'Trần Văn Giàu'	,0,'08/14/1990',N'Bến Tre'	,'0971298129','CV0002')
INSERT INTO NHANVIEN VALUES('NV0003',N'Nguyễn Thị Lựu'	,1,'11/12/1975',N'Đồng Nai'	,'0930192876','CV0003')
INSERT INTO NHANVIEN VALUES('NV0004',N'Mai Văn Khê'		,0,'12/20/1978',N'Đồng Nai'	,'0911284625','CV0004')
INSERT INTO NHANVIEN VALUES('NV0005',N'Đào Anh Thư'		,1,'01/19/1981',N'Đồng Nai'	,'0901281736','CV0005')
INSERT INTO NHANVIEN VALUES('NV0006',N'Nguyễn Hải Đăng'	,0,'07/28/1991',N'Đồng Nai'	,'0951827351','CV0006')



---------------------------Quy định-----------------------------------
CREATE TABLE QUYDINH
(
	SoNguoiToiDa			INT		NOT NULL,--Số người tối đa trong một căn hộ
	TuoiNguoiDan_Min		INT		NOT NULL,--Tuổi người dân nhỏ nhất trong căn hộ 
	TuoiNguoiDan_Max		INT		NOT NULL,--Tuổi người dân lớn nhất trong căn hộ
	TuoiNhanVien_Min		INT		NOT NULL,--Tuổi nhân viên nhỏ nhất
	TuoiNhanVien_Max		INT		NOT NULL --Tuổi nhân viên lớn nhât
)

INSERT INTO QUYDINH VALUES(6,0,150,18,150)
---------------------------Thông báo----------------------------------
CREATE TABLE THONGBAO
(
	PostID			INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	ID_NguoiDang	VARCHAR(6),            -- (Người đăng sẽ duyệt ý kiến thông qua mail và đăng thông báo)
	NgayDang		DATETIME,
	NoiDung			NVARCHAR(1000), --
	GhiChu			NVARCHAR(200),  -- (Who đề xuất ý kiến)
	CONSTRAINT FK_NguoiDang FOREIGN KEY(ID_NguoiDang) 	REFERENCES NGUOIDUNG(MaND)--Thường là GĐ/PGĐ/QL sẽ đăng thông báo
)
INSERT INTO THONGBAO(ID_NguoiDang,NgayDang,NoiDung,GhiChu)
VALUES('US0003',GETDATE(),'Goodmorning Everybody!','From: Quan Ly')
---------------------------Tin nhắn-----------------------------------
CREATE TABLE TINNHAN
(
	PostMessID		INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	ID_NguoiDangTN	VARCHAR(6),     
	ID_NguoiNhanTN  VARCHAR(6),
	NgayDang		DATETIME,
	NoiDung			NVARCHAR(1000), --
	GhiChu			NVARCHAR(200),  -- (Ghi chú thêm)
	CONSTRAINT FK_NguoiDangTN FOREIGN KEY(ID_NguoiDangTN) 	REFERENCES NGUOIDUNG(MaND),
	CONSTRAINT FK_NguoiNhanTN FOREIGN KEY(ID_NguoiNhanTN) 	REFERENCES NGUOIDUNG(MaND)
)
INSERT INTO TINNHAN(ID_NguoiDangTN,ID_NguoiNhanTN,NgayDang,NoiDung,GhiChu)
VALUES('US0003','US0002',GETDATE(),'I Love You','<3')

