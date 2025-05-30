# MicroK8s Health Check Script 🩺

This script performs a full health check of a MicroK8s cluster and generates a Markdown report.

## Features

✅ Status of MicroK8s and nodes  
✅ Overview of pods, services, ingresses  
✅ PVC and storage status  
✅ Pod restarts and crash detection  
✅ DNS test using BusyBox  
✅ Prometheus and Loki readiness check  
✅ Snap refresh info  
✅ Output: Colorized CLI + Markdown report (`microk8s_report.md`)

## Usage

```bash
chmod +x check_microk8s.sh
./check_microk8s.sh
```

## Output Example

```markdown
# MicroK8s Health Report - 2025-05-30
...
```

## Requirements

- MicroK8s
- jq
- curl
- BusyBox image available in registry (public by default)

## License

MIT © Massimo Danieli
