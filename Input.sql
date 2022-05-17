/*-------------------------------------------
MASV: 19120603
HO TEN: Nguyễn Bá Ngọc
LAB: 03
Ngày 16/4/2022
--------------------------------------------*/
--CAU LENH TAO DB
create database QLSV
--CAU LENH TAO TABLE
use QLSV
go

create table SINHVIEN
(
	MASV varchar(20),
	HOTEN nvarchar(100) not null,
	NGAYSINH datetime,
	DIACHI nvarchar(200),
	MALOP varchar(20),
	TENDN nvarchar(100) not null,
	MATKHAU varbinary(max) not null
	primary key (MASV)
)

create table NHANVIEN
(
	MANV varchar(20),
	HOTEN nvarchar(100) not null,
	EMAIL varchar(20),
	LUONG varbinary(max),
	TENDN nvarchar(100) not null,
	MATKHAU varbinary(max) not null
	primary key (MANV)
)

create table LOP
(
	MALOP varchar(20),
	TENLOP nvarchar(100) not null,
	MANV varchar(20)
	primary key (MALOP)
)

alter table LOP add constraint Fk_L_NV foreign key (MANV) references NHANVIEN(MANV)
alter table SINHVIEN add constraint Fk_SV_L foreign key (MALOP) references LOP(MALOP)