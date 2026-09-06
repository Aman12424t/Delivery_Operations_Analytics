# SwiftShip Delivery Operations Analytics
An end-to-end data analytics project focused on analyzing delivery operations, delivery delays, returns, shipping performance, customer behavior, and operational factors using Python and Microsoft SQL Server.

The project follows a complete analytics workflow from data understanding and cleaning to exploratory data analysis, visualization, and SQL-based business analysis.

# Project Overview
SwiftShip is a simulated delivery operations dataset containing information related to orders, customers, warehouses, products, shipping, delivery performance, returns, weather conditions, and customer ratings.

The objective of this project is to transform operational data into meaningful insights that can help understand delivery performance and identify areas for improvement.

The project uses Python for data understanding, data cleaning, exploratory data analysis, and visualization. The cleaned data is then loaded into Microsoft SQL Server for structured SQL analysis.

# Business Objectives
The main objectives of this project are:

+ Analyze delivery performance across delivery partners.
+ Understand the relationship between weather conditions and delivery delays.
+ Identify customer cities with higher order volumes.
+ Compare return rates across product categories.
+ Analyze delivery delays across different shipping modes.
+ Compare average delivery time across shipping modes.
+ Analyze return rates across customer segments.
+ Explore relationships between operational variables and delivery delays.
+ Practice real-world SQL analysis using Microsoft SQL Server.
# Dataset
The dataset contains delivery operation records with information related to:
+ Orders
+ Customers
+ Customer segments
+ Customer cities
+ Warehouses
+ Product categories
+ Quantity
+ Order value
+ Delivery partners
+ Vehicle types
+ Shipping modes
+ Distance
+ Package weight
+ Promised delivery dates
+ Dispatch dates
+ Delivery dates
+ Delivery status
+ Delay days
+ Weather conditions
+ Returns
+ Return reasons
+ Customer ratings
  
The raw dataset is stored in the Data/Raw directory.

The cleaned dataset is stored in the Data/Processed directory.

# Tools and Technologies
# Programming
+ Python
+ Pandas
+ NumPy

# Data Visualization
+ Matplotlib
+ Seaborn

# Database
+ Microsoft SQL Server
+ SQL

# Development Tools
+ Visual Studio Code
+ upyter Notebook
+ GitHub

## 🔄 Project Workflow

The project follows the workflow below:

```text
Raw Dataset
     |
     v
Data Understanding
     |
     v
Data Cleaning
     |
     v
Cleaned Dataset
     |
     v
Exploratory Data Analysis
     |
     v
Data Visualization
     |
     v
SQL Server
     |
     v
SQL Analysis
     |
     v
Business Insights
```

## 📁 Project Structure

```text
Delivery_Operations_Analytics/
│
├── Data/
│   ├── Raw/
│   └── Processed/
│
├── Notebooks/
│   ├── 01_data_understanding.ipynb
│   ├── 02_data_cleaning.ipynb
│   └── 03_eda_visualization.ipynb
│
├── Sql/
│   ├── 01_database.sql
│   ├── 02_create_table.sql
│   ├── 03_load_data.py
│   ├── 04_validation.sql
│   └── 05_analysis.sql
│
├── Visuals/
│   ├── 1.png
│   ├── 2.png
│   ├── 3.png
│   ├── 4.png
│   ├── 5.png
│   ├── 6.png
│   ├── 7.png
│   ├── 8.png
│   └── 9.png
│
├── venv/
│
├── requirement.txt
│
└── README.md
```
