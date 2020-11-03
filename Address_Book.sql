--Usecase1:
create database AddressBookService;
show databases;
use AddressBookService;

--Usecase2:
create table addressBookTable
    -> (
    -> fname    varchar(150) NOT NULL,
    -> lname    varchar(150) NOT NULL,
    -> address  varchar(300) NOT NULL,
    -> city     varchar(150) NOT NULL,
    -> state    varchar(150) NOT NULL,
    -> zip      numeric(6)  NOT NULL,
    -> phone    numeric(10) NOT NULL,
    -> email    varchar(200) NOT NULL,
    -> PRIMARY KEY(fname,lname)
    -> );
 describe addressBookTable;

--Usecase3:
insert into addressBookTable values('Adity','Kharade','Kaulkhed','Akola','Maharashtra',444001, 8844557722,'abc@d.com');
insert into addressBookTable values('Aniket','Sarap','Kaulkhed','Akola','Maharashtra',444001,8475612478,'adc@d.com');
insert into addressBookTable values('Prajwal','Bhamodre','Kaulkhed','Akola','Maharashtra',444001,8475574178,'ac@d.com');
insert into addressBookTable values('Sanket','Deshmukh','Kaulkhed','Akola','Maharashtra',444001,7445566221,'aac@d.com');
select * from addressBookTable;

--Usecase4:
update addressBookTable set phone = 7887483853 where fname = 'Aditya' AND lname = 'Kharade';
update addressBookTable set email = 'prajwal@gmail.com' where fname = 'Prajwal' AND lname = 'Bhamodre';
select * from addressBookTable;

--Usecase5:
delete from addressBookTable where fname = 'Aniket' AND lname = 'Sarap';
select * from addressBookTable;

--Usecase6:
update addressBookTable set city = 'Mumbai',zip = '400019' where fname = 'Prajwal' AND lname = 'Bhamodre';
update addressBookTable set city = 'Pune',zip = '401019' where fname = 'Sanket' AND lname = 'Deshmukh';
insert into addressBookTable values('Sachin','Badhe','Kaulkhed','Akola','Maharashtra',444001,7445544221,'assac@d.com');
select * from addressBookTable where city = 'Pune';
select * from addressBookTable where city = 'Akola';
select * from addressBookTable where state = 'Maharashtra';

--usecase7:
select city, state, count(*) from addressBookTable group by city, state;

--usecase8: 
select * from addressBookTable where city = 'Akola' order by fname,lname;

--Usecase9:
alter table addressBookTable add id INT AUTO_INCREMENT NOT NULL primary key  first;
 alter table addressBookTable change id contact_id INT;
alter table addressBookTable rename contact_table;
create table addressBook
    -> (
    -> id       INT NOT NULL AUTO_INCREMENT,
    -> addName  VARCHAR(150) NOT NULL,
    -> type     VARCHAR(150),
    -> primary key (id)
    -> );
alter table addressBook add contacts_id INT NOT NULL after id;
alter table addressBook add foreign key (contacts_id) references contact_table(contact_id);

--Usecase10:
 select type,count(contacts_id) from addressBook group by type;

--Usecase11:
insert into addressBook (contacts_id, addName, type) values (1,'AddressBook1','family');
insert into addressBook (contacts_id, addName, type) values (2,'AddressBook2','friend');
insert into addressBook (contacts_id, addName, type) values (3,'AddressBook3','profession');
insert into addressBook (contacts_id, addName, type) values (1,'AddressBook2','friend');

--Usecase13:
select contact_table.contact_id, contact_table.fname,contact_table.lname,contact_table.address, contact_table.city, contact_table.state, 
       contact_table.zip, contact_table.phone,contact_table.email,addressBook.addName, addressBook.type
from contact_table inner join addressBook on contact_table.contact_id = addressBook.contacts_id;