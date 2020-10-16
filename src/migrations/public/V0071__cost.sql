--HINT DISTRIBUTE ON KEY(person_id)
CREATE TABLE cost
(
  cost_id                       BIGINT NOT NULL,
  person_id                     BIGINT NOT NULL,
  cost_event_id                 BIGINT NOT NULL,
  cost_event_field_concept_id   INTEGER NOT NULL,
  cost_concept_id               INTEGER NOT NULL,
  cost_type_concept_id          INTEGER NOT NULL,
  currency_concept_id           INTEGER NOT NULL,
  COST                          NUMERIC NULL,
  incurred_date                 DATE NOT NULL,
  billed_date                   DATE NULL,
  paid_date                     DATE NULL,
  revenue_code_concept_id       INTEGER NOT NULL,
  drg_concept_id                INTEGER NOT NULL,
  cost_source_value             VARCHAR(50) NULL,
  cost_source_concept_id        INTEGER NOT NULL,
  revenue_code_source_value     VARCHAR(50) NULL,
  drg_source_value              VARCHAR(3) NULL,
  payer_plan_period_id          BIGINT NULL
);

ALTER TABLE cost ADD CONSTRAINT xpk_visit_cost PRIMARY KEY ( cost_id ) ;
CREATE INDEX idx_cost_person_id  ON cost  (person_id ASC);
CLUSTER cost  USING idx_cost_person_id ;
