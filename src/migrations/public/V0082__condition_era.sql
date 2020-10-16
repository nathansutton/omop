--HINT DISTRIBUTE_ON_KEY(person_id)
CREATE TABLE condition_era
(
  condition_era_id               BIGINT NOT NULL,
  person_id                      BIGINT NOT NULL,
  condition_concept_id           INTEGER NOT NULL,
  condition_era_start_datetime   TIMESTAMP NOT NULL,
  condition_era_end_datetime     TIMESTAMP NOT NULL,
  condition_occurrence_count     INTEGER NULL
);

ALTER TABLE condition_era ADD CONSTRAINT xpk_condition_era PRIMARY KEY ( condition_era_id ) ;
CREATE INDEX idx_condition_era_person_id  ON condition_era  (person_id ASC);
CLUSTER condition_era  USING idx_condition_era_person_id ;
CREATE INDEX idx_condition_era_concept_id ON condition_era (condition_concept_id ASC);
