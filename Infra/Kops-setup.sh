
### Install & access AWS with aws cli
sudo apt update && sudo apt install awscli -y
aws configure set aws_access_key_id $YOUR_ACCESS_KEY_ID; aws configure set aws_secret_access_key $YOUR_SECRET_ACCESS_KEY; aws configure set default.region $YOUR_AWS_DEFAULT_REGION


curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/
curl -LO https://github.com/kubernetes/kops/releases/download/$(curl -s https://api.github.com/repos/kubernetes/kops/releases/latest | grep tag_name | cut -d '"' -f 4)/kops-linux-amd64
sudo chmod +x ./kops-linux-amd64
sudo mv kops-linux-amd64 /usr/local/bin/kops

### Insatll Helm
cd /tmp/
sudo wget https://get.helm.sh/helm-v3.9.4-linux-amd64.tar.gz
tar -zxvf helm-v3.0.0-linux-amd64.tar.gz
mv linux-amd64/helm /usr/local/bin/helm

### Create Kubernetes Cluster
kops create cluster --name=$YOUR_DNS_ZONE_ON_AWS --state=s3://$YOUR_S3_NAME --zones=$YOUR_AWS_REGION_A,$YOUR_AWS_REGION_B --node-count=2 --node-size=t3.small --master-size=t3.medium --dns-zone=$YOUR_DNS_ZONE_ON_AWS --node-volume-size=8 --master-volume-size=8

 