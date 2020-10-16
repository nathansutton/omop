--HINT DISTRIBUTE_ON_KEY(person_id)
CREATE TABLE drug_era
(
  drug_era_id               BIGINT NOT NULL,
  person_id                 BIGINT NOT NULL,
  drug_concept_id           INTEGER NOT NULL,
  drug_era_start_datetime   TIMESTAMP NOT NULL,
  drug_era_end_datetime     TIMESTAMP NOT NULL,
  drug_exposure_count       INTEGER NULL,
  gap_days                  INTEGER NULL
);

ALTER TABLE drug_era ADD CONSTRAINT xpk_drug_era PRIMARY KEY ( drug_era_id ) ;
CREATE INDEX idx_drug_era_person_id  ON drug_era  (person_id ASC);
CLUSTER drug_era  USING idx_drug_era_person_id ;
CREATE INDEX idx_drug_era_concept_id ON drug_era (drug_concept_id ASC);
