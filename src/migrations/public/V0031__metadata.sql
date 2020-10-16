CREATE TABLE metadata
(
  metadata_concept_id        INTEGER NOT NULL,
  metadata_type_concept_id   INTEGER NOT NULL,
  name                       VARCHAR(250) NOT NULL,
  value_as_string            TEXT NULL,
  value_as_concept_id        INTEGER NULL,
  metadata_date              DATE NULL,
  metadata_datetime          TIMESTAMP NULL
);
