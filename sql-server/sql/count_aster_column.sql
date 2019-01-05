USE RecipesSample
GO

SELECT *
FROM Recipe_Classes
    LEFT JOIN Recipes
    ON Recipe_Classes.RecipeClassID = Recipes.RecipeClassID

/*
1	Main course	1
1	Main course	5
1	Main course	6
1	Main course	9
1	Main course	11
1	Main course	13
1	Main course	14
2	Vegetable	4
2	Vegetable	12
3	Starch	10
4	Salad	7
5	Hors d'oeuvres	2
5	Hors d'oeuvres	3
6	Dessert	8
6	Dessert	15
7	Soup	NULL
*/

/*
COUNT(*)とすると列の数をカウントするので、
最も下の列はNULLだがカウントに含まれる
*/
SELECT Recipe_Classes.RecipeClassDescription,
    COUNT(*) AS RecipeCount
FROM Recipe_Classes
    LEFT JOIN Recipes
    ON Recipe_Classes.RecipeClassID = Recipes.RecipeClassID
GROUP BY Recipe_Classes.RecipeClassDescription

/*
COUNT(Recipes.RecipeID)とすると値がNULLのものはカウントしないので
RecipeClassID=7のSoupはカウントされない
*/
SELECT Recipe_Classes.RecipeClassDescription,
    COUNT(Recipes.RecipeID) AS RecipeCount
FROM Recipe_Classes
    LEFT JOIN Recipes
    ON Recipe_Classes.RecipeClassID = Recipes.RecipeClassID
GROUP BY Recipe_Classes.RecipeClassDescription
