import datetime as dt
import logging
from logging import Logger

from airflow.decorators import dag, task

from cc_utils.db import (
    get_pg_engine,
    get_data_table_names_in_schema,
)

task_logger = logging.getLogger("airflow.task")


@task
def check_tables_in_schema(conn_id: str, task_logger: Logger) -> str:
    tables_in_data_raw_schema = get_data_table_names_in_schema(
        engine=get_pg_engine(conn_id=conn_id), schema_name="data_raw"
    )
    task_logger.info(f"Raw tables: {tables_in_data_raw_schema}")


@dag(
    schedule="0 4 3 3 *",
    start_date=dt.datetime(2022, 11, 1),
    catchup=False,
    tags=["cook_county", "boundary_lines", "dimension_table", "geospatial", "data_raw"],
)
def test_connection():
    POSTGRES_CONN_ID = "dwh_db_conn"

    check_tables_1 = check_tables_in_schema(conn_id=POSTGRES_CONN_ID, task_logger=task_logger)

    check_tables_1


test_connection()
