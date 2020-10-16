--HINT DISTRIBUTE_ON_KEY(person_id)
CREATE TABLE procedure_occurrence
(
  procedure_occurrence_id       BIGINT NOT NULL,
  person_id                     BIGINT NOT NULL,
  procedure_concept_id          INTEGER NOT NULL,
  procedure_date                DATE NULL,
  procedure_datetime            TIMESTAMP NOT NULL,
  procedure_type_concept_id     INTEGER NOT NULL,
  modifier_concept_id           INTEGER NOT NULL,
  quantity                      INTEGER NULL,
  provider_id                   BIGINT NULL,
  visit_occurrence_id           BIGINT NULL,
  visit_detail_id               BIGINT NULL,
  procedure_source_value        VARCHAR(50) NULL,
  procedure_source_concept_id   INTEGER NOT NULL,
  modifier_source_value         VARCHAR(50) NULL
);

ALTER TABLE procedure_occurrence ADD CONSTRAINT xpk_procedure_occurrence PRIMARY KEY ( procedure_occurrence_id ) ;
CREATE INDEX idx_procedure_person_id  ON procedure_occurrence  (person_id ASC);
CLUSTER procedure_occurrence  USING idx_procedure_person_id ;
CREATE INDEX idx_procedure_concept_id ON procedure_occurrence (procedure_concept_id ASC);
CREATE INDEX idx_procedure_visit_id ON procedure_occurrence (visit_occurrence_id ASC);
