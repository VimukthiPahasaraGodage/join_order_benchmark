DO $$
DECLARE
    tbl TEXT;
    r RECORD;
    col_clean TEXT;
    sql TEXT;
    table_list TEXT[] := ARRAY['aka_name', 'aka_title', 'cast_info', 'char_name', 'comp_cast_type', 'company_name', 'company_type', 'complete_cast', 'info_type', 'keyword', 'kind_type', 'link_type', 'movie_companies', 'movie_info_idx', 'movie_keyword', 'movie_link', 'name', 'role_type', 'title', 'movie_info', 'person_info'];
BEGIN
    -- Loop through each table in the list
    FOREACH tbl IN ARRAY table_list LOOP
        sql := '';
        
        -- Loop through character columns of the current table
        FOR r IN
            SELECT column_name
            FROM information_schema.columns
            WHERE table_name = tbl
              AND data_type IN ('character varying', 'character', 'text')
        LOOP
            -- Build column cleaning expressions
            col_clean := format('%I = REGEXP_REPLACE(%I, ''[^a-zA-Z0-9 ]'', '''', ''g'')', r.column_name, r.column_name);
            sql := sql || col_clean || ', ';
        END LOOP;

        -- If there are any character columns, run the update
        IF sql <> '' THEN
            sql := left(sql, length(sql) - 2); -- remove trailing comma
            sql := format('UPDATE %I SET %s;', tbl, sql);
            EXECUTE sql;
            RAISE NOTICE 'Cleaned table: %', tbl;
        ELSE
            RAISE NOTICE 'No character columns found in table: %', tbl;
        END IF;
    END LOOP;
END $$;
