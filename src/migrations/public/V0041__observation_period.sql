--HINT DISTRIBUTE_ON_KEY(person_id)
CREATE TABLE observation_period
(
  observation_period_id           BIGINT NOT NULL,
  person_id                       BIGINT NOT NULL,
  observation_period_start_date   DATE NOT NULL,
  observation_period_end_date     DATE NOT NULL,
  period_type_concept_id          INTEGER NOT NULL
);

ALTER TABLE observation_period ADD CONSTRAINT xpk_observation_period PRIMARY KEY ( observation_period_id ) ;
CREATE INDEX idx_observation_period_id  ON observation_period  (person_id ASC);
CLUSTER observation_period  USING idx_observation_period_id ;
