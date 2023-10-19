-- FIRST OF ALL CREATE TABLE IN YOUR DATABASE

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS MaynoothLandmarks; 

-- This table records landmarks around Maynooth. 
-- The name column is the local name of the landmark or building. 
-- The landmarkT column is a classification of the function of the landmark or its landuse. 
CREATE TABLE MaynoothLandmarks ( 
	 pkid SERIAL PRIMARY KEY NOT NULL, 
	 thegeom GEOMETRY DEFAULT ST_GeomFromText('POINT(0,51)', 4326), 
	 name TEXT not null,
	 landmarkT TEXT not null
); 

-- Spatial index is now created
 CREATE INDEX MaynoothLandmarks_spatial_index ON MaynoothLandmarks USING gist (thegeom); 
 
-- Begin to insert rows into the table. 
-- ST_MakePoint is used - this PostGIS function accepts a coordinate - in our case we supply
-- coordinates in EPSG:4326 (Latitude Longitude) 
-- Points are specified in ST_MakePoint as Longitude (x) value first then the latitude (y) value. 
INSERT into MaynoothLandmarks (thegeom, name,landmarkT) VALUES (ST_SetSRID(ST_MakePoint(-6.556073,53.377868),4326),'Pike Bridge','Bridge'); 
INSERT into MaynoothLandmarks (thegeom, name,landmarkT) VALUES (ST_SetSRID(ST_MakePoint(-6.590634,53.378053),4326),'Train Station entrance','Public Transport'); 
INSERT into MaynoothLandmarks (thegeom, name,landmarkT) VALUES (ST_SetSRID(ST_MakePoint(-6.598087,53.378927),4326),'Russell Library','Library'); 
INSERT into MaynoothLandmarks (thegeom, name,landmarkT) VALUES (ST_SetSRID(ST_MakePoint(-6.603706,53.384318),4326),'The Phoenix Restaurant','Restaurant'); 
INSERT into MaynoothLandmarks (thegeom, name,landmarkT) VALUES (ST_SetSRID(ST_MakePoint(-6.602314,53.382938),4326),'Callan Building (south end)','CS621 Labs'); 
INSERT into MaynoothLandmarks (thegeom, name,landmarkT) VALUES (ST_SetSRID(ST_MakePoint(-6.597918,53.385772),4326),'Hargadon Hall','Accomodation'); 
INSERT into MaynoothLandmarks (thegeom, name,landmarkT) VALUES (ST_SetSRID(ST_MakePoint(-6.593937,53.382180),4326),'Dunnes Stores Maynooth','Shopping');
INSERT into MaynoothLandmarks (thegeom, name,landmarkT) VALUES (ST_SetSRID(ST_MakePoint(-6.581588,53.380817),4326),'Tesco Extra Maynooth','Shopping');
INSERT into MaynoothLandmarks (thegeom, name,landmarkT) VALUES (ST_SetSRID(ST_MakePoint(-6.566895,53.390644),4326),'Carton House Hotel','Hotel and Leisure');
INSERT into MaynoothLandmarks (thegeom, name,landmarkT) VALUES (ST_SetSRID(ST_MakePoint(-6.621197,53.381072),4326),'Jacksons Bridge (14th Lock)','Bridge');
INSERT into MaynoothLandmarks (thegeom, name,landmarkT) VALUES (ST_SetSRID(ST_MakePoint(-6.596491,53.381883),4326),'Aldi Maynooth','Shopping');
INSERT into MaynoothLandmarks (thegeom, name,landmarkT) VALUES (ST_SetSRID(ST_MakePoint(-6.638650,53.387428),4326),'Baileys Bridge (Private)','Bridge');
INSERT into MaynoothLandmarks (thegeom, name,landmarkT) VALUES (ST_SetSRID(ST_MakePoint(-6.589179,53.369646),4326),'Lidl Maynooth','Shopping');

-- use a simple query to display our table contents. Let's just look at 5 rows
SELECT name, landmarkT, ST_AsText(thegeom) as TheGeometry, ST_Srid(thegeom) as CRS from MaynoothLandmarks ORDER BY name LIMIT 5;


-- use a simple query to display our table contents. Let's just look at 5 rows
SELECT name, landmarkT, ST_AsText(thegeom) as TheGeometry, ST_Srid(thegeom) as CRS from MaynoothLandmarks ORDER BY name LIMIT 5;

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- QUERY 1 - distance from a specified point to all landmarks 
-- find out which landmark is closest to the specified point. 
select name, landmarkT, 
ST_Distance(ST_Transform(st_geomfromtext('POINT(-6.593163 53.381061)',4326),32629),
st_transform(thegeom,32629)) as DistCalc 
from  MaynoothLandmarks order by DistCalc asc;
								
-- QUERY 2 - given a specified point - 
-- find landmarks WITHIN a specified 
-- distance to that point. 
select name, landmarkT
from  MaynoothLandmarks 
where 
ST_Distance(ST_Transform(st_geomfromtext('POINT(-6.605701 53.377865)',4326),32629),
st_transform(thegeom,32629)) < 1000;


-- QUERY 3
-- modifying query 2 to display calculated 
-- distances in the results. 
select name, landmarkT,
ST_Distance(ST_Transform(st_geomfromtext('POINT(-6.605701 53.377865)',4326),32629),
st_transform(thegeom,32629)) as DistCalc
from  MaynoothLandmarks 
where 
ST_Distance(ST_Transform(st_geomfromtext('POINT(-6.605701 53.377865)',4326),32629),
st_transform(thegeom,32629)) < 1000
order by DistCalc asc;


-- QUERY 4
-- Here you have been given a point, already expressed in 
-- EPSG:32629. It has been provided in WKT. 
-- The point is POINT (664880.2775 5916733.991)
select name, landmarkT,
ST_Distance(st_geomfromtext('POINT (664880.2775 5916733.991)',32629),
st_transform(thegeom,32629)) as DistCalc
from  MaynoothLandmarks 
order by DistCalc asc limit 1;


--QUERY 5
-- Here we have a standard distance query 
-- but we add in some extra conditions in the where statement. 
select name, landmarkT,
ST_Distance(ST_Transform(st_geomfromtext('POINT(-6.599758 53.382343)',4326),32629),
st_transform(thegeom,32629)) as DistCalc
from  MaynoothLandmarks 
where 
ST_Distance(ST_Transform(st_geomfromtext('POINT(-6.599758 53.382343)',4326),32629),
st_transform(thegeom,32629)) < 5000
and ((name ~ '^.*\d{1,}.*$') or (landmarkt  ~ '^.*\d{1,}.*$'))
order by DistCalc asc;