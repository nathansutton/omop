--HINT DISTRIBUTE ON RANDOM
CREATE TABLE vocabulary
(
  vocabulary_id           VARCHAR(20) NOT NULL,
  vocabulary_name         VARCHAR(255) NOT NULL,
  vocabulary_reference    VARCHAR(255) NOT NULL,
  vocabulary_version      VARCHAR(255) NULL,
  vocabulary_concept_id   INTEGER NOT NULL
);

COPY vocabulary FROM '/opt/VOCABULARY.csv' WITH DELIMITER E'\t' CSV HEADER QUOTE E'\b' ;

ALTER TABLE vocabulary ADD CONSTRAINT xpk_vocabulary PRIMARY KEY (vocabulary_id);

CREATE UNIQUE INDEX idx_vocabulary_vocabulary_id  ON vocabulary  (vocabulary_id ASC);
CLUSTER vocabulary  USING idx_vocabulary_vocabulary_id ;
