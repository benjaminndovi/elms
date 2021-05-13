

<?php

$tblemployees = "
create table if not exists tblemployees(
id int(11) auto_increment,
EmpId varchar(10) not null,
FirstName varchar(30) not null,
LastName varchar(30) not null,
EmailId      varchar(150),                                         
Password     varchar(150) ,                                      
Gender       varchar(10)  not null,                                      
Dob          varchar(30) ,                                       
Department   varchar(50) ,                                                                              
Phonenumber  char(11)  ,                                      
Status       tinyint(1),                                    
RegDate      timestamp    default   CURRENT_TIMESTAMP,
primary key(id))engine innoDB";


?>