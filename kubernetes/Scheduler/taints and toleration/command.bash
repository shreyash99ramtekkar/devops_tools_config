kubectl describe node controlplane| grep taints
#taint a node
kubectl taint nodes <node-name> key=value:<effect>
#<effect> can be NoSchedule, PreferNoSchedule, NoExecute
#NoSchedule = the pod will not be scheduled on the node
#PreferNoSchedule = the pod will be scheduled on the node if there are no other options
#NoExecute = the pod will be evicted from the node if it is already running