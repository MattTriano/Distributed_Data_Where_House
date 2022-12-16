mkdir -p ./airflow/dags ./airflow/logs ./airflow/plugins ./airflow/data_raw
echo -e "AIRFLOW_UID=$(id -u)" > .env
echo -e "POSTGRES_USER=airflow_user" >> .env
echo -e "POSTGRES_PASSWORD=airflow_pw" >> .env
echo -e "POSTGRES_DB=airflow_metadata_db" >> .env
echo -e "DWH_POSTGRES_USER=dwh_user" >> .env
echo -e "DWH_POSTGRES_PASSWORD=dwh_pw" >> .env
echo -e "DWH_POSTGRES_DB=dwh_db_name" >> .env
      
echo -e "POSTGRES_USER=dwh_user" >> .dwh.env
echo -e "POSTGRES_PASSWORD=dwh_pw" >> .dwh.env
echo -e "POSTGRES_DB=dwh_db_name" >> .dwh.env