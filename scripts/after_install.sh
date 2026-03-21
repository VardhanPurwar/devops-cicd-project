#!/bin/bash

set -ex

echo "Moving to app directory..."
cd /home/ubuntu/app

echo "Cleaning old setup..."
rm -rf venv

echo "Creating virtual environment..."
python3 -m venv venv

echo "Installing dependencies..."
./venv/bin/pip install -r requirements.txt

echo "AfterInstall completed"