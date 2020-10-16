CREATE TABLE map_cond_skin_cancer_dx
(
  diagnosis_cd        VARCHAR(15) NOT NULL,
  diagnosis_type_cd   VARCHAR(15) NOT NULL
);

INSERT INTO map_cond_skin_cancer_dx (
    diagnosis_cd
  , diagnosis_type_cd
)
WITH main_codes AS (
  SELECT
      max_levels_of_separation
    , descendant.*
  FROM concept_ancestor AS ca
  JOIN concept AS ancestor ON (ca.ancestor_concept_id = ancestor.concept_id)
  JOIN concept AS descendant ON (ca.descendant_concept_id = descendant.concept_id)
  WHERE
    ancestor.concept_name = 'Malignant melanoma' OR ancestor.concept_name = 'Malignant neoplasm of skin'
)
SELECT DISTINCT
  replace(c2.concept_code,'.','') as diagnosis_cd
, CASE WHEN c2.vocabulary_id = 'ICD10CM' THEN 'ICD-10'END AS diagnosis_type_cd
FROM concept_relationship cr
JOIN main_codes mc ON (cr.concept_id_1 = mc.concept_id)
JOIN concept c2 ON (cr.concept_id_2 = c2.concept_id)
WHERE
  c2.vocabulary_id = 'ICD10CM'
  AND LEFT(c2.concept_code,1) IN ('C','D')
;

ANALYZE map_cond_skin_cancer_dx;
