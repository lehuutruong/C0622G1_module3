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
insert into khu_nghi_duong_furama.vi_tri (ten_vi_tri) values("Qu???n L??");
insert into khu_nghi_duong_furama.vi_tri (ten_vi_tri)values("Nh??n Vi??n");

insert into khu_nghi_duong_furama.trinh_do(ten_trinh_do) values("Trung C???p");
insert into khu_nghi_duong_furama.trinh_do(ten_trinh_do) values("Cao ?????ng");
insert into khu_nghi_duong_furama.trinh_do(ten_trinh_do) values("?????i H???c");
insert into khu_nghi_duong_furama.trinh_do(ten_trinh_do) values("Sau ?????i H???c");

insert into khu_nghi_duong_furama.bo_phan(ten_bo_phan)values ("Sale-Marketing");
insert into khu_nghi_duong_furama.bo_phan(ten_bo_phan)values ("H??nh Ch??nh");
insert into khu_nghi_duong_furama.bo_phan(ten_bo_phan)values ("Ph???c V???");
insert into khu_nghi_duong_furama.bo_phan(ten_bo_phan)values ("Qu???n L??");

insert into khu_nghi_duong_furama.nhan_vien(ho_ten,ngay_sinh,so_cmnd,luong,so_dien_thoai,email,dia_chi,ma_vi_tri,ma_trinh_do,ma_bo_phan) values ("Nguy???n V??n An","1970-11-07","456231786",10000000,"0901234121","annguyen@gmail.com","295 Nguy???n T???t Th??nh, ???? N???ng",1,3,1);
insert into khu_nghi_duong_furama.nhan_vien(ho_ten,ngay_sinh,so_cmnd,luong,so_dien_thoai,email,dia_chi,ma_vi_tri,ma_trinh_do,ma_bo_phan) values ("L?? V??n B??nh","1997-04-09","654231234",7000000,"0934212314","binhlv@gmail.com","22 Y??n B??i, ???? N???ng",1,2,2);
insert into khu_nghi_duong_furama.nhan_vien(ho_ten,ngay_sinh,so_cmnd,luong,so_dien_thoai,email,dia_chi,ma_vi_tri,ma_trinh_do,ma_bo_phan) values ("H??? Th??? Y???n","1995-12-12","999231723",14000000,"0412352315","thiyen@gmail.com","K234/11 ??i???n Bi??n Ph???, Gia Lai",1,3,2);
insert into khu_nghi_duong_furama.nhan_vien(ho_ten,ngay_sinh,so_cmnd,luong,so_dien_thoai,email,dia_chi,ma_vi_tri,ma_trinh_do,ma_bo_phan) values ("V?? C??ng To???n","1980-04-04","123231365",17000000,"0374443232","toan0404@gmail.com","77 Ho??ng Di???u, Qu???ng Tr???",1,4,4);
insert into khu_nghi_duong_furama.nhan_vien(ho_ten,ngay_sinh,so_cmnd,luong,so_dien_thoai,email,dia_chi,ma_vi_tri,ma_trinh_do,ma_bo_phan) values ("Nguy???n B???nh Ph??t","1999-12-09","454363232",6000000,"0902341231","phatphat@gmail.com","43 Y??n B??i, ???? N???ng",2,1,1);
insert into khu_nghi_duong_furama.nhan_vien(ho_ten,ngay_sinh,so_cmnd,luong,so_dien_thoai,email,dia_chi,ma_vi_tri,ma_trinh_do,ma_bo_phan) values ("Kh??c Nguy???n An Nhi","2000-11-08","964542311",7000000,"0978653213","annghi20@gmail.com","294 Nguy???n T???t Th??nh, ???? N???ng",2,2,3);
insert into khu_nghi_duong_furama.nhan_vien(ho_ten,ngay_sinh,so_cmnd,luong,so_dien_thoai,email,dia_chi,ma_vi_tri,ma_trinh_do,ma_bo_phan) values ("Nguy???n H???u H??","1993-01-01","534323231",8000000,"0941234553","nhh0101@gmail.com","4 Nguy???n Ch?? Thanh, Hu???",2,3,2);
insert into khu_nghi_duong_furama.nhan_vien(ho_ten,ngay_sinh,so_cmnd,luong,so_dien_thoai,email,dia_chi,ma_vi_tri,ma_trinh_do,ma_bo_phan) values ("Nguy???n H?? ????ng","1989-09-03","234414123",9000000,"0642123111","donghaguyen@gmail.com","111 H??ng V????ng, H?? N???i",2,4,4);
insert into khu_nghi_duong_furama.nhan_vien(ho_ten,ngay_sinh,so_cmnd,luong,so_dien_thoai,email,dia_chi,ma_vi_tri,ma_trinh_do,ma_bo_phan) values ("T??ng Hoang","1982-09-03","256781231",6000000,"0245144444","hoangtong@gmail.com","213 H??m Nghi, ???? N???ng",2,4,4);
insert into khu_nghi_duong_furama.nhan_vien(ho_ten,ngay_sinh,so_cmnd,luong,so_dien_thoai,email,dia_chi,ma_vi_tri,ma_trinh_do,ma_bo_phan) values ("Nguy???n C??ng ?????o","1994-01-08","755434343",8000000,"0988767111","nguyencongdao12@gmail.com","6 Ho?? Kh??nh, ?????ng Nai",2,3,2);

insert into khu_nghi_duong_furama.loai_khach(ten_loai_khach) values("Diamond");
insert into khu_nghi_duong_furama.loai_khach(ten_loai_khach) values("Platinium");
insert into khu_nghi_duong_furama.loai_khach(ten_loai_khach) values("Gold");
insert into khu_nghi_duong_furama.loai_khach(ten_loai_khach) values("Silver");
insert into khu_nghi_duong_furama.loai_khach(ten_loai_khach) values("Member");

insert into khu_nghi_duong_furama.khach_hang(ho_ten,ngay_sinh,gioi_tinh,so_cmnd,so_dien_thoai,email,dia_chi,ma_loai_khach) values("Nguy???n Th??? H??o","1970-11-07",0,"643431213","0945423362","thihao07@gmail.com","23 Nguy???n Ho??ng, ???? N???ng",5);
insert into khu_nghi_duong_furama.khach_hang(ho_ten,ngay_sinh,gioi_tinh,so_cmnd,so_dien_thoai,email,dia_chi,ma_loai_khach) values("Ph???m Xu??n Di???u","1992-08-08",1,"865342123","0954333333","xuandieu92@gmail.com","K77/22 Th??i Phi??n, Qu???ng Tr???",3);
insert into khu_nghi_duong_furama.khach_hang(ho_ten,ngay_sinh,gioi_tinh,so_cmnd,so_dien_thoai,email,dia_chi,ma_loai_khach) values("Tr????ng ????nh Ngh???","1990-02-27",1,"488645199","0373213122","nghenhan2702@gmail.com","K323/12 ??ng ??ch Khi??m, Vinh",1);
insert into khu_nghi_duong_furama.khach_hang(ho_ten,ngay_sinh,gioi_tinh,so_cmnd,so_dien_thoai,email,dia_chi,ma_loai_khach) values("D????ng V??n Quan","1981-07-08",1,"543432111","0490039241","duongquan@gmail.com","K453/12 L?? L???i, ???? N???ng",1);
insert into khu_nghi_duong_furama.khach_hang(ho_ten,ngay_sinh,gioi_tinh,so_cmnd,so_dien_thoai,email,dia_chi,ma_loai_khach) values("Ho??ng Tr???n Nhi Nhi","1995-12-09",0,"795453345","0312345678","nhinhi123@gmail.com","224 L?? Th??i T???, Gia Lai",4);
insert into khu_nghi_duong_furama.khach_hang(ho_ten,ngay_sinh,gioi_tinh,so_cmnd,so_dien_thoai,email,dia_chi,ma_loai_khach) values("T??n N??? M???c Ch??u","2005-12-06",0,"732434215","0988888844","tonnuchau@gmail.com","37 Y??n Th???, ???? N???ng",4);
insert into khu_nghi_duong_furama.khach_hang(ho_ten,ngay_sinh,gioi_tinh,so_cmnd,so_dien_thoai,email,dia_chi,ma_loai_khach) values("Nguy???n M??? Kim","1984-04-08",0,"856453123","0912345698","kimcuong84@gmail.com","K123/45 L?? L???i, H??? Ch?? Minh",1);
insert into khu_nghi_duong_furama.khach_hang(ho_ten,ngay_sinh,gioi_tinh,so_cmnd,so_dien_thoai,email,dia_chi,ma_loai_khach) values("Nguy???n Th??? H??o","1999-04-08",0,"965656433","0763212345","haohao99@gmail.com","55 Nguy???n V??n Linh, Kon Tum",3);
insert into khu_nghi_duong_furama.khach_hang(ho_ten,ngay_sinh,gioi_tinh,so_cmnd,so_dien_thoai,email,dia_chi,ma_loai_khach) values("Tr???n ?????i Danh","1994-07-01",1,"432341235","0643343433","danhhai99@gmail.com","24 L?? Th?????ng Ki???t, Qu???ng Ng??i",1);
insert into khu_nghi_duong_furama.khach_hang(ho_ten,ngay_sinh,gioi_tinh,so_cmnd,so_dien_thoai,email,dia_chi,ma_loai_khach) values("Nguy???n T??m ?????c","1989-07-01",1,"344343432","0987654321","dactam@gmail.com","22 Ng?? Quy???n, ???? N???ng",2);


insert into khu_nghi_duong_furama.kieu_thue (ten_kieu_thue) values ("year");
insert into khu_nghi_duong_furama.kieu_thue (ten_kieu_thue) values ("month");
insert into khu_nghi_duong_furama.kieu_thue (ten_kieu_thue) values ("day");
insert into khu_nghi_duong_furama.kieu_thue (ten_kieu_thue) values ("hour");

insert into khu_nghi_duong_furama.loai_dich_vu(ten_loai_dich_vu) values("Villa");
insert into khu_nghi_duong_furama.loai_dich_vu(ten_loai_dich_vu) values("House");
insert into khu_nghi_duong_furama.loai_dich_vu(ten_loai_dich_vu) values("Room");

insert into khu_nghi_duong_furama.dich_vu(ten_dich_vu,dien_tich,chi_phi_thue,so_nguoi_toi_da,tieu_chuan_phong,mo_ta_tien_nghi_khac,dien_tich_ho_boi,so_tang,dich_vu_mien_phi_di_kem,ma_kieu_thue,ma_loai_dich_vu) values("Villa Beach Front",25000,1000000,10,"vip","C?? h??? b??i",500,4,"null",3,1);
insert into khu_nghi_duong_furama.dich_vu(ten_dich_vu,dien_tich,chi_phi_thue,so_nguoi_toi_da,tieu_chuan_phong,mo_ta_tien_nghi_khac,dien_tich_ho_boi,so_tang,dich_vu_mien_phi_di_kem,ma_kieu_thue,ma_loai_dich_vu) values("House Princess 01",14000,5000000,7,"vip","C?? th??m b???p n?????ng",null,3,"null",2,2);
insert into khu_nghi_duong_furama.dich_vu(ten_dich_vu,dien_tich,chi_phi_thue,so_nguoi_toi_da,tieu_chuan_phong,mo_ta_tien_nghi_khac,dien_tich_ho_boi,so_tang,dich_vu_mien_phi_di_kem,ma_kieu_thue,ma_loai_dich_vu) values("Room Twin 01",5000,1000000,2,"normal","C?? tivi",null,null,"1 Xe m??y, 1 Xe ?????p",4,3);
insert into khu_nghi_duong_furama.dich_vu(ten_dich_vu,dien_tich,chi_phi_thue,so_nguoi_toi_da,tieu_chuan_phong,mo_ta_tien_nghi_khac,dien_tich_ho_boi,so_tang,dich_vu_mien_phi_di_kem,ma_kieu_thue,ma_loai_dich_vu) values("Villa No Beach Front",22000,9000000,8,"normal","C?? h??? b??i",300,3,"null",3,1);
insert into khu_nghi_duong_furama.dich_vu(ten_dich_vu,dien_tich,chi_phi_thue,so_nguoi_toi_da,tieu_chuan_phong,mo_ta_tien_nghi_khac,dien_tich_ho_boi,so_tang,dich_vu_mien_phi_di_kem,ma_kieu_thue,ma_loai_dich_vu) values("House Princess 02",10000,4000000,5,"normal","C?? th??m b???p n?????ng",null,2,"null",3,2);
insert into khu_nghi_duong_furama.dich_vu(ten_dich_vu,dien_tich,chi_phi_thue,so_nguoi_toi_da,tieu_chuan_phong,mo_ta_tien_nghi_khac,dien_tich_ho_boi,so_tang,dich_vu_mien_phi_di_kem,ma_kieu_thue,ma_loai_dich_vu) values("Room Twin 02",3000,900000,2,"normal","C?? tivi",null,null,"1 Xe m??y",4,3);

insert into khu_nghi_duong_furama.dich_vu_di_kem(ten_dich_vu_di_kem,gia,don_vi,trang_thai) values ("Karaoke",10000,"gi???","ti???n nghi, hi???n t???i");
insert into khu_nghi_duong_furama.dich_vu_di_kem(ten_dich_vu_di_kem,gia,don_vi,trang_thai) values ("Thu?? xe m??y",10000,"chi???c","h???ng 1 xe");
insert into khu_nghi_duong_furama.dich_vu_di_kem(ten_dich_vu_di_kem,gia,don_vi,trang_thai) values ("Thu?? xe ?????p",20000,"chi???c","t???t");
insert into khu_nghi_duong_furama.dich_vu_di_kem(ten_dich_vu_di_kem,gia,don_vi,trang_thai) values ("Buffet bu???i s??ng",15000,"su???t","?????y ????? ????? ??n, tr??ng mi???ng");
insert into khu_nghi_duong_furama.dich_vu_di_kem(ten_dich_vu_di_kem,gia,don_vi,trang_thai) values ("Buffet bu???i tr??a",90000,"su???t","?????y ????? ????? ??n, tr??ng mi???ng");
insert into khu_nghi_duong_furama.dich_vu_di_kem(ten_dich_vu_di_kem,gia,don_vi,trang_thai) values ("Buffet bu???i t???i",16000,"su???t","?????y ????? ????? ??n, tr??ng mi???ng");

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
-- 2.	Hi???n th??? th??ng tin c???a t???t c??? nh??n vi??n c?? trong h??? th???ng c?? t??n b???t ?????u l?? m???t trong c??c k?? t??? ???H???, ???T??? ho???c ???K??? v?? c?? t???i ??a 15 k?? t???.
select * 
from nhan_vien
 where ho_ten regexp '([A-Za-z//s]+//sH[a-z]+)'and length(ho_ten)<=15;
-- 3.	Hi???n th??? th??ng tin c???a t???t c??? kh??ch h??ng c?? ????? tu???i t??? 18 ?????n 50 tu???i v?? c?? ?????a ch??? ??? ??????? N???ng??? ho???c ???Qu???ng Tr??????.
select * 
from khach_hang 
where year(ngay_sinh)<=2004 and year(ngay_sinh)>=1972 and (dia_chi like "%Qu???ng Tr???" or dia_chi like "%???? N???ng");

-- -----
select * from khach_hang
where((timestampdiff(year,ngay_sinh,curdate()) between 18 and 50) and (dia_chi like "%Qu???ng Tr???" or dia_chi like "%???? N???ng"));
-- 4.	?????m xem t????ng ???ng v???i m???i kh??ch h??ng ???? t???ng ?????t ph??ng bao nhi??u l???n.
--  K???t qu??? hi???n th??? ???????c s???p x???p t??ng d???n theo s??? l???n ?????t ph??ng c???a kh??ch h??ng. 
--  Ch??? ?????m nh???ng kh??ch h??ng n??o c?? T??n lo???i kh??ch h??ng l?? ???Diamond???.
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
-- b??i5
-- 5.	Hi???n th??? ma_khach_hang, ho_ten,
--  ten_loai_khach, ma_hop_dong, ten_dich_vu, 
--  ngay_lam_hop_dong, ngay_ket_thuc, tong_tien 
--  (V???i t???ng ti???n ???????c t??nh theo c??ng th???c nh?? sau: Chi Ph?? Thu?? + S??? L?????ng * Gi??, v???i S??? L?????ng v?? Gi?? l?? t??? b???ng dich_vu_di_kem, hop_dong_chi_tiet) 
--  cho t???t c??? c??c kh??ch h??ng ???? t???ng ?????t ph??ng. (nh???ng kh??ch h??ng n??o ch??a t???ng ?????t ph??ng c??ng ph???i hi???n th??? ra).

select kh.ma_khach_hang,kh.ho_ten,lk.ten_loai_khach,hd.ma_hop_dong,dv.ten_dich_vu,hd.ngay_lam_hop_dong,hd.ngay_ket_thuc,  sum((ifnull(hdct.so_luong * dvdk.gia, 0)) + chi_phi_thue) tong_tien from loai_khach lk
join khach_hang kh on kh.ma_loai_khach=lk.ma_loai_khach
left join hop_dong hd on hd.ma_khach_hang=kh.ma_khach_hang
left join dich_vu dv on dv.ma_dich_vu-hd.ma_dich_vu
left join hop_dong_chi_tiet hdct on hdct.ma_hop_dong=hd.ma_hop_dong
left join dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem=hdct.ma_dich_vu_di_kem
group by hd.ma_hop_dong
order by kh.ma_khach_hang, hd.ma_hop_dong;
-- 6.	Hi???n th??? ma_dich_vu, ten_dich_vu, dien_tich,
--  chi_phi_thue, ten_loai_dich_vu c???a t???t c??? c??c lo???i d???ch v??? ch??a t???ng 
--  ???????c kh??ch h??ng th???c hi???n ?????t t??? qu?? 1 c???a n??m 2021 (Qu?? 1 l?? th??ng 1, 2, 3).
select hd.ngay_lam_hop_dong, dv.ma_dich_vu,dv.ten_dich_vu,dv.dien_tich,dv.chi_phi_thue,ldv.ten_loai_dich_vu
from dich_vu dv
join loai_dich_vu ldv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
join hop_dong hd on hd.ma_dich_vu = dv.ma_dich_vu
where dv.ma_dich_vu not in (select dv.ma_dich_vu from dich_vu dv join hop_dong hd on hd.ma_dich_vu = dv.ma_dich_vu
        where ((month(hd.ngay_lam_hop_dong) between 1 and 3) and year(hd.ngay_lam_hop_dong) = '2021')
        group by  dv.ten_dich_vu)
group by dv.ten_dich_vu
order by  dv.dien_tich desc;


-- 7.	Hi???n th??? th??ng tin ma_dich_vu,
--  ten_dich_vu, dien_tich, so_nguoi_toi_da,
--  chi_phi_thue, ten_loai_dich_vu c???a t???t c??? c??c 
--  lo???i d???ch v??? ???? t???ng ???????c kh??ch h??ng ?????t ph??ng trong n??m 2020 nh??ng ch??a t???ng ???????c kh??ch h??ng ?????t ph??ng trong n??m 2021.
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
 
-- 8.	Hi???n th??? th??ng tin ho_ten kh??ch h??ng c?? trong h??? th???ng, v???i y??u c???u ho_ten kh??ng tr??ng nhau.
-- H???c vi??n s??? d???ng theo 3 c??ch kh??c nhau ????? th???c hi???n y??u c???u tr??n.
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
-- 9.	Th???c hi???n th???ng k?? doanh thu theo th??ng,
--  ngh??a l?? t????ng ???ng v???i m???i th??ng trong n??m 2021 th?? s??? c?? bao nhi??u kh??ch h??ng th???c hi???n ?????t ph??ng.
select month(hop_dong.ngay_lam_hop_dong) thang,count(month(hop_dong.ngay_lam_hop_dong)) so_luong_khach_hang
from hop_dong
where year(hop_dong.ngay_lam_hop_dong) = '2021'
group by month(hop_dong.ngay_lam_hop_dong)
order by thang;
-- 10.	Hi???n th??? th??ng tin t????ng ???ng v???i t???ng h???p ?????ng th?? ???? s??? d???ng bao nhi??u d???ch v??? ??i k??m.
--  K???t qu??? hi???n th??? bao g???m ma_hop_dong,
--  ngay_lam_hop_dong, ngay_ket_thuc, 
--  tien_dat_coc, so_luong_dich_vu_di_kem (???????c t??nh d???a tr??n vi???c sum so_luong ??? dich_vu_di_kem).
select hop_dong.ma_hop_dong,hop_dong.ngay_lam_hop_dong,hop_dong.ngay_ket_thuc,hop_dong.tien_dat_coc,
sum(ifnull(hop_dong_chi_tiet.so_luong, 0)) so_luong_dich_vu_di_kem
from hop_dong
left join
hop_dong_chi_tiet on hop_dong_chi_tiet.ma_hop_dong = hop_dong.ma_hop_dong
group by hop_dong.ma_hop_dong;
-- 5.	Hi???n th??? ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, 
-- ngay_lam_hop_dong, ngay_ket_thuc, tong_tien (V???i t???ng ti???n ???????c t??nh theo c??ng th???c nh?? sau:
--  Chi Ph?? Thu?? + S??? L?????ng * Gi??, v???i S??? L?????ng v?? Gi?? l?? t??? b???ng dich_vu_di_kem, hop_dong_chi_tiet) 
--  cho t???t c??? c??c kh??ch h??ng ???? t???ng ?????t ph??ng. (nh???ng kh??ch h??ng n??o ch??a t???ng ?????t ph??ng c??ng ph???i hi???n th??? ra).
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

-- 11.	Hi???n th??? th??ng tin c??c d???ch v??? ??i k??m ???? ???????c s??? d???ng b???i nh???ng kh??ch h??ng
--  c?? ten_loai_khach l?? ???Diamond??? v?? c?? dia_chi ??? ???Vinh??? ho???c ???Qu???ng Ng??i???.
select dvdk.ma_dich_vu_di_kem,dvdk.ten_dich_vu_di_kem,dvdk.gia,dvdk.don_vi,dvdk.trang_thai
from khach_hang kh join loai_khach lk on kh.ma_loai_khach = lk.ma_loai_khach
                   join hop_dong hd on kh.ma_khach_hang = hd.ma_khach_hang
                   join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
                   join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
where lk.ten_loai_khach = 'Diamond'
        and (kh.dia_chi like '%Vinh'or kh.dia_chi like '%Qu???ng Ng??i');
	
-- 12.	Hi???n th??? th??ng tin ma_hop_dong, ho_ten (nh??n vi??n), ho_ten (kh??ch h??ng),
--  so_dien_thoai (kh??ch h??ng), ten_dich_vu, so_luong_dich_vu_di_kem 
--  (???????c t??nh d???a tr??n vi???c sum so_luong ??? dich_vu_di_kem), tien_dat_coc c???a t???t c??? c??c d???ch v??? ???? t???ng ???????c kh??ch 
-- h??ng ?????t v??o 3 th??ng cu???i n??m 2020 nh??ng ch??a t???ng ???????c kh??ch h??ng ?????t v??o 6 th??ng ?????u n??m 2021.
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

-- 13.	Hi???n th??? th??ng tin c??c D???ch v??? ??i k??m ???????c s??? d???ng nhi???u nh???t b???i c??c Kh??ch h??ng ???? ?????t ph??ng. 
-- (L??u ?? l?? c?? th??? c?? nhi???u d???ch v??? c?? s??? l???n s??? d???ng nhi???u nh?? nhau).
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


-- 14.	Hi???n th??? th??ng tin t???t c???  D???ch v??? ??i k??m ch??? m???i ???????c s??? d???ng m???t l???n duy nh???t. 
-- Th??ng tin hi???n th??? bao g???m ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, so_lan_su_dung 
-- (???????c t??nh d???a tr??n vi???c count c??c ma_dich_vu_di_kem).
select  hd.ma_hop_dong,ldv.ten_loai_dich_vu, dvdk.ten_dich_vu_di_kem,count(hdct.so_luong) so_lan_su_dung
from hop_dong_chi_tiet hdct 
 join hop_dong hd on hdct.ma_hop_dong=hd.ma_hop_dong
join dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem=hdct.ma_dich_vu_di_kem
join dich_vu dv on dv.ma_dich_vu=hd.ma_dich_vu
join loai_dich_vu ldv on ldv.ma_loai_dich_vu=dv.ma_loai_dich_vu
group by dvdk.ma_dich_vu_di_kem
having so_lan_su_dung=1;

-- 15.	Hi???n thi th??ng tin c???a t???t c??? nh??n vi??n bao g???m ma_nhan_vien, ho_ten, 
-- ten_trinh_do, ten_bo_phan, so_dien_thoai, dia_chi m???i ch??? l???p ???????c t???i ??a 3 h???p ?????ng t??? n??m 2020 ?????n 2021
select nv.ma_nhan_vien,nv.ho_ten,td.ten_trinh_do,bp.ten_bo_phan,nv.so_dien_thoai,nv.dia_chi,count(hd.ma_hop_dong) as so_luong
from nhan_vien nv
join trinh_do td on nv.ma_trinh_do=td.ma_trinh_do
join bo_phan bp on nv.ma_bo_phan=bp.ma_bo_phan
join hop_dong hd on hd.ma_nhan_vien=nv.ma_nhan_vien
group by nv.ma_nhan_vien
having so_luong <= 3;
-- 16.	X??a nh???ng Nh??n vi??n ch??a t???ng l???p ???????c h???p ?????ng n??o t??? n??m 2019 ?????n n??m 2021.
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
 
-- 17.	C???p nh???t th??ng tin nh???ng kh??ch h??ng c?? ten_loai_khach t??? Platinum l??n Diamond, 
-- ch??? c???p nh???t nh???ng kh??ch h??ng ???? t???ng ?????t ph??ng v???i T???ng Ti???n thanh to??n trong n??m 2021 l?? l???n h??n 10.000.000 VN??.
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
-- 18.	X??a nh???ng kh??ch h??ng c?? h???p ?????ng tr?????c n??m 2021 (ch?? ?? r??ng bu???c gi???a c??c b???ng).
set FOREIGN_KEY_CHECKS=0;
delete from khach_hang
where khach_hang.ma_khach_hang in (
select hop_dong.ma_khach_hang from hop_dong 
where year(hop_dong.ngay_lam_hop_dong) < 2021);
select *from khach_hang;
-- 19.	C???p nh???t gi?? cho c??c d???ch v??? ??i k??m ???????c s??? d???ng tr??n 10 l???n trong n??m 2020 l??n g???p ????i.
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
-- 20.	Hi???n th??? th??ng tin c???a t???t c??? c??c nh??n vi??n v?? kh??ch h??ng c?? trong h??? th???ng,
--  th??ng tin hi???n th??? bao g???m id (ma_nhan_vien, ma_khach_hang), ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi.

select nv.ma_nhan_vien,nv.ho_ten, nv.email, nv.so_dien_thoai, nv.ngay_sinh, nv.dia_chi from nhan_vien nv
union
select kh.ma_khach_hang,kh.ho_ten, kh.email, kh.so_dien_thoai, kh.ngay_sinh, kh.dia_chi from khach_hang kh
