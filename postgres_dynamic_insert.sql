CREATE TABLE public.sample1
(
    id int,
    load_dt date,
    name varchar,
    address varchar
);

CREATE TABLE public.sample1_stg
(
    name varchar,
    address varchar
);

---------------------

    SELECT
            string_agg(t.attname_c1, ',') as ins_cols,
            string_agg(t.attname_c2, ',') as sel_cols
    from
            (select
         c1.attname as attname_c1, c2.attname as attname_c2
    FROM    pg_attribute c1
    LEFT JOIN    pg_attribute c2
    ON      c2.attrelid = 'public.sample1_stg'::regclass
    AND     c2.attnum > 0
    AND     NOT c2.attisdropped
    AND     c1.attname = c2.attname
    WHERE   c1.attrelid = 'public.sample1'::regclass
    AND     c1.attnum > 0
    AND     NOT c1.attisdropped
    order by c1.attnum, c2.attnum) as t;

--Testing:

insert into public.sample1_stg(name,address) values ('name1','addr1');
insert into public.sample1_stg(name,address) values ('name2','addr2');
commit;

select * from public.sample1_stg;
select * from public.sample1;


select insert_into_table1_v3(p_target_table := 'sample1', p_stg_table := 'sample1_stg');


select * from public.sample1;






