--HINT DISTRIBUTE_ON_KEY(person_id)
CREATE TABLE specimen
(
  specimen_id                   BIGINT NOT NULL,
  person_id                     BIGINT NOT NULL,
  specimen_concept_id           INTEGER NOT NULL,
  specimen_type_concept_id      INTEGER NOT NULL,
  specimen_date                 DATE NULL,
  specimen_datetime             TIMESTAMP NOT NULL,
  quantity                      NUMERIC NULL,
  unit_concept_id               INTEGER NULL,
  anatomic_site_concept_id      INTEGER NOT NULL,
  disease_status_concept_id     INTEGER NOT NULL,
  specimen_source_id            VARCHAR(50) NULL,
  specimen_source_value         VARCHAR(50) NULL,
  unit_source_value             VARCHAR(50) NULL,
  anatomic_site_source_value    VARCHAR(50) NULL,
  disease_status_source_value   VARCHAR(50) NULL
);

ALTER TABLE specimen ADD CONSTRAINT xpk_specimen PRIMARY KEY ( specimen_id ) ;
CREATE INDEX idx_specimen_person_id  ON specimen  (person_id ASC);
CLUSTER specimen  USING idx_specimen_person_id ;
CREATE INDEX idx_specimen_concept_id ON specimen (specimen_concept_id ASC);
