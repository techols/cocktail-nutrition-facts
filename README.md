# cocktail-nutrition-facts

## Module 1 -  groupe : Taler + Marius

Problématique : Quel est le cocktail le plus adapté à votre régime alimentaire

NDLR : Ce projet est destiné aux épicuriens qui souhaitent garder la ligne ;) 

Le but du projet est de permettre une visualisation des données nutritionnelles sur une liste de cocktail définie.
D'autres informations telles que les ingrédients, la recette et l'état des USA dans lequelle le cocktail est le plus populaire sont disponibles.

## Source de données :

- Informations nutritionnelles sur les cocktails : https://www.fatsecret.com/calories-nutrition/food/cocktails/
- Informations de mixologie (data principale) : https://www.kaggle.com/jenlooper/mr-boston-cocktail-dataset
- Classement des cocktails par états : https://www.insider.com/most-popular-cocktail-in-every-state

### I) Challenges

Une fois la donnée récupérée via du scrapping ou de l'import CSV, le principal challenge était le nettoyage et notamment la normalisation.
Certains cocktails avaient :
- un suffix en plus (Margarita Cocktail ou lieu de Margarita) 
- un caractère en plus (Mai-Tai ou lieu de Mai-Tai)
- des noms différents (Cape Codder ou lieu de Cape Cod)
- une absence dans la data principale : (Tom Collins)

Il a donc fallu harmoniser ou chercher la variation la plus proche afin d'avoir une clé de jointure entre les 3 sources de données

### II) Code récupération de données (Python)

Le code des scrappers sont disponibles dans les fichiers suivants :
- nutrition.py
- ranking.py
    
    
### III) Code de transformation et jointure de données (SQL)

Le code des différentes opérations SQL est disponible dans le fichier suivant
- operations.sql


