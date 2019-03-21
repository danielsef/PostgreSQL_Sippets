create table t1
(
  id   integer,
  col1 text
);

alter table t1 owner to postgres;

create table sometable(id int);

insert into sometable(id) values (10);

create table sometable2(id int);

insert into sometable2(id) values (11);