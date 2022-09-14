drop database if exists management_store;
create database management_store ;
use management_store;
create table customer(
c_id int auto_increment primary key,
c_name varchar(25),
c_age tinyint);
create table order_tb(
o_id int primary key auto_increment ,
c_id int,
foreign key (c_id) references customer(c_id),
o_date date,
o_total_price int);
create table product(
p_id int auto_increment primary key,
p_name varchar(25),
p_price int);
CREATE TABLE order_detail (
    o_id INT,
    p_id INT,
    PRIMARY KEY (o_id , p_id),
    FOREIGN KEY (o_id)
        REFERENCES order_tb (o_id),
    FOREIGN KEY (p_id)
        REFERENCES product (p_id),
    od_qty INT
);
insert into customer(c_name,c_age) values ("Minh Quan",10);
insert into customer(c_name,c_age) values ("Ngoc Oanh",20);
insert into customer(c_name,c_age) values ("Hong Ha",50);

insert into order_tb(c_id,o_date,o_total_price) values(1,"2006-03-21",null);
insert into  order_tb(c_id,o_date,o_total_price)  values(2,"2006-03-23",null);
insert into order_tb(c_id,o_date,o_total_price)values(1,"2006-03-16",null);

insert into product(p_name,p_price) values ("May Giat",3);
insert into  product(p_name,p_price) values ("Tu Lanh",5);
insert into product(p_name,p_price) values ("Dieu Hoa",7);
insert into  product(p_name,p_price) values ("Quat",1);
insert into product(p_name,p_price) values ("Bep Dien",2);

insert into order_detail(o_id,p_id,od_qty)values(1,1,3);
insert into order_detail(o_id,p_id,od_qty)values(1,3,7);
insert into order_detail(o_id,p_id,od_qty)values(1,4,2);
insert into order_detail(o_id,p_id,od_qty)values(2,1,1);
insert into order_detail(o_id,p_id,od_qty)values(3,1,8);
insert into order_detail(o_id,p_id,od_qty)values(2,5,4);
insert into order_detail(o_id,p_id,od_qty)values(2,3,3);
-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
select s.o_id,s.o_date,s.o_total_price from order_tb s;
-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách-- 
select s.c_name, e.p_name
from customer s 
join order_tb c on c.c_id=s.c_id
join order_detail d on d.o_id=c.o_id
join product e on e.p_id=d.p_id;
-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
select s.c_name, e.p_name
from customer s 
 left join order_tb c on c.c_id=s.c_id
  left join order_detail d on d.o_id=c.o_id
 left join product e on e.p_id=d.p_id
 where p_name is null;
--  Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice)
select sp.p_name, hd.o_id,hd.o_date,sum(sp.p_price * dh.od_qty) as total_money
from order_tb hd
join order_detail dh
on hd.o_id = dh.o_id
join product sp
on dh.p_id = sp.p_id
group by sp.p_id;