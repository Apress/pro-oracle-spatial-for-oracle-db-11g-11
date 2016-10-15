-- Listing 5-8. Control File for Loading Nonpoint SDO_GEOMETRY Data
LOAD DATA
INFILE *
CONTINUEIF NEXT(1:1)='#'
INTO TABLE sales_regions
APPEND
FIELDS TERMINATED BY '|'
TRAILING NULLCOLS
(
  id CHAR(6),
  geom COLUMN OBJECT
  (
    SDO_GTYPE INTEGER EXTERNAL,
    SDO_SRID INTEGER EXTERNAL,
    SDO_ELEM_INFO VARRAY terminated by '/' (E FLOAT EXTERNAL),
    SDO_ORDINATES VARRAY terminated by '/' (O FLOAT EXTERNAL)
  )
)
BEGINDATA
10000| 2003| 8307|
#1| 1003| 1|/
#-77.04487| 38.9043742| -77.046645| 38.9040983| -77.04815| 38.9033127|-77.049155|
#38.9021368| -77.049508| 38.9007499| -77.049155| 38.899363| -77.048149|
#38.8981873| -77.046645| 38.8974017| -77.04487| 38.8971258| -77.043095|
#38.8974017| -77.041591| 38.8981873| -77.040585| 38.899363| -77.040232|
#38.9007499| -77.040585| 38.9021368| -77.04159| 38.9033127| -77.043095|
#38.9040983| -77.04487| 38.9043742| -77.04487| 38.9043742|/
