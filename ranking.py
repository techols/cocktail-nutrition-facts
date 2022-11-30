import requests
import re
from bs4 import BeautifulSoup
import pandas as pd

url = "https://www.insider.com/most-popular-cocktail-in-every-state"
res = requests.get(url)
soup = BeautifulSoup(res.content, 'lxml')
states = [element.text for element in soup.find_all('h2',{'class':'slide-title-text'})]
colnames = ['state', 'cocktail_name']

state_top = {}
for state in states:
    item = state.split(':')
    result = {item[0].strip():item[1].strip() for i in range(0, len(item))}
    state_top.update(result)

df = pd.DataFrame(state_top.items(), columns = colnames)

df.to_csv('state_ranking.csv', index=False)