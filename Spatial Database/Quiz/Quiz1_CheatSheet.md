# LIKE

* Write a query which returns all rows or records in the
CS621MaynoothBirds table where the obscode begins with the character
7 or ends with the character 7.

```sql
SELECT bird, obscode from CS621MaynoothBirds where (obscode LIKE '7%') OR (obscode LIKE '%7');
```

# Regular Expression

### {m} 
* Examples: p{3} means that the string must
contain ‘ppp’ together

### {m,} 

* Examples: 9{3,} means that the string must
contain at least three digit 9 characters together.
‘99999’ or ‘dkfj999999sdlf’

### {m,n}

* Examples: G{2,4} means that the string must
contain between 2 and 4 (inclusive) upper case G. The
string ‘sdjfGGG’ or ‘GGGG’ or ‘OGGI’ all match.

### Case Insensitive

* column_name ~* 'regext'

### Case Sensitive

* column_name ~ 'regext'

### Mixing Upper and Lower case

* [m-zA-H] is a mixture – you are looking for any
lower case character between m and z (inclusive) but
upper case characters between A and H (inclusive)

### Digit

* \d

### Space

* \s

### Alpha Numeric

* \w

### Consecutive Letters

* (ab){2,3}

### OR

* (m|n)

# Date

* ‘date_part(text, timestamp)’
* Hour uses 24 hours. So 9pm is equal to 21

Text can be:

* century
* decade
* year
* month
* day
* hour
* minute
* second
* microseconds
* milliseconds
* dow
* doy
* epoch
* isodow
* isoyear
* timezone
* timezone_hour
* timezone_minute 

# Spatial

### <->
* returns distance between two geom

* ALWAYS looks for the CLOSEST parts of each
object in order to measure distance

### &&
* returns true if geams are instersect
* The && operator checks whether the bounding boxes of two geometries overlap. If the bounding boxes overlap, it does not necessarily mean that the geometries themselves intersect.

### st_intersects
* The ST_Intersects function checks whether two geometries have any spatial intersection. It's a more rigorous condition compared to &&.

### st_contains
* returns TRUE if geometry A contains geometry B. A contains B if and only if all points of B lie inside A

### st_npoints(st_transform(wrgeom, 32630))
* return numbers of points

### st_length(st_transform(wrgeom, 32630))
* return length

### self join
* from wfroads as a, wfroads as b  where (a.wkid != b.wkid and a.wkid < b wkid)
* note!!!: add where conditions for a and b

### st_centroid(geom)
* return center point of the geom

### st_envelope(geom)
* return bounding boxes of the geom

### st_srid(geom)
* Returns the spatial reference identifier for the ST_Geometry as defined in spatial_ref_sys table

