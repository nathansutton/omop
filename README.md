#### setup
make the directories that are git ignored  
__/volumes/data__ - your database will be persisted here  
__/volumes/cdm__ - input data for the athena vocabulary, unzipped CSV files

#### turn on the stack
```
docker-compose up
```

#### drop into database container
```
docker-compose run postgres bash
```

### from the database container, turn on psql client
```
psql --host=postgres --username=admin --dbname=athena
```

### clean it up and restart
```
docker-compose run flyway clean -configFiles=/flyway/conf/flyway.conf -locations=filesystem:/flyway/sql/public -schemas=public
```

### run all migrations
```
docker-compose run flyway migrate -configFiles=/flyway/conf/flyway.conf -locations=filesystem:/flyway/sql/public -schemas=public
```
