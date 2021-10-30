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
	INSERT INTO TheTichDiem(MaThe,MaKhachHang,Hang,NgayTao,Diem,TrangThai)
	VALUES('1',@ma_khach_hang,'H0001',GETDATE(),0,0)
END
GO

---sp tao don hang online---
---Chuc nang: tao moi dong hang online---
---input ma khach hang, ma voucher (neu co)---
---output: ma don (lay id de truyen vao chi tiet don hang)---
---Thanh cong: tao don hang moi----
---That bai: neu sai khoa ngoai(ma khach hang, thoi gian cua voucher)---
CREATE PROC Tao_Don_Hang_Online @ma_khach_hang CHAR(10), @ma_voucher CHAR(10), @ma_don CHAR(10) OUTPUT AS
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
			INSERT INTO DonHang(MaDonHang,MaKhachHang,MaCuaHang,ThoiGianTao,MaVoucher,Loai) OUTPUT inserted.MaDonHang INTO @OutputTbl(ID)
			VALUES(@ID,@ma_khach_hang,@ma_cua_hang,GETDATE(),@ma_voucher,0)
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
GO