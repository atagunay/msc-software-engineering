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
