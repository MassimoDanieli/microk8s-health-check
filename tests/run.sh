#!/usr/bin/env bash
# Runs check_microk8s.sh against stub microk8s/snap commands and checks the report.
set -euo pipefail
here=$(cd "$(dirname "$0")" && pwd)
bin=$(mktemp -d); work=$(mktemp -d)
cp "$here/stub-microk8s" "$bin/microk8s"; cp "$here/stub-snap" "$bin/snap"; chmod +x "$bin"/*
cd "$work"
PATH="$bin:$PATH" bash "$here/../check_microk8s.sh" > out.txt
fences=$(grep -c '^```' microk8s_report.md)
(( fences % 2 == 0 )) || { echo "unbalanced code fences ($fences)"; exit 1; }
grep -q 'CrashLoopBackOff' microk8s_report.md || { echo "unhealthy pod not reported"; exit 1; }
grep -q '_Skipped: set PROMETHEUS_URL_' microk8s_report.md || { echo "Prometheus not skipped"; exit 1; }
grep -q 'Address: 10.152.183.1' microk8s_report.md || { echo "DNS test output missing"; exit 1; }
echo "PASS: report has $fences balanced fences and every section"
