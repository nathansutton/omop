--HINT DISTRIBUTE_ON_KEY(person_id)
CREATE TABLE payer_plan_period
(
  payer_plan_period_id            BIGINT NOT NULL,
  person_id                       BIGINT NOT NULL,
  contract_person_id              BIGINT NULL,
  payer_plan_period_start_date    DATE NOT NULL,
  payer_plan_period_end_date      DATE NOT NULL,
  payer_concept_id                INTEGER NOT NULL,
  plan_concept_id                 INTEGER NOT NULL,
  contract_concept_id             INTEGER NOT NULL,
  sponsor_concept_id              INTEGER NOT NULL,
  stop_reason_concept_id          INTEGER NOT NULL,
  payer_source_value              VARCHAR(50) NULL,
  payer_source_concept_id         INTEGER NOT NULL,
  plan_source_value               VARCHAR(50) NULL,
  plan_source_concept_id          INTEGER NOT NULL,
  contract_source_value           VARCHAR(50) NULL,
  contract_source_concept_id      INTEGER NOT NULL,
  sponsor_source_value            VARCHAR(50) NULL,
  sponsor_source_concept_id       INTEGER NOT NULL,
  family_source_value             VARCHAR(50) NULL,
  stop_reason_source_value        VARCHAR(50) NULL,
  stop_reason_source_concept_id   INTEGER NOT NULL
);

ALTER TABLE payer_plan_period ADD CONSTRAINT xpk_payer_plan_period PRIMARY KEY ( payer_plan_period_id ) ;
CREATE INDEX idx_period_person_id  ON payer_plan_period  (person_id ASC);
CLUSTER payer_plan_period  USING idx_period_person_id ;
