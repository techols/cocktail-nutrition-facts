-- Final Table for nutrition facts called nutrition_facts_cleaned

CREATE TABLE
  nutrition_facts_cleaned AS (
  SELECT
    CASE
      WHEN cocktail_name = 'Manhattan' THEN 'Manhattan Cocktail (dry)'
      WHEN cocktail_name = 'Grasshopper' THEN 'Grasshopper Cocktail'
      WHEN cocktail_name = 'Rob Roy' THEN 'Rob Roy Cocktail'
      WHEN cocktail_name = 'High Ball' THEN 'Irish Whiskey Highball'
      WHEN cocktail_name = 'Mint Julep' THEN 'Georgia Mint Julep'
      WHEN cocktail_name = 'Martini' THEN 'Martini (Dry) (5-to-1)'
      WHEN cocktail_name = 'Tom Collins' THEN 'Apricot Anisette Collins'
      WHEN cocktail_name = 'Gin Rickey' THEN 'Orange Gin Rickey'
      WHEN cocktail_name = 'Gin Fizz' THEN 'Orange Gin Fizz'
      WHEN cocktail_name = 'Sloe Gin Fizz' THEN 'Ruby Fizz'
      WHEN cocktail_name = 'Stinger' THEN 'Stinger Cocktail'
      WHEN cocktail_name = 'Mai Tai' THEN 'Mai-Tai (Trader Vic Version)'
      WHEN cocktail_name = 'Cape Cod' THEN 'Cape Codder'
      WHEN cocktail_name = 'Seabreeze' THEN 'Sea Breeze'
      WHEN cocktail_name = 'Bacardi' THEN 'Bacardi Cocktail'
      WHEN cocktail_name = 'Gimlet' THEN 'Gimlet '
      WHEN cocktail_name = 'Mimosa' THEN 'Bucks Fizz (Mimosa)'
    ELSE
    cocktail_name
  END
    AS cocktail_name,
    `Fat(g)` ,
  `Carbs(g)`,
  `Prot(g)_x`,
  `Calories`,
  `Net Carbs(g)`,
  `Sugar(g)`,
  `Fiber(g)`,
  `Total Carbs(g)`,
  `Trans(g)`,
  `Mono(g)`,
  `Poly(g)`,
  `Sat(g)`,
  `Total Fat(g)`,
  `Prot(g)_y`,
  `Sodium(mg)`,
  `Cholesterol(mg)`,
  `Iron`,
  `Calcium`,
  `Vitamin A`,
  `Vitamin C`,
  `Vitamin D`
    FROM
    `nutrition_facts`
  WHERE
    cocktail_name NOT IN ('Bourbon and Soda',
      'Scotch and Soda',
      'Gin',
      'Gin and Soda',
      'Bourbon and Soda',
      'Rum',
      'Rum and Cola',
      'Brandy',
      'Vodka',
      'Whiskey',
      '1 glass Champagne',
      '1 punch cup Alcoholic Fruit Punch',
      '1 Frozen Daiquiri',
      '1 cup Alcoholic Eggnog'))



-- Final Table for popularity data called state_ranking_cleaned

CREATE TABLE
  state_ranking_cleaned AS (
  SELECT
    CASE
      WHEN cocktail_name = 'Manhattan' THEN 'Manhattan Cocktail (dry)'
      WHEN cocktail_name = 'Grasshopper' THEN 'Grasshopper Cocktail'
      WHEN cocktail_name = 'Rob Roy' THEN 'Rob Roy Cocktail'
      WHEN cocktail_name = 'High Ball' THEN 'Irish Whiskey Highball'
      WHEN cocktail_name = 'Mint Julep' THEN 'Georgia Mint Julep'
      WHEN cocktail_name = 'Martini' THEN 'Martini (Dry) (5-to-1)'
      WHEN cocktail_name = 'Tom Collins' THEN 'Apricot Anisette Collins'
      WHEN cocktail_name = 'Gin Rickey' THEN 'Orange Gin Rickey'
      WHEN cocktail_name = 'Gin Fizz' THEN 'Orange Gin Fizz'
      WHEN cocktail_name = 'Sloe Gin Fizz' THEN 'Ruby Fizz'
      WHEN cocktail_name = 'Stinger' THEN 'Stinger Cocktail'
      WHEN cocktail_name = 'Mai Tai' THEN 'Mai-Tai (Trader Vic Version)'
      WHEN cocktail_name = 'Cape Cod' THEN 'Cape Codder'
      WHEN cocktail_name = 'Seabreeze' THEN 'Sea Breeze'
      WHEN cocktail_name = 'Bacardi' THEN 'Bacardi Cocktail'
      WHEN cocktail_name = 'Gimlet' THEN 'Gimlet '
      WHEN cocktail_name = 'Mimosa' THEN 'Bucks Fizz (Mimosa)'
    ELSE
    cocktail_name
  END
    AS cocktail_name,
    state
  FROM
    `state_ranking`



-- Final Table for cocktail data and nutrition facts data called final_table

CREATE TABLE
  final_table AS (
  SELECT
    * EXCEPT(cocktail_name)
  FROM (
    SELECT
      *
    FROM
      cocktails AS t1
    INNER JOIN
      nutrition_facts_cleaned AS t2
    ON
      t1.name = t2.cocktail_name)
