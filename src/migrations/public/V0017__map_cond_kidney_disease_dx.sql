CREATE TABLE map_cond_kidney_disease_dx
(
  diagnosis_cd        VARCHAR(15) NOT NULL,
  diagnosis_type_cd   VARCHAR(15) NOT NULL
);


INSERT INTO map_cond_kidney_disease_dx
(
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
    c2.concept_name = 'Chronic kidney disease'
    AND c.vocabulary_id in ('ICD10CM','ICD9CM')
)
SELECT
    replace(concept_code,'.','') as diagnosis_cd
  , case -- backwards compatible
      when vocabulary_id = 'ICD9CM' then 'ICD-9'
      when vocabulary_id = 'ICD10CM' then 'ICD-10'
    end as diagnosis_type_cd
FROM concept_relationship cr
INNER JOIN concept c2
  ON cr.concept_id_2 = c2.concept_id
INNER JOIN main_codes mc
  ON cr.concept_id_1 = mc.concept_id
WHERE
  c2.vocabulary_id in ('ICD10CM','ICD9CM')
  AND cr.relationship_id = 'Subsumes'
;

ANALYZE map_cond_kidney_disease_dx;
