drop database if exists management_store;
create database management_store ;
use management_store;
create table Customer(
cID int primary key,
cName varchar(45),
cAge int);
create table Orde(
oID int primary key,
cID int,
foreign key (cID) references Customer(cID),
oDate date,
oTotalPrice double);
create table Product(
pID int primary key,
pName varchar(45),
pPrice varchar(45));
create table OderDetail(
oID int,
pID int,
primary key (oID, pID),
foreign key (oID) references Orde(oID),
foreign key(pID)references Product(pID),
odQTY varchar(45));