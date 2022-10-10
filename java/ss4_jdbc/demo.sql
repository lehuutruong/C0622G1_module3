drop  database if exists demo;
CREATE DATABASE demo;
USE demo;
create table users (
 id  int(3) NOT NULL AUTO_INCREMENT,
 name varchar(120) NOT NULL,
 email varchar(220) NOT NULL,
 country varchar(120),
 PRIMARY KEY (id)
);
insert into users(name, email, country) values('Minh','minh@codegym.vn','Viet Nam');
insert into users(name, email, country) values('Kante','kante@che.uk','Kenia');

select * from users order by name;

select * from users;
DELIMITER $$

CREATE PROCEDURE get_user_by_id(IN user_id INT)

BEGIN

    SELECT users.name, users.email, users.country

    FROM users

    where users.id = user_id;

    END$$

DELIMITER ;

  

DELIMITER $$

CREATE PROCEDURE insert_user(

IN user_name varchar(50),

IN user_email varchar(50),

IN user_country varchar(50)

)

BEGIN

    INSERT INTO users(name, email, country) VALUES(user_name, user_email, user_country);

    END$$

DELIMITER ;
DELIMITER $$

CREATE PROCEDURE get_all_user()

BEGIN

    select * from users;

    END$$

DELIMITER ;

delimiter //
create procedure edit_user_by_id(p_id int,p_name varchar(50),p_email varchar(50),p_country varchar(50))
begin
UPDATE users
SET
    `name` = p_name,
    email = p_email,
    country = p_country
WHERE
    id = p_id;
end;
// delimiter ;
call edit_user_by_id(3,"truong","minhtiusersen@gmail.com","Việt Nam");
delimiter //
create procedure delete_user_by_id(p_id int)
begin
		delete
        from users
		where id = p_id;
end;
// delimiter ;
call delete_user_by_id(3);