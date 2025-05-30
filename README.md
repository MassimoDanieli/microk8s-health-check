# MicroK8s Health Check 🩺

![Shell Script](https://img.shields.io/badge/language-Bash-blue)
![License](https://img.shields.io/badge/license-MIT-green)
![Status](https://img.shields.io/badge/status-active-brightgreen)

A CLI tool and Markdown report generator to monitor your local MicroK8s cluster.

## 🔍 What it does

- Checks MicroK8s and node status
- Lists pods, services, ingresses, PVCs
- Verifies DNS, Prometheus targets and Loki readiness
- Highlights pod restarts or unknown states
- Outputs colorized terminal info and a `microk8s_report.md` file

## 🚀 Usage

```bash
chmod +x check_microk8s.sh
./check_microk8s.sh
```

## 📦 Requirements

- MicroK8s installed and running
- `jq` and `curl`
- Access to Prometheus and Loki endpoints (default: `*.nip.io`)

## 📂 Output

- `microk8s_report.md` – Markdown report you can archive or share
- Colorized CLI output for quick checks

## 📝 License

MIT © [Massimo Danieli](https://github.com/MassimoDanieli)

