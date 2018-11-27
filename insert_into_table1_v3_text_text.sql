create function insert_into_table1_v3(p_target_table text, p_stg_table text)
  returns void
language plpgsql
as $$
DECLARE
  v_ins_cols      text;
  v_sel_cols      text;
  v_id            text = '10';
  v_date          text = cast(current_date as text);
  c_c1_table_name text = 'public.' || p_target_table;
  c_c2_table_name text = 'public.' || p_stg_table;

BEGIN
  SELECT string_agg(t.attname_c1, ',') as ins_cols, string_agg(t.attname_c2, ',') as sel_cols
      INTO v_ins_cols,
        v_sel_cols
  from (select c1.attname as attname_c1, c2.attname as attname_c2
        FROM pg_attribute c1
               LEFT JOIN pg_attribute c2 ON c2.attrelid = c_c2_table_name :: regclass
                                              AND c2.attnum > 0
                                              AND NOT c2.attisdropped
                                              AND c1.attname = c2.attname
        WHERE c1.attrelid = c_c1_table_name :: regclass
          AND c1.attnum > 0
          AND NOT c1.attisdropped
        order by c1.attnum, c2.attnum) as t;

  EXECUTE format(
      'INSERT INTO ' || p_target_table || ' ( %s )
            SELECT '||v_id||', null, %s
            FROM ' || p_stg_table,
      v_ins_cols,
      v_sel_cols
  );
  --Exception
  --when others Then
  --raise warning 'sqlstate %', SQLSTATE;
  --raise warning 'sqlerrm %', SQLERRM;
END;
$$;

alter function insert_into_table1_v3(text, text)
  owner to postgres;

