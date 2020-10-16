--HINT DISTRIBUTE_ON_KEY(person_id)
CREATE TABLE device_exposure
(
  device_exposure_id               BIGINT NOT NULL,
  person_id                        BIGINT NOT NULL,
  device_concept_id                INTEGER NOT NULL,
  device_exposure_start_date       DATE NULL,
  device_exposure_start_datetime   TIMESTAMP NOT NULL,
  device_exposure_end_date         DATE NULL,
  device_exposure_end_datetime     TIMESTAMP NULL,
  device_type_concept_id           INTEGER NOT NULL,
  unique_device_id                 VARCHAR(50) NULL,
  quantity                         INTEGER NULL,
  provider_id                      BIGINT NULL,
  visit_occurrence_id              BIGINT NULL,
  visit_detail_id                  BIGINT NULL,
  device_source_value              VARCHAR(100) NULL,
  device_source_concept_id         INTEGER NOT NULL
);

ALTER TABLE device_exposure ADD CONSTRAINT xpk_device_exposure PRIMARY KEY ( device_exposure_id ) ;
CREATE INDEX idx_device_person_id  ON device_exposure  (person_id ASC);
CLUSTER device_exposure  USING idx_device_person_id ;
CREATE INDEX idx_device_concept_id ON device_exposure (device_concept_id ASC);
CREATE INDEX idx_device_visit_id ON device_exposure (visit_occurrence_id ASC);
