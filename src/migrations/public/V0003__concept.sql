--HINT DISTRIBUTE ON RANDOM
CREATE TABLE concept
(
  concept_id         INTEGER NOT NULL,
  concept_name       VARCHAR(255) NOT NULL,
  domain_id          VARCHAR(20) NOT NULL,
  vocabulary_id      VARCHAR(20) NOT NULL,
  concept_class_id   VARCHAR(20) NOT NULL,
  standard_concept   VARCHAR(1) NULL,
  concept_code       VARCHAR(50) NOT NULL,
  valid_start_date   DATE NOT NULL,
  valid_end_date     DATE NOT NULL,
  invalid_reason     VARCHAR(1) NULL
);

COPY concept FROM '/opt/CONCEPT.csv' WITH DELIMITER E'\t' CSV HEADER QUOTE E'\b' ;

ALTER TABLE concept ADD CONSTRAINT xpk_concept PRIMARY KEY (concept_id);

CREATE UNIQUE INDEX idx_concept_concept_id  ON concept  (concept_id ASC);
CLUSTER concept  USING idx_concept_concept_id ;
CREATE INDEX idx_concept_code ON concept (concept_code ASC);
CREATE INDEX idx_concept_vocabluary_id ON concept (vocabulary_id ASC);
CREATE INDEX idx_concept_domain_id ON concept (domain_id ASC);
CREATE INDEX idx_concept_class_id ON concept (concept_class_id ASC);
CREATE INDEX idx_concept_id_varchar ON concept (CAST(concept_id AS VARCHAR));
