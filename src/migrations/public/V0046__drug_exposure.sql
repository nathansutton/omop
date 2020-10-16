--HINT DISTRIBUTE_ON_KEY(person_id)
CREATE TABLE drug_exposure
(
  drug_exposure_id               BIGINT NOT NULL,
  person_id                      BIGINT NOT NULL,
  drug_concept_id                INTEGER NOT NULL,
  drug_exposure_start_date       DATE NULL,
  drug_exposure_start_datetime   TIMESTAMP NOT NULL,
  drug_exposure_end_date         DATE NULL,
  drug_exposure_end_datetime     TIMESTAMP NOT NULL,
  verbatim_end_date              DATE NULL,
  drug_type_concept_id           INTEGER NOT NULL,
  stop_reason                    VARCHAR(20) NULL,
  refills                        INTEGER NULL,
  quantity                       NUMERIC NULL,
  days_supply                    INTEGER NULL,
  sig                            TEXT NULL,
  route_concept_id               INTEGER NOT NULL,
  lot_number                     VARCHAR(50) NULL,
  provider_id                    BIGINT NULL,
  visit_occurrence_id            BIGINT NULL,
  visit_detail_id                BIGINT NULL,
  drug_source_value              VARCHAR(50) NULL,
  drug_source_concept_id         INTEGER NOT NULL,
  route_source_value             VARCHAR(50) NULL,
  dose_unit_source_value         VARCHAR(50) NULL
);

ALTER TABLE drug_exposure ADD CONSTRAINT xpk_drug_exposure PRIMARY KEY ( drug_exposure_id ) ;
CREATE INDEX idx_drug_person_id  ON drug_exposure  (person_id ASC);
CLUSTER drug_exposure  USING idx_drug_person_id ;
CREATE INDEX idx_drug_concept_id ON drug_exposure (drug_concept_id ASC);
CREATE INDEX idx_drug_visit_id ON drug_exposure (visit_occurrence_id ASC);
