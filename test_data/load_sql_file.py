import sqlite3
import pandas as pd

def retrieve_data_from_sqlite(sql_file: str, query: str, encoding: str = 'utf-8') -> pd.DataFrame:
    """
    Retrieves data from an SQLite database file based on the provided SQL script.

    Parameters
    ----------
    sql_file: str 
        The path to the SQL file.
    query: str
        The SQL query to retrieve the data.
    encoding: str, default 'utf-8'
        The encoding of the SQL file.

    Returns:
        pd.DataFrame: A Pandas DataFrame containing the retrieved data.
    """

    # Connect to an in-memory SQLite database

    with open(sql_file, 'r', encoding=encoding) as file:
        sql_script = file.read()

    # Query the data using Pandas within a context manager
    with sqlite3.connect(':memory:') as conn:
        # Execute the entire SQL script
        conn.executescript(sql_script)

        # Query the data using Pandas
        df = pd.read_sql_query(query, conn)

    return df