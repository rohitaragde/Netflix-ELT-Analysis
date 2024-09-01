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
4. Data Analysis: Run the SQL analysis queries to generate insights from the cleaned data

## Conclusion
This project successfully demonstrated the ELT process by extracting, loading, and transforming a real-world dataset. Through a series of SQL-based analyses, valuable insights were uncovered about Netflix’s content, including director versatility, genre-specific trends, and country-based production statistics. These findings not only offer a deeper understanding of the Netflix catalog but also provide a foundation for more advanced analyses and applications. The flexibility of SQL in handling complex transformations and queries made it an ideal choice for this project, showing how powerful data can be when properly cleaned and analyzed.

## Future Work
1. Data Enrichment: Integrate additional datasets, such as viewer ratings or box office performance, to further analyze the success of movies and TV shows.
2. Predictive Analysis: Implement machine learning models to predict the success of a movie or TV show based on historical data.
3. Visualization: Use data visualization tools like Power BI or Tableau to create dashboards that provide interactive insights into the Netflix dataset.
4. Automation: Automate the entire ELT process using tools like Apache Airflow to streamline the workflow and ensure real-time data processing

## Contributors
**Rohit Annasaheb Ragde**


