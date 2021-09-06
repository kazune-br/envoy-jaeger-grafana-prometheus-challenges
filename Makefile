.PHONY: build up down logs healthcheck open-jaeger open-prometheus open-grafana

build:
	COMPOSE_DOCKER_CLI_BUILD=1 DOCKER_BUILDKIT=1 docker compose build

up: build
	docker compose up -d

down:
	docker compose down

logs:
	docker compose logs -f

healthcheck:
	curl localhost:8088/healthcheck/backend

open-jaeger:
	open http://localhost:16686/

open-prometheus:
	open http://localhost:9090/targets

open-grafana:
	open http://localhost:3000/datasources

k6:
	docker run --net=mesh_network -i loadimpact/k6 run --vus 5 --duration 60s --rps 5 - < ./loadtest/example.js
