/* OBJECTIVES
Come up with a flu shots dashboard for 2022 that reports these following requests:

1) Total % of patient getting flu shot, stratified by
	a) Age
	b) Race
	c) County (map)
	d) overall
2) Trended total flu shots over the course of 2022
3) Total number of flu shots given in 2022
4) a list of patients that show weather or not they received flu shots

REQUIREMENTS:
1) Patient must have been "Currently Active at our hospital system" (started within 3 years)
2) Following the guidline: "Everyone, who are 6 months and older, 
							should be receiving flu shots"
*/


WITH active_patients AS 
(	--CTE from public.encounter: selecting "currently active", Not death, and older than 6 months
	SELECT patient
 	FROM encounters AS e
 	JOIN patients AS pat
 		ON e.patient = pat.id
 	WHERE 	e.start BETWEEN '2020-01-01 00:00' AND '2022-12-31 00:00'
 			AND pat.deathdate IS NULL
			AND EXTRACT(MONTH FROM AGE('2022-12-31', pat.birthdate)) >= 6
	GROUP BY patient
),
flu_shot_2022 AS
(
	SELECT 	patient,
			MIN(date) AS first_flu_shot_2022
	FROM public.immunizations
	WHERE 	code = '5302'
			AND date >= '2022-01-01 00:00'
			AND date <= '2022-12-31 23:59'
	GROUP BY patient
)
--CTE from public.immunization: selecting patients who receive shots in 2022
SELECT 	pat.id
		,pat.first
		,pat.last
		,pat.birthdate
		,EXTRACT(YEAR FROM AGE('2022-12-31', pat.birthdate)) as Age
		,pat.race
		,pat.gender -- error in synthetic dataset, all F, no M
		,pat.ethnicity
		,pat.county
		,pat.zip
		,pat.lat
		,pat.lon
		,flu_2022.first_flu_shot_2022 as date_of_immunization
FROM public.patients AS pat
LEFT JOIN flu_shot_2022 AS flu_2022
ON pat.id = flu_2022.patient
WHERE pat.id in (SELECT patient from active_patients)

