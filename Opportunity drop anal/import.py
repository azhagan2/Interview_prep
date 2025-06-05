import pandas as pd 
import duckdb

df = pd.read_excel(r"C:\Users\Azhagan\Desktop\DC\Opportunities funnel analysis.xlsx", sheet_name="# Raw data")

print(df.head(5))

