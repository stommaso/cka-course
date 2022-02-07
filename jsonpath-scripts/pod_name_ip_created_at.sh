kubectl get pod -o jsonpath='{range .items[*]}{.metadata.name}{" - "}{.status.podIP}{" - "}{.status.startTime}{"\n"}{end}'
