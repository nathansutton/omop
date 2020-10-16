--HINT DISTRIBUTE ON RANDOM
CREATE TABLE relationship
(
  relationship_id           VARCHAR(20) NOT NULL,
  relationship_name         VARCHAR(255) NOT NULL,
  is_hierarchical           VARCHAR(1) NOT NULL,
  defines_ancestry          VARCHAR(1) NOT NULL,
  reverse_relationship_id   VARCHAR(20) NOT NULL,
  relationship_concept_id   INTEGER NOT NULL
)
;

COPY relationship FROM '/opt/RELATIONSHIP.csv' WITH DELIMITER E'\t' CSV HEADER QUOTE E'\b' ;

ALTER TABLE relationship ADD CONSTRAINT xpk_relationship PRIMARY KEY (relationship_id);

CREATE UNIQUE INDEX idx_relationship_rel_id  ON relationship  (relationship_id ASC);
CLUSTER relationship  USING idx_relationship_rel_id ;
