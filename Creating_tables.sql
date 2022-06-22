create database Library;
use Library;

drop table adult;

 /*   ********************************************************* Creating tables *************************************************** */
 /*   Table no: 1 Member          */ 
 create table Members
(
    member_no int auto_increment not null,
	firstName varchar(30) not null,
	middleInitial tinytext not null,
	lastName varchar(50) null,
    photograph longblob not null,
    DOB datetime not null,
    Address varchar(40) not null,
    City varchar(30) not null,
    State varchar(2) not null,
    ZIP varchar(10) not null,
    Phone varchar(15) not null,
    exp_date datetime not null,
    constraint pk_members primary key(member_no asc)
)
;

 create table Adult
(
    member_no int auto_increment not null,
	firstName varchar(30) not null,
	middleInitial tinytext not null,
	lastName varchar(50) null,
    street varchar(40) not null,
    city varchar(30) not null,
    state varchar(2) not null,
    zip varchar(10) not null,
    phone varchar(15) null,
    expr_date date not null,
    constraint pk_members primary key(member_no asc)
)
;

 create table Books
(
	ISBN int not null,
	title varchar(40) not null,
	language varchar(40) not null,
    translation varchar(40) not null,
    CoverType tinyint not null,
    edition char(2) not null,
    author varchar(30) not null,
    publishdate date not null,
    AuthID varchar(30) not null,
    PubID varchar(30) not null,
    LoanID varchar(30) not null,
    country varchar(30) not null,
    copy_no char(2) not null,
    constraint pk_Books primary key(ISBN asc),
    constraint fk_AuthID foreign key (AuthID) 
		references Author (AuthID),
	constraint fk_PubID foreign key (PubID) 
		references Publishers (PubID),
	constraint fk_LoanID foreign key (LoanID) 
		references Loans (LoanID)
)
;

 create table author
(
    AuthID char(10)  not null,
    AuthFN varchar(40) not null,
    AuthLN varchar(40) not null,
    Lang varchar(40) not null,
	Country varchar(40) not null,
    constraint pk_author primary key(AuthID asc)
)
;

 create table Publishers
(
    PubID char(1) not null,
    PubName varchar(40) not null,
    Country varchar(40) not null,
    constraint pk_Publishers primary key(PubID asc)
)
;


 create table loans
(
    LoanID varchar(40) not null,
	LoanedON datetime not null,
    DueOn datetime not null,
    ISBN int not null,
    constraint pk_loans primary key(LoanID asc),
	constraint fk_loans foreign key (ISBN) 
		references Books (ISBN)
)
;

 create table Juvenilles
(
    member_no int auto_increment not null,
	firstName varchar(30) not null,
	middleInitial tinytext not null,
	lastName varchar(50) not null,
	constraint fk_Juvenilles foreign key (member_no) 
		references Adult (member_no)
)
;
