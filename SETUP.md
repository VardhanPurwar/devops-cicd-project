# AWS CI/CD Pipeline Setup Guide (Step-by-Step)

## Objective

Set up a complete CI/CD pipeline to automatically deploy a Flask application on an EC2 instance using AWS services.

## Prerequisites

- AWS Account
- GitHub Repository with project code
- EC2 Instance (Ubuntu)
- IAM Roles configured

## Step 1: Launch EC2 Instance
1. Go to AWS Console → EC2
2. Click Launch Instance
3. Choose Ubuntu
4. Allow inbound rules:
  - SSH (22)
  - HTTP (80)
  - Custom TCP (5000)
5. Launch instance

## Step 2: Connect to EC2

ssh -i your-key.pem ubuntu@<EC2-PUBLIC-IP>

## Step 3: Install Required Software

- sudo apt update
- sudo apt install python3-pip -y
- sudo apt install ruby -y
- sudo apt install wget -y

## Step 4: Install CodeDeploy Agent

- cd /home/ubuntu
- wget https://aws-codedeploy-<region>.s3.<region>.amazonaws.com/latest/install
- chmod +x ./install
- sudo ./install auto
- sudo systemctl start codedeploy-agent
- sudo systemctl status codedeploy-agent

## Step 5: Create IAM Role for EC2
1. Go to IAM → Roles
2. Create Role → Select EC2
3. Attach policy:
  - AmazonEC2RoleforAWSCodeDeploy
  - Attach role to EC2 instance

## Step 6: Prepare Project Files

Ensure your repo has:

- `app.py`
- `requirements.txt`
- `appspec.yml`
- `scripts/`

appspec.yml example:

version: 0.0
os: linux
files:
  - source: /
    destination: /home/ubuntu/app

hooks:
  ApplicationStop:
    - location: scripts/stop.sh
  BeforeInstall:
    - location: scripts/install.sh
  AfterInstall:
    - location: scripts/install.sh
  ApplicationStart:
    - location: scripts/start.sh

## Step 7: Create Deployment Scripts

install.sh

  #!/bin/bash
  cd /home/ubuntu/app
  python3 -m venv venv
  source venv/bin/activate
  pip install -r requirements.txt

start.sh

#!/bin/bash
cd /home/ubuntu/app
source venv/bin/activate
nohup python3 app.py > app.log 2>&1 &

stop.sh

#!/bin/bash
pkill -f app.py || true

## Step 8: Create CodeDeploy Application

1. Go to CodeDeploy
2. Create Application
3. Compute platform → EC2

## Step 9: Create Deployment Group

1. Select application
2. Create deployment group
3. Choose EC2 instances
4. Select IAM role
5. Choose deployment type → In-place

## Step 10: Create CodePipeline

1. Go to CodePipeline
2. Click Create Pipeline
3. Source → GitHub
4. Build → Skip
5. Deploy → CodeDeploy
6. Select your application & deployment group

## Step 11: Trigger Deployment
1. Push code to GitHub
2. Pipeline starts automatically
3. Deployment happens on EC2

## Step 12: Access Application
http://<EC2-PUBLIC-IP>:5000
