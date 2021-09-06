import http from "k6/http";
import { check } from "k6";

export default function() {
    const response = http.get("http://front-envoy:8088/healthcheck/backend");

    check(response, {
        "status was 200": (r) => r.status == 200
    });
};