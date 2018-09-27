drop database if exists web_student_crm;
create database web_student_crm;
use web_student_crm;
create table user(
					id int not null auto_increment,
                    first_name varchar(45),
                    last_name varchar(45),
                    email varchar(45),
                    date_of_birth varchar(45),
                    username varchar(45),
                    password varchar(45),
                    validate varchar(45) default "invalidate",
                    forgetPassword varchar(45) default "forget",
                    primary key(id)
				);
