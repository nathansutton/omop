--HINT DISTRIBUTE_ON_KEY(person_id)
CREATE TABLE measurement
(
  measurement_id                  BIGINT NOT NULL,
  person_id                       BIGINT NOT NULL,
  measurement_concept_id          INTEGER NOT NULL,
  measurement_date                DATE NULL,
  measurement_datetime            TIMESTAMP NOT NULL,
  measurement_time                VARCHAR(10) NULL,
  measurement_type_concept_id     INTEGER NOT NULL,
  operator_concept_id             INTEGER NULL,
  value_as_number                 NUMERIC NULL,
  value_as_concept_id             INTEGER NULL,
  unit_concept_id                 INTEGER NULL,
  range_low                       NUMERIC NULL,
  range_high                      NUMERIC NULL,
  provider_id                     BIGINT NULL,
  visit_occurrence_id             BIGINT NULL,
  visit_detail_id                 BIGINT NULL,
  measurement_source_value        VARCHAR(50) NULL,
  measurement_source_concept_id   INTEGER NOT NULL,
  unit_source_value               VARCHAR(50) NULL,
  value_source_value              VARCHAR(50) NULL
);

ALTER TABLE measurement ADD CONSTRAINT xpk_measurement PRIMARY KEY ( measurement_id ) ;
CREATE INDEX idx_measurement_person_id  ON measurement  (person_id ASC);
CLUSTER measurement  USING idx_measurement_person_id ;
CREATE INDEX idx_measurement_concept_id ON measurement (measurement_concept_id ASC);
CREATE INDEX idx_measurement_visit_id ON measurement (visit_occurrence_id ASC);
