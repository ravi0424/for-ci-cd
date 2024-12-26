#!/bin/bash
# Variables: Replace these with your actual credentials and preferred settings
AWS_ACCESS_KEY_ID=""
AWS_SECRET_ACCESS_KEY=""
AWS_REGION="ap-south-1"
AWS_OUTPUT="json"

echo "Configuring AWS CLI..."
aws configure set aws_access_key_id $AWS_ACCESS_KEY_ID
aws configure set aws_secret_access_key $AWS_SECRET_ACCESS_KEY
aws configure set region $AWS_REGION
aws configure set output $AWS_OUTPUT
echo "AWS CLI has been configured successfully."
# installing kubecl and aws cli into code-deploy agent 
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
sudo apt install unzip
unzip awscliv2.zip
sudo ./aws/install
curl -LO https://dl.k8s.io/release/v1.30.0/bin/linux/amd64/kubectl
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
chmod +x kubectl
mkdir -p ~/.local/bin
mv ./kubectl ~/.local/bin/kubectl

# Step 4: Verify installations
echo "Verifying installations..."
kubectl version --client
aws --version

# Step 5: Interact with AWS EKS
echo "Fetching EKS cluster status..."
aws eks --region $AWS_REGION describe-cluster --name public-clusterforcicd --query cluster.status

echo "Updating kubeconfig for EKS cluster..."
aws eks update-kubeconfig --region $AWS_REGION --name public-clusterforcicd

echo "Checking Kubernetes nodes..."
kubectl get nodes

echo "Script execution completed."

