--HINT DISTRIBUTE ON RANDOM
CREATE TABLE provider
(
  provider_id                   BIGINT NOT NULL,
  provider_name                 VARCHAR(255) NULL,
  NPI                           VARCHAR(20) NULL,
  DEA                           VARCHAR(20) NULL,
  specialty_concept_id          INTEGER NOT NULL,
  care_site_id                  BIGINT NULL,
  year_of_birth                 INTEGER NULL,
  gender_concept_id             INTEGER NOT NULL,
  provider_source_value         VARCHAR(50) NULL,
  specialty_source_value        VARCHAR(50) NULL,
  specialty_source_concept_id   INTEGER NULL,
  gender_source_value           VARCHAR(50) NULL,
  gender_source_concept_id      INTEGER NOT NULL
);

ALTER TABLE provider ADD CONSTRAINT xpk_provider PRIMARY KEY ( provider_id ) ;
