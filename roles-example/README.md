• Create client key with openssl
```
openssl genrsa -out dev-simo.key 2048
```

• Create certificateSigningRequest for key
```
openssl req -new -key dev-simo.key -subj "/CN=user" -out dev-simo.csr
```

• Create YAML file and change user and request
```
apiVersion: certificates.k8s.io/v1
kind: CertificateSigningRequest
metadata:
  name: simo
spec:
  request: $add_here_csr_in_base64
  signerName: kubernetes.io/kube-apiserver-client
  expirationSeconds: 86400 # one day
  usages:
  - client auth
```

• Send request to cluster
```
kubectl apply -f dev-simo-csr.yaml
```

• Approve certificateSigningRequest
```
kubectl get CertificateSigningRequest
kubectl certificate approve dev-simo
```

• Get signed certificate
```
kubectl get csr dev-simo -o yaml
```

• From the status take the certificate

• Certificate is in base64 and needs to be decoded
```
echo $cert | base64 --decode > dev-simo.crt
```