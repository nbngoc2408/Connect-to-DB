use QLSV
go

create or alter proc SP_INS_SINHVIEN (@MaSV nvarchar(20), @HoTen nvarchar(100),
									  @NgaySinh varchar(100), @DiaChi nvarchar(200),
									  @MaLop nvarchar(20), @TenDN nvarchar(100), @MatKhau varchar(40))
as
	insert into SINHVIEN values (@MaSV, @HoTen, cast (@NgaySinh as date), @DiaChi, @MaLop, @TenDN,
								CONVERT(varbinary, hashbytes('MD5', @MatKhau)))
go

EXEC SP_INS_SINHVIEN 'SV01', 'NGUYEN VAN A', '1/1/1990', '280 AN
DUONG VUONG', 'CNTT-K35', 'NVA', '123456'
go

create or alter proc SP_INS_NHANVIEN (@MaNV nvarchar(20), @HoTen nvarchar(100),
								 @Email varchar(20), @Luong int,
								 @TenDN nvarchar(100), @MatKhau varchar(40))
as
	open symmetric key KEY_1
	decryption by password = '19120603'
	declare @Luong_CT varbinary(max)
	set @Luong_CT = ENCRYPTBYKEY(key_guid('KEY_1'),CONVERT(varchar, @Luong))
	insert into NHANVIEN values (@MaNV, @HoTen, @Email, @Luong_CT, @TenDN, CONVERT(varbinary, hashbytes('SHA1', @MatKhau)))
	close symmetric key KEY_1
go

EXEC SP_INS_NHANVIEN 'NV01', 'NGUYEN VAN A', 'NVA@', 3000000,
'NVA', '12345'
go

create or alter proc SP_SEL_NHANVIEN 
as
	open symmetric key KEY_1
	decryption by password = '19120603'
	select nv.MANV, nv.HOTEN, nv.EMAIL, CONVERT(varchar,DECRYPTBYKEY(nv.LUONG)) as LUONGNV
	from NHANVIEN nv
	close symmetric key KEY_1
go

exec SP_SEL_NHANVIEN