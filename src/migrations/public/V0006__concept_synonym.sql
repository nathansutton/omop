--HINT DISTRIBUTE ON RANDOM
CREATE TABLE concept_synonym
(
  concept_id             INTEGER NOT NULL,
  concept_synonym_name   VARCHAR(1000) NOT NULL,
  language_concept_id    INTEGER NOT NULL
);

COPY concept_synonym FROM '/opt/CONCEPT_SYNONYM.csv' WITH DELIMITER E'\t' CSV HEADER QUOTE E'\b' ;

CREATE INDEX idx_concept_synonym_id  ON concept_synonym  (concept_id ASC);
CLUSTER concept_synonym  USING idx_concept_synonym_id ;
