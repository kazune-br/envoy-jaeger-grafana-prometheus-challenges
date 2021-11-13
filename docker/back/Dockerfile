FROM envoyproxy/envoy-alpine:v1.20-latest
ADD ./docker/back/conf.d/envoy.yaml /etc/envoy/envoy.yaml
CMD /usr/local/bin/envoy -c /etc/envoy/envoy.yaml
EXPOSE 8089