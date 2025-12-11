#!/usr/bin/env bash
set -e

source .venv/bin/activate
# Use port 80 so the URL has no port (http://<ip>/)
sudo env "PATH=$PATH" uvicorn src.app.main:app --host 0.0.0.0 --port 80
