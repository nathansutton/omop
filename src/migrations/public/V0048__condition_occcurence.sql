--HINT DISTRIBUTE_ON_KEY(person_id)
CREATE TABLE condition_occurrence
(
  condition_occurrence_id         BIGINT NOT NULL,
  person_id                       BIGINT NOT NULL,
  condition_concept_id            INTEGER NOT NULL,
  condition_start_date            DATE NULL,
  condition_start_datetime        TIMESTAMP NOT NULL,
  condition_end_date              DATE NULL,
  condition_end_datetime          TIMESTAMP NULL,
  condition_type_concept_id       INTEGER NOT NULL,
  condition_status_concept_id     INTEGER NOT NULL,
  stop_reason                     VARCHAR(20) NULL,
  provider_id                     BIGINT NULL,
  visit_occurrence_id             BIGINT NULL,
  visit_detail_id                 BIGINT NULL,
  condition_source_value          VARCHAR(50) NULL,
  condition_source_concept_id     INTEGER NOT NULL,
  condition_status_source_value   VARCHAR(50) NULL
);

ALTER TABLE condition_occurrence ADD CONSTRAINT xpk_condition_occurrence PRIMARY KEY ( condition_occurrence_id ) ;
CREATE INDEX idx_condition_person_id  ON condition_occurrence  (person_id ASC);
CLUSTER condition_occurrence  USING idx_condition_person_id ;
CREATE INDEX idx_condition_concept_id ON condition_occurrence (condition_concept_id ASC);
CREATE INDEX idx_condition_visit_id ON condition_occurrence (visit_occurrence_id ASC);
