import requests
import re
from bs4 import BeautifulSoup
import pandas as pd
from lxml import etree
from functools import reduce

base_url = 'https://www.fatsecret.com/calories-nutrition/food/cocktails/'
suffixes = ['','carbohydrate','fat','protein','sodium','cholesterol','vitamins']
urls = [base_url+suffix for suffix in suffixes]
df_list = [pd.read_html(url)[3] for url in urls]

def format_cols(df):
    colnames = ['cocktail_name']
    for i in range(1,len(df.columns)):
        col = set(df.columns[i])
        col = re.sub('[\'{}]',"", str(col))
        colnames.append(col)
    df.columns = colnames

for df in df_list:
    format_cols(df)
nutrition_facts = reduce(lambda left,right: pd.merge(left,right,on='cocktail_name'), df_list)
nutrition_facts.head()

df.to_csv('nutrition_facts.csv', index=False)