CREATE DATABASE ps11112;
USE ps11112;

CREATE TABLE users (
	id int NOT NULL AUTO_INCREMENT, 
	username varchar(64) NOT NULL,
	password varchar(64) NOT NULL,
	fullname varchar(100) NOT NULL,
	PRIMARY KEY (id),
	UNIQUE (username)
);

CREATE TABLE departs (
	id int NOT NULL AUTO_INCREMENT, 
	name varchar(100) NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE staffs (
	id int NOT NULL AUTO_INCREMENT,
	name varchar(100) NOT NULL,
	gender boolean NOT NULL,
	birthday date NOT NULL,
	image varchar(100),
	email varchar(50) NOT NULL,
	phone varchar(20) NOT NULL,
	salary bigint NOT NULL,
	depart_id int NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (depart_id) REFERENCES departs(id)
);

CREATE TABLE records (
	id int NOT NULL AUTO_INCREMENT,
	type boolean NOT NULL,
	reason varchar(250) NOT NULL,
	created_time timestamp NOT NULL,
	staff_id int NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (staff_id) REFERENCES staffs(id)
);

INSERT INTO users (username, password, fullname) VALUES
	('admin','admin','Admin'),
	('duyna','duyna','Duy Nguyễn'),
	('minhtd','minhtd','Minh Tinh'),
	('minhtd1','minhtd1','Minh Tinh'),
	('minhtd2','minhtd2','Minh Tinh'),
	('minhtd3','minhtd3','Minh Tinh'),
	('minhtd4','minhtd4','Minh Tinh'),
	('minhtd5','minhtd5','Minh Tinh'),
	('minhtd6','minhtd6','Minh Tinh'),
	('minhtd7','minhtd7','Minh Tinh'),
	('minhtd8','minhtd8','Minh Tinh'),
	('minhtd9','minhtd9','Minh Tinh');

INSERT INTO departs (name) VALUES
	('Phòng Giám đốc'),
	('Phòng Kinh doanh'),
	('Phòng Kế toán'),
	('Phòng Nhân sự'),
	('Phòng IT');

INSERT INTO staffs (name, gender, birthday, image, email, phone, salary, depart_id) VALUES
	('Tư Ếch',1,'1970-10-07','user.png','tuech@mail.com','0966777888',30000,1),
	('Duy Nguyễn',1,'1995-02-11','user.png','duynaps11112@mail.com','0901384664',20000,5),
	('Hùng Phạm',1,'1995-11-21','user.png','hungpm@mail.com','0933666888',18000,5),
	('Ngân Cao',0,'1996-06-19','user.png','ngancn@mail.com','0865777555',15500,3),
	('Oanh Lê',0,'1998-03-18','user.png','oanhlk@mail.com','0938333888',15800,3),
	('Tuấn Lê',1,'1988-12-22','user.png','tuanlh@mail.com','0944555666',19500,3),
	('Hương Trần',0,'1983-08-13','user.png','huongtt@mail.com','0987668778',25500,2),
	('Cường Lý',1,'1998-08-11','user.png','cuonglk@mail.com','0877666555',17300,2),
	('Quỳnh Ngô',0,'1997-09-17','user.png','quynhnn@mail.com','0844333555',16000,4),
	('Lan Trần',0,'1999-03-12','user.png','lantt@mail.com','0944777666',16600,4);

INSERT INTO records (type, reason, created_time, staff_id) VALUES
	(1,'Nhân viên nam giỏi','2020-06-01',2),
	(0,'Đi trễ nhiều lần','2019-12-12',8),
	(0,'Nghỉ làm không lý do','2020-01-21',5),
	(0,'Ngủ gật giờ làm việc','2019-10-10',9),
	(1,'Trưởng phòng ưu tú','2020-01-01',7),
	(0,'Nói xấu sếp','2020-02-12',5),
	(0,'Ăn vặt giờ làm việc','2020-03-26',4),
	(1,'Hoàn thành vượt chỉ tiêu','2020-04-04',2),
	(0,'Buôn dưa lê giờ làm việc','2020-05-03',9),
	(1,'Nhân viên nữ giỏi','2020-06-01',10);

-- Trigger
CREATE TRIGGER users_id BEFORE INSERT ON users
FOR EACH ROW SET NEW.id = IF((SELECT COUNT(*) FROM users)=0, 1, (SELECT MAX(id) FROM users)+1);

CREATE TRIGGER departs_id BEFORE INSERT ON departs
FOR EACH ROW SET NEW.id = IF((SELECT COUNT(*) FROM departs)=0, 1, (SELECT MAX(id) FROM departs)+1);

CREATE TRIGGER staffs_id BEFORE INSERT ON staffs
FOR EACH ROW SET NEW.id = IF((SELECT COUNT(*) FROM staffs)=0, 1, (SELECT MAX(id) FROM staffs)+1);

CREATE TRIGGER records_id BEFORE INSERT ON records
FOR EACH ROW SET NEW.id = IF((SELECT COUNT(*) FROM records)=0, 1, (SELECT MAX(id) FROM records)+1);

CREATE TRIGGER staffs_image BEFORE INSERT ON staffs
FOR EACH ROW SET NEW.image = IFNULL(NEW.image, 'user.png');