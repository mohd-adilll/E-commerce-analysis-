import pandas as pd

df = pd.read_csv("pandaorder.csv")

# Q1.a check Duplicates
df[df.duplicated('Order_ID', keep=False)]

# Q1.b Drop Duplicates
df = df.drop_duplicates()

# Fills Null value in Price
price_map = {'Shoes': 2000, 'Watch': 1200}
df['Price'] = df['Price'].fillna(df['Product'].map(price_map))

# Fills Null value in customer_spend
df['customer_spend'] = df['Price'] * df['Qty']

# Calculate profits
df['Profit'] = (df['Price'] - df['Cost']) * df['Qty'] - df['Ad_Spend']
df.groupby('State')['Profit'].sum().sort_values()

# RTO loss 
df.loc[df['Status'] == 'RTO', 'Profit'] = -50 - df['Ad_Spend']

print(df)

# df.to_csv("output.csv",index=False)

