USE QLDienMay
GO
---sp tao the cho khach hang---
---Chuc nang: tao the thanh vien cho khach hang---
---input: ma khach hang---
---output: khong co---
---Thanh cong: tao the moi----
---That bai: neu khach hang da co the---
CREATE PROC Tao_The_Cho_Khach_Hang @ma_khach_hang CHAR(10) AS
BEGIN
	IF(@ma_khach_hang IS NOT NULL)
		INSERT INTO TheTichDiem(MaThe,MaKhachHang,Hang,NgayTao,Diem,TrangThai)
		VALUES('1',@ma_khach_hang,'H0001',GETDATE(),0,0)
	ELSE
		RAISERROR(N'Lỗi: Input không được null !',16,1)
END
GO

---sp tao don hang online---
---Chuc nang: tao moi dong hang online---
---input ma khach hang, ma voucher (neu co)---
---output: ma don (lay id de truyen vao chi tiet don hang)---
---Thanh cong: tao don hang moi----
---That bai: neu sai khoa ngoai(ma khach hang, thoi gian cua voucher)---
CREATE PROC Tao_Don_Hang_Online @ma_khach_hang CHAR(10), @ma_voucher CHAR(10),@tong_gia_tri_don DECIMAL(18,2), @ma_don CHAR(10) OUTPUT AS
BEGIN
	IF(@ma_khach_hang IS NOT NULL AND @tong_gia_tri_don IS NOT NULL AND @ma_don IS NOT NULL)
	BEGIN
		IF NOT EXISTS(SELECT(MaKhachHang) FROM KhachHang WHERE MaKhachHang = @ma_khach_hang)
		BEGIN
			RAISERROR('Mã khách hàng sai hoặc không tồn tại!',16,1)
		END
		ELSE IF((SELECT(NgayBatDau) FROM Voucher WHERE MaVoucher = @ma_voucher) > GETDATE() OR (SELECT(NgayKetThuc) FROM Voucher WHERE MaVoucher = @ma_voucher) < GETDATE())
		BEGIN
			RAISERROR('Thời gian đặt không nằm trong phạm vi của voucher(Voucher đã quá hạn hoặc chưa tới)!',16,1)
		END
		ELSE
		BEGIN
			DECLARE @OutputTbl TABLE (ID CHAR(10))
			DECLARE @ma_cua_hang CHAR(5) = (SELECT(MaCuaHang) FROM CuaHang, KhachHang WHERE CuaHang.ThanhPho = KhachHang.ThanhPho AND MaKhachHang = @ma_khach_hang)
			DECLARE @DEMDH INT = (SELECT COUNT(MaDonHang) FROM DonHang)
			DECLARE @I INT = 0
			SET @DEMDH += 1
			DECLARE @ID CHAR(10)

			DECLARE @chuoiSoKhong VARCHAR(8) = '0'
			DECLARE @LENGTHID INT = 10 - (LEN('DH') + LEN(@DEMDH))

			WHILE(@I < @LENGTHID - 1)
			BEGIN
				SET @CHUOISOKHONG += '0'
				SET @I += 1
			END

			SET @ID  = CONCAT('DH',@chuoiSoKhong,@DEMDH)
			DECLARE @DEMID INT = (SELECT COUNT(MaVoucher) FROM Voucher WHERE MaVoucher = @ID)

			WHILE(@DEMID <> 0)
			BEGIN
				SET @DEMDH += 1
				SET @CHUOISOKHONG = '0'
				SET @ID = 0
				SET @LENGTHID = 10 - (LEN('DH') + LEN(@DEMDH))

				WHILE(@I < @LENGTHID - 1)
				BEGIN
					SET @CHUOISOKHONG += '0'
					SET @I += 1
				END
				SET @ID  = CONCAT('DH',@chuoiSoKhong,@DEMDH)
				SET @DEMID = (SELECT COUNT(MaVoucher) FROM Voucher WHERE MaVoucher = @ID)
			END
			BEGIN TRAN
			BEGIN TRY
				INSERT INTO DonHang(MaDonHang,MaKhachHang,MaCuaHang,ThoiGianTao,MaVoucher,Loai,TongGiaTri) OUTPUT inserted.MaDonHang INTO @OutputTbl(ID)
				VALUES(@ID,@ma_khach_hang,@ma_cua_hang,GETDATE(),@ma_voucher,0,@tong_gia_tri_don)
				COMMIT 
			END TRY
			BEGIN CATCH
				ROLLBACK
				DECLARE @ERRORMESS VARCHAR(2000) = 'Lỗi: ' + ERROR_MESSAGE()
				RAISERROR(@ERRORMESS,16,1)
			END CATCH
			SET @ma_don = (SELECT TOP 1 ID FROM @OutputTbl)
		END
	END
	ELSE
		RAISERROR(N'Lỗi: Input không được null !',16,1)
END
GO

---sp xac nhan don hang---
---Chuc nang: xac nhan don hang online---
---input: ma don hang, ma nhan vien phu trach, tinh trang xac nhan---
---output: khong co---
---Thanh cong: cap nhat thong tin don hang thanh da xac nhan----
---That bai: tinh trang input bi null---
CREATE PROC Xac_Nhan_Don_Hang @ma_don_hang CHAR(10), @ma_nhan_vien CHAR(10), @tinh_trang_xac_nhan BIT AS
BEGIN
	DECLARE @tinh_trang_hien_tai BIT = (SELECT TinhTrangXacNhan FROM DonHang WHERE MaDonHang = @ma_don_hang)
	IF(@tinh_trang_hien_tai IS NULL AND @ma_don_hang IS NOT NULL AND @ma_nhan_vien IS NOT NULL AND @tinh_trang_xac_nhan IS NOT NULL)
	BEGIN
		IF(@tinh_trang_xac_nhan = 0)
		BEGIN
			BEGIN TRAN
			UPDATE DonHang SET TinhTrangXacNhan = @tinh_trang_xac_nhan, NhanVienPhuTrach = @ma_nhan_vien WHERE MaDonHang = @ma_don_hang
			COMMIT
		END
		ELSE IF(@tinh_trang_xac_nhan = 1)
		BEGIN
			BEGIN TRAN
			UPDATE DonHang SET TinhTrangXacNhan = @tinh_trang_xac_nhan, TinhTrangThanhToan = @tinh_trang_xac_nhan, TinhTrangGiaoHang = @tinh_trang_xac_nhan, NhanVienPhuTrach = @ma_nhan_vien WHERE MaDonHang = @ma_don_hang
			COMMIT
		END
	END
	ELSE
		RAISERROR(N'Lỗi: Tình trạng xác nhận đã được cập nhật từ trước hoặc input null !',16,1)
END
GO

---sp thanh toan don hang---
---Chuc nang: thanh toan don hang online---
---input: ma don hang, ma nhan vien phu trach, tinh trang thanh toan---
---output: khong co---
---Thanh cong: cap nhat thong tin don hang thanh da thanh toan----
---That bai: tinh trang input bi null---
CREATE PROC Thanh_Toan_Don_Hang @ma_don_hang CHAR(10), @ma_nhan_vien CHAR(10), @tinh_trang_thanh_toan BIT AS
BEGIN
	DECLARE @tinh_trang_hien_tai BIT = (SELECT TinhTrangThanhToan FROM DonHang WHERE MaDonHang = @ma_don_hang)
	IF(@tinh_trang_hien_tai IS NULL AND @ma_don_hang IS NOT NULL AND @ma_nhan_vien IS NOT NULL AND @tinh_trang_thanh_toan IS NOT NULL)
	BEGIN
		IF(@tinh_trang_thanh_toan = 0)
		BEGIN
			BEGIN TRAN
			UPDATE DonHang SET TinhTrangThanhToan = @tinh_trang_thanh_toan, NhanVienPhuTrach = @ma_nhan_vien WHERE MaDonHang = @ma_don_hang
			COMMIT
		END
		ELSE IF(@tinh_trang_thanh_toan = 1)
		BEGIN
			BEGIN TRAN
			UPDATE DonHang SET TinhTrangThanhToan = @tinh_trang_thanh_toan, TinhTrangGiaoHang = @tinh_trang_thanh_toan, NhanVienPhuTrach = @ma_nhan_vien WHERE MaDonHang = @ma_don_hang
		END
	END
	ELSE
		RAISERROR(N'Lỗi: Tình trạng xác nhận đã được cập nhật từ trước hoặc input null !',16,1)
END
GO


---sp xuat phieu xuat kho---
---Chuc nang: xuat phieu xuat---
---input: ma don hang, ma nhan vien phu trach---
---output: khong co---
---Thanh cong: tao phieu xuat cho don hang input----
---That bai: input bi null hoac khong du hang---
CREATE PROC Xuat_Phieu_Xuat_Kho @nhan_vien_tao_phieu CHAR(10), @ma_don_hang CHAR(10) AS
BEGIN
	IF EXISTS(SELECT MaPhieuXuat FROM PhieuXuat WHERE MaDonHang = @ma_don_hang)
	BEGIN
		RAISERROR('Lỗi: Đã xuất phiếu xuất cho đơn hàng này !',16,1)
	END
	ELSE
	BEGIN
		IF(@nhan_vien_tao_phieu IS NOT NULL AND @ma_don_hang IS NOT NULL)
		BEGIN
			---Lay sl san pham can xuat (so luong san pham trong don hang)
			DECLARE @BANGSPXUAT TABLE(STT INT, MaSP CHAR(10),SoLuong INT,DonGia DECIMAL(18,2),ThanhTien DECIMAL(18,2))
			INSERT INTO @BANGSPXUAT(STT,MaSP,SoLuong,DonGia,ThanhTien)
				 (SELECT ROW_NUMBER() OVER (ORDER BY MaSanPham) AS dong
					 , MaSanPham
					 , SoLuong
					 , DonGia
					 , ThanhTien
				 FROM ChiTietDonHang WHERE MaDonHang = @ma_don_hang)

			---Lay ma cac kho thuoc cua hang cua don hang
			DECLARE @KHOTHUOCCH TABLE(STT INT, MaKho CHAR(5))
			DECLARE @CUAHANG CHAR(5) = (SELECT MaCuaHang FROM DonHang WHERE MaDonHang = @ma_don_hang)
			INSERT INTO @KHOTHUOCCH(STT,MaKho)(SELECT ROW_NUMBER() OVER (ORDER BY MaKho) AS dong
					 , MaKho
				 FROM Kho INNER JOIN CuaHang ON KHO.MaCuaHang = CuaHang.MaCuaHang AND CuaHang.MaCuaHang = @CUAHANG)

			---Kiem tra so luong kho thuoc cua hang de chay loop
			DECLARE @MAKHO CHAR(5) = (SELECT TOP 1 MaKho FROM @KHOTHUOCCH)
			DECLARE @DEMKHO INT

			---bien toan cuc 
			DECLARE @COUNT INT
			DECLARE @CHECK1 INT = 1
			DECLARE @CHECK2 INT

			---Neu cua hang chi co mot kho
			WHILE(@CHECK1 = 1) 
			BEGIN
				BEGIN TRAN
				BEGIN TRY
					---Lay san pham dau tien can xuat ra de kiem tra
					SET @COUNT = ((SELECT COUNT(MaSP) FROM @BANGSPXUAT))
					---Loop kiem tru kho test
					WHILE(@COUNT > 0)
					BEGIN
						DECLARE @MASP CHAR(10) = (SELECT TOP 1 MaSP FROM @BANGSPXUAT)
						UPDATE ChiTietKho SET SoLuong = SoLuong - (SELECT SoLuong FROM @BANGSPXUAT WHERE MaSP = @MASP) WHERE MaKho = @MAKHO AND MaSanPham = @MASP
						DELETE FROM @BANGSPXUAT WHERE MaSP = @MASP
						SET @COUNT = ((SELECT COUNT(MaSP) FROM @BANGSPXUAT))
					END
					---Neu con du hang se bat dau xuat phieu
					INSERT INTO PhieuXuat(MaPhieuXuat,NhanVienTaoPhieu,NhanVienTruongKho,MaKho,MaDonHang,ThoiGianTao,TongGiaTri,TrangThai)
					VALUES('1',@nhan_vien_tao_phieu,(SELECT TruongKho FROM Kho WHERE MaKho = @MAKHO),@MAKHO,@ma_don_hang,GETDATE(),(SELECT SUM(ThanhTien) FROM ChiTietDonHang WHERE MaDonHang = @ma_don_hang),0)
					DECLARE @MAPX CHAR(10) = (SELECT MaPhieuXuat FROM PhieuXuat WHERE MaDonHang = @ma_don_hang)
					INSERT INTO ChiTietPhieuXuat(MaPhieuXuat,MaSanPham,SoLuong) SELECT @MAPX,MaSanPham,SoLuong FROM ChiTietDonHang WHERE MaDonHang = @ma_don_hang
					---SET CHECK1 = 0 de ket thuc loop
					SET @CHECK1 = 0
					COMMIT
				END TRY
				BEGIN CATCH
					ROLLBACK
					---Qua kho tiep theo
					DELETE FROM @KHOTHUOCCH WHERE MaKho = @MAKHO
					SET @DEMKHO = (SELECT COUNT(MaKho) FROM @KHOTHUOCCH)
					SET @MAKHO = (SELECT TOP 1 MaKho FROM @KHOTHUOCCH)
					IF(@DEMKHO <> 0)
					BEGIN
						---Khoi tao lai bang sp xuat
						DELETE FROM @BANGSPXUAT	
						INSERT INTO @BANGSPXUAT(MaSP,SoLuong,DonGia,ThanhTien) SELECT MaSanPham,SoLuong,DonGia,ThanhTien FROM ChiTietDonHang WHERE MaDonHang = @ma_don_hang	
						SET @CHECK1 = 1
					END
					ELSE
					BEGIN
						---Neu khong co kho nao du hang
						---Thoat vong lap, goi check2
						SET @CHECK1 = 0
						SET @CHECK2 = 1
					END	
				END CATCH
			END
			DELETE FROM @BANGSPXUAT
			---check2 se lay hang tu nhieu kho khac nhau thuoc cua hang
			IF(@CHECK2 = 1)
			BEGIN
				BEGIN TRAN
				---kho tam de kiem tra
				DECLARE @CTKHO_TEMP TABLE(MaKho CHAR(5),MaSanPham CHAR(10),SoLuong INT)
				INSERT INTO @CTKHO_TEMP SELECT * FROM ChiTietKho

				---khoi tao lai bang sp can xuat
				INSERT INTO @BANGSPXUAT(STT,MaSP,SoLuong,DonGia,ThanhTien)
				 (SELECT ROW_NUMBER() OVER (ORDER BY MaSanPham) AS dong
					 , MaSanPham
					 , SoLuong
					 , DonGia
					 , ThanhTien
				 FROM ChiTietDonHang WHERE MaDonHang = @ma_don_hang)
		 
				---khoi tao lai kho
				INSERT INTO @KHOTHUOCCH(STT,MaKho)(SELECT ROW_NUMBER() OVER (ORDER BY MaKho) AS dong
					 , MaKho
				 FROM Kho INNER JOIN CuaHang ON KHO.MaCuaHang = CuaHang.MaCuaHang AND CuaHang.MaCuaHang = @CUAHANG)
		

				---Lay san pham dau tien can xuat ra de kiem tra
				SET @COUNT = ((SELECT COUNT(MaSP) FROM @BANGSPXUAT))
		
				DECLARE @I INT
				DECLARE @J INT
				DECLARE @SL_TEMP INT
				DECLARE @NUM INT
				---loop check từng sp
				SET @I = 1
				WHILE(@I <= @COUNT)
				BEGIN
					SET @MASP = (SELECT MaSP FROM @BANGSPXUAT WHERE STT = @I)
					SET @J = 1
					SET @DEMKHO = (SELECT COUNT(MaKho) FROM @KHOTHUOCCH)
					WHILE(@J <= @DEMKHO)
					BEGIN
						IF((SELECT SoLuong FROM @BANGSPXUAT WHERE MaSP = @MASP) > 0)
						BEGIN
							SET @MAKHO = (SELECT MaKho FROM @KHOTHUOCCH WHERE STT = @J)
							SET @SL_TEMP = (SELECT SoLuong FROM @BANGSPXUAT WHERE MaSP = @MASP)
							UPDATE @BANGSPXUAT SET SoLuong = SoLuong - (SELECT SoLuong FROM ChiTietKho WHERE MaKho = @MAKHO AND MaSanPham = @MASP) WHERE MaSP = @MASP

							---kho nay du hang
							IF((SELECT SoLuong FROM @BANGSPXUAT WHERE MaSP = @MASP) <= 0)
							BEGIN
								DECLARE @GETMAPX CHAR(10) = (SELECT MaPhieuXuat FROM PhieuXuat WHERE MaKho = @MAKHO AND MaDonHang = @ma_don_hang)
								IF (@GETMAPX IS NOT NULL)
								BEGIN
									INSERT INTO ChiTietPhieuXuat(MaPhieuXuat,MaSanPham,SoLuong) VALUES(@GETMAPX,@MASP,@SL_TEMP)	
									UPDATE PhieuXuat SET TongGiaTri = TongGiaTri + (@SL_TEMP* (SELECT DonGia FROM @BANGSPXUAT WHERE MaSP = @MASP)) WHERE MaPhieuXuat = @GETMAPX
									UPDATE ChiTietKho SET SoLuong = SoLuong - @SL_TEMP WHERE MaKho = @MAKHO AND MaSanPham = @MASP
								END
								ELSE
								BEGIN
									INSERT INTO PhieuXuat(MaPhieuXuat,NhanVienTaoPhieu,NhanVienTruongKho,MaKho,MaDonHang,ThoiGianTao,TongGiaTri,TrangThai)
									VALUES('1',@nhan_vien_tao_phieu,(SELECT TruongKho FROM Kho WHERE MaKho = @MAKHO),@MAKHO,@ma_don_hang,GETDATE(),0,0)
									SET @GETMAPX = (SELECT TOP 1 MaPhieuXuat FROM PhieuXuat ORDER BY MaPhieuXuat DESC)
									INSERT INTO ChiTietPhieuXuat(MaPhieuXuat,MaSanPham,SoLuong) VALUES(@GETMAPX,@MASP,@SL_TEMP)	
									UPDATE PhieuXuat SET TongGiaTri = TongGiaTri + (@SL_TEMP* (SELECT DonGia FROM @BANGSPXUAT WHERE MaSP = @MASP)) WHERE MaPhieuXuat = @GETMAPX
									UPDATE ChiTietKho SET SoLuong = SoLuong - @SL_TEMP WHERE MaKho = @MAKHO AND MaSanPham = @MASP
								END
							END
							---khong du hang thi
							ELSE
							BEGIN
								SET @GETMAPX = (SELECT MaPhieuXuat FROM PhieuXuat WHERE MaKho = @MAKHO AND MaDonHang = @ma_don_hang)
								IF (@GETMAPX IS NOT NULL)
								BEGIN
									SET @NUM = @SL_TEMP - (SELECT SoLuong FROM @BANGSPXUAT WHERE MaSP = @MASP)
									INSERT INTO ChiTietPhieuXuat(MaPhieuXuat,MaSanPham,SoLuong) VALUES(@GETMAPX,@MASP,@NUM)	
									UPDATE PhieuXuat SET TongGiaTri = TongGiaTri + (@NUM * (SELECT DonGia FROM @BANGSPXUAT WHERE MaSP = @MASP)) WHERE MaPhieuXuat = @GETMAPX
									UPDATE ChiTietKho SET SoLuong = SoLuong - @NUM WHERE MaKho = @MAKHO AND MaSanPham = @MASP
								END
								ELSE
								BEGIN 
									INSERT INTO PhieuXuat(MaPhieuXuat,NhanVienTaoPhieu,NhanVienTruongKho,MaKho,MaDonHang,ThoiGianTao,TongGiaTri,TrangThai)
									VALUES('1',@nhan_vien_tao_phieu,(SELECT TruongKho FROM Kho WHERE MaKho = @MAKHO),@MAKHO,@ma_don_hang,GETDATE(),0,0)
									SET @NUM = @SL_TEMP - (SELECT SoLuong FROM @BANGSPXUAT WHERE MaSP = @MASP)
									SET @GETMAPX = (SELECT TOP 1 MaPhieuXuat FROM PhieuXuat ORDER BY MaPhieuXuat DESC)
									INSERT INTO ChiTietPhieuXuat(MaPhieuXuat,MaSanPham,SoLuong) VALUES(@GETMAPX,@MASP,@NUM)	
									UPDATE PhieuXuat SET TongGiaTri = TongGiaTri + (@NUM * (SELECT DonGia FROM @BANGSPXUAT WHERE MaSP = @MASP)) WHERE MaPhieuXuat = @GETMAPX
									UPDATE ChiTietKho SET SoLuong = SoLuong - @NUM WHERE MaKho = @MAKHO AND MaSanPham = @MASP
								END 
							END
						END
						----
						SET @J += 1
					END
					SET @I += 1
				END
				DECLARE @KQ INT = (SELECT COUNT(MaSP) FROM @BANGSPXUAT WHERE SoLuong > 0)
				IF(@KQ = 0)
					COMMIT
				ELSE
				BEGIN
					ROLLBACK
					RAISERROR(N'Lỗi: Không kho nào còn hàng !',16,1)
				END
			END
		END
		ELSE
			RAISERROR(N'Lỗi: Input không được null !',16,1)
	END
END
GO

---sp cap nhat tinh trang giao hang---
---Chuc nang: cap nhat tinh trang giao hang---
---input: ma don hang, ma nhan vien phu trach, tinh trang giao hang---
---output: khong co---
---Thanh cong: cap nhat tinh trang giao hang cho don hang input----
---Giao hang thanh cong: Cong diem cho the khach hang, Tao phieu bao hanh
---Giao hang that bai: Tra hang ve kho
---That bai: input bi null---
CREATE PROC Cap_Nhat_Tinh_Trang_Giao_Hang @ma_don_hang CHAR(10), @ma_nhan_vien CHAR(10), @tinh_trang_giao_hang BIT AS
BEGIN
	DECLARE @tinh_trang_hien_tai BIT = (SELECT TinhTrangGiaoHang FROM DonHang WHERE MaDonHang = @ma_don_hang)
	IF(@tinh_trang_hien_tai IS NULL AND @ma_don_hang IS NOT NULL AND @ma_nhan_vien IS NOT NULL AND @tinh_trang_giao_hang IS NOT NULL)
	BEGIN
		DECLARE @ERRORMESS VARCHAR(2000)
		IF(@tinh_trang_giao_hang = 0)
		BEGIN
			BEGIN TRAN
			BEGIN TRY
				DECLARE @MAKH CHAR(10) = (SELECT MaKhachHang FROM DonHang WHERE MaDonHang = @ma_don_hang)
				IF EXISTS((SELECT MaThe FROM TheTichDiem WHERE MaKhachHang = @MAKH))
					UPDATE TheTichDiem SET Diem = Diem + ((SELECT TongGiaTri FROM DonHang WHERE MaDonHang = @ma_don_hang) / 1000) WHERE MaKhachHang = @MAKH
				UPDATE DonHang SET TinhTrangGiaoHang = @tinh_trang_giao_hang, NhanVienPhuTrach = @ma_nhan_vien WHERE MaDonHang = @ma_don_hang
				
				DECLARE @CTDH_TEMP TABLE(STT INT,MaSanPham CHAR(10), SoLuong INT)
				INSERT INTO @CTDH_TEMP(STT,MaSanPham,SoLuong)
				(SELECT ROW_NUMBER() OVER (ORDER BY MaSanPham) AS dong
					   , MaSanPham
					   , SoLuong
				 FROM ChiTietDonHang WHERE MaDonHang = @ma_don_hang)

				DECLARE @I INT = 1
				DECLARE @J INT
				DECLARE @SL_SP INT
				DECLARE @TEMP_LEN INT = (SELECT COUNT(STT) FROM @CTDH_TEMP)
				DECLARE @MASP CHAR(10)

				WHILE(@I <= @TEMP_LEN)
				BEGIN
					SET @MASP = (SELECT MaSanPham FROM @CTDH_TEMP WHERE STT = @I)
					SET @J = 1
					SET @SL_SP = (SELECT SoLuong FROM @CTDH_TEMP WHERE STT = @I)
					WHILE(@J <= @SL_SP)
					BEGIN
						INSERT INTO PhieuBaoHanh(MaPhieuBH,MaSanPham,MaKhachHang,MaDonHang,NgayTao,NgayHetHan,TrangThai)
						VALUES('1',@MASP,@MAKH,@ma_don_hang,GETDATE(),DATEADD(year, 1, GETDATE()),0)
						SET @J += 1
					END 
					SET @I += 1
				END
				COMMIT
			END TRY
			BEGIN CATCH
				ROLLBACK
				SET @ERRORMESS = 'Lỗi: ' + ERROR_MESSAGE()
				RAISERROR(@ERRORMESS,16,1)
			END CATCH
		END
		ELSE IF(@tinh_trang_giao_hang = 1)
		BEGIN
			BEGIN TRAN
			BEGIN TRY
				UPDATE DonHang SET TinhTrangGiaoHang = @tinh_trang_giao_hang, NhanVienPhuTrach = @ma_nhan_vien WHERE MaDonHang = @ma_don_hang
				UPDATE PhieuXuat SET TrangThai = 1 WHERE MaDonHang = @ma_don_hang
				DECLARE @CTPX_TEMP TABLE(STT INT, MaKho CHAR(5), MaSP CHAR(10), SL INT)

				INSERT INTO @CTPX_TEMP SELECT ROW_NUMBER() OVER (ORDER BY MaKho, MaSanPham) AS dong
					   , PhieuXuat.MaKho
					   , ChiTietPhieuXuat.MaSanPham
					   , ChiTietPhieuXuat.SoLuong
				 FROM ChiTietPhieuXuat INNER JOIN PhieuXuat ON PhieuXuat.MaDonHang = @ma_don_hang AND PhieuXuat.MaPhieuXuat = ChiTietPhieuXuat.MaPhieuXuat

				 DECLARE @COUNT INT = (SELECT COUNT(STT) FROM @CTPX_TEMP)
				 DECLARE @M INT = 1

				 DECLARE @MAKHOTRAVE CHAR(5)
				 DECLARE @MASPTRAVE CHAR(10)
				 DECLARE @SLTRAVE INT

				 WHILE(@M <= @COUNT)
				 BEGIN
					SET @MAKHOTRAVE = (SELECT MaKho FROM @CTPX_TEMP WHERE STT = @M)
					SET @MASPTRAVE = (SELECT MaSP FROM @CTPX_TEMP WHERE STT = @M)
					SET @SLTRAVE = (SELECT SL FROM @CTPX_TEMP WHERE STT = @M)
					UPDATE ChiTietKho SET SoLuong = SoLuong + @SLTRAVE WHERE MaKho = @MAKHOTRAVE AND MaSanPham = @MASPTRAVE
					SET @M += 1
				 END
				 COMMIT
			END TRY
			BEGIN CATCH
				ROLLBACK
				SET @ERRORMESS = 'Lỗi: ' + ERROR_MESSAGE()
				RAISERROR(@ERRORMESS,16,1)
			END CATCH
		END
	END
	ELSE
		RAISERROR(N'Lỗi: Tình trạng giao hàng đã được cập nhật từ trước hoặc input null !',16,1)
END
GO