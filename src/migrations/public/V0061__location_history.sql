--HINT DISTRIBUTE ON RANDOM
CREATE TABLE location_history
(
  location_history_id            BIGINT NOT NULL,
  location_id                    BIGINT NOT NULL,
  relationship_type_concept_id   INTEGER NOT NULL,
  domain_id                      VARCHAR(50) NOT NULL,
  entity_id                      BIGINT NOT NULL,
  start_date                     DATE NOT NULL,
  end_date                       DATE NULL
);

ALTER TABLE location_history ADD CONSTRAINT xpk_location_history PRIMARY KEY ( location_history_id ) ;
