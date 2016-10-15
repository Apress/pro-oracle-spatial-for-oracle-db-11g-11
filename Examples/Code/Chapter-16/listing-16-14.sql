-- Listing 16-14. Creating a Partitioned Table for Storing Temporal Weather-Pattern Data
CREATE TABLE weather_patterns
(
  gid NUMBER,
  geom SDO_GEOMETRY,
  creation_date VARCHAR2(32)
)
PARTITION BY RANGE(CREATION_DATE)
(
  PARTITION p1  VALUES LESS THAN ('2000-01-01') TABLESPACE tbs_3,
  PARTITION p2  VALUES LESS THAN ('2001-01-01') TABLESPACE tbs_3,
  PARTITION p3  VALUES LESS THAN ('2002-01-01') TABLESPACE tbs_3,
  PARTITION p4  VALUES LESS THAN ('2003-01-01') TABLESPACE tbs_3,
  PARTITION p5  VALUES LESS THAN ('2004-01-01') TABLESPACE tbs_3,
  PARTITION jan VALUES LESS THAN ('2004-02-01'), -- Month of January, 2004
  PARTITION feb VALUES LESS THAN ('2004-03-01'), -- Month of February, 2004
  PARTITION current_month VALUES LESS THAN (MAXVALUE)
);
INSERT INTO USER_SDO_GEOM_METADATA VALUES (
  'WEATHER_PATTERNS', 'GEOM',
  SDO_DIM_ARRAY(
    SDO_DIM_ELEMENT('LONG', -180, 180, 0.5),
    SDO_DIM_ELEMENT('LAT', -90, 90, 0.5)
  ),
  8307
);
