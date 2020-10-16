CREATE TABLE fact_relationship
(
  domain_concept_id_1       INTEGER NOT NULL,
  fact_id_1                 BIGINT NOT NULL,
  domain_concept_id_2       INTEGER NOT NULL,
  fact_id_2                 BIGINT NOT NULL,
  relationship_concept_id   INTEGER NOT NULL
);

CREATE INDEX idx_fact_relationship_id_1 ON fact_relationship (domain_concept_id_1 ASC);
CREATE INDEX idx_fact_relationship_id_2 ON fact_relationship (domain_concept_id_2 ASC);
CREATE INDEX idx_fact_relationship_id_3 ON fact_relationship (relationship_concept_id ASC);
