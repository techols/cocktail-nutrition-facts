import pandas as pd
cocktails = pd.read_csv('/Users/mariusfall/Desktop/cocktails.csv')
nutrition = pd.read_csv('/Users/mariusfall/Desktop/nutrition_facts_cleaned.csv')
states = pd.read_csv('/Users/mariusfall/Desktop/state_ranking_cleaned.csv')
table_final = (pd.merge(cocktails, nutrition, left_on='name', right_on='cocktail_name')).drop(['cocktail_name'], axis=1)
table_final = table_final.replace('-','0')
table_final.head()