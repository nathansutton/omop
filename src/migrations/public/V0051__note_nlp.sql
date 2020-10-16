--HINT DISTRIBUTE ON RANDOM
CREATE TABLE note_nlp
(
  note_nlp_id                  BIGINT NOT NULL,
  note_id                      BIGINT NOT NULL,
  section_concept_id           INTEGER NOT NULL,
  snippet                      VARCHAR(250) NULL,
  "offset"                     VARCHAR(250) NULL,
  lexical_variant              VARCHAR(250) NOT NULL,
  note_nlp_concept_id          INTEGER NOT NULL,
  nlp_system                   VARCHAR(250) NULL,
  nlp_date                     DATE NOT NULL,
  nlp_datetime                 TIMESTAMP NULL,
  term_exists                  VARCHAR(1) NULL,
  term_temporal                VARCHAR(50) NULL,
  term_modifiers               VARCHAR(2000) NULL,
  note_nlp_source_concept_id   INTEGER NOT NULL
);

ALTER TABLE note_nlp ADD CONSTRAINT xpk_note_nlp PRIMARY KEY ( note_nlp_id ) ;
CREATE INDEX idx_note_nlp_note_id  ON note_nlp  (note_id ASC);
CLUSTER note_nlp  USING idx_note_nlp_note_id ;
CREATE INDEX idx_note_nlp_concept_id ON note_nlp (note_nlp_concept_id ASC);
