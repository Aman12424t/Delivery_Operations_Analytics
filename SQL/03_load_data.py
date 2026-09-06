import pandas as pd
from sqlalchemy import create_engine


file_path = r"C:\Users\Nadeem\Desktop\Projects\Delivery_Operations_Analytics\Data\Processed\delivery_operations_clean.csv"

df = pd.read_csv(file_path)

print("CSV loaded")
print("Rows:", len(df))
print("Columns:", len(df.columns))

connection_string = (
    "mssql+pyodbc://localhost/DeliveryOperations"
    "?driver=ODBC+Driver+18+for+SQL+Server"
    "&trusted_connection=yes"
    "&TrustServerCertificate=yes"
)

engine = create_engine(connection_string)


df.to_sql(
    "delivery_operations",
    con=engine,
    if_exists="append",
    index=False
)

print("Data loaded into SQL Server successfully!")