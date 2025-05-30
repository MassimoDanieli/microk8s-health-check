#!/bin/bash

# Color functions
GREEN="\033[0;32m"
YELLOW="\033[1;33m"
RED="\033[0;31m"
RESET="\033[0m"

report="microk8s_report.md"
echo "# MicroK8s Health Report - $(date)" > "$report"
echo "" >> "$report"

print_section() {
  echo -e "\n${YELLOW}== $1 ==${RESET}"
  echo -e "\n## $1\n" >> "$report"
}

print_command() {
  echo -e "${GREEN}\$ $1${RESET}"
  echo -e "```bash\n$1\n```" >> "$report"
  eval "$1" | tee -a "$report"
}

print_section "MicroK8s Status"
print_command "microk8s status --wait-ready"

print_section "Node Info"
print_command "microk8s kubectl get nodes -o wide"

print_section "Pods"
print_command "microk8s kubectl get pods -A"

print_section "Services (LoadBalancer)"
print_command "microk8s kubectl get svc -A | grep LoadBalancer"

print_section "Ingresses"
print_command "microk8s kubectl get ingress -A"

print_section "Persistent Volumes and Claims"
print_command "microk8s kubectl get pvc -A"
print_command "microk8s kubectl get pv"

print_section "StorageClass"
print_command "microk8s kubectl get storageclass"

print_section "Pod Restarts"
print_command "microk8s kubectl get pods -A | awk '$5 > 0'"

print_section "DNS Test"
print_command "microk8s kubectl run -i --tty dnsutils --image=busybox --restart=Never --rm -- nslookup kubernetes.default"

print_section "Prometheus Targets"
print_command "curl -s http://prometheus.192.168.1.111.nip.io/api/v1/targets | jq '.data.activeTargets[] | {instance, health, lastError}'"

print_section "Loki Health"
print_command "curl -s http://loki.192.168.1.111.nip.io/loki/api/v1/ready"

print_section "Snap Refresh Status"
print_command "snap refresh --time | grep microk8s"

echo -e "\n${GREEN}✅ Report written to ${report}${RESET}"
