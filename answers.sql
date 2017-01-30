1

-----

Select all fields for all brands in the brands table.

The result set for this query should be every record in the brands table.

-----


SELECT * FROM brands;


==========
2

-----

Select all fields for all car models made by Pontiac in the
models table.

The result set should be:
 model_id | year | brand_id |    name    
----------+------+----------+------------
       24 | 1961 | pon      | Tempest
       26 | 1962 | pon      | Grand Prix
       35 | 1963 | pon      | Grand Prix
       41 | 1964 | pon      | LeMans
       42 | 1964 | pon      | Bonneville
       43 | 1964 | pon      | Grand Prix
(6 rows)


-----


SELECT * FROM models WHERE brand_id = 'pon';


==========
3

-----

Select the brand id and model name for all models made in
1964 from the models table.

The result set should be:
 brand_id |    name     
----------+-------------
 che      | Corvette
 for      | Mustang
 for      | Galaxie
 pon      | LeMans
 pon      | Bonneville
 pon      | Grand Prix
 ply      | Fury
 stu      | Avanti
 aus      | Mini Cooper
(9 rows)
 

-----


SELECT brand_id, name FROM models WHERE year = 1964;


==========
4

-----

Select the model name, brand name, and headquarters for
the Ford Mustang from the models and brands tables.

The result set should be:
 model_name | brand_name | headquarters 
------------+------------+--------------
 Mustang    | Ford       | Dearborn, MI
 (1 rows)


-----


SELECT m.name, b.name, b.headquarters 
FROM brands AS b
LEFT JOIN models AS m
USING (brand_id)
WHERE m.name = 'Mustang'
AND b.name = 'Ford';


==========
5

-----

Select all rows for the three oldest brands from the brands
table.

The result set should be:
 brand_id |    name    | founded |    headquarters     | discontinued 
----------+------------+---------+---------------------+--------------
 stu      | Studebaker |    1852 | South Bend, Indiana |         1967
 ram      | Rambler    |    1901 | Kenosha, Washington |         1969
 cad      | Cadillac   |    1902 | New York City, NY   |             
(3 rows)


-----


SELECT * from brands ORDER BY founded LIMIT 3;


==========
6

-----

Count the Ford models in the database. The output should be a
number.

The result set should be:
 count 
-------
     6
(1 row)


-----


SELECT count(*)
FROM models AS m
LEFT JOIN brands AS b
USING (brand_id)
WHERE b.name = 'Ford';


==========
7

-----

Select the brand name of any and all car brands that are not
discontinued.

The result set should be:
   name    
-----------
 Ford
 Chrysler
 Citroen
 Chevrolet
 Cadillac
 BMW
 Buick
 Tesla
 Subaru
(9 rows)


-----


SELECT name FROM brands WHERE discontinued IS NULL;


==========
8

-----

Select everything from rows 15-24 of the models table in
alphabetical order by name. The result set should have 10 records.

The result set should be:
 model_id | year | brand_id |   name   
----------+------+----------+----------
        6 | 1954 | che      | Corvette
        8 | 1955 | che      | Corvette
       10 | 1956 | che      | Corvette
       11 | 1957 | che      | Corvette
       13 | 1958 | che      | Corvette
       20 | 1960 | che      | Corvette
       38 | 1964 | che      | Corvette
       37 | 1963 | che      | Corvette
       25 | 1961 | che      | Corvette
       27 | 1962 | che      | Corvette
(10 rows)


-----


SELECT * 
FROM models 
ORDER BY name
LIMIT 10 
OFFSET 14;


==========
9

-----

Select the model year, name, and id, and the award name for all of the models from 1964 and beyond. Include row(s)
for model(s) even if they have not won awards.

Note that in the result set, the award name should be NULL if
the model is not in the awards table.

So, the result set should be:
 year |    name     | model_id |       name        
------+-------------+----------+-------------------
 2015 | Malibu      |       47 | IIHS Safety Award
 2015 | Outback     |       48 | IIHS Safety Award
 1964 | Mustang     |       39 | 
 1964 | Mini Cooper |       46 | 
 1964 | Galaxie     |       40 | 
 1964 | Corvette    |       38 | 
 1964 | Bonneville  |       42 | 
 1964 | LeMans      |       41 | 
 1964 | Fury        |       44 | 
 1964 | Avanti      |       45 | 
 1964 | Grand Prix  |       43 | 
(11 rows)


-----


SELECT m.year, m.name, m.model_id, a.name 
FROM awards as a
FULL OUTER JOIN models as m
ON m.model_id = CAST(a.brand_id AS INT)
WHERE m.year > 1963
ORDER BY m.year DESC;