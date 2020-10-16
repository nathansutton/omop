--HINT DISTRIBUTE_ON_KEY(person_id)
CREATE TABLE dose_era
(
  dose_era_id               BIGINT NOT NULL,
  person_id                 BIGINT NOT NULL,
  drug_concept_id           INTEGER NOT NULL,
  unit_concept_id           INTEGER NOT NULL,
  dose_value                NUMERIC NOT NULL,
  dose_era_start_datetime   TIMESTAMP NOT NULL,
  dose_era_end_datetime     TIMESTAMP NOT NULL
);

ALTER TABLE dose_era  ADD CONSTRAINT xpk_dose_era PRIMARY KEY ( dose_era_id ) ;
CREATE INDEX idx_dose_era_person_id  ON dose_era  (person_id ASC);
CLUSTER dose_era  USING idx_dose_era_person_id ;
CREATE INDEX idx_dose_era_concept_id ON dose_era (drug_concept_id ASC);
