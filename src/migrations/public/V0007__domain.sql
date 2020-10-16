CREATE TABLE domain
(
  domain_id           VARCHAR(20) NOT NULL,
  domain_name         VARCHAR(255) NOT NULL,
  domain_concept_id   INTEGER NOT NULL
);

COPY domain FROM '/opt/DOMAIN.csv' WITH DELIMITER E'\t' CSV HEADER QUOTE E'\b' ;

ALTER TABLE domain ADD CONSTRAINT xpk_domain PRIMARY KEY (domain_id);

CREATE UNIQUE INDEX idx_domain_domain_id  ON domain  (domain_id ASC);
CLUSTER domain  USING idx_domain_domain_id ;
