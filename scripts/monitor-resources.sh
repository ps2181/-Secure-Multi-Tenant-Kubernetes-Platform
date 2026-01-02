#!/bin/bash

echo "=== 📊 Resource Usage Report ==="
echo ""

echo "1️⃣  Docker Container Resources:"
docker stats --no-stream --format "table {{.Name}}\t{{.CPUPerc}}\t{{.MemUsage}}" | grep -E "NAME|secure-platform"

echo ""
echo "2️⃣  Kubernetes Nodes:"
kubectl top nodes 2>/dev/null || echo "Metrics server not ready"

echo ""
echo "3️⃣  Top Resource-Consuming Pods:"
kubectl top pods -A --sort-by=memory 2>/dev/null | head -n 10 || echo "Metrics server not ready"

echo ""
echo "4️⃣  Active Port-Forwards:"
ps aux | grep "kubectl port-forward" | grep -v grep | wc -l | xargs echo "Active port-forwards:"

echo ""
echo "5️⃣  Background Processes:"
ps aux | grep -E "kubectl|helm|kind" | grep -v grep | wc -l | xargs echo "Kubectl/Helm/Kind processes:"

echo ""
echo "=== 💾 System Resources ==="
echo "Memory:"
top -l 1 | grep PhysMem

echo ""
echo "CPU:"
top -l 1 | grep "CPU usage"