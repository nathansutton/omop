--HINT DISTRIBUTE ON KEY(person_id)
CREATE TABLE survey_conduct
(
  survey_conduct_id                BIGINT NOT NULL,
  person_id                        BIGINT NOT NULL,
  survey_concept_id                INTEGER NOT NULL,
  survey_start_date                DATE NULL,
  survey_start_datetime            TIMESTAMP NULL,
  survey_end_date                  DATE NULL,
  survey_end_datetime              TIMESTAMP NOT NULL,
  provider_id                      BIGINT NULL,
  assisted_concept_id              INTEGER NOT NULL,
  respondent_type_concept_id       INTEGER NOT NULL,
  timing_concept_id                INTEGER NOT NULL,
  collection_method_concept_id     INTEGER NOT NULL,
  assisted_source_value            VARCHAR(50) NULL,
  respondent_type_source_value     VARCHAR(100) NULL,
  timing_source_value              VARCHAR(100) NULL,
  collection_method_source_value   VARCHAR(100) NULL,
  survey_source_value              VARCHAR(100) NULL,
  survey_source_concept_id         INTEGER NOT NULL,
  survey_source_identifier         VARCHAR(100) NULL,
  validated_survey_concept_id      INTEGER NOT NULL,
  validated_survey_source_value    VARCHAR(100) NULL,
  survey_version_number            VARCHAR(20) NULL,
  visit_occurrence_id              BIGINT NULL,
  visit_detail_id                  BIGINT NULL,
  response_visit_occurrence_id     BIGINT NULL
);

ALTER TABLE survey_conduct ADD CONSTRAINT xpk_survey PRIMARY KEY ( survey_conduct_id ) ;
CREATE INDEX idx_survey_person_id  ON survey_conduct  (person_id ASC);
CLUSTER survey_conduct  USING idx_survey_person_id ;
