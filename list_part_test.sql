
create table hbase (model_id text, hbase_key text, hbase_value text)
PARTITION BY LIST (model_id);



CREATE TABLE hbase_MODEL_ID_1_112111121111113323323232322332
  PARTITION OF
      hbase (model_id, hbase_key, hbase_value)
    FOR VALUES IN ('1');

CREATE TABLE hbase_MODEL_ID_2_112111121111113323323232322332jkjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjkkjkjjkkjkjkjjkkjgjjgghhgh32323322
  PARTITION OF
      hbase (model_id, hbase_key, hbase_value)
    FOR VALUES IN ('2');




create index hbase_model_id_1_112111121111113323323232322332_ix1
  on hbase_model_id_1_112111121111113323323232322332 (hbase_key);





insert into hbase (model_id, hbase_key, hbase_value)
values ('1','gffgf','hghghg');

insert into hbase (model_id, hbase_key, hbase_value)
values ('2','gffgf','hghghg');

commit;




insert into hbase (model_id, hbase_key, hbase_value)
select
    '1',
    md5(random()::text),
    left(md5(random()::text), 4)
from generate_series(1, 1000000) s(i);
commit;

insert into hbase (model_id, hbase_key, hbase_value)
select
    '2',
    md5(random()::text),
    left(md5(random()::text), 4)
from generate_series(1, 1000000) s(i);
commit;







explain (ANALYZE)
select hbase_value from hbase where model_id ='1' and hbase_key='gffgf';

explain (ANALYZE)
select hbase_value from hbase where model_id ='2' and hbase_key='gffgf';




