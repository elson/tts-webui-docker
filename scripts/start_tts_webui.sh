#!/usr/bin/env bash

mkdir -p /workspace/logs
echo "Starting TTS Generation Web UI"
export PYTHONUNBUFFERED=1
export HF_HOME="/workspace"
# Set port for the React UI
export PORT=3006
source /venv/bin/activate
cd /workspace/tts-generation-webui
nohup python3 server.py > /workspace/logs/tts.log 2>&1 &
echo "TTS Generation Web UI started"
echo "Log file: /workspace/logs/tts.log"
deactivate
