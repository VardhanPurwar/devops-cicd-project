#!/bin/bash

echo "Stopping application..."

# Kill process if running (ignore errors)
pkill -f app.py || true

echo "Application stopped (if it was running)"