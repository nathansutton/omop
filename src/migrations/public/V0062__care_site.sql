--HINT DISTRIBUTE ON RANDOM
CREATE TABLE care_site
(
  care_site_id                    BIGINT NOT NULL,
  care_site_name                  VARCHAR(255) NULL,
  place_of_service_concept_id     INTEGER NOT NULL,
  location_id                     BIGINT NULL,
  care_site_source_value          VARCHAR(50) NULL,
  place_of_service_source_value   VARCHAR(50) NULL
);

ALTER TABLE care_site ADD CONSTRAINT xpk_care_site PRIMARY KEY ( care_site_id ) ;
