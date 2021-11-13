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
```bash
make check-loki
```

## How to make load test by k6
```bash
make k6
```

Import `2587`, `10660`, and `14801` in grafana dashboard to see load test result.

## How to set up loki and query logs
```bash
docker plugin install grafana/loki-docker-driver:latest --alias loki --grant-all-permissions
# if latest version does not work well, try arm-v7.
# docker plugin install grafana/loki-docker-driver:arm-v7 --alias loki --grant-all-permissions
docker plugin ls
```

Register Prometheus as data sources in grafana dashboard first.  
Then, import `1860` and `13978` to visualize metrics collected through node exporter. 