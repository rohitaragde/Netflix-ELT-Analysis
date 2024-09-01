# Netflix ELT Analysis 

## Project Description
This project focuses on extracting Netflix data from Kaggle, loading it into a SQL Server database, and performing data cleaning and analysis. The aim is to demonstrate the ELT process using SQL for data transformation and analysis after loading the raw data into a database.

## Key Features
- **Data Extraction:** Downloading the Netflix dataset using the Kaggle API.
- **Data Loading:** Loading the dataset into a Pandas DataFrame and then into SQL Server.
- **Data Cleaning:**
  - Handling foreign characters by adjusting data types.
  - Removing duplicate records.
  - Splitting multi-valued columns like `listed_in`, `cast`, `director`, and `country` into separate tables.
  - Filling in missing values and dropping unnecessary columns.
- **Data Analysis:**
  - Counting the number of movies and TV shows for each director.
  - Identifying the country with the most comedy movies.
  - Finding the director with the maximum number of movies released each year.
  - Calculating the average duration of movies by genre.
  - Identifying directors who have created both comedy and horror movies.

## Prerequisites
- **Python Libraries:**
  - `pandas`
  - `sqlalchemy`
  - `pyodbc`
- **SQL Server:** A running SQL Server instance with ODBC connection set up.
- **Kaggle API:** Access to Kaggle datasets via the Kaggle API.

## Installation Instructions
1. **Python Environment Setup:**  
   Install necessary Python libraries:
   ```bash
   pip install pandas sqlalchemy pyodbc

2.  SQL Server Setup: Ensure SQL Server is installed and running, with ODBC connection configured.

3. Kaggle Setup: Configure the Kaggle API and download the Netflix dataset using Python Kaggle Library

## Usage Instructions

1. Data Extraction: Use the Kaggle API within Jupyter Notebook to download the Netflix dataset
2. Data Loading: Load the dataset into a Pandas DataFrame and then into SQL Server
3. Data Cleaning and Transformation: Execute the provided SQL scripts to clean and transform the data
4. Data Analysis: Run the SQL analysis queries to generate insights from the cleaned dat

## Contributors
**Rohit Annasaheb Ragde**


