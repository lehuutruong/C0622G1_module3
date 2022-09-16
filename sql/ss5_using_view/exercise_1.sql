drop database if exists managament_product;
create database managament_product;
use managament_product;
create table products(
id int auto_increment primary key,
product_code varchar(45),
product_name varchar(45),
product_price int,
product_amount int,
product_description varchar(45),
product_status varchar(45));
insert into products(product_code,product_name,product_price,product_amount,product_description,product_status) values("a1","truong",1500,12,"tốt","độc thân");
insert into products(product_code,product_name,product_price,product_amount,product_description,product_status) values("a3","uy",700,2,"hư","sai lầm lấy vợ");
insert into products(product_code,product_name,product_price,product_amount,product_description,product_status) values("a5","hai",30000,7,"khá tốt","có vợ");
insert into products(product_code,product_name,product_price,product_amount,product_description,product_status) values("a2","vinh",15000,5,"ổn","độc lập tự do hạnh phúc");
-- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
create unique index product_code_index on products(product_code);
-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
create index product_name_price_index on products(product_code,product_price);
-- Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào
-- So sánh câu truy vấn trước và sau khi tạo index
explain select *from products;
-- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
create view w_product as 
select product_code,product_name,product_price,product_status from products;
select *from w_product;
-- Tiến hành sửa đổi view
update w_product
set product_price=20000
where product_name="truong";
select *from w_product;
-- Tiến hành xoá view
drop view w_product;
-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
delimiter //
create procedure product_all()
begin
select * from products;
end //
delimiter ;
call product_all();
-- Tạo store procedure thêm một sản phẩm mới
delimiter //
create procedure add_product()
begin
insert into products(id,product_code,product_name,product_price,product_amount,product_description,product_status) values(6,"a9","đường tam",1500,11,"tốt","vợ của tiểu vũ");
end //
delimiter ;
call add_product();
select*from products;
-- Tạo store procedure sửa thông tin sản phẩm theo id
delimiter //
create procedure sp_get_product_by_id(in product_id int)
begin
update products
set product_price=100000
where id=product_id
;
end //
delimiter ;
select *from products;
call sp_get_product_by_id(3);
-- Tạo store procedure xoá sản phẩm theo id
delimiter //
create procedure drop_product_by_id(in product_id int)
begin
delete from products
where id=product_id;
end //
delimiter ;
select *from products;
call drop_product_by_id(3);
