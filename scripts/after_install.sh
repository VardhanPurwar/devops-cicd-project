#!/bin/bash

set -e

echo "Fixing permissions..."
sudo chown -R ubuntu:ubuntu /home/ubuntu/app

echo "Moving to app directory..."
cd /home/ubuntu/app

echo "Cleaning old setup..."
rm -rf venv

echo "Creating virtual environment..."
python3 -m venv venv

echo "Activating virtual environment..."
source venv/bin/activate

echo "Installing dependencies..."
pip install --upgrade pip
pip install -r requirements.txt

echo "AfterInstall completed"