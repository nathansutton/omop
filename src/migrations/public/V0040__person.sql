CREATE TABLE person
(
  person_id                     BIGINT NOT NULL,
  gender_concept_id             INTEGER NOT NULL,
  year_of_birth                 INTEGER NOT NULL,
  month_of_birth                INTEGER NULL,
  day_of_birth                  INTEGER NULL,
  birth_datetime                TIMESTAMP NULL,
  death_datetime                TIMESTAMP NULL,
  race_concept_id               INTEGER NOT NULL,
  ethnicity_concept_id          INTEGER NOT NULL,
  location_id                   BIGINT NULL,
  provider_id                   BIGINT NULL,
  care_site_id                  BIGINT NULL,
  person_source_value           VARCHAR(50) NULL,
  gender_source_value           VARCHAR(50) NULL,
  gender_source_concept_id      INTEGER NOT NULL,
  race_source_value             VARCHAR(50) NULL,
  race_source_concept_id        INTEGER NOT NULL,
  ethnicity_source_value        VARCHAR(50) NULL,
  ethnicity_source_concept_id   INTEGER NOT NULL
);

ALTER TABLE person ADD CONSTRAINT xpk_person PRIMARY KEY ( person_id ) ;
CREATE UNIQUE INDEX idx_person_id  ON person  (person_id ASC);
CLUSTER person  USING idx_person_id ;
