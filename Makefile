.PHONY: build up down logs healthcheck open-jaeger open-prometheus open-grafana

build:
	COMPOSE_DOCKER_CLI_BUILD=1 DOCKER_BUILDKIT=1 docker compose build

up:
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

check-loki-chunks:
	docker exec -it loki ls -l /loki/chunks

check-node-exporter:
	curl http://localhost:9100/metrics

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

influxdb:
	docker exec -it influxdb influx

promsnapshot-create:
	curl -X POST http://localhost:9090/api/v1/admin/tsdb/snapshot

vmbackup:
	docker compose run vmbackup \
		-storageDataPath=/data/victoria-metrics-data \
		-snapshotName=$$(ls -1 ./data/victoria-metrics-data/snapshots/ | fzf) \
		-dst=fs:///data/vmbackup

vmsnapshot-list:
	curl http://localhost:8428/snapshot/list

vmsnapshot-create:
	curl -X POST http://localhost:8428/snapshot/create