# Envoy Jaeger Grafana Prometheus Challenges

## How to run
```bash
make up
```

## How to display logs
```bash
make logs
```

## How to confirm each container running
### envoy
```bash
make healthcheck
```

### jaeger
```bash
make open-jaeger
```

### prometheus
```bash
make open-prometheus
```

### grafana
```bash
make open-grafana
```

### influxdb
```bash
make check-influxdb
```

### loki
```
make check-loki
```

## How to make load test by k6
```
make k6
```

It is possible to see the load test result in grafana dashboard.  
In order to see the result, two steps are required.  
1. In configuration page, add influxdb as new data source.
2. In import page, put `2587` on the form and import `k6 Load Testing Results` dashboard via grafana.com.

## How to set up loki on local
```
docker plugin install grafana/loki-docker-driver:latest --alias loki --grant-all-permissions
docker plugin ls
```