## Kubernetes REST API

- Create a ServiceAccount
```bash
kubectl create sa myscript
```
- Create Role
```bash
kubectl apply -f script-role.yaml
```
- Link Role and ServiceAccount
```bash
kubectl create rolebinding script-role-binding --role=script-role --serviceaccount=default:myscript
```
- Get Secret name from  ServiceAccount
```bash
kubectl get sa myscript -o yaml
```
- Get Token from Secret
```bash
kubectl get secret myscript-token-grgbt -o yaml
```
- Decode base64 Token
```bash
echo token | base64 --decode | tr -d "\n"
```
- Get Server IP and Port
```bash
kubectl config view
```
- Test API
```bash
curl -X GET $SERVER/api --header "Authorization: Bearer $TOKEN" --cacert /etc/kubernetes/pki/ca.crt
curl -X GET $SERVER/apis/apps/v1/namespaces/default/deployments --header "Authorization: Bearer $TOKEN" --cacert /etc/kubernetes/pki/ca.crt
curl -X GET $SERVER/apis/apps/v1/namespaces/default/deployments/ingress-nginx-controller --header "Authorization: Bearer $TOKEN" --insecure
```
