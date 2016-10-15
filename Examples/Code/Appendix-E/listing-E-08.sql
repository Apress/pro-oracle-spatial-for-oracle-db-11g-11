-- Listing E-8. Querying a Point Cloud Object
CREATE TABLE qryres AS SELECT * FROM MDSYS.SDO_PC_BLK_TABLE;
-- Query
DECLARE
inp sdo_pc;
BEGIN
SELECT pc INTO inp FROM pc_tab WHERE rownum=1;
INSERT INTO qryres
SELECT * FROM
TABLE(SDO_PC_PKG.CLIP_PC
(
inp, -- Input point cloud object
SDO_GEOMETRY(2003, 8307, NULL,
SDO_ELEM_INFO_ARRAY(1, 1003, 3),
SDO_ORDINATE_ARRAY(-74.1, -73.9, 39.99999,40.00001)
), -- QUERY
NULL, NULL, NULL, NULL));
END;
/
