--HINT DISTRIBUTE ON RANDOM
CREATE TABLE concept_ancestor
(
  ancestor_concept_id        INTEGER NOT NULL,
  descendant_concept_id      INTEGER NOT NULL,
  min_levels_of_separation   INTEGER NOT NULL,
  max_levels_of_separation   INTEGER NOT NULL
);

COPY concept_ancestor FROM '/opt/CONCEPT_ANCESTOR.csv' WITH DELIMITER E'\t' CSV HEADER QUOTE E'\b' ;

ALTER TABLE concept_ancestor ADD CONSTRAINT xpk_concept_ancestor PRIMARY KEY (ancestor_concept_id,descendant_concept_id);

CREATE INDEX idx_concept_ancestor_id_1  ON concept_ancestor  (ancestor_concept_id ASC);
CLUSTER concept_ancestor  USING idx_concept_ancestor_id_1 ;
CREATE INDEX idx_concept_ancestor_id_2 ON concept_ancestor (descendant_concept_id ASC);
