#!/bin/bash

# Wait for Grafana to start
sleep 10

# Download Docker Metrics Dashboard (1860)
curl -s -o /tmp/docker-dashboard.json https://grafana.com/api/dashboards/1860/revisions/1/download

# Import Docker Metrics Dashboard
curl -X POST http://admin:admin@grafana:3000/api/dashboards/import \
    -H "Content-Type: application/json" \
    -d @<(cat <<EOF
{
  "dashboard": $(cat /tmp/docker-dashboard.json),
  "overwrite": true,
  "folderId": 0,
  "inputs": []
}
EOF
)

# Download Loki Logs Dashboard (13665)
curl -s -o /tmp/loki-logs-dashboard.json https://grafana.com/api/dashboards/13665/revisions/1/download

# Import Loki Logs Dashboard
curl -X POST http://admin:admin@grafana:3000/api/dashboards/import \
    -H "Content-Type: application/json" \
    -d @<(cat <<EOF
{
  "dashboard": $(cat /tmp/loki-logs-dashboard.json),
  "overwrite": true,
  "folderId": 0,
  "inputs": []
}
EOF
)

# Finally start Grafana
exec /run.sh

