import pandas as pd
import pytest
import freshrss_hash

from test_data import load_sql_file
from typing import Any

@pytest.fixture
def test_df() -> pd.DataFrame:
    return load_sql_file.retrieve_data_from_sqlite('test_data/sample_freshrss_db.sql', 'SELECT * FROM entry')


@pytest.fixture
def entry_from_test_df(test_df: pd.DataFrame, index: int) -> freshrss_hash.Entry:
    columns_for_hash = ['link', 'title', 'author', 'content', 'tags']

    entry_data: Any = test_df[columns_for_hash].iloc[index]
    entry = freshrss_hash.Entry(*entry_data)

    return entry


@pytest.mark.parametrize('index', [0, 1, 2])
def test_create_hash(entry_from_test_df: freshrss_hash.Entry, index: int, test_df: pd.DataFrame):
    expected_hash: Any = test_df['hash'][index]
    computed_hash = freshrss_hash.create_hash(entry_from_test_df).hex()

    assert computed_hash == expected_hash
