drop database if exists erd_exercise;
create database erd_exercise;
use erd_exercise;

create table NHACC(
MaNCC int primary key,
TeNNCC varchar(45),
DiaChi varchar(45)
);
create table SDT(
maNcc int primary key,
SDT int,
foreign key(maNcc) references NHACC(MaNCC));
create table DONDH(
SoDH int primary key,
NgayDH date,
MaNCC int,
foreign key (MaNCC) references NHACC(MaNCC));
create table PHIEUXUAT(
SoPX int primary key,
NgayXuat date);
create table PHIEUNHAP(
SoPN int primary key,
NgayNhap date);
create table VATTU(
MaVTU int primary key,
TenVTU varchar(45));
create table chi_tiet_phieu_xuat(
SoPX int,
MaVTU int,
primary key(SoPX,MaVTU),
foreign key (SoPX) references PHIEUXUAT(SoPX),
foreign key (MaVTU) references VATTU(MaVTU),
DGXuat varchar(45),
SLXuat varchar(45)
);
create table chi_tiet_phieu_nhap(
MaVTU int,
SoPN int,
primary key(MaVTU,SoPN),
foreign key (SoPN) references PHIEUNHAP(SoPN),
foreign key (MaVTU) references VATTU(MaVTU),
DGNhap varchar(45),
SLNhap varchar(45));
create table chi_tiet_dat_don_hang(
MaVTU int,
SoDH int,
primary key(MaVTU,SoDH),
foreign key (MaVTU) references VATTU(MaVTU),
foreign key (SoDH) references DONDH(SoDH));
