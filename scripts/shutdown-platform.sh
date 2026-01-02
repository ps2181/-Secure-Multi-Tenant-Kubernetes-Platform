#!/bin/bash

echo "🛑 Shutting down platform..."

# Kill port-forwards
pkill -f "kubectl port-forward"

# Scale down deployments
kubectl scale deployment --all --replicas=0 -n tenant-a
kubectl scale deployment --all --replicas=0 -n observability

# Stop Kind cluster (keeps data, just stops containers)
docker pause $(docker ps --filter name=secure-platform -q)

echo "✅ Platform shut down. Containers paused."
echo "To resume: docker unpause \$(docker ps -aq --filter name=secure-platform)"