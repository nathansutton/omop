--HINT DISTRIBUTE ON RANDOM
CREATE TABLE drug_strength
(
  drug_concept_id               INTEGER NOT NULL,
  ingredient_concept_id         INTEGER NOT NULL,
  amount_value                  NUMERIC NULL,
  amount_unit_concept_id        INTEGER NULL,
  numerator_value               NUMERIC NULL,
  numerator_unit_concept_id     INTEGER NULL,
  denominator_value             NUMERIC NULL,
  denominator_unit_concept_id   INTEGER NULL,
  box_size                      INTEGER NULL,
  valid_start_date              DATE NOT NULL,
  valid_end_date                DATE NOT NULL,
  invalid_reason                VARCHAR(1) NULL
);

COPY drug_strength FROM '/opt/DRUG_STRENGTH.csv' WITH DELIMITER E'\t' CSV HEADER QUOTE E'\b' ;

ALTER TABLE drug_strength ADD CONSTRAINT xpk_drug_strength PRIMARY KEY (drug_concept_id, ingredient_concept_id);
CREATE INDEX idx_drug_strength_id_1  ON drug_strength  (drug_concept_id ASC);
CLUSTER drug_strength  USING idx_drug_strength_id_1 ;
CREATE INDEX idx_drug_strength_id_2 ON drug_strength (ingredient_concept_id ASC);
