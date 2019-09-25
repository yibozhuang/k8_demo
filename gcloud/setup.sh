gcloud config set project multi-k8s-254004
gcloud config set compute/zone us-central1-a
gcloud container clusters get-credentials multi-cluster
kubectl create secret generic pgpassword --from-literal PGPASSWORD=<$PASSWORD>
curl -LO https://git.io/get_helm.sh
chmod 700 get_helm.sh
./get_helm.sh
kubectl get namespaces
kubectl create serviceaccount --namespace kube-system tiller
kubectl create clusterrolebinding tiller-cluster-rule --clusterrole=cluster-admin --serviceaccount=kube-system:tiller
helm init --service-account tiller --upgrade
helm install stable/nginx-ingress --name my-nginx --set rbac.create=true
kubectl apply -f https://raw.githubusercontent.com/jetstack/cert-manager/release-0.10/deploy/manifests/00-crds.yaml
kubectl create namespace cert-manager
kubectl label namespace cert-manager certmanager.k8s.io/disable-validation=true
helm repo add jetstack https://charts.jetstack.io
helm repo update
helm install   --name cert-manager   --namespace cert-manager   --version v0.10.0   jetstack/cert-manager
