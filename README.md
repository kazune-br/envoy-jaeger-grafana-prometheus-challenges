# envoy-jaeger-grafana-prometheus-challenges

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