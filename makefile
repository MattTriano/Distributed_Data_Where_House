SHELL = /bin/bash
.phony: build_images clean_dbt update_dbt_packages build_images_no_cache quiet_startup \
	create_warehouse_infra
	
run_time := "$(shell date '+%Y_%m_%d__%H_%M_%S')"

update_dbt_packages:
	docker compose exec airflow-worker /bin/bash -c "cd dbt/ && dbt deps";

build_images:
	docker compose build 2>&1 | tee logs/where_house_build_logs_$(run_time).txt

build_images_no_cache:
	docker compose build --no-cache 2>&1 | tee logs/where_house_build_logs_$(run_time).txt

quiet_startup:
	docker compose up -d

clean_dbt:
	docker compose exec airflow-scheduler /bin/bash -c "cd dbt && dbt clean";
	docker compose exec airflow-scheduler /bin/bash -c "cd dbt && dbt deps";
	docker compose exec airflow-scheduler /bin/bash -c "mkdir -p /opt/airflow/dbt/target"

create_warehouse_infra:
	docker compose exec airflow-scheduler /bin/bash -c \
		"airflow dags trigger ensure_metadata_table_exists";
	docker compose exec airflow-scheduler /bin/bash -c \
		"airflow dags trigger setup_schemas";
	docker compose exec airflow-scheduler /bin/bash -c "cd dbt && dbt deps";
	docker compose exec airflow-scheduler /bin/bash -c \
		"mkdir -p /opt/airflow/dbt/models/intermediate &&\
		 mkdir -p /opt/airflow/dbt/models/feature &&\
		 mkdir -p /opt/airflow/dbt/models/dwh &&\
		 mkdir -p /opt/airflow/dbt/models/report"
	