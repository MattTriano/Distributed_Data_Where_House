# Steps

## 0. Clone the repo and `cd` into your local
## 1. Setup directories and credentials via
```
bash setup.sh
```
## 2. Build images via
```
docker-compose build
```
## 3. Initialize Airflow via
```
docker-compose up airflow-init
```
## 4. Spin up the system via
```
docker-compose up
```
## 5. (in another terminal) Install dbt dependencies via 
```
docker-compose exec airflow-worker /bin/bash -c "cd dbt/ && dbt deps"
```
## 6. Access web interfaces 
* [Airflow web UI (http://localhost:8080)](http://localhost:8080): {username: airflow_user, password: airflow_pw}
* [pgAdmin4 UI (http://0.0.0.0:5678/)](http://0.0.0.0:5678/): {email: email@email.com, password: pgadmin_pw}
* [Celery flower UI (http://localhost:5555/)](http://localhost:5555/): no credentials