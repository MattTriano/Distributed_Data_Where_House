FROM apache/superset:2.0.1

COPY requirements/docker-init.sh /app/docker/docker-init.sh
COPY requirements/pythonpath_dev /app/docker/pythonpath_dev
COPY requirements/docker-bootstrap.sh /app/docker/docker-bootstrap.sh
COPY requirements/superset_requirements.txt /app/docker/requirements.txt

USER root
RUN pip install --no-cache -r /app/docker/requirements.txt
USER superset