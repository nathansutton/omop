--HINT DISTRIBUTE_ON_KEY(person_id)
CREATE TABLE note
(
  note_id                       BIGINT NOT NULL,
  person_id                     BIGINT NOT NULL,
  note_event_id                 BIGINT NULL,
  note_event_field_concept_id   INTEGER NOT NULL,
  note_date                     DATE NULL,
  note_datetime                 TIMESTAMP NOT NULL,
  note_type_concept_id          INTEGER NOT NULL,
  note_class_concept_id         INTEGER NOT NULL,
  note_title                    VARCHAR(250) NULL,
  note_text                     TEXT NULL,
  encoding_concept_id           INTEGER NOT NULL,
  language_concept_id           INTEGER NOT NULL,
  provider_id                   BIGINT NULL,
  visit_occurrence_id           BIGINT NULL,
  visit_detail_id               BIGINT NULL,
  note_source_value             VARCHAR(50) NULL
);

ALTER TABLE note ADD CONSTRAINT xpk_note PRIMARY KEY ( note_id ) ;
CREATE INDEX idx_note_person_id  ON note  (person_id ASC);
CLUSTER note  USING idx_note_person_id ;
CREATE INDEX idx_note_concept_id ON note (note_type_concept_id ASC);
CREATE INDEX idx_note_visit_id ON note (visit_occurrence_id ASC);
