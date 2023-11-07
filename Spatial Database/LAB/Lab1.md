![1](/images/Spatial%20Database/lab1_1.png)
![1](/images/Spatial%20Database/lab1_2.png)

```sql
select * from labexam12022table;

-- q1
-- rows: 131
select * from labexam12022table where vehicle = 'car' and mph >= 100 and mph <= 140 and date_part('month', trapts) = 12

-- q2
-- rows: 80
select * from labexam12022table where date_part('day', trapts) = 7 or date_part('day', trapts) = 14;

-- q3
-- rows: 15
select * from labexam12022table where vehicle = 'bus' and
st_distance(
	st_transform(thegeom, 6875),
	st_transform(st_geomfromtext('POINT(9.303231 45.355149)', 4326), 6875)
) <= 10000

-- q4
-- reg: LJ7023AZ
select st_distance(
	st_transform(thegeom, 6875),
	st_transform(st_geomfromtext('POINT(9.262569 45.382383)', 4326), 6875)
) as distance, reg from labexam12022table where vehicle = 'van' and mph < 90 order by distance asc;

-- q5
-- rows: 3
select * from labexam12022table where mph > 100 and
st_distance(
	st_transform(thegeom, 6875),
	st_transform(st_geomfromtext('POINT (1016235.07 5696786.90)', 3857), 6875)
) <= 2000

-- q6
-- rows: 1
select * from labexam12022table where reg ~ '^(A|E|I|O|U){2}.*(A|E|I|O|U){2}$'

-- q7
-- rows: 25
select * from labexam12022table where reg ~ '^(A|B|C|D|M|N|O|P).*(A|B|C|D|M|N|O|P)$' 
and (vehicle = 'truck' or vehicle = 'motorcyle')

-- q8
-- rows: 33
select * from labexam12022table where reg ~ '(1|2|3){3,4}' 

-- q9
-- rows: 45
select * from labexam12022table where 
date_part('hour', trapts) >= 00 and date_part('minute', trapts) >= 00 and date_part('second', trapts) >= 00 
and date_part('hour', trapts) <= 1 and date_part('minute', trapts) < 30;

-- q10
-- rows: 124
select * from labexam12022table where vehicle != 'car' and
(date_part('hour', trapts) + date_part('minute', trapts) + date_part('second', trapts)) >= mph

-- q11
-- rows: 226
select * from labexam12022table where reg ~ '9[6-9][0-9]{2}'

-- q12
-- rows: 22
select * from labexam12022table where reg ~ '4[0-5][0-9]{2}' or  reg ~ '[0-3][0-9]{3}'

```