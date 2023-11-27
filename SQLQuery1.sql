use adc

CREATE TABLE KhachHang (
    MaKH char(10) PRIMARY KEY ,
    TenKH NVARCHAR(50),
    DiaChi NVARCHAR(250) null,
    SDT NVARCHAR(15) null,
    
);

select * from hoadons
CREATE TABLE feedbackcustomer (
    MaFB INT IDENTITY(1,1) NOT NULL PRIMARY KEY ,
    TenKH NVARCHAR(50),
    Email NVARCHAR(100) null,
    SDT NVARCHAR(15) null,
	NoiDung NVARCHAR(250) null,
    
);

-- Chèn dữ liệu vào bảng feedbackcustomer
INSERT INTO feedbackcustomer (TenKH, Email, SDT, NoiDung)
VALUES 
    (N'Nguyễn Quốc Việt', N'email1@example.com', '0123456789', N'Hàng đẹp'),
    (N'Đức', N'email2@example.com', '0987654311', N'Chỉ còn thừa nhiều'),
    (N'Hưng', N'email3@example.com', '0987654321', N'Hàng bị rách');






select * from HoaDons
drop table KhachHang


CREATE TABLE HoaDons(
    MaHoaDon INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    TrangThai BIT DEFAULT 0,
    NgayTao DATETIME,
    NgayDuyet DATETIME,
    TongGia DECIMAL(18, 0),
    TenKH NVARCHAR(50),
    Diachi NVARCHAR(250),
    Email NVARCHAR(50),
    SDT NVARCHAR(50),
    DiaChiGiaoHang NVARCHAR(350)
);


CREATE TABLE ChiTietHoaDons(
    MaChiTietHoaDon INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    MaHoaDon INT foreign key (MaHoaDon) references HoaDons(MaHoaDon) on delete cascade on update cascade,
    MaSanPham INT foreign key (MaSanPham) references SanPhams(MaSanPham) on delete cascade on update cascade,
    SoLuong INT,
    TongGia DECIMAL(18, 0)
);



drop table sanphams
select * from sanphams
CREATE TABLE [dbo].[SanPhams](
	[MaSanPham] [int] IDENTITY(1,1) NOT NULL,
	[TenSanPham] [nvarchar](150) NULL,
	[Gia] [decimal](18, 0) NULL,
	[SoLuong] [int] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[MaSanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
ALTER TABLE dbo.SanPhams
ADD TrangThai nvarchar(50) NULL;




-- Chèn một sản phẩm vào bảng SanPhams
INSERT INTO SanPhams (TenSanPham, Gia, SoLuong)
VALUES (N'Áo phông đen', 320.000, 50);

-- Chèn một sản phẩm khác
INSERT INTO SanPhams (TenSanPham, Gia, SoLuong)
VALUES (N'Áo phông đỏ', 250.000, 30);

-- Chèn sản phẩm khác nữa
INSERT INTO SanPhams (TenSanPham, Gia, SoLuong)
VALUES (N'Áo phông xanh', 275.000, 20);

INSERT INTO SanPhams (TenSanPham, Gia, SoLuong)
VALUES (N'Áo phông trắng', 375.000, 20);

UPDATE SanPhams
SET TrangThai = N'Bán chạy'
WHERE TenSanPham = N'Áo phông đen';

UPDATE SanPhams
SET TrangThai = N'Giám giá'
WHERE TenSanPham = N'Áo phông đỏ';

UPDATE SanPhams
SET TrangThai = N'Bán chạy'
WHERE TenSanPham = N'Áo phông xanh';

UPDATE SanPhams
SET TrangThai = N'Giảm giá'
WHERE TenSanPham = N'Áo phông trắng';




drop table donhangnhap
CREATE TABLE donhangnhap (
    MaDonHangNhap INT IDENTITY(1, 1) PRIMARY KEY,
    MaSanPham INT,
    TenSanPham NVARCHAR(150),
    SoLuong INT NULL,
    NgayNhap DATETIME,
    FOREIGN KEY (MaSanPham) REFERENCES SanPhams(MaSanPham)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);




-- Chèn một đơn hàng nhập
INSERT INTO donhangnhap (MaSanPham, TenSanPham, SoLuong, NgayNhap)
VALUES (1, N'Áo phông đen', 50, '2023-11-01');

-- Chèn một đơn hàng nhập khác
INSERT INTO donhangnhap (MaSanPham, TenSanPham, SoLuong, NgayNhap)
VALUES (2, N'Áo phông đỏ', 30, '2023-11-02');

-- Chèn đơn hàng nhập khác nữa
INSERT INTO donhangnhap (MaSanPham, TenSanPham, SoLuong, NgayNhap)
VALUES (3, N'Áo phông xanh', 20, '2023-11-03');

INSERT INTO donhangnhap (MaSanPham, TenSanPham, SoLuong, NgayNhap)
VALUES (4, N'Áo phông trắng', 60, '2023-11-01');







CREATE TABLE ChiTietTaiKhoans(
    MaChitietTaiKhoan INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    MaTaiKhoan INT foreign key (MaTaiKhoan) references TaiKhoans(MaTaiKhoan) on delete cascade on update cascade,
	MaLoaitaikhoan INT foreign key (MaLoaitaikhoan) references LoaiTaiKhoans(MaLoaitaikhoan) on delete cascade on update cascade,
    HoTen NVARCHAR(50),
    DiaChi NVARCHAR(250),
    SoDienThoai NVARCHAR(11),
    AnhDaiDien NVARCHAR(MAX)
);

CREATE TABLE LoaiTaiKhoans(
    MaLoaitaikhoan INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    TenLoai NVARCHAR(50),
    MoTa NVARCHAR(250)
);


CREATE TABLE TaiKhoans(
    MaTaiKhoan INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    TenTaiKhoan NVARCHAR(50),
    MatKhau NVARCHAR(50),
    Email NVARCHAR(150)
);


select * from taikhoans


INSERT INTO LoaiTaiKhoans (TenLoai, MoTa)
VALUES 
('Admin', N'Tài khoản quản trị hệ thống'),
('KhachHang', N'Tài khoản người dùng thông thường'),
('KhachHang', N'Tài khoản người dùng thông thường'),
('KhachHang', N'Tài khoản người dùng thông thường'),
('KhachHang', N'Tài khoản người dùng thông thường')


INSERT INTO TaiKhoans (TenTaiKhoan, MatKhau, Email)
VALUES 
( 'admin1', '1', 'admin1@example.com'),
( 'user1', '1', 'user1@example.com'),
( 'user2', '1', 'user1@example.com'),
('user3', '1', 'user1@example.com'),
( 'user4', '1', 'user1@example.com')


INSERT INTO ChiTietTaiKhoans (MaTaiKhoan,MaLoaitaikhoan, HoTen, DiaChi, SoDienThoai, AnhDaiDien)
VALUES 
(1,1, 'Admin 1', N'123 Đường Admin, Quận 1, TP.HCM', '0987654321', 'admin1.jpg'),
(2,2, 'User 1', N'456 Đường User, Quận 2, TP.HCM', '0123456789', 'user1.jpg'),
(3,3, 'User 2', N'456 Đường User, Quận 2, TP.HCM', '0123456789', 'user1.jpg'),
(4,4, 'User 3', N'456 Đường User, Quận 2, TP.HCM', '0123456789', 'user1.jpg'),
(5,5, 'User 4', N'456 Đường User, Quận 2, TP.HCM', '0123456789', 'user1.jpg')









INSERT INTO KhachHang (MaKH, TenKH, DiaChi, SDT)
VALUES ('1', N'Nguyễn Quốc Việt', N'Hưng Yên', '0123456789');
INSERT INTO KhachHang (MaKH, TenKH, DiaChi, SDT)
VALUES ('3', N'Việt', N'Hà Nội', '0123456789');

select * from KhachHang

drop proc KH_get_by_id

CREATE PROCEDURE KH_get_by_id
    @MaID char(10)
AS
BEGIN
    DECLARE @ErrorMessage NVARCHAR(MAX);

    -- Kiểm tra xem @MaID có tồn tại trong bảng KhachHang không
    IF NOT EXISTS (SELECT 1 FROM KhachHang WHERE MaKH = @MaID)
    BEGIN
        SET @ErrorMessage = 'Không tìm thấy khách hàng với MaKH = ' + @MaID;
        
        RETURN;
    END;

    -- Lấy thông tin của khách hàng dựa trên @MaID
    SELECT * FROM KhachHang WHERE MaKH = @MaID;
END;


CREATE PROCEDURE create_khach_hang
    @MaKH char(10),
    @TenKH NVARCHAR(50),
    @DiaChi NVARCHAR(100),
    @SDT NVARCHAR(15)
AS
BEGIN
    

    -- Thêm dữ liệu mới vào bảng KhachHang
    INSERT INTO KhachHang (MaKH, TenKH, DiaChi, SDT)
    VALUES (@MaKH, @TenKH, @DiaChi, @SDT);
    

END;




CREATE PROCEDURE sp_khach_update
    @MaKH char(10),
    @TenKH NVARCHAR(50),
    @DiaChi NVARCHAR(100),
    @SDT NVARCHAR(15)
AS
BEGIN
    UPDATE KhachHang
    SET 
        TenKH = @TenKH,
        DiaChi = @DiaChi,
        SDT = @SDT
    WHERE
        MaKH = @MaKH;
END;


CREATE PROCEDURE sp_khach_delete
    @MaKH char(10)
AS
BEGIN
    DELETE FROM KhachHang
    WHERE MaKH = @MaKH;
END;


drop proc sp_khach_search

create PROCEDURE sp_khach_search (@page_index  INT, 
                                       @page_size   INT,
									   @ten_khach Nvarchar(50),
									   @dia_chi Nvarchar(100)
									   )
AS
    BEGIN
        DECLARE @RecordCount BIGINT;
        IF(@page_size <> 0)
            BEGIN
						SET NOCOUNT ON;
                        SELECT(ROW_NUMBER() OVER(
                              ORDER BY TenKH ASC)) AS RowNumber, 
                              k.MaKH,
							  k.TenKH,
							  k.DiaChi,
							  k.SDT
                        INTO #Results1
                        FROM KhachHang AS k
					    WHERE  (@ten_khach = '' Or k.TenKH like N'%'+@ten_khach+'%') and						
						(@dia_chi = '' Or k.DiaChi like N'%'+@dia_chi+'%');                   
                        SELECT @RecordCount = COUNT(*)
                        FROM #Results1;
                        SELECT *, 
                               @RecordCount AS RecordCount
                        FROM #Results1
                        WHERE ROWNUMBER BETWEEN(@page_index - 1) * @page_size + 1 AND(((@page_index - 1) * @page_size + 1) + @page_size) - 1
                              OR @page_index = -1;
                        DROP TABLE #Results1; 
            END;
            ELSE
            BEGIN
						SET NOCOUNT ON;
                        SELECT(ROW_NUMBER() OVER(
                              ORDER BY TenKH ASC)) AS RowNumber, 
                              k.MaKH,
							  k.TenKH,
							  k.DiaChi,
							  k.SDT
                        INTO #Results2
                        FROM KhachHang AS k
					    WHERE  (@ten_khach = '' Or k.TenKH like N'%'+@ten_khach+'%') and						
						(@dia_chi = '' Or k.DiaChi like N'%'+@dia_chi+'%');                   
                        SELECT @RecordCount = COUNT(*)
                        FROM #Results2;
                        SELECT *, 
                               @RecordCount AS RecordCount
                        FROM #Results2;                        
                        DROP TABLE #Results1; 
        END;
    END;






CREATE PROCEDURE KH_get_all
AS
BEGIN
    SELECT * FROM KhachHang;
END;


CREATE PROCEDURE SP_get_all
AS
BEGIN
    SELECT * FROM SanPhams;
END;



CREATE PROCEDURE sp_sanpham_search
    @page_index INT,
    @page_size INT,
    @ten_sanpham NVARCHAR(50),
    @trang_thai NVARCHAR(50)
AS
BEGIN
    DECLARE @RecordCount BIGINT;

    IF (@page_size <> 0)
    BEGIN
        SET NOCOUNT ON;

        SELECT (ROW_NUMBER() OVER (ORDER BY TenSanPham ASC)) AS RowNumber,
               s.MaSanPham,
               s.TenSanPham,
               s.Gia,
               s.SoLuong,
               s.TrangThai
        INTO #Results1
        FROM SanPhams AS s
        WHERE (@ten_sanpham = '' OR s.TenSanPham LIKE N'%' + @ten_sanpham + '%')
          AND (@trang_thai = '' OR s.TrangThai LIKE N'%' + @trang_thai + '%');

        SELECT @RecordCount = COUNT(*)
        FROM #Results1;

        SELECT *,
               @RecordCount AS RecordCount
        FROM #Results1
        WHERE RowNumber BETWEEN (@page_index - 1) * @page_size + 1 AND ((@page_index - 1) * @page_size + 1) + @page_size - 1
           OR @page_index = -1;

        DROP TABLE #Results1;
    END
    ELSE
    BEGIN
        SET NOCOUNT ON;

        SELECT (ROW_NUMBER() OVER (ORDER BY TenSanPham ASC)) AS RowNumber,
               s.MaSanPham,
               s.TenSanPham,
               s.Gia,
               s.SoLuong,
               s.TrangThai
        INTO #Results2
        FROM SanPhams AS s
        WHERE (@ten_sanpham = '' OR s.TenSanPham LIKE N'%' + @ten_sanpham + '%')
          AND (@trang_thai = '' OR s.TrangThai LIKE N'%' + @trang_thai + '%');

        SELECT @RecordCount = COUNT(*)
        FROM #Results2;

        SELECT *,
               @RecordCount AS RecordCount
        FROM #Results2;

        DROP TABLE #Results1;
    END;
END;


CREATE PROCEDURE Feedback_get_all
AS
BEGIN
    SELECT * FROM feedbackcustomer;
END;

CREATE PROCEDURE create_feedbackcustomer
    @TenKH NVARCHAR(50),
    @Email NVARCHAR(100),
    @SDT NVARCHAR(15),
    @NoiDung NVARCHAR(250)
AS
BEGIN
    -- Thêm dữ liệu mới vào bảng feedbackcustomer
    INSERT INTO feedbackcustomer (TenKH, Email, SDT, NoiDung)
    VALUES (@TenKH, @Email, @SDT, @NoiDung);
END;






drop proc sp_hoa_don_update

CREATE PROCEDURE hoadon_get_all
AS
BEGIN
    SELECT * FROM HoaDons;
END;

create PROCEDURE [dbo].[sp_hoa_don_update]
(@MaHoaDon        int, 
 @TenKH              NVARCHAR(50), 
 @Diachi          NVARCHAR(250), 
 @TrangThai         bit,  
 @list_json_chitiethoadon NVARCHAR(MAX)
)
AS
    BEGIN
		UPDATE HoaDons
		SET
			TenKH  = @TenKH ,
			Diachi = @Diachi,
			TrangThai = @TrangThai
		WHERE MaHoaDon = @MaHoaDon;
		
		IF(@list_json_chitiethoadon IS NOT NULL) 
		BEGIN
			 -- Insert data to temp table 
		   SELECT
			  JSON_VALUE(p.value, '$.maChiTietHoaDon') as maChiTietHoaDon,
			  JSON_VALUE(p.value, '$.maHoaDon') as maHoaDon,
			  JSON_VALUE(p.value, '$.maSanPham') as maSanPham,
			  JSON_VALUE(p.value, '$.soLuong') as soLuong,
			  JSON_VALUE(p.value, '$.tongGia') as tongGia,
			  JSON_VALUE(p.value, '$.status') AS status 
			  INTO #Results 
		   FROM OPENJSON(@list_json_chitiethoadon) AS p;
		 
		 -- Insert data to table with STATUS = 1;
			INSERT INTO ChiTietHoaDons (MaSanPham, 
						  MaHoaDon,
                          SoLuong, 
                          TongGia ) 
			   SELECT
				  #Results.maSanPham,
				  @MaHoaDon,
				  #Results.soLuong,
				  #Results.tongGia			 
			   FROM  #Results 
			   WHERE #Results.status = '1' 
			
			-- Update data to table with STATUS = 2
			  UPDATE ChiTietHoaDons 
			  SET
				 SoLuong = #Results.soLuong,
				 TongGia = #Results.tongGia
			  FROM #Results 
			  WHERE  ChiTietHoaDons.maChiTietHoaDon = #Results.maChiTietHoaDon AND #Results.status = '2';
			
			-- Delete data to table with STATUS = 3
			DELETE C
			FROM ChiTietHoaDons C
			INNER JOIN #Results R
				ON C.maChiTietHoaDon=R.maChiTietHoaDon
			WHERE R.status = '3';
			DROP TABLE #Results;
		END;
        SELECT '';
    END;



alter PROCEDURE [dbo].[sp_hoadon_create]
(@TenKH              NVARCHAR(50), 
 @Diachi          NVARCHAR(250), 
 @list_json_chitiethoadon NVARCHAR(MAX)
)
AS
    BEGIN
		DECLARE @MaHoaDon INT;
        INSERT INTO HoaDons
                (TenKH, 
                 Diachi           
                )
                VALUES
                (@TenKH, 
                 @Diachi
                );

				SET @MaHoaDon = (SELECT SCOPE_IDENTITY());
                IF(@list_json_chitiethoadon IS NOT NULL)
                    BEGIN
                        INSERT INTO ChiTietHoaDons
						 (MaSanPham, 
						  MaHoaDon,
                          SoLuong, 
                          TongGia               
                        )
                    SELECT JSON_VALUE(p.value, '$.maSanPham'), 
                            @MaHoaDon, 
                            JSON_VALUE(p.value, '$.soLuong'), 
                            JSON_VALUE(p.value, '$.tongGia')    
                    FROM OPENJSON(@list_json_chitiethoadon) AS p;
                END;
        SELECT '';
    END;





create PROCEDURE [dbo].[sp_thong_ke_khach] (@page_index  INT, 
                                       @page_size   INT,
									   @ten_khach Nvarchar(50),
									   @fr_NgayTao datetime, 
									   @to_NgayTao datetime
									   )
AS
    BEGIN
        DECLARE @RecordCount BIGINT;
        IF(@page_size <> 0)
            BEGIN
						SET NOCOUNT ON;
                        SELECT(ROW_NUMBER() OVER(
                              ORDER BY h.NgayTao ASC)) AS RowNumber, 
                              s.MaSanPham,
							  s.TenSanPham,
							  c.SoLuong,
							  c.TongGia,
							  h.NgayTao,
							  h.TenKH,
							  h.Diachi
                        INTO #Results1
                        FROM HoaDons  h
						inner join ChiTietHoaDons c on c.MaHoaDon = h.MaHoaDon
						inner join SanPhams s on s.MaSanPham = c.MaSanPham
					    WHERE  (@ten_khach = '' Or h.TenKH like N'%'+@ten_khach+'%') and						
						((@fr_NgayTao IS NULL
                        AND @to_NgayTao IS NULL)
                        OR (@fr_NgayTao IS NOT NULL
                            AND @to_NgayTao IS NULL
                            AND h.NgayTao >= @fr_NgayTao)
                        OR (@fr_NgayTao IS NULL
                            AND @to_NgayTao IS NOT NULL
                            AND h.NgayTao <= @to_NgayTao)
                        OR (h.NgayTao BETWEEN @fr_NgayTao AND @to_NgayTao))              
                        SELECT @RecordCount = COUNT(*)
                        FROM #Results1;
                        SELECT *, 
                               @RecordCount AS RecordCount
                        FROM #Results1
                        WHERE ROWNUMBER BETWEEN(@page_index - 1) * @page_size + 1 AND(((@page_index - 1) * @page_size + 1) + @page_size) - 1
                              OR @page_index = -1;
                        DROP TABLE #Results1; 
            END;
            ELSE
            BEGIN
						SET NOCOUNT ON;
                        SELECT(ROW_NUMBER() OVER(
                              ORDER BY h.NgayTao ASC)) AS RowNumber, 
                              s.MaSanPham,
							  s.TenSanPham,
							  c.SoLuong,
							  c.TongGia,
							  h.NgayTao,
							  h.TenKH,
							  h.Diachi
                        INTO #Results2
                        FROM HoaDons  h
						inner join ChiTietHoaDons c on c.MaHoaDon = h.MaHoaDon
						inner join SanPhams s on s.MaSanPham = c.MaSanPham
					    WHERE  (@ten_khach = '' Or h.TenKH like N'%'+@ten_khach+'%') and						
						((@fr_NgayTao IS NULL
                        AND @to_NgayTao IS NULL)
                        OR (@fr_NgayTao IS NOT NULL
                            AND @to_NgayTao IS NULL
                            AND h.NgayTao >= @fr_NgayTao)
                        OR (@fr_NgayTao IS NULL
                            AND @to_NgayTao IS NOT NULL
                            AND h.NgayTao <= @to_NgayTao)
                        OR (h.NgayTao BETWEEN @fr_NgayTao AND @to_NgayTao))
SELECT @RecordCount = COUNT(*)
                        FROM #Results2;
                        SELECT *, 
                               @RecordCount AS RecordCount
                        FROM #Results2                        
                        DROP TABLE #Results2; 
        END;
    END;





CREATE PROCEDURE HD_get_all
AS
BEGIN
    SELECT * FROM HoaDons;
END;



create PROCEDURE [dbo].[sp_hoadon_get_by_id](@MaHoaDon int)
AS
    BEGIN
        SELECT h.*, 
        (
            SELECT c.*
            FROM ChiTietHoaDons AS c
            WHERE h.MaHoaDon = c.MaHoaDon FOR JSON PATH
        ) AS list_json_chitiethoadon
        FROM HoaDons AS h
        WHERE  h.MaHoaDon = @MaHoaDon;
    END;



create PROCEDURE [dbo].[sp_login](@taikhoan nvarchar(50), @matkhau nvarchar(50))
AS
    BEGIN
      SELECT  *
      FROM TaiKhoans
      where TenTaiKhoan= @taikhoan and MatKhau = @matkhau;
    END;





CREATE PROCEDURE donhangnhap_get_all
AS
BEGIN
    SELECT * FROM donhangnhap;
END;






drop proc sp_donhangnhap_search

CREATE PROCEDURE sp_donhangnhap_search
    @page_index INT,
    @page_size INT,
    @ngay_thong_ke DATETIME
AS
BEGIN
    DECLARE @RecordCount BIGINT;

    IF @page_size <> 0
    BEGIN
        SET NOCOUNT ON;

        SELECT
            (ROW_NUMBER() OVER (ORDER BY DH.NgayNhap ASC)) AS RowNumber,
            DH.MaDonHangNhap,
			S.MaSanPham,
            S.TenSanPham,
            DH.SoLuong,
            DH.NgayNhap
        INTO #Results1
        FROM donhangnhap DH
        INNER JOIN SanPhams S ON DH.MaSanPham = S.MaSanPham
        WHERE DH.NgayNhap = @ngay_thong_ke;

        SELECT @RecordCount = COUNT(*)
        FROM #Results1;

        SELECT *,
            @RecordCount AS RecordCount
        FROM #Results1
        WHERE RowNumber BETWEEN (@page_index - 1) * @page_size + 1 AND ((@page_index - 1) * @page_size + 1) + @page_size - 1
        OR @page_index = -1;

        DROP TABLE #Results1;
    END
    ELSE
    BEGIN
        SET NOCOUNT ON;

        SELECT
            (ROW_NUMBER() OVER (ORDER BY DH.NgayNhap ASC)) AS RowNumber,
            DH.MaDonHangNhap,
			S.MaSanPham,
            S.TenSanPham,
            DH.SoLuong,
            DH.NgayNhap
        INTO #Results2
        FROM donhangnhap DH
        INNER JOIN SanPhams S ON DH.MaSanPham = S.MaSanPham
        WHERE DH.NgayNhap = @ngay_thong_ke;

        SELECT @RecordCount = COUNT(*)
        FROM #Results2;

        SELECT *,
            @RecordCount AS RecordCount
        FROM #Results2;

        DROP TABLE #Results2;
    END;
END


drop proc create_donhangnhap
CREATE PROCEDURE create_donhangnhap
    @MaSanPham INT,
    @TenSanPham NVARCHAR(150),
    @SoLuong INT,
    @NgayNhap DATETIME
AS
BEGIN
    -- Thêm dữ liệu mới vào bảng donhangnhap
    INSERT INTO donhangnhap (MaSanPham, TenSanPham, SoLuong, NgayNhap)
    VALUES (@MaSanPham, @TenSanPham, @SoLuong, @NgayNhap);
END;


select * from sanphams



CREATE PROCEDURE sp_donhangnhap_update
    @MaDonHangNhap INT,
    @MaSanPham INT,
    @TenSanPham NVARCHAR(150),
    @SoLuong INT,
    @NgayNhap DATETIME
AS
BEGIN
    UPDATE donhangnhap
    SET 
        MaSanPham = @MaSanPham,
        TenSanPham = @TenSanPham,
        SoLuong = @SoLuong,
        NgayNhap = @NgayNhap
    WHERE
        MaDonHangNhap = @MaDonHangNhap;
END;



CREATE PROCEDURE sp_donhangnhap_delete
    @MaDonHangNhap INT
AS
BEGIN
    DELETE FROM donhangnhap
    WHERE MaDonHangNhap = @MaDonHangNhap;
END;





CREATE TABLE [dbo].[HoaDon](
	[MaHoaDon] [int] IDENTITY(1,1) NOT NULL,
	[MaSanPham] [int] NULL,
	[MaKH] [char](10) NULL,
	[NgayTao] [datetime] NULL,
	[NgayDuyet] [datetime] NULL,
	[TongGia] [decimal](18, 0) NULL,
	[DiaChiGiaoHang] [nvarchar](350) NULL,
	CONSTRAINT [PK_Bills] PRIMARY KEY CLUSTERED 
	(
		[MaHoaDon] ASC
	) WITH (
		PAD_INDEX = OFF, 
		STATISTICS_NORECOMPUTE = OFF, 
		IGNORE_DUP_KEY = OFF, 
		ALLOW_ROW_LOCKS = ON, 
		ALLOW_PAGE_LOCKS = ON, 
		OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF
	) ON [PRIMARY],
	FOREIGN KEY ([MaSanPham]) REFERENCES [SanPhams]([MaSanPham])
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	FOREIGN KEY ([MaKH]) REFERENCES [KhachHang]([MaKH])
		ON DELETE CASCADE
		ON UPDATE CASCADE
) ON [PRIMARY];

-- Chèn dữ liệu vào bảng HoaDon
INSERT INTO [dbo].[HoaDon] (MaSanPham, MaKH, NgayTao, NgayDuyet, TongGia, DiaChiGiaoHang)
VALUES
    (1, 1, '2023-11-01', '2023-11-02', 150000, N'Hà Nội'),
    (2, 11, '2023-11-03', '2023-11-04', 200000, N'Quảng Ninh'),
    (3, 14, '2023-11-05', '2023-11-06', 180000, N'Đà Lạt');
select * from khachhang
select * from SanPhams





CREATE PROCEDURE [dbo].[sp_hoadon_search]
    @page_index INT,
    @page_size INT,
    @fr_NgayTao DATETIME,
    @to_NgayTao DATETIME,
    @fr_NgayDuyet DATETIME,
    @to_NgayDuyet DATETIME
AS
BEGIN
    DECLARE @RecordCount BIGINT;

    IF (@page_size <> 0)
    BEGIN
        SET NOCOUNT ON;

        SELECT
            (ROW_NUMBER() OVER (ORDER BY NgayTao ASC)) AS RowNumber,
            MaHoaDon,
            MaSanPham,
            MaKH,
            NgayTao,
            NgayDuyet,
            TongGia,
            DiaChiGiaoHang
        INTO #Results1
        FROM HoaDon
        WHERE
            (NgayTao BETWEEN @fr_NgayTao AND @to_NgayTao) OR
            (NgayDuyet BETWEEN @fr_NgayDuyet AND @to_NgayDuyet);

        SELECT @RecordCount = COUNT(*)
        FROM #Results1;

        SELECT
            *,
            @RecordCount AS RecordCount
        FROM #Results1
        WHERE
            RowNumber BETWEEN (@page_index - 1) * @page_size + 1 AND ((@page_index - 1) * @page_size + 1) + @page_size - 1
            OR @page_index = -1;

        DROP TABLE #Results1;
    END
    ELSE
    BEGIN
        SET NOCOUNT ON;

        SELECT
            (ROW_NUMBER() OVER (ORDER BY NgayTao ASC)) AS RowNumber,
            MaHoaDon,
            MaSanPham,
            MaKH,
            NgayTao,
            NgayDuyet,
            TongGia,
            DiaChiGiaoHang
        INTO #Results2
        FROM HoaDon
        WHERE
            (NgayTao BETWEEN @fr_NgayTao AND @to_NgayTao) OR
            (NgayDuyet BETWEEN @fr_NgayDuyet AND @to_NgayDuyet);

        SELECT @RecordCount = COUNT(*)
        FROM #Results2;

        SELECT
            *,
            @RecordCount AS RecordCount
        FROM #Results2;

        DROP TABLE #Results2;
    END;
END;



create proc sp_getbyidchitiettaikhoan(@MaTaiKhoan int)
as
begin
	select h.*,c.TenLoai
	from ChiTietTaiKhoans h
	inner join LoaiTaiKhoans c on h.MaLoaitaikhoan=c.MaLoaitaikhoan
	where MaTaiKhoan =@MaTaiKhoan
end



create proc sp_getbyidchitiethoadon(@MaHoaDon int)
as
begin
	select h.MaHoaDon,
			c.MaChiTietHoaDon,
							  c.MaSanPham,
                              s.TenSanPham,
							  c.SoLuong,
							  c.TongGia
                        FROM HoaDons AS h
						inner join ChiTietHoaDons c on c.MaHoaDon = h.MaHoaDon
						inner join SanPhams s on s.MaSanPham = c.MaSanPham
	where h.MaHoaDon = @MaHoaDon
end



create proc sp_create_hoadon(
@TrangThai bit,
@NgayTao datetime,
@NgayDuyet datetime,
@TongGia decimal(18,0),
@TenKH nvarchar(50),
@Diachi nvarchar(250),
@Email nvarchar(50),
@SDT nvarchar(50),
@DiaChiGiaoHang nvarchar(350),
@list_json_chitiet_hoadon NVARCHAR(MAX)
)
as
BEGIN
		DECLARE @MaHoaDon INT;
		BEGIN
			INSERT INTO HoaDons
					(TrangThai,
					NgayTao ,
					NgayDuyet ,
					TongGia ,
					TenKH ,
					Diachi ,
					Email ,
					SDT ,
					DiaChiGiaoHang
					)
					VALUES
					(@TrangThai,
					@NgayTao ,
					@NgayDuyet ,
					@TongGia ,
					@TenKH ,
					@Diachi ,
					@Email ,
					@SDT ,
					@DiaChiGiaoHang
					);

					SET @MaHoaDon = (SELECT SCOPE_IDENTITY());
					IF(@list_json_chitiet_hoadon IS NOT NULL)
						BEGIN
							INSERT INTO ChiTietHoaDons
							 (
							 MaHoaDon,
							 MaSanPham,
							 SoLuong,
							 TongGia)
							 
						SELECT	@MaHoaDon,
								JSON_VALUE(y.value, '$.maSanPham') ,
								JSON_VALUE(y.value, '$.soLuong') ,
								JSON_VALUE(y.value, '$.tongGia') 
						FROM OPENJSON(@list_json_chitiet_hoadon) AS y;
						END;
			END


        SELECT '';
    END;

-------------------------------------------------------------------------------------------------------------------------------
create proc sp_update_hoadon(
@MaHoaDon int,
@TrangThai bit,
@NgayTao datetime,
@NgayDuyet datetime,
@TongGia decimal(18,0),
@TenKH nvarchar(50),
@Diachi nvarchar(250),
@Email nvarchar(50),
@SDT nvarchar(50),
@DiaChiGiaoHang nvarchar(350),
@list_json_chitiet_hoadon NVARCHAR(MAX)
)
as
BEGIN
		update HoaDons
		set TrangThai = @TrangThai,
			NgayTao = @NgayTao ,
			NgayDuyet = NgayDuyet ,
			TongGia = @TongGia ,
			TenKH = @TenKH,
			Diachi = @Diachi,
			Email = @Email,
			SDT = @SDT,
			DiaChiGiaoHang = @DiaChiGiaoHang
					
		where MaHoaDon =@MaHoaDon
		
					IF(@list_json_chitiet_hoadon IS NOT NULL)
						BEGIN
							SELECT JSON_VALUE(p.value, '$.maChiTietHoaDon') as maChiTietHoaDon,
								JSON_VALUE(p.value, '$.maHoaDon') as MaHoaDon, 
								JSON_VALUE(p.value, '$.maSanPham') as MaSanPham,
								JSON_VALUE(p.value, '$.soLuong') as soLuong,
								JSON_VALUE(p.value, '$.tongGia')as tongGia,
								JSON_VALUE(p.value, '$.status') as status
								INTO #Result
							FROM OPENJSON(@list_json_chitiet_hoadon) AS p;

							--insert status =1
							Insert into ChiTietHoaDons(MaHoaDon,MaSanPham,SoLuong,TongGia)
							select @MaHoaDon,
									#Result.maSanPham,
									#Result.soLuong,
									#Result.tongGia
							from #Result
							where #Result.Status = 1

							--update status =2 
							Update ChiTietHoaDons
							set MaSanPham= #Result.MaSanPham,
								SoLuong = #Result.soLuong,
								TongGia = #Result.tongGia
							from #Result
							where ChiTietHoaDons.MaChiTietHoaDon=#Result.maChiTietHoaDon and #Result.status = '2'

							--delete status =3
							delete c 
							from ChiTietHoaDons c
							inner join #Result r on c.maChiTietHoaDon = r.maChiTietHoaDon
							where r.status = '3'
							drop table #Result

						END;
			


        SELECT '';
    END;

-------------------------------------------------------------------------------------------------------------------------------
create proc sp_delete_hoadon(@MaHoaDon int)
as
begin
	delete from HoaDons
	where MaHoaDon = @MaHoaDon
end
	
-------------------------------------------------------------------------------------------------------------------------------
create proc sp_hoadon_search(@page_index  INT, 
                                       @page_size   INT,
									   @TenKH Nvarchar(50),
									   @SDT nvarchar(50),
									   @fr_NgayTao datetime,
									   @to_NgayTao datetime)
AS
    BEGIN
        DECLARE @RecordCount BIGINT;
        IF(@page_size <> 0)
            BEGIN
                SET NOCOUNT ON;
                        SELECT(ROW_NUMBER() OVER(
                              ORDER BY h.MaHoaDon DESC)) AS RowNumber, 
							  h.MaHoaDon,
							  h.NgayTao,
							  h.NgayDuyet,
							  h.TenKH,
							  h.SDT,
							  h.DiaChiGiaoHang,
                              s.TenSanPham,
							  c.SoLuong,
							  c.TongGia
                        INTO #Results
                        FROM HoaDons AS h
						inner join ChiTietHoaDons c on c.MaHoaDon = h.MaHoaDon
						inner join SanPhams s on s.MaSanPham = c.MaSanPham
					    WHERE (@TenKH = '' or h.TenKH like N'%'+@TenKH +'%')
						and   (@SDT = '' or h.SDT like N'%'+@SDT +'%')
						and ((@fr_NgayTao is null and @to_NgayTao is null 
								or (@fr_NgayTao is not null
								and @to_NgayTao is null and
								h.NgayTao >= @fr_NgayTao)
								or @fr_NgayTao is null and @to_NgayTao is not null 
								and h.NgayTao < @to_NgayTao
								or h.NgayTao between @fr_NgayTao and @to_NgayTao))
                        SELECT @RecordCount = COUNT(*)
                        FROM #Results;
                        SELECT *, 
                               @RecordCount AS RecordCount
                        FROM #Results
                        WHERE ROWNUMBER BETWEEN(@page_index - 1) * @page_size + 1 AND(((@page_index - 1) * @page_size + 1) + @page_size) - 1
                              OR @page_index = -1;
                        DROP TABLE #Results; 
            END;
            ELSE
            BEGIN
                SET NOCOUNT ON;
                        SELECT(ROW_NUMBER() OVER(
                              ORDER BY h.MaHoaDon DESC)) AS RowNumber, 
							  h.MaHoaDon,
							  h.NgayTao,
							  h.NgayDuyet,
							  h.TenKH,
							  h.SDT,
							  h.DiaChiGiaoHang,
                              s.TenSanPham,
							  c.SoLuong,
							  c.TongGia
                        INTO #Results2
                        FROM HoaDons AS h
						inner join ChiTietHoaDons c on c.MaHoaDon = h.MaHoaDon
						inner join SanPhams s on s.MaSanPham = c.MaSanPham
					    WHERE (@TenKH = '' or h.TenKH like N'%'+@TenKH +'%')
						and   (@SDT = '' or h.SDT like N'%'+@SDT +'%')
						and ((@fr_NgayTao is null and @to_NgayTao is null 
								or (@fr_NgayTao is not null
								and @to_NgayTao is null and
								h.NgayTao >= @fr_NgayTao)
								or @fr_NgayTao is null and @to_NgayTao is not null 
								and h.NgayTao < @to_NgayTao
								or h.NgayTao between @fr_NgayTao and @to_NgayTao))
                        SELECT @RecordCount = COUNT(*)
                        FROM #Results2;
                        SELECT *, 
                               @RecordCount AS RecordCount
                        FROM #Results2
                        DROP TABLE #Results2; 
        END;
    END;

exec sp_hoadon_search @page_index = 1, @page_size = 5, @TenKH = '', @SDT = '09', @fr_NgayTao ='',@to_NgayTao=''

-------------------------------------------------------------------------------------------------------------------------------
create proc sp_hoadon_search_single(@page_index  INT, 
                                       @page_size   INT,
									   @TenKH Nvarchar(50),
									   @SDT nvarchar(50),
									   @fr_NgayTao datetime,
									   @to_NgayTao datetime)
AS
    BEGIN
        DECLARE @RecordCount BIGINT;
        IF(@page_size <> 0)
            BEGIN
                SET NOCOUNT ON;
                        SELECT(ROW_NUMBER() OVER(
                              ORDER BY h.MaHoaDon DESC)) AS RowNumber, 
							  h.*
                        INTO #Results
                        FROM HoaDons AS h
					    WHERE (@TenKH = '' or h.TenKH like N'%'+@TenKH +'%')
						and   (@SDT = '' or h.SDT like N'%'+@SDT +'%')
						and ((@fr_NgayTao is null and @to_NgayTao is null 
								or (@fr_NgayTao is not null
								and @to_NgayTao is null and
								h.NgayTao >= @fr_NgayTao)
								or @fr_NgayTao is null and @to_NgayTao is not null 
								and h.NgayTao < @to_NgayTao
								or h.NgayTao between @fr_NgayTao and @to_NgayTao))
                        SELECT @RecordCount = COUNT(*)
                        FROM #Results;
                        SELECT *, 
                               @RecordCount AS RecordCount
                        FROM #Results
                        WHERE ROWNUMBER BETWEEN(@page_index - 1) * @page_size + 1 AND(((@page_index - 1) * @page_size + 1) + @page_size) - 1
                              OR @page_index = -1;
                        DROP TABLE #Results; 
            END;
            ELSE
            BEGIN
                SET NOCOUNT ON;
                        SELECT(ROW_NUMBER() OVER(
                              ORDER BY h.MaHoaDon DESC)) AS RowNumber, 
							  h.*
                        INTO #Results2
                        FROM HoaDons AS h
					    WHERE (@TenKH = '' or h.TenKH like N'%'+@TenKH +'%')
						and   (@SDT = '' or h.SDT like N'%'+@SDT +'%')
						and ((@fr_NgayTao is null and @to_NgayTao is null 
								or (@fr_NgayTao is not null
								and @to_NgayTao is null and
								h.NgayTao >= @fr_NgayTao)
								or @fr_NgayTao is null and @to_NgayTao is not null 
								and h.NgayTao < @to_NgayTao
								or h.NgayTao between @fr_NgayTao and @to_NgayTao))
                        SELECT @RecordCount = COUNT(*)
                        FROM #Results2;
                        SELECT *, 
                               @RecordCount AS RecordCount
                        FROM #Results2
                        DROP TABLE #Results2; 
        END;
    END;










