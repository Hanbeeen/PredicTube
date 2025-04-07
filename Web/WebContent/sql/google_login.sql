create table users (
	id int primary key auto_increment,
	username varchar(50) not null,
	email varchar(50) not null , 
	loginDate DATETIME not null
);


select * from users;
truncate users;

create table service(
	id int primary key auto_increment,
	username varchar(50) not null,
	email varchar(50) not null,
	channel_id varchar(50) not null,
	title varchar(255) not null,
	filename varchar(100) not null,
	category int not null,
	sub_count int,
	result varchar(50) not null,
	serviceDate DATETIME not null
);

select * from service;
truncate service;

DROP TABLE service;

delete from service

ALTER TABLE service MODIFY COLUMN title VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;