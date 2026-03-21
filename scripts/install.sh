#!/bin/bash

set -ex

echo "Updating system..."
sudo apt update -y

echo "Installing dependencies..."
sudo apt install -y python3 python3-pip python3-venv

echo "BeforeInstall completed"