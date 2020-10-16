## OMOP - Common Data Model

This repository modifies the [common data model](https://github.com/OHDSI/CommonDataModel/tree/master/PostgreSQL) developed by the [Observational Health Data Sciences and Informatics](https://www.ohdsi.org/) program.  

### tl;dr

The CDM is a great tool, but it can be difficult to set up if you're not a database administrator.  This repository makes creating a local database on your laptop as simple as ...

```
docker-compose up
```

### flyway
We migrated the PostgreSQL version of the common data model to [flyway](https://flywaydb.org/).  This structure make it simple to create databases reliably from source control.  We chose to represent each table as a [versioned migration](https://flywaydb.org/documentation/concepts/migrations#versioned-migrations) with a four digit numeric sequence.  This means that each script will run once upon initialization (__docker-compose up__) If you were to run the migrate command manually, it will skip the code that it has already run.

### setup
make the directories that are git ignored  
__/volumes/data__ - your database will be persisted here  
__/volumes/cdm__ - input data for the athena vocabulary, unzipped CSV files


#### usage

Drop into database container's shell.
```
docker-compose run postgres bash
```

From the database container's shell, interact with the database with the psql client.
```
psql --host=postgres --username=admin --dbname=athena
```

Run all flyway migrations in your database
```
docker-compose run flyway migrate -configFiles=/flyway/conf/flyway.conf -locations=filesystem:/flyway/sql/public -schemas=public
```

Drop all objects in your database
```
docker-compose run flyway clean -configFiles=/flyway/conf/flyway.conf -locations=filesystem:/flyway/sql/public -schemas=public
```
