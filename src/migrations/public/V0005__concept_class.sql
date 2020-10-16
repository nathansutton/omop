--HINT DISTRIBUTE ON RANDOM
CREATE TABLE concept_class
(
  concept_class_id           VARCHAR(20) NOT NULL,
  concept_class_name         VARCHAR(255) NOT NULL,
  concept_class_concept_id   INTEGER NOT NULL
);

COPY concept_class FROM '/opt/CONCEPT_CLASS.csv' WITH DELIMITER E'\t' CSV HEADER QUOTE E'\b' ;

ALTER TABLE concept_class ADD CONSTRAINT xpk_concept_class PRIMARY KEY (concept_class_id);

CREATE UNIQUE INDEX idx_concept_class_class_id  ON concept_class  (concept_class_id ASC);
CLUSTER concept_class  USING idx_concept_class_class_id ;
