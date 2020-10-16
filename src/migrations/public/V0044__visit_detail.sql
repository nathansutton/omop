--HINT DISTRIBUTE_ON_KEY(person_id)
CREATE TABLE visit_detail
(
  visit_detail_id                  BIGINT NOT NULL,
  person_id                        BIGINT NOT NULL,
  visit_detail_concept_id          INTEGER NOT NULL,
  visit_detail_start_date          DATE NULL,
  visit_detail_start_datetime      TIMESTAMP NOT NULL,
  visit_detail_end_date            DATE NULL,
  visit_detail_end_datetime        TIMESTAMP NOT NULL,
  visit_detail_type_concept_id     INTEGER NOT NULL,
  provider_id                      BIGINT NULL,
  care_site_id                     BIGINT NULL,
  discharge_to_concept_id          INTEGER NOT NULL,
  admitted_from_concept_id         INTEGER NOT NULL,
  admitted_from_source_value       VARCHAR(50) NULL,
  visit_detail_source_value        VARCHAR(50) NULL,
  visit_detail_source_concept_id   INTEGER NOT NULL,
  discharge_to_source_value        VARCHAR(50) NULL,
  preceding_visit_detail_id        BIGINT NULL,
  visit_detail_parent_id           BIGINT NULL,
  visit_occurrence_id              BIGINT NOT NULL
);

ALTER TABLE visit_detail ADD CONSTRAINT xpk_visit_detail PRIMARY KEY ( visit_detail_id ) ;
CREATE INDEX idx_visit_detail_person_id  ON visit_detail  (person_id ASC);
CLUSTER visit_detail  USING idx_visit_detail_person_id ;
CREATE INDEX idx_visit_detail_concept_id ON visit_detail (visit_detail_concept_id ASC);
