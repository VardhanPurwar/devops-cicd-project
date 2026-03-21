#!/bin/bash

set -e

echo "Updating system..."
sudo apt update -y

echo "Installing required packages..."
sudo apt install -y python3 python3-pip python3-venv

cd /home/ubuntu/app

echo "Removing old venv (if exists)..."
rm -rf venv

echo "Creating virtual environment..."
python3 -m venv venv

echo "Installing dependencies..."
./venv/bin/pip install -r requirements.txt

echo "Install completed successfully"