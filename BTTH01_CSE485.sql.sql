CREATE DATABASE BTTH01_CSE485;
USE BTTH01_CSE485;
go 

CREATE TABLE tacgia(
	ma_tgia int /*unsigned*/ not null PRIMARY KEY,
    ten_tgia varchar(100) not null,
    hinh_tgia varchar(100)
);

INSERT INTO tacgia (ma_tgia, ten_tgia) VALUES (1, N'Nhacvietplus');
INSERT INTO tacgia (ma_tgia, ten_tgia) VALUES (2, N'Sưu tầm');
INSERT INTO tacgia (ma_tgia, ten_tgia) VALUES (3, N'Sandy');
INSERT INTO tacgia (ma_tgia, ten_tgia) VALUES (4, N'Lê Trung Ngân');
INSERT INTO tacgia (ma_tgia, ten_tgia) VALUES (5, N'Khánh Ngọc');
INSERT INTO tacgia (ma_tgia, ten_tgia) VALUES (6, N'Night Stalker');
INSERT INTO tacgia (ma_tgia, ten_tgia) VALUES (7, N'Phạm Phương Anh');
INSERT INTO tacgia (ma_tgia, ten_tgia) VALUES (8, N'Tâm tình');


CREATE TABLE theloai(
	ma_tloai int /*unsigned*/ not null PRIMARY KEY,
    ten_tloai varchar(50) not null
);

INSERT INTO theloai VALUES (1, N'Nhạc trẻ');
INSERT INTO theloai VALUES (2, N'Nhạc trữ tình');
INSERT INTO theloai VALUES (3, N'Nhạc cách mạng');
INSERT INTO theloai VALUES (4, N'Nhạc thiếu nhi');
INSERT INTO theloai VALUES (5, N'Nhạc quê hương');
INSERT INTO theloai VALUES (6, N'POP');
INSERT INTO theloai VALUES (7, N'Rock');
INSERT INTO theloai VALUES (8, N'R&B');



CREATE TABLE baiviet(
	ma_bviet int /*unsigned*/ NOT null PRIMARY KEY,
	tieude varchar(200) NOT null,
	ten_bhat varchar(100) NOT null,
	ma_tloai int /*unsigned*/ NOT null,
	tomtat text NOT null,
	noidung text,
	ma_tgia int /*unsigned*/ NOT null,
	ngayviet datetime NOT null DEFAULT CURRENT_TIMESTAMP,
	hinhanh varchar(200),
	FOREIGN KEY(ma_tloai) REFERENCES theloai(ma_tloai),
	FOREIGN KEY(ma_tgia) REFERENCES tacgia(ma_tgia)
);

INSERT INTO baiviet (ma_bviet, tieude, ten_bhat, ma_tloai, tomtat, ma_tgia, ngayviet)
VALUES (1, N'Lòng mẹ', N'Lòng mẹ', 2,N'Và mẹ ơi đừng khóc nhé! Cả đời này mẹ đã khóc nhiều lắm rồi, hãy cười lên vì con đã trưởng thành! Con sẽ lại về dậy sớm nấu cơm cho mẹ, nấu nước cho mẹ tắm như ngày xưa. \“Dù cho vai nắng nhưng lòng thương chẳng nhạt màu, vẫn mơ quay về vui vầy dưới bóng mẹ yêu\”', 1, '2012/7/23');

INSERT INTO baiviet (ma_bviet, tieude, ten_bhat, ma_tloai, tomtat, ma_tgia, ngayviet)
VALUES (2, N'Cảm ơn em đã rời xa anh', N'Vết mưa', 2,N'Cảm ơn em đã cho anh những tháng ngày hạnh phúc, cho anh biết yêu và được yêu. Em cho anh được nếm trải hương vị ngọt ngào của tình yêu nhưng cũng đầy đau khổ và nước mắt. Những tháng ngày đó có lẽ suốt cuộc đời anh không bao giờ quên', 3, '2012/2/12');

INSERT INTO baiviet (ma_bviet, tieude, ten_bhat, ma_tloai, tomtat, ma_tgia, ngayviet)
VALUES (3,N'Cuộc đời có mấy ngày mai?', N'Phôi pha', 2, N'Đêm nay, trời quang mây tạnh, trong người nghe hoang vắng và tôi ngồi đây \“Ôm lòng đêm, Nhìn vầng trăng mới về\” mà ngậm ngùi \“Nhớ chân giang hồ. Ôi phù du, từng tuổi xuân đã già\”', 4, '2014/3/13');

INSERT INTO baiviet (ma_bviet, tieude, ten_bhat, ma_tloai, tomtat, ma_tgia, ngayviet)
VALUES (4, N'Quê tôi!', N'Quê hương', 5,N'Quê hương là gì mà chở đầy kí ức nhỏ xinh. Có đám trẻ nô đùa bên nhau dưới gốc ổi nhà bà Năm giữa trưa nắng gắt chỉ để chờ bà đi vắng là hái trộm. Có hai anh em tôi bì bõm lội sình bắt cua đem về nhà cho mẹ nấu canh, nấu cháo… Có ba chị em tôi lục đục tự nấu ăn khi mẹ vắng nhà. Có anh tôi luôn dắt tôi đi cùng đường ngõ xóm chỉ để em được vui. Có cả những trận cãi nhau nảy lửa của ba anh em nữa…', 5, '2014/2/20');

INSERT INTO baiviet (ma_bviet, tieude, ten_bhat, ma_tloai, tomtat, ma_tgia, ngayviet)
VALUES (5, N'Đất nước', N'Đất nước', 5,N'Đã bao nhiêu lần tôi tự hỏi: liệu trên Thế giới này có nơi nào chiến tranh tang thương mà lại rất đổi anh hùng như nước mình không? Liệu có mảnh đất nào mà mỗi tấc đất hôm nay đã thấm máu xương của những thế hệ đi trước nhiều như nước mình không? Và, liệu có một đất nước nào lại có nhiều bà mẹ đau khổ nhưng cũng hết sức gan góc như đất nước mình không?', 1, '2010/5/25');

INSERT INTO baiviet (ma_bviet, tieude, ten_bhat, ma_tloai, tomtat, ma_tgia, ngayviet)
VALUES (6, 'Hard Rock Hallelujah', 'Hard Rock Hallelujah', 7,N'Những linh hồn đang lạc lối, mù quáng mất phương hướng trong cõi trần gian đầy nghiệt ngã hãy nên lắng nghe \"Hard Rock Hallelujah\" để có thể quên tất cả mọi thứ để tìm về đúng bản chất sâu thẳm nhất trong tâm hồn chính mình!', 6, '2013/9/12');

INSERT INTO baiviet (ma_bviet, tieude, ten_bhat, ma_tloai, tomtat, ma_tgia, ngayviet)
VALUES (7, 'The Unforgiven', 'The Unforgiven', 7,N'Lâu lắm rồi mới nghe lại The Unforgiven II, vì bài này không phải là bài mà tôi thích. Anh bạn tôi lúc trước, đi đâu cũng nghêu ngao bài này ấy, chỉ tại vì hắn đang... thất tình mà lị. Mà sao Metallica có The Unforgiven rồi lại có thêm bài này chi nữa vậy không biết nữa, làm cho tôi cảm thấy hình như hơi bị đúng so với tâm trạng của tôi lúc này.', 1, '2010/5/25');

INSERT INTO baiviet (ma_bviet, tieude, ten_bhat, ma_tloai, tomtat, ma_tgia, ngayviet)
VALUES (8, N'Nơi tình yêu bắt đầu', N'Nơi tình yêu bắt đầu', 1,N'Nhiều người sẽ nghĩ làm gì có yêu nhất và làm gì có yêu mãi. Ừ! Chẳng có gì là mãi mãi cả, vì chúng ta không trường tồn vĩnh cửu', 1, '2014/2/3');

INSERT INTO baiviet (ma_bviet, tieude, ten_bhat, ma_tloai, tomtat, ma_tgia, ngayviet)
VALUES (9, 'Love Me Like There’s No Tomorrow', 'Love Me Like There’s No Tomorrow', 8,N'Nếu ai đã từng yêu Queen, yêu cái chất giọng cao, sắc sảo như một vết cắt thật ngọt ẩn giấu bao cảm xúc mãnh liệt của Freddie chắc không thể không \"điêu đứng\" mỗi khi nghe Love Me Like There’s No Tomorrow.', 1, '2013/2/26');

INSERT INTO baiviet (ma_bviet, tieude, ten_bhat, ma_tloai, tomtat, ma_tgia, ngayviet)
VALUES (10, 'I\m stronger', 'I\m stronger', 7,N'Em không phải là người giỏi giấu cảm xúc, nhưng em lại là người giỏi đoán biết cảm xúc của người khác vậy nên đừng cố nói nhớ em, rằng mọi thứ chỉ là do hoàn cảnh. Và cũng đừng dối em rằng anh đã từng yêu em. Em nhắm mắt cũng cảm nhận được mà, thật đấy', 2, '2013/8/21');

INSERT INTO baiviet (ma_bviet, tieude, ten_bhat, ma_tloai, tomtat, ma_tgia, ngayviet)
VALUES (11, N'Ôi Cuộc Sống Mến Thương', N'Ôi Cuộc Sống Mến Thương', 5,N'Có một câu nói như thế này \"Âm nhạc là một cái gì khác lạ mà hầu như tôi muốn nói nó là một phép thần diệu.Vì nó đứng giữa tư tưởng và hiện tượng, tinh thần và vật chất, mọi thứ trung gian mơ hồ thế đó mà không là thế đó giữa các sự vật mà âm nhạc hòa giải\"', 2, '2011/10/9');

INSERT INTO baiviet (ma_bviet, tieude, ten_bhat, ma_tloai, tomtat, ma_tgia, ngayviet)
VALUES (12, N'Cây và gió', N'Cây và gió', 7,N'Em và anh, hai đứa quen nhau thật tình cờ. Lời hát của anh từ bài hát “Cây và gió” đã làm tâm hồn em xao động. Nhưng sự thật phũ phàng rằng em chưa bao giờ nói cho anh biết những suy nghĩ tận sâu trong tim mình. Bởi vì em nhút nhát, em không dám đối mặt với thực tế khắc nghiệt, hay thực ra em không dám đối diện với chính mình.',7, '2013/12/5');

INSERT INTO baiviet (ma_bviet, tieude, ten_bhat, ma_tloai, tomtat, ma_tgia, ngayviet)
VALUES (13,N'Như một cách tạ ơn đời', N'Người thầy', 2,N'Ánh nắng cuối ngày rồi cũng sẽ tắt, dòng sông con đò rồi cũng sẽ rẽ sang một hướng khác. Nhưng việc trồng người luôn cảm thụ với chuyến đò ngang, cứ tần tảo đưa rồi lặng lẽ quay về đưa sang. Con đò năm xưa của Thầy nặng trĩu yêu thương, hy sinh thầm lặng.', 8, '2014/1/2');

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

