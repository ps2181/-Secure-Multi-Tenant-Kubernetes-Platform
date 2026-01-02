#!/bin/bash

echo "🚀 Starting platform..."

# Resume Kind cluster
docker unpause $(docker ps -aq --filter name=secure-platform)

# Wait for cluster
sleep 10

# Scale up tenant apps
kubectl scale deployment webapp-a -n tenant-a --replicas=2

echo "✅ Platform started!"
echo ""
echo "Access URLs:"
echo "  Tenant A: http://tenant-a.local"
echo ""
echo "Port-forward commands:"
echo "  kubectl port-forward -n observability svc/prometheus-kube-prometheus-prometheus 9090:9090"