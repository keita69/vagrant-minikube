cat > ingress.yaml <<"EOF"
apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  name: myvagrant-ingress
  annotations:
    nginx.ingress.kubernetes.io/rewrite-target: /
spec:
  rules:
  - host: kubernetes-dashboard.local
    http:
      paths:
      - path: /
        backend:
          serviceName: kubernetes-dashboard 
          servicePort: 80
EOF