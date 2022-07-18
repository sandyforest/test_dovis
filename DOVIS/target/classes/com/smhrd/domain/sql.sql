desc member;

create table member
(
	id varchar(20) not null, 
	pw varchar(20) not null,
	nick varchar(20) not null,
	
	primary key(id)

);

insert into member(id, pw, nick)
values('test', '1234', '테스트id');

insert into member(id, pw, nick)
values('test2', '1234', '테스트id2');

insert into member(id, pw, nick)
values('test3', '1234', '테스트id2');

select * from member;