drop database school

create database school
go
use school
go
create table khoa(
   KhoaID char(10) ,
   KhoaName char(30),
   Phone char(10),
)
insert into khoa values ('A08','DIA LY','09999999')
insert into khoa values ('B09','QTLN','09999123')
insert into khoa values ('D17','TOAN','09999456')
insert into khoa values ('C22','CONG NGHE SINH HOC','09999789')
insert into khoa values ('F02','Y HOC','09999745')

select * from khoa
drop table khoa

create table GiangVien(
   GvID int ,
   GvName char(30),
   Salary decimal(5,2),
   KhoaID char(10),
)
insert into GiangVien values ( 1,'Tran Son',500,'D17')
insert into GiangVien values ( 2,'Hong Ha',450,'A08')
insert into GiangVien values ( 3,'Nguyen Hoang',700,'C22')
insert into GiangVien values ( 4,'Le Anh',670,'F02')
insert into GiangVien values ( 5,'Bui Dao',899,'B09')

select * from GiangVien

drop table GiangVien

create table SinhVien(
   SvID int ,
   SvName char(30),
   KhoaID char(10),
   Birth int,
   HomeTown char(30),
)
insert into SinhVien values ( 1,'Duc','D17',2003,'HN')
insert into SinhVien values ( 2,'Hoang','D17',2003,'NA')
insert into SinhVien values ( 3,'Quan','D17',2003,'HCM')
insert into SinhVien values ( 4,'Ngoc','C22',2003,'DN')
insert into SinhVien values ( 5,'Yen','C22',2003,'HN')
insert into SinhVien values ( 6,'Dung','C22',2002,'V')
insert into SinhVien values ( 7,'Nhung','F02',2003,'QN')
insert into SinhVien values ( 8,'Ha','F02',2003,'NT')
insert into SinhVien values ( 9,'Huyen','F02',2000,'BC')
insert into SinhVien values ( 10,'Duy','A08',1999,'AG')
insert into SinhVien values ( 11,'Dat','A08',2003,'QB')
insert into SinhVien values ( 12,'Duong','A08',2003,'DL')
insert into SinhVien values ( 13,'Linh','B09',2001,'HN')
insert into SinhVien values ( 14,'Hang','B09',2003,'KH')
insert into SinhVien values ( 15,'Minh','B09',2003,'TG')

select * from SinhVien

drop table SinhVien

create table DeTai(
   DtID char(10) ,
   DtName char(30),
   Fee int,
   Internship char(30),
)
insert into DeTai values ('D17A','Nghien cuu do dac',127,'HN')
insert into DeTai values ('C22A','Thien nhien sinh hoc',72,'HCM')
insert into DeTai values ('B09A','Quan li khach san',203,'NA')
insert into DeTai values ('A08A','Moi truong dia li',59,'QN')
insert into DeTai values ('F02A','Khoa hoc y te',300,'KH')
insert into DeTai values ('GO3F','Dao Tao Ky Thuat',59,'NB')

select * from DeTai

drop table DeTai

create table HuongDan(
   SvID int ,
   DtID char(10),
   GvID int ,
   Result decimal(5,2),
)

insert into HuongDan values(1,'D17A',1,89)
insert into HuongDan values(2,'D17A',1,70)
insert into HuongDan values(3,'D17A',1,0)

insert into HuongDan values(4,'C22A',3,null)
insert into HuongDan values(5,'C22A',3,66)
insert into HuongDan values(6,'C22A',3,0)

insert into HuongDan values(7,'F02A',4,59)
insert into HuongDan values(8,'F02A',4,61)
insert into HuongDan values(9,'F02A',4,null)

insert into HuongDan values(10,'A08A',2,22)
insert into HuongDan values(11,'A08A',2,0)
insert into HuongDan values(12,'A08A',2,34)

insert into HuongDan values(13,null,5,null)
insert into HuongDan values(14,null,5,null)
insert into HuongDan values(15,null,5,null)

select * from HuongDan

drop table HuongDan


--1.Đưa ra thông tin gồm mã số, họ tên và tên khoa của tất cả các giảng viên
select GvID,GvName,KhoaName from GiangVien Full OUTER JOIN khoa
ON GiangVien.KhoaID = khoa.KhoaID


--2.Đưa ra thông tin gồm mã số, họ tên và tên khoa của các giảng viên của khoa ‘DIA LY va QLTN’
select GvID,GvName,KhoaName from GiangVien Full OUTER JOIN khoa
ON GiangVien.KhoaID = khoa.KhoaID
WHERE KhoaName = 'DIA LY' OR KhoaName = 'QTLN'


--3.Cho biết số sinh viên của khoa ‘CONG NGHE SINH HOC’
select SvID,SvName,KhoaName from SinhVien full OUTER JOIN khoa
on SinhVien.KhoaID = khoa.KhoaID
Where KhoaName = 'CONG NGHE SINH HOC'


--4.Đưa ra danh sách gồm mã số, họ tên và tuổi của các sinh viên khoa ‘TOAN’
select SvID,SvName,Age = 2022-Birth from SinhVien full OUTER JOIN khoa
on SinhVien.KhoaID = khoa.KhoaID
Where KhoaName = 'TOAN'


--5.Cho biết số giảng viên của khoa ‘CONG NGHE SINH HOC’
select GvID,GvName,KhoaName from GiangVien Full OUTER JOIN khoa
ON GiangVien.KhoaID = khoa.KhoaID
WHERE KhoaName = 'CONG NGHE SINH HOC'


--6.Cho biết thông tin về sinh viên không tham gia thực tập
select SinhVien.SvID,SvName,KhoaID,Birth,HomeTown from SinhVien JOIN HuongDan
ON SinhVien.SvID = HuongDan.SvID 
WHERE DtID is null;


--7.Đưa ra mã khoa, tên khoa và số giảng viên của mỗi khoa
select khoa.KhoaID,KhoaName,GvId,GvName from khoa Full OUTER JOIN GiangVien
ON khoa.KhoaID = GiangVien.KhoaID


--8.Cho biết số điện thoại của khoa mà sinh viên có tên ‘Le van son’ đang theo học
select SvID,SvName,KhoaName,Phone from khoa full OUTER JOIN SinhVien
on SinhVien.KhoaID = khoa.KhoaID
Where SvName = 'Quan'


--9.Cho biết mã số và tên của các đề tài do giảng viên ‘Tran son’ hướng dẫn
select HuongDan.GvID,GvName,DtName,SvID from DeTai 
JOIN HuongDan on DeTai.DtID = HuongDan.DtID
JOIN GiangVien on HuongDan.GvID = GiangVien.GvID
where GvName = 'Tran son'


--10.Cho biết tên đề tài không có sinh viên nào thực tập 
select DtName from DeTai 
JOIN HuongDan on DeTai.DtID = HuongDan.DtID
where HuongDan.DtID is null and result is null


--11.Cho biết mã số, họ tên, tên khoa của các giảng viên hướng dẫn từ 3 sinh viên trở lên 
select HuongDan.GvID,GvName,KhoaName FROM GiangVien 
join HuongDan on HuongDan.GvID = GiangVien.GvID
join khoa on khoa.KhoaID = GiangVien.KhoaID
Where  GiangVien.GvID in (select HuongDan.GvID from HuongDan
group by GvID
Having count(SvID) >= 3)

--12. Cho biết mã số, tên đề tài của đề tài có kinh phí cao nhất
select DtID,DtName from DeTai
where fee in (select max(fee) from Detai)

--13. Cho biết mã số và tên các đề tài có nhiều hơn 2 sinh viên tham gia thực tập
select distinct DeTai.DtID,DtName from DeTai
join HuongDan on DeTai.DtID = HuongDan.DtID
where DeTai.DtID in (select HuongDan.DtID from HuongDan
group by HuongDan.DtID
Having count (SvID) > 2)


--14. Đưa ra mã số, họ tên và điểm của các sinh viên khoa ‘DIALY và QLTN’
SELECT SinhVien.SvID,SvName,Result FROM SinhVien
join khoa on SinhVien.KhoaID = khoa.KhoaID
join HuongDan on SinhVien.SvID = HuongDan.SvID
where KhoaName = 'Y HOC' or KhoaName = 'QLTN'


--15. Đưa ra tên khoa, số lượng sinh viên của mỗi khoa
select KhoaName,SvID,SvName from khoa
join SinhVien on khoa.KhoaID = SinhVien.KhoaID


--16. Cho biết thông tin về các sinh viên thực tập tại quê nhà
select SinhVien.SvID,SvName,KhoaName,Birth,HomeTown from SinhVien
join khoa on SinhVien.KhoaID = khoa.KhoaID
join HuongDan on SinhVien.SvID = HuongDan.SvID
join DeTai on HuongDan.DtID = DeTai.DtID
where HomeTown = Internship


--17. Hãy cho biết thông tin về những sinh viên chưa có điểm thực tập
select SinhVien.SvID,SvName,KhoaName,Birth,HomeTown from SinhVien
join khoa on SinhVien.KhoaID = khoa.KhoaID
join HuongDan on SinhVien.SvID = HuongDan.SvID
where Result is null


--18. Đưa ra danh sách gồm mã số, họ tên các sinh viên có điểm thực tập bằng 0
select SinhVien.SvID,SvName,Birth,HomeTown,KhoaName from SinhVien
join khoa on SinhVien.KhoaID = khoa.KhoaID
join HuongDan on SinhVien.SvID = HuongDan.SvID
where Result = 0