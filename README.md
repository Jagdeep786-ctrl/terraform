⚙️ Tech Stack
🚀 Backend & Services

Node.js (API Gateway & Write Service)

Python (Trend Service - ML Predictions)

MySQL (Data Service)

🌐 Frontend

React.js (Chart visualization)

☁️ DevOps & Cloud

AWS EKS

Kubernetes

Docker

Helm

AWS ALB (Ingress)

📊 Monitoring

Prometheus

Grafana

Node Exporter

🚀 Deployment Workflow
🔹 Create Kubernetes Resources
kubectl apply -f namespace.yaml
kubectl apply -f . -n stock
kubectl create configmap mysql-initdb --from-file=init.sql=./db/init.sql -n stock
☁️ AWS EKS Setup
🔹 Create EKS Cluster
eksctl create cluster \
--name crop-dashboard-newcluster \
--region us-east-1 \
--nodegroup-name standard-workers \
--node-type t3.medium \
--nodes 2 \
--nodes-min 2 \
--nodes-max 2 \
--managed
🔹 Configure kubectl
aws eks --region us-east-1 update-kubeconfig \
--name crop-dashboard-newcluster
🔹 Associate IAM OIDC Provider
eksctl utils associate-iam-oidc-provider \
--region us-east-1 \
--cluster crop-dashboard-newcluster \
--approve
🌐 ALB Ingress Setup
🔹 Download IAM Policy
curl -O https://raw.githubusercontent.com/kubernetes-sigs/aws-load-balancer-controller/main/docs/install/iam_policy.json
🔹 Create IAM Policy
aws iam create-policy \
--policy-name AWSLoadBalancerControllerIAMPolicy \
--policy-document file://iam_policy.json
🔹 Create IAM Service Account
eksctl create iamserviceaccount \
--cluster crop-dashboard-newcluster \
--namespace kube-system \
--name aws-load-balancer-controller \
--attach-policy-arn arn:aws:iam::<ACCOUNT_ID>:policy/AWSLoadBalancerControllerIAMPolicy \
--approve
🔹 Install ALB Controller
helm repo add eks https://aws.github.io/eks-charts
helm repo update

helm install aws-load-balancer-controller eks/aws-load-balancer-controller \
-n kube-system \
--set clusterName=crop-dashboard-newcluster \
--set serviceAccount.create=false \
--set serviceAccount.name=aws-load-balancer-controller
🔹 Verify Ingress
kubectl get ingress

Access application:

http://<ALB-DNS>
📊 Monitoring Setup
🔹 Install Prometheus & Grafana
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update

helm install monitoring prometheus-community/kube-prometheus-stack -n monitoring --create-namespace
🔹 Install Node Exporter
kubectl apply -f https://raw.githubusercontent.com/prometheus/node_exporter/master/examples/node-exporter-daemonset.yaml
🔹 Expose Grafana
kubectl patch svc monitoring-grafana -n monitoring -p '{"spec": {"type": "LoadBalancer"}}'
kubectl get svc -n monitoring
🔹 Grafana Credentials

Username:

admin

Password:

kubectl get secret -n monitoring monitoring-grafana -o jsonpath="{.data.admin-password}" | base64 --decode
🧹 Cleanup
eksctl delete cluster \
--name crop-dashboard-newcluster \
--region us-east-1
💬 Interview Tip

👉 Say this confidently:

“I designed and deployed a microservices-based application on AWS EKS with ALB ingress and implemented full monitoring using Prometheus and Grafana.”

👨‍💻 Author

Jagdeep Sodhi
DevOps Engineer | AWS | Kubernetes | Monitoring
