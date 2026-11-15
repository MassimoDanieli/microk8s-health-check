# MicroK8s Health Check 🩺

![Shell Script](https://img.shields.io/badge/language-Bash-blue)
![License](https://img.shields.io/badge/license-MIT-green)
![Status](https://img.shields.io/badge/status-active-brightgreen)

A CLI tool and Markdown report generator to monitor your local MicroK8s cluster.

## 🔍 What it does

- Checks MicroK8s and node status
- Lists pods, services, ingresses, PVCs
- Verifies DNS, Prometheus targets and Loki readiness
- Highlights pods that are not Running/Completed and pods with restarts
- Outputs colorized terminal info and a `microk8s_report.md` file

## 🚀 Usage

```bash
chmod +x check_microk8s.sh
./check_microk8s.sh

# with Prometheus and Loki checks
PROMETHEUS_URL=http://prometheus.192.168.1.111.nip.io \
LOKI_URL=http://loki.192.168.1.111.nip.io \
./check_microk8s.sh
```

| Variable | Default | |
|---|---|---|
| `REPORT` | `microk8s_report.md` | where the report is written |
| `PROMETHEUS_URL` | – | Prometheus base URL; the check is skipped if unset |
| `LOKI_URL` | – | Loki base URL; the check is skipped if unset |
| `DNS_IMAGE` | `busybox:1.36` | image used for the in-cluster DNS lookup |

The exit code is 1 when any check fails, so it can run from cron or CI.

## 📦 Requirements

- MicroK8s installed and running
- `jq` and `curl`
- Optional: Prometheus and Loki endpoints (`PROMETHEUS_URL`, `LOKI_URL`)

## 📂 Output

- `microk8s_report.md` – Markdown report you can archive or share (not committed: it describes your cluster)
- Colorized CLI output for quick checks

## 📝 License

MIT © [Massimo Danieli](https://github.com/MassimoDanieli)

