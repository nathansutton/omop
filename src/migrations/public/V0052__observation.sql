--HINT DISTRIBUTE_ON_KEY(person_id)
CREATE TABLE observation
(
  observation_id                  BIGINT NOT NULL,
  person_id                       BIGINT NOT NULL,
  observation_concept_id          INTEGER NOT NULL,
  observation_date                DATE NULL,
  observation_datetime            TIMESTAMP NOT NULL,
  observation_type_concept_id     INTEGER NOT NULL,
  value_as_number                 NUMERIC NULL,
  value_as_string                 VARCHAR(60) NULL,
  value_as_concept_id             INTEGER NULL,
  qualifier_concept_id            INTEGER NULL,
  unit_concept_id                 INTEGER NULL,
  provider_id                     BIGINT NULL,
  visit_occurrence_id             BIGINT NULL,
  visit_detail_id                 BIGINT NULL,
  observation_source_value        VARCHAR(50) NULL,
  observation_source_concept_id   INTEGER NOT NULL,
  unit_source_value               VARCHAR(50) NULL,
  qualifier_source_value          VARCHAR(50) NULL,
  observation_event_id            BIGINT NULL,
  obs_event_field_concept_id      INTEGER NOT NULL,
  value_as_datetime               TIMESTAMP NULL
);

ALTER TABLE observation  ADD CONSTRAINT xpk_observation PRIMARY KEY ( observation_id ) ;
CREATE INDEX idx_observation_person_id  ON observation  (person_id ASC);
CLUSTER observation  USING idx_observation_person_id ;
CREATE INDEX idx_observation_concept_id ON observation (observation_concept_id ASC);
CREATE INDEX idx_observation_visit_id ON observation (visit_occurrence_id ASC);
