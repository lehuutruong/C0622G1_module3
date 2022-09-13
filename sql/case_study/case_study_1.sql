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