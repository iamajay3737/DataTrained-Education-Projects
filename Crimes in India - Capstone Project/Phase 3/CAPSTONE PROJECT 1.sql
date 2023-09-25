SELECT * FROM 42_district_wise_crimes_committed_against_women_2001_2012;
SELECT Year FROM 42_district_wise_crimes_committed_against_women_2001_2012;
SELECT Year FROM 42_district_wise_crimes_committed_against_women_2001_2012 WHERE Year > 2005;
SELECT STATE, DISTRICT, Year, MAX(Rape)as RAPE, MAX(KidnappingAbduction) as KIDNAPPING
FROM 42_district_wise_crimes_committed_against_women_2001_2012
GROUP BY STATE, DISTRICT, Year
ORDER BY MAX(RAPE) DESC;

SELECT STATE, DISTRICT, Year, MIN(Rape)as RAPE, MIN(KidnappingAbduction) as KIDNAPPING
FROM 42_district_wise_crimes_committed_against_women_2001_2012
GROUP BY STATE, DISTRICT, Year
ORDER BY MIN(RAPE) ;

SELECT * FROM 02_01_district_wise_crimes_committed_against_sc_2001_2012;

SELECT DISTRICT ,  MAX(Dacoity+Robbery) as ROB
FROM 02_01_district_wise_crimes_committed_against_sc_2001_2012
GROUP BY DISTRICT
ORDER BY ROB DESC;


SELECT DISTRICT , MIN(Murder) as MUD
FROM 02_01_district_wise_crimes_committed_against_sc_2001_2012
GROUP BY DISTRICT
ORDER BY MUD;


SELECT DISTRICT ,Year , MIN(Murder) AS MUD
FROM 02_01_district_wise_crimes_committed_against_sc_2001_2012
GROUP BY DISTRICT,Year
ORDER BY MUD ;

SELECT * FROM 01_district_wise_crimes;

SELECT STATE,YEAR,DISTRICT,MAX(MURDER) AS MUD
FROM 01_district_wise_crimes
GROUP by STATE,DISTRICT,YEAR
ORDER BY MUD DESC;

SELECT * FROM answer;

SELECT STATE,DISTRICT,MUD,YEAR
FROM answer
WHERE DISTRICT IN ( 
	SELECT DISTRICT 
	FROM answer 
	GROUP BY DISTRICT 
	HAVING COUNT(DISTINCT YEAR) >= 3
)
ORDER BY DISTRICT DESC , YEAR DESC;




SELECT STATE,DISTRICT,MUD,YEAR, COUNT(DISTRICT)
	FROM answer 
#		JOIN locations USING (country_id) 
#		JOIN departments USING (location_id) 
WHERE DISTRICT IN 
    (SELECT DISTRICT 
		FROM answer 
	 GROUP BY DISTRICT 
	 HAVING COUNT(DISTRICT)>=2)
GROUP BY STATE,YEAR;











