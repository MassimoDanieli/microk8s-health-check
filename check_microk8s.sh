#!/usr/bin/env bash
# MicroK8s health check: colourised terminal output + a Markdown report.
#
# Configuration (environment variables, all optional):
#   REPORT          report file                       (default: microk8s_report.md)
#   PROMETHEUS_URL  e.g. http://prometheus.192.168.1.111.nip.io   (skipped if unset)
#   LOKI_URL        e.g. http://loki.192.168.1.111.nip.io         (skipped if unset)
#   DNS_IMAGE       image for the DNS test            (default: busybox:1.36)
set -uo pipefail

GREEN=$'\033[0;32m'
YELLOW=$'\033[1;33m'
RED=$'\033[0;31m'
RESET=$'\033[0m'

report="${REPORT:-microk8s_report.md}"
PROMETHEUS_URL="${PROMETHEUS_URL:-}"
LOKI_URL="${LOKI_URL:-}"
DNS_IMAGE="${DNS_IMAGE:-busybox:1.36}"
failures=0

printf '# MicroK8s Health Report - %s\n\n' "$(date)" > "$report"

print_section() {
  printf '\n%s== %s ==%s\n' "$YELLOW" "$1" "$RESET"
  printf '\n## %s\n\n' "$1" >> "$report"
}

# Runs a command, shows it, and records command + output as a fenced block.
# (The fence used to be written with backticks inside double quotes, which
# bash runs as command substitution: the report came out mangled.)
print_command() {
  printf '%s$ %s%s\n' "$GREEN" "$1" "$RESET"
  # shellcheck disable=SC2016  # literal Markdown fences, nothing to expand
  printf '```bash\n%s\n```\n\n```text\n' "$1" >> "$report"
  if ! bash -c "$1" 2>&1 | tee -a "$report"; then
    failures=$((failures + 1))
    printf '%s(failed)%s\n' "$RED" "$RESET"
    printf '(failed)\n' >> "$report"
  fi
  printf '```\n' >> "$report"
}

skip() {
  printf '%s(skipped: %s)%s\n' "$YELLOW" "$1" "$RESET"
  printf '_Skipped: %s_\n' "$1" >> "$report"
}

for tool in microk8s jq curl; do
  command -v "$tool" >/dev/null || { printf '%s%s not found%s\n' "$RED" "$tool" "$RESET"; exit 1; }
done

print_section "MicroK8s Status"
print_command "microk8s status --wait-ready --timeout 60"

print_section "Node Info"
print_command "microk8s kubectl get nodes -o wide"

print_section "Pods"
print_command "microk8s kubectl get pods -A"

print_section "Pods not Running or Completed"
print_command "microk8s kubectl get pods -A --no-headers | awk '\$4 != \"Running\" && \$4 != \"Completed\"' || true"

print_section "Pod Restarts"
print_command "microk8s kubectl get pods -A --no-headers | awk '\$5 > 0' || true"

print_section "Services (LoadBalancer)"
print_command "microk8s kubectl get svc -A --field-selector spec.type=LoadBalancer"

print_section "Ingresses"
print_command "microk8s kubectl get ingress -A"

print_section "Persistent Volumes and Claims"
print_command "microk8s kubectl get pvc -A"
print_command "microk8s kubectl get pv"

print_section "StorageClass"
print_command "microk8s kubectl get storageclass"

print_section "DNS Test"
# No --tty: it fails when the script runs from cron or through a pipe.
print_command "timeout 90 microk8s kubectl run dnsutils-\$RANDOM --image=$DNS_IMAGE --restart=Never --rm -i --quiet -- nslookup kubernetes.default"

print_section "Prometheus Targets"
if [[ -n "$PROMETHEUS_URL" ]]; then
  print_command "curl -fsS --max-time 10 '$PROMETHEUS_URL/api/v1/targets' | jq '.data.activeTargets[] | {instance: .labels.instance, health, lastError}'"
else
  skip "set PROMETHEUS_URL"
fi

print_section "Loki Health"
if [[ -n "$LOKI_URL" ]]; then
  print_command "curl -fsS --max-time 10 '$LOKI_URL/ready'"
else
  skip "set LOKI_URL"
fi

print_section "Snap Refresh Status"
print_command "snap refresh --time | grep -i -A2 microk8s || snap refresh --time"

if (( failures > 0 )); then
  printf '\n%s⚠️  %d check(s) failed. Report written to %s%s\n' "$RED" "$failures" "$report" "$RESET"
  exit 1
fi
printf '\n%s✅ Report written to %s%s\n' "$GREEN" "$report" "$RESET"
