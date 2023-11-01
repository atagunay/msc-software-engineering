-- q1
select * from cs621week4oslo where instrcode ~ '^(a|e|u|i|o)';
delete from cs621week4oslo where instrcode ~ '^(a|e|u|i|o)';

-- q2
select * from cs621week4oslo where 
st_distance(
	st_transform(thegeom, 3857),
	st_transform(st_geomfromtext('POINT(10.734410 59.914390)', 4326),3857)
) < 1000
delete from cs621week4oslo where 
st_distance(
	st_transform(thegeom, 3857),
	st_transform(st_geomfromtext('POINT(10.734410 59.914390)', 4326),3857)
) < 1000

-- q3
select * from cs621week4oslo where pm10 * 0.75 > 25
update cs621week4oslo set pm10 = -999.0 where pm10 * 0.75 > 25

-- q4
select * from cs621week4oslo where pm10 < 4
delete from cs621week4oslo where pm10 < 4

-- q5
select * from cs621week4oslo where
st_distance(
	st_transform(thegeom, 3857),
	st_geomfromtext('POINT(1194149.4 8381397.9)', 3857)	
) > 5500
delete from cs621week4oslo where
st_distance(
	st_transform(thegeom, 3857),
	st_geomfromtext('POINT(1194149.4 8381397.9)', 3857)	
) > 5500

-- q6
select * from cs621week4oslo where date_part('minute', pm10ts) > pm10 and pm10 % 2 = 0
update cs621week4oslo set pm10 = pm10 + 1 where date_part('minute', pm10ts) > pm10 and pm10 % 2 = 0







