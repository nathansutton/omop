--HINT DISTRIBUTE_ON_KEY(subject_id)
CREATE TABLE cohort
(
  cohort_definition_id   BIGINT NOT NULL,
  subject_id             BIGINT NOT NULL,
  cohort_start_date      DATE NOT NULL,
  cohort_end_date        DATE NOT NULL
);

ALTER TABLE cohort ADD CONSTRAINT xpk_cohort PRIMARY KEY ( cohort_definition_id, subject_id, cohort_start_date, cohort_end_date  ) ;
CREATE INDEX idx_cohort_subject_id ON cohort (subject_id ASC);
CREATE INDEX idx_cohort_c_definition_id ON cohort (cohort_definition_id ASC);
