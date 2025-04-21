# Join Order Benchmark

This package contains the **Join Order Benchmark** (JOB) queries from:  
"How Good Are Query Optimizers, Really?"  
by Viktor Leis, Andrey Gubichev, Atans Mirchev, Peter Boncz, Alfons Kemper, Thomas Neumann  
PVLDB Volume 9, No. 3, 2015  
[http://www.vldb.org/pvldb/vol9/p204-leis.pdf](http://www.vldb.org/pvldb/vol9/p204-leis.pdf)

This repository is not maintained by the original authors of the Join Order Benchmark. The purpose is to ease the distribution of Join Order Benchmark queries (e.g., as a git submodule).

### IMDB Data Set
The CSV files used in the paper, which are from May 2013, can be found
at 
[http://event.cwi.nl/da/job/imdb.tgz](http://event.cwi.nl/da/job/imdb.tgz)

### Step-by-step instructions
1. download `imdb.tgz` file and extract the csv files to 'original' folder in JOB_database

2. create a new database in PostgreSQL and run the schema file
```commandline
create database imdb;
\c imdb
\i schematext.sql
```

3. then add the data to the tables which do not need processing
```commandline
\copy comp_cast_type from 'comp_cast_type.csv' csv
\copy company_type from 'company_type.csv' csv
\copy complete_cast from 'complete_cast.csv' csv
\copy info_type from 'info_type.csv' csv
\copy keyword from 'keyword.csv' csv
\copy kind_type from 'kind_type.csv' csv
\copy link_type from 'link_type.csv' csv
\copy movie_info_idx from 'movie_info_idx.csv' csv
\copy movie_keyword from 'movie_keyword.csv' csv
\copy movie_link from 'movie_link.csv' csv
\copy role_type from 'role_type.csv' csv
```

5. then process the rest of the csv files to a form that can be added to the PostgreSQL database(use process_wrong_csv_filed.ipynb in JOB_database)
6. update the status in the status.txt
  

