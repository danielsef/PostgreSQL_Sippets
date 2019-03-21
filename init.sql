CREATE USER docker;
CREATE DATABASE docker;
GRANT ALL PRIVILEGES ON DATABASE docker TO docker;
GRANT ALL PRIVILEGES ON DATABASE docker TO postgres;

create table t1
(
  id   integer,
  col1 text
);

alter table t1 owner to postgres;

create table sometable(id int);

insert into sometable(id) values (10);