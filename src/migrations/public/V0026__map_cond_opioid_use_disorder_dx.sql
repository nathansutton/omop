CREATE TABLE map_cond_opioid_use_disorder_dx
(
  diagnosis_cd        VARCHAR(15) NOT NULL,
  diagnosis_type_cd   VARCHAR(15) NOT NULL
);

INSERT INTO map_cond_opioid_use_disorder_dx (
    diagnosis_cd
  , diagnosis_type_cd
)
WITH main_codes AS (
  SELECT
      c.concept_id
    , c2.concept_name
  FROM concept_relationship cr
  INNER JOIN concept c
    ON cr.concept_id_1 = c.concept_id
  INNER JOIN concept c2
    ON cr.concept_id_2 = c2.concept_id
  WHERE
    c2.concept_name = 'Opioid related disorders'
    AND c.vocabulary_id in ('ICD10CM')
)
SELECT DISTINCT
    replace(c2.concept_code,'.','') as diagnosis_cd
  , CASE WHEN c2.vocabulary_id = 'ICD10CM' THEN 'ICD-10'END AS diagnosis_type_cd
FROM concept_relationship cr
JOIN concept c2 ON (cr.concept_id_2 = c2.concept_id)
JOIN main_codes mc ON (cr.concept_id_1 = mc.concept_id)
WHERE
  c2.vocabulary_id in ('ICD10CM')
;

ANALYZE map_cond_opioid_use_disorder_dx;
