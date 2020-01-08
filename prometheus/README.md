# NiFi with Prometheus and Grafana
Basic setup to monitor NiFi nodes with Prometheus. Any such node must have a label "app: nifi".
The running NiFi node must also have a PrometheusReportingTask running to expose the /metrics endpoint
on port 9092 (or whatever port is specified in the nifi.yaml).
 
To install: run `kubectl apply -k .` while in this directory.
 
To optionally install grafana as well: `kubectl apply -k grafana/`

## TODO
1. Persistent prometheus server state/data between restarts. Right now it's just emptyDir so it's ephemeral