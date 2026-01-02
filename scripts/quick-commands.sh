#!/bin/bash

cat << 'EOF'
🎯 Quick Resource Management Commands:

📊 Check Resources:
  ./scripts/monitor-resources.sh

🛑 Stop Everything:
  ./scripts/shutdown-platform.sh

🚀 Start Everything:
  ./scripts/startup-platform.sh

🧹 Cleanup:
  pkill -f "kubectl port-forward"
  kubectl scale deployment --all --replicas=0 -n tenant-a

📉 Reduce Resources:
  kubectl scale deployment webapp-a -n tenant-a --replicas=1
  kubectl scale deployment load-generator -n tenant-a --replicas=0

🔍 Monitor:
  docker stats
  kubectl top nodes
  kubectl top pods -A

⏸️  Pause Cluster (keeps data):
  docker pause $(docker ps -q --filter name=secure-platform)

▶️  Resume Cluster:
  docker unpause $(docker ps -aq --filter name=secure-platform)

🗑️  Delete Cluster:
  kind delete cluster --name secure-platform
EOF