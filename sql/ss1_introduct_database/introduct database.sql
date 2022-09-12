create database if not exists quan_ly_hoc_sinh;
use quan_ly_hoc_sinh;
create table Class(
id int,
name varchar(45)
);
create table Teacher(
id int,
name varchar(45),
age int,
country varchar(45)
);