drop database if exists khu_nghi_duong_furama;
create database khu_nghi_duong_furama;
use khu_nghi_duong_furama;
create table vi_tri(
ma_vi_tri INT auto_increment PRIMARY KEY,
ten_vi_tri VARCHAR(45)
);
create table trinh_do(
ma_trinh_do INT auto_increment primary key,
ten_trinh_do varchar(45)
);
create table bo_phan(
ma_bo_phan int auto_increment primary key,
ten_bo_phan varchar(45)
);
create table nhan_vien(
ma_nhan_vien int auto_increment primary key,
ho_ten varchar(45),
ngay_sinh date,
so_cmnd varchar(45),
luong double,
so_dien_thoai varchar(45),
email varchar(45),
dia_chi varchar(45),
ma_vi_tri int,
foreign key (ma_vi_tri) references vi_tri(ma_vi_tri),
ma_trinh_do int,
foreign key (ma_trinh_do) references trinh_do(ma_trinh_do),
ma_bo_phan int,
foreign key (ma_bo_phan) references bo_phan(ma_bo_phan)
);
create table loai_khach(
ma_loai_khach int auto_increment primary key,
ten_loai_khach varchar(45)
);
create table khach_hang(
ma_khach_hang int auto_increment primary key,
ma_loai_khach int,
foreign key (ma_loai_khach) references loai_khach(ma_loai_khach),
ho_ten varchar(45),
ngay_sinh date,
gioi_tinh bit(1),
so_cmnd varchar(45),
so_dien_thoai varchar(45),
email varchar(45),
dia_chi varchar(45)
);
create table loai_dich_vu(
ma_loai_dich_vu int auto_increment primary key,
ten_loai_dich_vu varchar(45)
);
create table kieu_thue(
ma_kieu_thue int auto_increment primary key,
ten_kieu_thue varchar(45));
create table dich_vu(
ma_dich_vu int auto_increment primary key,
ten_dich_vu varchar(45),
dien_tich int,
chi_phi_thue double,
so_nguoi_toi_da int,
ma_kieu_thue int,
foreign key (ma_kieu_thue) references kieu_thue(ma_kieu_thue),
ma_loai_dich_vu int,
foreign key(ma_loai_dich_vu) references loai_dich_vu(ma_loai_dich_vu),
tieu_chuan_phong varchar(45),
mo_ta_tien_nghi_khac varchar(45),
dien_tich_ho_boi double,
so_tang int,
dich_vu_mien_phi_di_kem text
);
create table hop_dong(
ma_hop_dong int auto_increment primary key,
ngay_lam_hop_dong datetime,
ngay_ket_thuc datetime,
tien_dat_coc double,
ma_nhan_vien int,
foreign key (ma_nhan_vien) references nhan_vien(ma_nhan_vien),
ma_khach_hang int,
foreign key (ma_khach_hang) references khach_hang(ma_khach_hang),
ma_dich_vu int,
foreign key(ma_dich_vu) references dich_vu(ma_dich_vu)
);
create table dich_vu_di_kem(
ma_dich_vu_di_kem int auto_increment primary key,
ten_dich_vu_di_kem varchar(45),
gia double,
don_vi varchar(10),
trang_thai varchar(45)
);
create table hop_dong_chi_tiet(
ma_hop_dong_chi_tiet int  auto_increment primary key,
ma_hop_dong int,
foreign key (ma_hop_dong) references hop_dong(ma_hop_dong),
ma_dich_vu_di_kem int,
foreign key (ma_dich_vu_di_kem) references dich_vu_di_kem(ma_dich_vu_di_kem),
so_luong int);
insert into khu_nghi_duong_furama.vi_tri (ten_vi_tri) values("Quản Lý");
insert into khu_nghi_duong_furama.vi_tri (ten_vi_tri)values("Nhân Viên");

insert into khu_nghi_duong_furama.trinh_do(ten_trinh_do) values("Trung Cấp");
insert into khu_nghi_duong_furama.trinh_do(ten_trinh_do) values("Cao Đẳng");
insert into khu_nghi_duong_furama.trinh_do(ten_trinh_do) values("Đại Học");
insert into khu_nghi_duong_furama.trinh_do(ten_trinh_do) values("Sau Đại Học");

insert into khu_nghi_duong_furama.bo_phan(ten_bo_phan)values ("Sale-Marketing");
insert into khu_nghi_duong_furama.bo_phan(ten_bo_phan)values ("Hành Chính");
insert into khu_nghi_duong_furama.bo_phan(ten_bo_phan)values ("Phục Vụ");
insert into khu_nghi_duong_furama.bo_phan(ten_bo_phan)values ("Quản Lý");

insert into khu_nghi_duong_furama.nhan_vien(ho_ten,ngay_sinh,so_cmnd,luong,so_dien_thoai,email,dia_chi,ma_vi_tri,ma_trinh_do,ma_bo_phan) values ("Nguyễn Văn An","1970-11-07","456231786",10000000,"0901234121","annguyen@gmail.com","295 Nguyễn Tất Thành, Đà Nẵng",1,3,1);
insert into khu_nghi_duong_furama.nhan_vien(ho_ten,ngay_sinh,so_cmnd,luong,so_dien_thoai,email,dia_chi,ma_vi_tri,ma_trinh_do,ma_bo_phan) values ("Lê Văn Bình","1997-04-09","654231234",7000000,"0934212314","binhlv@gmail.com","22 Yên Bái, Đà Nẵng",1,2,2);
insert into khu_nghi_duong_furama.nhan_vien(ho_ten,ngay_sinh,so_cmnd,luong,so_dien_thoai,email,dia_chi,ma_vi_tri,ma_trinh_do,ma_bo_phan) values ("Hồ Thị Yến","1995-12-12","999231723",14000000,"0412352315","thiyen@gmail.com","K234/11 Điện Biên Phủ, Gia Lai",1,3,2);
insert into khu_nghi_duong_furama.nhan_vien(ho_ten,ngay_sinh,so_cmnd,luong,so_dien_thoai,email,dia_chi,ma_vi_tri,ma_trinh_do,ma_bo_phan) values ("Võ Công Toản","1980-04-04","123231365",17000000,"0374443232","toan0404@gmail.com","77 Hoàng Diệu, Quảng Trị",1,4,4);
insert into khu_nghi_duong_furama.nhan_vien(ho_ten,ngay_sinh,so_cmnd,luong,so_dien_thoai,email,dia_chi,ma_vi_tri,ma_trinh_do,ma_bo_phan) values ("Nguyễn Bỉnh Phát","1999-12-09","454363232",6000000,"0902341231","phatphat@gmail.com","43 Yên Bái, Đà Nẵng",2,1,1);
insert into khu_nghi_duong_furama.nhan_vien(ho_ten,ngay_sinh,so_cmnd,luong,so_dien_thoai,email,dia_chi,ma_vi_tri,ma_trinh_do,ma_bo_phan) values ("Khúc Nguyễn An Nhi","2000-11-08","964542311",7000000,"0978653213","annghi20@gmail.com","294 Nguyễn Tất Thành, Đà Nẵng",2,2,3);
insert into khu_nghi_duong_furama.nhan_vien(ho_ten,ngay_sinh,so_cmnd,luong,so_dien_thoai,email,dia_chi,ma_vi_tri,ma_trinh_do,ma_bo_phan) values ("Nguyễn Hữu Hà","1993-01-01","534323231",8000000,"0941234553","nhh0101@gmail.com","4 Nguyễn Chí Thanh, Huế",2,3,2);
insert into khu_nghi_duong_furama.nhan_vien(ho_ten,ngay_sinh,so_cmnd,luong,so_dien_thoai,email,dia_chi,ma_vi_tri,ma_trinh_do,ma_bo_phan) values ("Nguyễn Hà Đông","1989-09-03","234414123",9000000,"0642123111","donghaguyen@gmail.com","111 Hùng Vương, Hà Nội",2,4,4);
insert into khu_nghi_duong_furama.nhan_vien(ho_ten,ngay_sinh,so_cmnd,luong,so_dien_thoai,email,dia_chi,ma_vi_tri,ma_trinh_do,ma_bo_phan) values ("Tòng Hoang","1982-09-03","256781231",6000000,"0245144444","hoangtong@gmail.com","213 Hàm Nghi, Đà Nẵng",2,4,4);
insert into khu_nghi_duong_furama.nhan_vien(ho_ten,ngay_sinh,so_cmnd,luong,so_dien_thoai,email,dia_chi,ma_vi_tri,ma_trinh_do,ma_bo_phan) values ("Nguyễn Công Đạo","1994-01-08","755434343",8000000,"0988767111","nguyencongdao12@gmail.com","6 Hoà Khánh, Đồng Nai",2,3,2);

insert into khu_nghi_duong_furama.loai_khach(ten_loai_khach) values("Diamond");
insert into khu_nghi_duong_furama.loai_khach(ten_loai_khach) values("Platinium");
insert into khu_nghi_duong_furama.loai_khach(ten_loai_khach) values("Gold");
insert into khu_nghi_duong_furama.loai_khach(ten_loai_khach) values("Silver");
insert into khu_nghi_duong_furama.loai_khach(ten_loai_khach) values("Member");

insert into khu_nghi_duong_furama.khach_hang(ho_ten,ngay_sinh,gioi_tinh,so_cmnd,so_dien_thoai,email,dia_chi,ma_loai_khach) values("Nguyễn Thị Hào","1970-11-07",0,"643431213","0945423362","thihao07@gmail.com","23 Nguyễn Hoàng, Đà Nẵng",5);
insert into khu_nghi_duong_furama.khach_hang(ho_ten,ngay_sinh,gioi_tinh,so_cmnd,so_dien_thoai,email,dia_chi,ma_loai_khach) values("Phạm Xuân Diệu","1992-08-08",1,"865342123","0954333333","xuandieu92@gmail.com","K77/22 Thái Phiên, Quảng Trị",3);
insert into khu_nghi_duong_furama.khach_hang(ho_ten,ngay_sinh,gioi_tinh,so_cmnd,so_dien_thoai,email,dia_chi,ma_loai_khach) values("Trương Đình Nghệ","1990-02-27",1,"488645199","0373213122","nghenhan2702@gmail.com","K323/12 Ông Ích Khiêm, Vinh",1);
insert into khu_nghi_duong_furama.khach_hang(ho_ten,ngay_sinh,gioi_tinh,so_cmnd,so_dien_thoai,email,dia_chi,ma_loai_khach) values("Dương Văn Quan","1981-07-08",1,"543432111","0490039241","duongquan@gmail.com","K453/12 Lê Lợi, Đà Nẵng",1);
insert into khu_nghi_duong_furama.khach_hang(ho_ten,ngay_sinh,gioi_tinh,so_cmnd,so_dien_thoai,email,dia_chi,ma_loai_khach) values("Hoàng Trần Nhi Nhi","1995-12-09",0,"795453345","0312345678","nhinhi123@gmail.com","224 Lý Thái Tổ, Gia Lai",4);
insert into khu_nghi_duong_furama.khach_hang(ho_ten,ngay_sinh,gioi_tinh,so_cmnd,so_dien_thoai,email,dia_chi,ma_loai_khach) values("Tôn Nữ Mộc Châu","2005-12-06",0,"732434215","0988888844","tonnuchau@gmail.com","37 Yên Thế, Đà Nẵng",4);
insert into khu_nghi_duong_furama.khach_hang(ho_ten,ngay_sinh,gioi_tinh,so_cmnd,so_dien_thoai,email,dia_chi,ma_loai_khach) values("Nguyễn Mỹ Kim","1984-04-08",0,"856453123","0912345698","kimcuong84@gmail.com","K123/45 Lê Lợi, Hồ Chí Minh",1);
insert into khu_nghi_duong_furama.khach_hang(ho_ten,ngay_sinh,gioi_tinh,so_cmnd,so_dien_thoai,email,dia_chi,ma_loai_khach) values("Nguyễn Thị Hào","1999-04-08",0,"965656433","0763212345","haohao99@gmail.com","55 Nguyễn Văn Linh, Kon Tum",3);
insert into khu_nghi_duong_furama.khach_hang(ho_ten,ngay_sinh,gioi_tinh,so_cmnd,so_dien_thoai,email,dia_chi,ma_loai_khach) values("Trần Đại Danh","1994-07-01",1,"432341235","0643343433","danhhai99@gmail.com","24 Lý Thường Kiệt, Quảng Ngãi",1);
insert into khu_nghi_duong_furama.khach_hang(ho_ten,ngay_sinh,gioi_tinh,so_cmnd,so_dien_thoai,email,dia_chi,ma_loai_khach) values("Nguyễn Tâm Đắc","1989-07-01",1,"344343432","0987654321","dactam@gmail.com","22 Ngô Quyền, Đà Nẵng",2);


insert into khu_nghi_duong_furama.kieu_thue (ten_kieu_thue) values ("year");
insert into khu_nghi_duong_furama.kieu_thue (ten_kieu_thue) values ("month");
insert into khu_nghi_duong_furama.kieu_thue (ten_kieu_thue) values ("day");
insert into khu_nghi_duong_furama.kieu_thue (ten_kieu_thue) values ("hour");

insert into khu_nghi_duong_furama.loai_dich_vu(ten_loai_dich_vu) values("Villa");
insert into khu_nghi_duong_furama.loai_dich_vu(ten_loai_dich_vu) values("House");
insert into khu_nghi_duong_furama.loai_dich_vu(ten_loai_dich_vu) values("Room");

insert into khu_nghi_duong_furama.dich_vu(ten_dich_vu,dien_tich,chi_phi_thue,so_nguoi_toi_da,tieu_chuan_phong,mo_ta_tien_nghi_khac,dien_tich_ho_boi,so_tang,dich_vu_mien_phi_di_kem,ma_kieu_thue,ma_loai_dich_vu) values("Villa Beach Front",25000,1000000,10,"vip","Có hồ bơi",500,4,"null",3,1);
insert into khu_nghi_duong_furama.dich_vu(ten_dich_vu,dien_tich,chi_phi_thue,so_nguoi_toi_da,tieu_chuan_phong,mo_ta_tien_nghi_khac,dien_tich_ho_boi,so_tang,dich_vu_mien_phi_di_kem,ma_kieu_thue,ma_loai_dich_vu) values("House Princess 01",14000,5000000,7,"vip","Có thêm bếp nướng",null,3,"null",2,2);
insert into khu_nghi_duong_furama.dich_vu(ten_dich_vu,dien_tich,chi_phi_thue,so_nguoi_toi_da,tieu_chuan_phong,mo_ta_tien_nghi_khac,dien_tich_ho_boi,so_tang,dich_vu_mien_phi_di_kem,ma_kieu_thue,ma_loai_dich_vu) values("Room Twin 01",5000,1000000,2,"normal","Có tivi",null,null,"1 Xe máy, 1 Xe đạp",4,3);
insert into khu_nghi_duong_furama.dich_vu(ten_dich_vu,dien_tich,chi_phi_thue,so_nguoi_toi_da,tieu_chuan_phong,mo_ta_tien_nghi_khac,dien_tich_ho_boi,so_tang,dich_vu_mien_phi_di_kem,ma_kieu_thue,ma_loai_dich_vu) values("Villa No Beach Front",22000,9000000,8,"normal","Có hồ bơi",300,3,"null",3,1);
insert into khu_nghi_duong_furama.dich_vu(ten_dich_vu,dien_tich,chi_phi_thue,so_nguoi_toi_da,tieu_chuan_phong,mo_ta_tien_nghi_khac,dien_tich_ho_boi,so_tang,dich_vu_mien_phi_di_kem,ma_kieu_thue,ma_loai_dich_vu) values("House Princess 02",10000,4000000,5,"normal","Có thêm bếp nướng",null,2,"null",3,2);
insert into khu_nghi_duong_furama.dich_vu(ten_dich_vu,dien_tich,chi_phi_thue,so_nguoi_toi_da,tieu_chuan_phong,mo_ta_tien_nghi_khac,dien_tich_ho_boi,so_tang,dich_vu_mien_phi_di_kem,ma_kieu_thue,ma_loai_dich_vu) values("Room Twin 02",3000,900000,2,"normal","Có tivi",null,null,"1 Xe máy",4,3);

insert into khu_nghi_duong_furama.dich_vu_di_kem(ten_dich_vu_di_kem,gia,don_vi,trang_thai) values ("Karaoke",10000,"giờ","tiện nghi, hiện tại");
insert into khu_nghi_duong_furama.dich_vu_di_kem(ten_dich_vu_di_kem,gia,don_vi,trang_thai) values ("Thuê xe máy",10000,"chiếc","hỏng 1 xe");
insert into khu_nghi_duong_furama.dich_vu_di_kem(ten_dich_vu_di_kem,gia,don_vi,trang_thai) values ("Thuê xe đạp",20000,"chiếc","tốt");
insert into khu_nghi_duong_furama.dich_vu_di_kem(ten_dich_vu_di_kem,gia,don_vi,trang_thai) values ("Buffet buổi sáng",15000,"suất","đầy đủ đồ ăn, tráng miệng");
insert into khu_nghi_duong_furama.dich_vu_di_kem(ten_dich_vu_di_kem,gia,don_vi,trang_thai) values ("Buffet buổi trưa",90000,"suất","đầy đủ đồ ăn, tráng miệng");
insert into khu_nghi_duong_furama.dich_vu_di_kem(ten_dich_vu_di_kem,gia,don_vi,trang_thai) values ("Buffet buổi tối",16000,"suất","đầy đủ đồ ăn, tráng miệng");

insert into khu_nghi_duong_furama.hop_dong(ngay_lam_hop_dong,ngay_ket_thuc,tien_dat_coc,ma_nhan_vien,ma_khach_hang,ma_dich_vu) values("2020-12-08","2020-12-08",0,3,1,3);
insert into khu_nghi_duong_furama.hop_dong(ngay_lam_hop_dong,ngay_ket_thuc,tien_dat_coc,ma_nhan_vien,ma_khach_hang,ma_dich_vu) values("2020-07-14","2020-07-21",200000,7,3,1);
insert into khu_nghi_duong_furama.hop_dong(ngay_lam_hop_dong,ngay_ket_thuc,tien_dat_coc,ma_nhan_vien,ma_khach_hang,ma_dich_vu) values("2021-03-15","2021-03-17",50000,3,4,2);
insert into khu_nghi_duong_furama.hop_dong(ngay_lam_hop_dong,ngay_ket_thuc,tien_dat_coc,ma_nhan_vien,ma_khach_hang,ma_dich_vu) values("2021-01-14","2021-01-18",100000,7,5,5);
insert into khu_nghi_duong_furama.hop_dong(ngay_lam_hop_dong,ngay_ket_thuc,tien_dat_coc,ma_nhan_vien,ma_khach_hang,ma_dich_vu) values("2021-07-14","2021-07-15",0,7,2,6);
insert into khu_nghi_duong_furama.hop_dong(ngay_lam_hop_dong,ngay_ket_thuc,tien_dat_coc,ma_nhan_vien,ma_khach_hang,ma_dich_vu) values("2021-06-01","2021-06-03",0,7,7,6);
insert into khu_nghi_duong_furama.hop_dong(ngay_lam_hop_dong,ngay_ket_thuc,tien_dat_coc,ma_nhan_vien,ma_khach_hang,ma_dich_vu) values("2021-09-02","2021-09-05",100000,7,4,4);
insert into khu_nghi_duong_furama.hop_dong(ngay_lam_hop_dong,ngay_ket_thuc,tien_dat_coc,ma_nhan_vien,ma_khach_hang,ma_dich_vu) values("2021-06-17","2021-06-18",150000,3,4,1);
insert into khu_nghi_duong_furama.hop_dong(ngay_lam_hop_dong,ngay_ket_thuc,tien_dat_coc,ma_nhan_vien,ma_khach_hang,ma_dich_vu) values("2020-11-19","2020-11-19",0,3,4,3);
insert into khu_nghi_duong_furama.hop_dong(ngay_lam_hop_dong,ngay_ket_thuc,tien_dat_coc,ma_nhan_vien,ma_khach_hang,ma_dich_vu) values("2021-04-12","2021-04-14",0,10,3,5);
insert into khu_nghi_duong_furama.hop_dong(ngay_lam_hop_dong,ngay_ket_thuc,tien_dat_coc,ma_nhan_vien,ma_khach_hang,ma_dich_vu) values("2021-04-25","2021-04-25",0,2,2,1);
insert into khu_nghi_duong_furama.hop_dong(ngay_lam_hop_dong,ngay_ket_thuc,tien_dat_coc,ma_nhan_vien,ma_khach_hang,ma_dich_vu) values("2021-05-25","2021-05-27",0,7,10,1);

insert into khu_nghi_duong_furama.hop_dong_chi_tiet(so_luong,ma_hop_dong,ma_dich_vu_di_kem) values(5,2,4);
insert into khu_nghi_duong_furama.hop_dong_chi_tiet(so_luong,ma_hop_dong,ma_dich_vu_di_kem) values(8,2,5);
insert into khu_nghi_duong_furama.hop_dong_chi_tiet(so_luong,ma_hop_dong,ma_dich_vu_di_kem) values(15,2,6);
insert into khu_nghi_duong_furama.hop_dong_chi_tiet(so_luong,ma_hop_dong,ma_dich_vu_di_kem) values(1,3,1);
insert into khu_nghi_duong_furama.hop_dong_chi_tiet(so_luong,ma_hop_dong,ma_dich_vu_di_kem) values(11,3,2);
insert into khu_nghi_duong_furama.hop_dong_chi_tiet(so_luong,ma_hop_dong,ma_dich_vu_di_kem) values(1,1,3);
insert into khu_nghi_duong_furama.hop_dong_chi_tiet(so_luong,ma_hop_dong,ma_dich_vu_di_kem) values(2,1,2);
insert into khu_nghi_duong_furama.hop_dong_chi_tiet(so_luong,ma_hop_dong,ma_dich_vu_di_kem) values(2,12,2);
-- 2.	Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự.
select * 
from nhan_vien
 where ho_ten regexp '([A-Za-z//s]+//sH[a-z]+)'and length(ho_ten)<=15;
-- 3.	Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
select * 
from khach_hang 
where year(ngay_sinh)<=2004 and year(ngay_sinh)>=1972 and (dia_chi like "%Quảng Trị" or dia_chi like "%Đà Nẵng");

-- -----
select * from khach_hang
where((timestampdiff(year,ngay_sinh,curdate()) between 18 and 50) and (dia_chi like "%Quảng Trị" or dia_chi like "%Đà Nẵng"));
-- 4.	Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần.
--  Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng. 
--  Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.
select  h.ma_khach_hang,count(hd.ma_khach_hang) as so_luong from loai_khach s
join khach_hang c on c.ma_loai_khach=s.ma_loai_khach
join hop_dong h on h.ma_khach_hang=c.ma_khach_hang
where s.ten_loai_khach="Diamond"
group by h.ma_khach_hang
order by so_luong ;
-- ------
select kh.ma_khach_hang, count(hd.ma_hop_dong) from hop_dong hd
join khach_hang kh on kh.ma_khach_hang=hd.ma_khach_hang
join loai_khach lk on lk.ma_loai_khach=kh.ma_loai_khach
where lk.ten_loai_khach ="Diamond"
group by hd.ma_khach_hang;


-- ----
-- bài5
-- 5.	Hiển thị ma_khach_hang, ho_ten,
--  ten_loai_khach, ma_hop_dong, ten_dich_vu, 
--  ngay_lam_hop_dong, ngay_ket_thuc, tong_tien 
--  (Với tổng tiền được tính theo công thức như sau: Chi Phí Thuê + Số Lượng * Giá, với Số Lượng và Giá là từ bảng dich_vu_di_kem, hop_dong_chi_tiet) 
--  cho tất cả các khách hàng đã từng đặt phòng. (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).

select kh.ma_khach_hang,kh.ho_ten,lk.ten_loai_khach,hd.ma_hop_dong,dv.ten_dich_vu,hd.ngay_lam_hop_dong,hd.ngay_ket_thuc,  sum((ifnull(hdct.so_luong * dvdk.gia, 0)) + chi_phi_thue) tong_tien from loai_khach lk
join khach_hang kh on kh.ma_loai_khach=lk.ma_loai_khach
left join hop_dong hd on hd.ma_khach_hang=kh.ma_khach_hang
left join dich_vu dv on dv.ma_dich_vu-hd.ma_dich_vu
left join hop_dong_chi_tiet hdct on hdct.ma_hop_dong=hd.ma_hop_dong
left join dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem=hdct.ma_dich_vu_di_kem
group by hd.ma_hop_dong
order by kh.ma_khach_hang, hd.ma_hop_dong;
-- 6.	Hiển thị ma_dich_vu, ten_dich_vu, dien_tich,
--  chi_phi_thue, ten_loai_dich_vu của tất cả các loại dịch vụ chưa từng 
--  được khách hàng thực hiện đặt từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3).
select hd.ngay_lam_hop_dong, dv.ma_dich_vu,dv.ten_dich_vu,dv.dien_tich,dv.chi_phi_thue,ldv.ten_loai_dich_vu
from dich_vu dv
join loai_dich_vu ldv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
join hop_dong hd on hd.ma_dich_vu = dv.ma_dich_vu
where dv.ma_dich_vu not in (select dv.ma_dich_vu from dich_vu dv join hop_dong hd on hd.ma_dich_vu = dv.ma_dich_vu
        where ((month(hd.ngay_lam_hop_dong) between 1 and 3) and year(hd.ngay_lam_hop_dong) = '2021')
        group by  dv.ten_dich_vu)
group by dv.ten_dich_vu
order by  dv.dien_tich desc;


-- 7.	Hiển thị thông tin ma_dich_vu,
--  ten_dich_vu, dien_tich, so_nguoi_toi_da,
--  chi_phi_thue, ten_loai_dich_vu của tất cả các 
--  loại dịch vụ đã từng được khách hàng đặt phòng trong năm 2020 nhưng chưa từng được khách hàng đặt phòng trong năm 2021.
select *from hop_dong;
select * from dich_vu;
select hd.ngay_lam_hop_dong, dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.so_nguoi_toi_da, dv.chi_phi_thue, ldv.ten_loai_dich_vu 
from loai_dich_vu ldv
join dich_vu dv on ldv.ma_loai_dich_vu = dv.ma_loai_dich_vu
join hop_dong hd on dv.ma_dich_vu = hd.ma_dich_vu
where hd.ma_dich_vu not in
(select hd.ma_dich_vu from hop_dong hd
join dich_vu dv on dv.ma_dich_vu = hd.ma_dich_vu
where year(hd.ngay_lam_hop_dong)  = 2021) and year(ngay_lam_hop_dong)=2020
group by hd.ma_dich_vu;
 
-- 8.	Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không trùng nhau.
-- Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên.
-- c1
select kh.ho_ten 
from loai_khach lk
join khach_hang kh on kh.ma_loai_khach=lk.ma_loai_khach
group by kh.ho_ten;
-- c2
select kh.ho_ten 
from loai_khach lk 
join khach_hang kh on lk.ma_loai_khach=kh.ma_loai_khach
union
select kh.ho_ten 
from khach_hang kh 
join loai_khach lk on kh.ma_loai_khach=lk.ma_loai_khach;
-- c3  
select distinct kh.ho_ten 
from loai_khach lk join khach_hang kh on lk.ma_loai_khach=kh.ma_loai_khach;
-- 9.	Thực hiện thống kê doanh thu theo tháng,
--  nghĩa là tương ứng với mỗi tháng trong năm 2021 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.
select month(hop_dong.ngay_lam_hop_dong) thang,count(month(hop_dong.ngay_lam_hop_dong)) so_luong_khach_hang
from hop_dong
where year(hop_dong.ngay_lam_hop_dong) = '2021'
group by month(hop_dong.ngay_lam_hop_dong)
order by thang;
-- 10.	Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm.
--  Kết quả hiển thị bao gồm ma_hop_dong,
--  ngay_lam_hop_dong, ngay_ket_thuc, 
--  tien_dat_coc, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem).
select hop_dong.ma_hop_dong,hop_dong.ngay_lam_hop_dong,hop_dong.ngay_ket_thuc,hop_dong.tien_dat_coc,
sum(ifnull(hop_dong_chi_tiet.so_luong, 0)) so_luong_dich_vu_di_kem
from hop_dong
left join
hop_dong_chi_tiet on hop_dong_chi_tiet.ma_hop_dong = hop_dong.ma_hop_dong
group by hop_dong.ma_hop_dong;
-- 5.	Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, 
-- ngay_lam_hop_dong, ngay_ket_thuc, tong_tien (Với tổng tiền được tính theo công thức như sau:
--  Chi Phí Thuê + Số Lượng * Giá, với Số Lượng và Giá là từ bảng dich_vu_di_kem, hop_dong_chi_tiet) 
--  cho tất cả các khách hàng đã từng đặt phòng. (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).
select k.ma_khach_hang,k.ho_ten,lk.ten_loai_khach,hd.ma_hop_dong,dv.ten_dich_vu,hd.ngay_lam_hop_dong,hd.ngay_ket_thuc,
    sum((ifnull(hdct.so_luong * dvdk.gia, 0)) + chi_phi_thue) tong_tien
from khach_hang k
left join loai_khach lk on k.ma_loai_khach = lk.ma_loai_khach
left join hop_dong hd on hd.ma_khach_hang = k.ma_khach_hang
left join dich_vu dv on hd.ma_dich_vu = dv.ma_dich_vu
left join hop_dong_chi_tiet hdct on hdct.ma_hop_dong = hd.ma_hop_dong
left join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
group by  hd.ma_hop_dong
order by k.ma_khach_hang;

-- 11.	Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng
--  có ten_loai_khach là “Diamond” và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.
select dvdk.ma_dich_vu_di_kem,dvdk.ten_dich_vu_di_kem,dvdk.gia,dvdk.don_vi,dvdk.trang_thai
from khach_hang kh join loai_khach lk on kh.ma_loai_khach = lk.ma_loai_khach
                   join hop_dong hd on kh.ma_khach_hang = hd.ma_khach_hang
                   join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
                   join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
where lk.ten_loai_khach = 'Diamond'
        and (kh.dia_chi like '%Vinh'or kh.dia_chi like '%Quảng Ngãi');
	
-- 12.	Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng),
--  so_dien_thoai (khách hàng), ten_dich_vu, so_luong_dich_vu_di_kem 
--  (được tính dựa trên việc sum so_luong ở dich_vu_di_kem), tien_dat_coc của tất cả các dịch vụ đã từng được khách 
-- hàng đặt vào 3 tháng cuối năm 2020 nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021.
	select hd.ma_hop_dong, nv.ho_ten,kh.ho_ten,kh.so_dien_thoai,dv.ten_dich_vu, sum(ifnull(hdct.so_luong,0)) so_luong_dich_vu_di_kem,hd.tien_dat_coc,hd.ngay_lam_hop_dong
    from hop_dong hd
     left join hop_dong_chi_tiet hdct on hd.ma_hop_dong=hdct.ma_hop_dong
 join dich_vu dv on dv.ma_dich_vu=hd.ma_dich_vu
    join khach_hang kh on kh.ma_khach_hang=hd.ma_khach_hang
    join nhan_vien nv on nv.ma_nhan_vien=hd.ma_nhan_vien
    where  month(ngay_lam_hop_dong) not in(
    select month(ngay_lam_hop_dong) from hop_dong hd 
    join dich_vu dv on hd.ma_dich_vu=dv.ma_dich_vu
    where month(ngay_lam_hop_dong) in(1,2,3,4,5,6) and year(ngay_lam_hop_dong)=2021)
   and (month(ngay_lam_hop_dong) in(10,11,12) and year(ngay_lam_hop_dong)=2020)
    group by hd.ma_hop_dong;

-- 13.	Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng. 
-- (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).
drop view if exists w_dich_vu_di_kem;
create view w_dich_vu_di_kem as
select dich_vu_di_kem.ma_dich_vu_di_kem,dich_vu_di_kem.ten_dich_vu_di_kem, SUM(hop_dong_chi_tiet.so_luong) as so_luong
from dich_vu_di_kem
join hop_dong_chi_tiet on dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem
group by hop_dong_chi_tiet.ma_dich_vu_di_kem;
select *from w_dich_vu_di_kem;
select w_dich_vu_di_kem.ma_dich_vu_di_kem,w_dich_vu_di_kem.ten_dich_vu_di_kem,w_dich_vu_di_kem.so_luong 
from w_dich_vu_di_kem
 where w_dich_vu_di_kem.so_luong = (select max(w_dich_vu_di_kem.so_luong) from w_dich_vu_di_kem);


-- 14.	Hiển thị thông tin tất cả  Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất. 
-- Thông tin hiển thị bao gồm ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, so_lan_su_dung 
-- (được tính dựa trên việc count các ma_dich_vu_di_kem).
select  hd.ma_hop_dong,ldv.ten_loai_dich_vu, dvdk.ten_dich_vu_di_kem,count(hdct.so_luong) so_lan_su_dung
from hop_dong_chi_tiet hdct 
 join hop_dong hd on hdct.ma_hop_dong=hd.ma_hop_dong
join dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem=hdct.ma_dich_vu_di_kem
join dich_vu dv on dv.ma_dich_vu=hd.ma_dich_vu
join loai_dich_vu ldv on ldv.ma_loai_dich_vu=dv.ma_loai_dich_vu
group by dvdk.ma_dich_vu_di_kem
having so_lan_su_dung=1;

-- 15.	Hiển thi thông tin của tất cả nhân viên bao gồm ma_nhan_vien, ho_ten, 
-- ten_trinh_do, ten_bo_phan, so_dien_thoai, dia_chi mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021
select nv.ma_nhan_vien,nv.ho_ten,td.ten_trinh_do,bp.ten_bo_phan,nv.so_dien_thoai,nv.dia_chi,count(hd.ma_hop_dong) as so_luong
from nhan_vien nv
join trinh_do td on nv.ma_trinh_do=td.ma_trinh_do
join bo_phan bp on nv.ma_bo_phan=bp.ma_bo_phan
join hop_dong hd on hd.ma_nhan_vien=nv.ma_nhan_vien
group by nv.ma_nhan_vien
having so_luong <= 3;
-- 16.	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.
 delete from nhan_vien nv 
 where nv.ma_nhan_vien not in(
 select hd.ma_nhan_vien from hop_dong hd
 where year(hd.ngay_lam_hop_dong) 
 between 2019 and 20221);
 select * from nhan_vien;
--  c2--------
drop view if exists v_nhan_vien;
create view v_nhan_vien as
select nv.ma_nhan_vien
from nhan_vien nv
join hop_dong hd on nv.ma_nhan_vien = hd.ma_nhan_vien
group by nv.ma_nhan_vien
having count(hd.ma_hop_dong) >0;
select * from v_nhan_vien;
set sql_safe_updates = 0;
delete from nhan_vien nv where nv.ma_nhan_vien not in (select v_nhan_vien.ma_nhan_vien  from v_nhan_vien );
select * from nhan_vien;
 
-- 17.	Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond, 
-- chỉ cập nhật những khách hàng đã từng đặt phòng với Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ.
drop view if exists  w_khach_hang;
create view w_khach_hang as
select khach_hang.ma_khach_hang,
khach_hang.ho_ten,
loai_khach.ten_loai_khach,
hop_dong.ma_hop_dong, 
dich_vu.ten_dich_vu, 
hop_dong.ngay_lam_hop_dong,
hop_dong.ngay_ket_thuc, 
(ifnull(dich_vu.chi_phi_thue,0)+ SUM(ifnull(hop_dong_chi_tiet.so_luong,0)*ifnull(dich_vu_di_kem.gia,0)))  as tong_tien
from khach_hang
left join loai_khach on khach_hang.ma_loai_khach = loai_khach.ma_loai_khach 
left join hop_dong on khach_hang.ma_khach_hang = hop_dong.ma_khach_hang 
left join dich_vu on hop_dong.ma_dich_vu = dich_vu.ma_dich_vu
left join hop_dong_chi_tiet on hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
left join dich_vu_di_kem on dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem
group by hop_dong.ma_hop_dong, khach_hang.ma_khach_hang
order by khach_hang.ma_khach_hang;

update khach_hang 
join w_khach_hang on khach_hang.ma_khach_hang = w_khach_hang.ma_khach_hang
join hop_dong on hop_dong.ma_khach_hang = khach_hang.ma_khach_hang
set khach_hang.ma_loai_khach =1
where khach_hang.ma_loai_khach=2 and khach_hang.ma_khach_hang in (
select w_khach_hang.ma_khach_hang from w_khach_hang where w_khach_hang.tong_tien >10000000
) and year(hop_dong.ngay_lam_hop_dong) between 2021 and 2021; 

select * from khach_hang;

-- ---------------------
drop view  if exists w_tong_tien;
create view w_tong_tien as select lk.ma_loai_khach (sum(dv.chi_phi_thue)+sum(hdct.so_luong * dvdk.gia)) as tong_tien
from loai_khach lk
join khach_hang kh on kh.ma_loai_khach=lk.ma_loai_khach
join hop_dong hd on hd.ma_khach_hang=kh.ma_khach_hang
join dich_vu dv on dv.ma_dich_vu=hd.ma_dich_vu
join hop_dong_chi_tiet hdct on hdct.ma_hop_dong=hd.ma_hop_dong
join dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem=hdct.ma_dich_vu_di_kem
group by kh.ma_khach_hang;
select * from w_tong_tien;

update loai_khach 
join w_tong_tien on w_tong_tien.ma_loai_khach=loai_khach.ma_loai_khach
set loai_khach.ten_loai_khach="Dianmond"
where loai_khach.ten_loai_khach= "Platinum" and w_tong_tien.tong_tien>10000000;

select* from loai_khach;
-- 18.	Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).
set FOREIGN_KEY_CHECKS=0;
delete from khach_hang
where khach_hang.ma_khach_hang in (
select hop_dong.ma_khach_hang from hop_dong 
where year(hop_dong.ngay_lam_hop_dong) < 2021);
select *from khach_hang;
-- 19.	Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi.
drop view if exists w_hop_dong;
create view w_hop_dong as
select hop_dong_chi_tiet.ma_dich_vu_di_kem, SUM(hop_dong_chi_tiet.so_luong) as so_luong 
from hop_dong_chi_tiet
join hop_dong on hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
where hop_dong.ma_hop_dong  in (
select hop_dong.ma_hop_dong 
from hop_dong 
where year(hop_dong.ngay_lam_hop_dong)=2020)
group by hop_dong_chi_tiet.ma_dich_vu_di_kem;
select * from w_hop_dong;

update dich_vu_di_kem 
join w_hop_dong on w_hop_dong.ma_dich_vu_di_kem =  dich_vu_di_kem.ma_dich_vu_di_kem
set dich_vu_di_kem.gia = dich_vu_di_kem.gia*2
where w_hop_dong.so_luong>10;
select * from dich_vu_di_kem;
-- ----
select count(hdct.ma_hop_dong_chi_tiet) as so_lan_su_dung, dvdk.ma_dich_vu_di_kem
from dich_vu_di_kem dvdk
join hop_dong_chi_tiet hdct on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
join hop_dong hd on hd.ma_hop_dong = hdct.ma_hop_dong
group by dvdk.ma_dich_vu_di_kem
having count(hdct.ma_hop_dong_chi_tiet) >0;
-- 20.	Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống,
--  thông tin hiển thị bao gồm id (ma_nhan_vien, ma_khach_hang), ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi.

select nv.ma_nhan_vien,nv.ho_ten, nv.email, nv.so_dien_thoai, nv.ngay_sinh, nv.dia_chi from nhan_vien nv
union
select kh.ma_khach_hang,kh.ho_ten, kh.email, kh.so_dien_thoai, kh.ngay_sinh, kh.dia_chi from khach_hang kh
