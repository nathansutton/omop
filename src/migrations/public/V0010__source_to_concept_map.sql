--HINT DISTRIBUTE ON RANDOM
CREATE TABLE source_to_concept_map
(
  source_code               VARCHAR(50) NOT NULL,
  source_concept_id         INTEGER NOT NULL,
  source_vocabulary_id      VARCHAR(20) NOT NULL,
  source_code_description   VARCHAR(255) NULL,
  target_concept_id         INTEGER NOT NULL,
  target_vocabulary_id      VARCHAR(20) NOT NULL,
  valid_start_date          DATE NOT NULL,
  valid_end_date            DATE NOT NULL,
  invalid_reason            VARCHAR(1) NULL
);

ALTER TABLE source_to_concept_map ADD CONSTRAINT xpk_source_to_concept_map PRIMARY KEY (source_vocabulary_id,target_concept_id,source_code,valid_end_date);
CREATE INDEX idx_source_to_concept_map_id_3  ON source_to_concept_map  (target_concept_id ASC);
CLUSTER source_to_concept_map  USING idx_source_to_concept_map_id_3 ;
CREATE INDEX idx_source_to_concept_map_id_1 ON source_to_concept_map (source_vocabulary_id ASC);
CREATE INDEX idx_source_to_concept_map_id_2 ON source_to_concept_map (target_vocabulary_id ASC);
CREATE INDEX idx_source_to_concept_map_code ON source_to_concept_map (source_code ASC);
