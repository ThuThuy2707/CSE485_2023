--a
SELECT ma_bviet, tieude
FROM baiviet
WHERE ma_tloai = (
    SELECT ma_tloai 
    FROM theloai 
    WHERE ten_tloai = 'Nhạc trữ tình'
);

--b
SELECT ma_bviet, tieude
FROM baiviet
WHERE ma_tgia = (
	SELECT ma_tgia
	FROM tacgia
	WHERE ten_tgia = 'Nhacvietplus'
);

--c
select ten_tloai
from theloai
left join baiviet on baiviet.ma_tloai = theloai.ma_tloai
where baiviet.ma_bviet is null;

--d
SELECT baiviet.ma_bviet, baiviet.tieude, baiviet.ten_bhat, tacgia.ten_tgia, theloai.ten_tloai, baiviet.ngayviet
FROM baiviet
JOIN tacgia ON baiviet.ma_tgia = tacgia.ma_tgia
JOIN theloai ON baiviet.ma_tloai = theloai.ma_tloai;

--e
SELECT TOP 1 theloai.ten_tloai, COUNT(baiviet.ma_bviet) AS so_bai_viet
FROM baiviet
JOIN theloai ON baiviet.ma_tloai = theloai.ma_tloai
GROUP BY theloai.ten_tloai
ORDER BY so_bai_viet DESC;

--f
SELECT TOP 2 tacgia.ten_tgia, COUNT(baiviet.ma_bviet) AS so_bai_viet
FROM baiviet
JOIN tacgia ON baiviet.ma_tgia = tacgia.ma_tgia
GROUP BY tacgia.ten_tgia
ORDER BY so_bai_viet DESC;

--g
SELECT ma_bviet, tieude, ten_bhat
FROM baiviet
WHERE ten_bhat LIKE N'%yêu%'
   OR ten_bhat LIKE N'%thương%'
   OR ten_bhat LIKE N'%anh%'
   OR ten_bhat LIKE N'%em%';

--h
SELECT ma_bviet, tieude, ten_bhat
FROM baiviet
WHERE tieude LIKE N'%yêu%'
   OR tieude LIKE N'%thương%'
   OR tieude LIKE N'%anh%'
   OR tieude LIKE N'%em%'
   OR ten_bhat LIKE N'%yêu%'
   OR ten_bhat LIKE N'%thương%'
   OR ten_bhat LIKE N'%anh%'
   OR ten_bhat LIKE N'%em%';

--i
CREATE VIEW vw_Music AS
SELECT baiviet.ma_bviet, baiviet.tieude, baiviet.ten_bhat, theloai.ten_tloai, tacgia.ten_tgia
FROM baiviet
JOIN theloai ON baiviet.ma_tloai = theloai.ma_tloai
JOIN tacgia ON baiviet.ma_tgia = tacgia.ma_tgia;

--j
CREATE PROCEDURE sp_DSBaiViet
    @ten_tloai NVARCHAR(50)
AS
BEGIN
    IF EXISTS (SELECT 1 FROM theloai WHERE ten_tloai = @ten_tloai)
    BEGIN
        SELECT baiviet.ma_bviet, baiviet.tieude, baiviet.ten_bhat
        FROM baiviet
        JOIN theloai ON baiviet.ma_tloai = theloai.ma_tloai
        WHERE theloai.ten_tloai = @ten_tloai;
    END
    ELSE
    BEGIN
        PRINT 'Thể loại không tồn tại';
    END
END;

--k
ALTER TABLE theloai ADD SLBaiViet INT DEFAULT 0;
CREATE TRIGGER tg_CapNhatTheLoai
ON baiviet
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    -- Cập nhật số lượng bài viết sau khi thêm, sửa, hoặc xóa bài viết
    UPDATE theloai
    SET SLBaiViet = (
        SELECT COUNT(*)
        FROM baiviet
        WHERE baiviet.ma_tloai = theloai.ma_tloai
    );
END;

--l
CREATE TABLE Users (
    user_id INT PRIMARY KEY IDENTITY(1,1),
    username NVARCHAR(50) NOT NULL,
    password NVARCHAR(255) NOT NULL,
    email NVARCHAR(100),
    role NVARCHAR(50) DEFAULT 'user'
);