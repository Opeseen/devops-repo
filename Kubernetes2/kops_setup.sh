#  NEWER VERSION OF KOPS

### Using Ubuntu 22

#  FIRST ATTACH THE IAM ROLE TO THE EC2 INSTANCE

### SECOND RUN THE COMMAND "ssh-keygen"


# Update apt and install awscli
sudo apt update && apt install awscli -y

# Install and setup kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

chmod +x ./kubectl
sudo mv kubectl /usr/local/bin

# setup and install Kops
curl -Lo kops https://github.com/kubernetes/kops/releases/download/$(curl -s https://api.github.com/repos/kubernetes/kops/releases/latest | grep tag_name | cut -d '"' -f 4)/kops-linux-amd64
chmod +x kops
sudo mv kops /usr/local/bin/kops

# Create a kubernetes cluster config with the kops into S3 bucket
kops create cluster --name=kubepro.horpedev.online --state=s3://kube-kops-data --zones=us-east-1b \
 --node-count=1 \
 --node-size=t2.small --control-plane-size=t2.medium \
 --dns-zone=kubepro.horpedev.online --node-volume-size=8 \
 --control-plane-volume-size=8

# Update and validate the cluster with the config
kops update cluster --name kubepro.horpedev.online --state=s3://kube-kops-data --yes --admin
kops validate cluster --state=s3://kube-kops-data --wait 10m

# Delete the cluster if needed
kops delete cluster --name kubepro.horpedev.online --state=s3://kube-kops-data --yes



################################################################################################################

# OLDER VERSION OF KOPS

### Using Ubuntu 22

#  FIRST ATTACH THE IAM ROLE TO THE EC2 INSTANCE

### SECOND RUN THE COMMAND "ssh-keygen"


# Update apt and install awscli
sudo apt update && apt install awscli -y

# Install and setup kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

chmod +x ./kubectl
sudo mv kubectl /usr/local/bin

# setup and install Kops
wget https://github.com/kubernetes/kops/releases/download/v1.26.4/kops-linux-amd64
chmod +x kops-linux-amd64
sudo mv kops-linux-amd64 /usr/local/bin/kops

# Create a kubernetes cluster config with the kops into S3 bucket
kops create cluster --name=kubepro.horpedev.online --state=s3://kube-kops-data \
 --zones=us-east-1a --node-count=1 --node-size=t2.small \
 --master-size=t2.medium --dns-zone=kubepro.horpedev.online \
 --node-volume-size=8 --master-volume-size=8

# Update and validate the cluster with the config
kops update cluster --name kubepro.horpedev.online --state=s3://kube-kops-data --yes --admin
kops validate cluster --state=s3://kube-kops-data --wait 10m

# Delete the cluster if needed
kops delete cluster --name kubepro.horpedev.online --state=s3://kube-kops-data --yes



############################################################################################

# For NS Lookup
nslookup -type=ns kubepro.horpedev.online 