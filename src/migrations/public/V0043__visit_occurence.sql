--HINT DISTRIBUTE_ON_KEY(person_id)
CREATE TABLE visit_occurrence
(
  visit_occurrence_id             BIGINT NOT NULL,
  person_id                       BIGINT NOT NULL,
  visit_concept_id                INTEGER NOT NULL,
  visit_start_date                DATE NULL,
  visit_start_datetime            TIMESTAMP NOT NULL,
  visit_end_date                  DATE NULL,
  visit_end_datetime              TIMESTAMP NOT NULL,
  visit_type_concept_id           INTEGER NOT NULL,
  provider_id                     BIGINT NULL,
  care_site_id                    BIGINT NULL,
  visit_source_value              VARCHAR(50) NULL,
  visit_source_concept_id         INTEGER NOT NULL,
  admitted_from_concept_id        INTEGER NOT NULL,
  admitted_from_source_value      VARCHAR(50) NULL,
  discharge_to_source_value       VARCHAR(50) NULL,
  discharge_to_concept_id         INTEGER NOT NULL,
  preceding_visit_occurrence_id   BIGINT NULL
);

ALTER TABLE visit_occurrence ADD CONSTRAINT xpk_visit_occurrence PRIMARY KEY ( visit_occurrence_id ) ;
CREATE INDEX idx_visit_person_id  ON visit_occurrence  (person_id ASC);
CLUSTER visit_occurrence  USING idx_visit_person_id ;
CREATE INDEX idx_visit_concept_id ON visit_occurrence (visit_concept_id ASC);
