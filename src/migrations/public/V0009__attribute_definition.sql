--HINT DISTRIBUTE ON RANDOM
CREATE TABLE attribute_definition
(
  attribute_definition_id     INTEGER NOT NULL,
  attribute_name              VARCHAR(255) NOT NULL,
  attribute_description       TEXT NULL,
  attribute_type_concept_id   INTEGER NOT NULL,
  attribute_syntax            TEXT NULL
);
