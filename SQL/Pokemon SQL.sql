USE pokemon;

#1. An overview of all the columns, typo correction
SELECT 
    *
FROM
    pokemon_data;

ALTER TABLE pokemon_data
CHANGE COLUMN classfication classification VARCHAR(50);

#2. On the basis of base_total stats alone, what are the 5 most powerful legendary pokemon?
SELECT 
    name, classification, base_total
FROM
    pokemon_data
WHERE
    is_legendary = 1
ORDER BY base_total DESC
LIMIT 5;

#3. On the basis of attack power alone, what are the 5 strongest legendary pokemon? Are they the same as the most powerful?
SELECT 
    name, classification, attack
FROM
    pokemon_data
WHERE
    is_legendary = 1
ORDER BY attack DESC
LIMIT 5;

#4. On the basis of base_total stats alone, what are the 5 most powerful non-legendary pokemon?
SELECT 
    name, classification, base_total
FROM
    pokemon_data
WHERE
    is_legendary = 0
ORDER BY base_total DESC
LIMIT 5;

#5. On the basis of attack power alone, what are the 5 strongest non-legendary pokemon?
SELECT 
    name, classification, attack
FROM
    pokemon_data
WHERE
    is_legendary = 0
ORDER BY attack DESC
LIMIT 5;

#6. Creating a view of the 10 heaviest pokemon of all time
CREATE VIEW BigPokemon AS
    SELECT 
        name, classification, weight_kg, height_m
    FROM
        pokemon_data
    ORDER BY weight_kg DESC
    LIMIT 10;

SELECT 
    *
FROM
    BigPokemon;


#7. Among the 10 heaviest pokemon of all time, which of them is the tallest?
SELECT 
    name, classification, weight_kg, height_m
FROM
    BigPokemon
ORDER BY height_m DESC
LIMIT 1;

#8. I like cute pokemon. Create a procedure that returns only cute pokemon, based on its classification alone <3. I want to know which generation they come from as well.
DELIMITER //

CREATE PROCEDURE CutePokemon()
BEGIN
SELECT name, classification, generation, type1, type2
FROM pokemon_data
WHERE classification LIKE '%cute%';

END //
DELIMITER ;

CALL CutePokemon();

#9. It seems like there are no cute pokemon. Well surely there must be Bird pokemon! They're cute too :3

DELIMITER //

CREATE Procedure BirdPokemon()
BEGIN
SELECT name, classification, generation, type1, type2
FROM pokemon_data
WHERE CONCAT(' ',classification,' ') LIKE '% Bird %'; #or else the procedure also returns stuff like Scatter Pokemon
 
 END //
 
DELIMITER ;
 
CALL BirdPokemon();
 
#10. Create a stored procedure that returns a list of the top ten most powerful all-female pokemon (on the basis of , along with their actual base_total stats,pokemon types and legendary status :)
DELIMITER //

CREATE PROCEDURE PowerfulMatriarchy()
BEGIN
SELECT name, 
CASE
WHEN percentage_male = 0 THEN 'Yes'
ELSE 'No'
END AS all_female,
classification, type1, type2, base_total,
CASE is_legendary
WHEN 1 THEN 'Yes'
ELSE 'No'
END AS legendary_status
FROM pokemon_data
WHERE percentage_male = 0
ORDER BY base_total DESC
LIMIT 10;
END //

DELIMITER ;

CALL PowerfulMatriarchy();

#11. Here's a complicated query! Create a view that returns 5 of top pokemon of each main type (type1) according to their base_total, attack, and defense stats, along with their legendary_status.

CREATE VIEW DreamTeam AS #couldn't make a stored procedure
SELECT *
FROM (
    SELECT name, 'Attack' AS stat_name, attack AS stat_value
    FROM pokemon_data
    ORDER BY attack DESC
    LIMIT 5
) AS stat_attack

UNION ALL #to join with the results of the subquery that comes after

SELECT *
FROM (
    SELECT name, 'Defense' AS stat_name, defense AS stat_value
    FROM pokemon_data
    ORDER BY defense DESC
    LIMIT 5
) AS stat_defense

UNION ALL

SELECT *
FROM (
    SELECT name, 'Special Attack' AS stat_name, sp_attack AS stat_value
    FROM pokemon_data
    ORDER BY sp_attack DESC
    LIMIT 5
) AS stat_sp_attack

UNION ALL

SELECT *
FROM (
    SELECT name, 'Special Defense' AS stat_name, sp_defense AS stat_value
    FROM pokemon_data
    ORDER BY sp_defense DESC
    LIMIT 5
) AS stat_sp_defense

UNION ALL

SELECT *
FROM (
    SELECT name, 'Speed' AS stat_name, speed AS stat_value
    FROM pokemon_data
    ORDER BY speed DESC
    LIMIT 5
) AS stat_speed

UNION ALL

SELECT 
    *
FROM
    (SELECT 
        name, 'HP' AS stat_name, hp AS stat_value
    FROM
        pokemon_data
    ORDER BY hp DESC
    LIMIT 5) AS stat_hp 
UNION ALL SELECT 
    *
FROM
    (SELECT 
        name, 'base_total' AS stat_name, base_total AS stat_value
    FROM
        pokemon_data
    ORDER BY base_total DESC
    LIMIT 5) AS stat_base_total;

SELECT * FROM DreamTeam;
