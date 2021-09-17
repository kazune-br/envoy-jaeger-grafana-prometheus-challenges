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

check-influxdb:
	curl localhost:8086/health

check-loki:
	curl localhost:3100/ready

open-jaeger:
	open http://localhost:16686/

open-prometheus:
	open http://localhost:9090/targets

open-grafana:
	open http://localhost:3000/datasources

reset-data:
	rm -rf data/*

k6:
	docker compose exec -T k6 \
		k6 run \
			--vus 5 \
			--duration 60s \
			--rps 5 - < ./loadtest/example.js