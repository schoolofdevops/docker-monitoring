# 🔭 Observability Stack with Prometheus, Grafana, Loki, Promtail, and Node Exporter

This project sets up a complete monitoring and logging stack using Docker Compose.

## 🚀 Stack Components

- **Prometheus** – Metrics collection and alerting
- **Grafana** – Visualization and dashboarding
- **Loki** – Log aggregation system by Grafana
- **Promtail** – Log shipping agent for Loki
- **Node Exporter** – Host-level metrics for Prometheus

---

## 📦 Getting Started

### 1. Clone the Repository

```bash
git clone https://github.com/yourusername/docker-monitoring.git
cd docker-monitoring
```


### 2. Start All Services

```
docker compose up -d
```

This will pull all required images and start the containers in the background.

---

## 🌐 Accessing the Services

| Service | URL | Default Credentials |
|---|---|---|
| Grafana | [http://localhost:3000](http://localhost:3000) | **admin / admin** | 
| Prometheus | [http://localhost:9090](http://localhost:9090) | N/A | 
| Loki | [http://localhost:3100](http://localhost:3100) | N/A | 
| Node Exporter | [http://localhost:9100](http://localhost:9100) | N/A | 

---

## 📊 Grafana Dashboards

### 1. Log in to Grafana

Visit [http://localhost:3000](http://localhost:3000) and log in with:

```
Username: admin
Password: admin
```

### 2. Add Data Sources

If not auto-provisioned, configure the following:

* **Prometheus** at `http://prometheus:9090`

* **Loki** at `http://loki:3100`

### 3. Import Dashboards

You can import dashboards from Grafana.com:

* **Node Exporter Full** (ID: `1860`)

* **Loki Logs Dashboard** (ID: `13665`)

---

## 🔧 Configuration Files

* `prometheus/prometheus.yml` – Prometheus scrape configuration

* `promtail/config.yml` – Promtail log collection rules

* `grafana/provisioning/` – Optional folder to auto-provision data sources/dashboards

---

## 📥 Logs and Metrics Locations

* Promtail reads logs from `/var/log` and `/var/lib/docker/containers`

* Node Exporter reads system metrics from host via `/proc`, `/sys`, and root FS

---

## 🧼 Stop and Cleanup

```
docker compose down
```

To remove all volumes and start fresh:

```
docker compose down -v
```

---

## 🧠 Tip

Make sure Docker has access to system folders (`/var/log`, `/var/lib/docker`, `/proc`, etc.) and your user has permission to bind to these files on macOS/Linux.

---

## 🛠️ Troubleshooting

* Check logs:

```
docker compose logs -f
```

* Verify Prometheus targets:
* Go to **Status > Targets** in Prometheus UI

* Grafana dashboards not showing data? Check:

  * Data source config

  * Time range in dashboard

  * Prometheus targets scraping successfully

---

## 📎 License
Apache 2


#courses/docker/labs-v2
