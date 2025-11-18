# AutoCorp-Hub

Automation hub for AutoCorp — scheduling, HR/document helpers, email utilities, and deployment manifests.

## Overview

AutoCorp-Hub bundles a set of small, focused Python utilities and deployment manifests used for internal automation tasks. The repo includes:
- Meeting scheduling helpers
- HR document request automation
- Email helper utilities
- Database helper scripts and tests
- Dockerfile and Kubernetes manifests for containerized deployment

## Features

- Simple Python scripts for office automation
- Dockerfile for quick container builds
- Kubernetes manifests under `k8s/` for cluster deployments
- Minimal tests to validate DB utilities

## Quick start (Windows PowerShell)

Prerequisites:
- Python 3.9+
- pip
- (optional) Docker, kubectl for deployment

Create and activate virtual environment:
powershell:
python -m venv .venv
.\\.venv\\Scripts\\Activate.ps1  

Install Dependencies:
pip install -r requirements.txt

Run main app or a script:
python app.py
# or
python meeting_scheduler.py

Run Tests:
python -m pytest -q

## Docker
Build and run locally:
docker build -t autocorp-hub:local .
docker run --rm -p 8000:8000 autocorp-hub:local

## Kubernetes
Apply manifests in k8s/ :
kubectl apply -f k8s/configmap.yaml
kubectl apply -f k8s/secret.yaml
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml

Note: Do not commit real secrets to the repo. Replace sensitive values with variables or use cluster secret stores.

## Configuration and Secrets :
Use environment variables or GitHub Actions secrets for credentials and tokens.
Inspect k8s/secret.yaml, .env, and any *.json files for secrets before pushing. Replace with placeholders where needed.

## Project Structure :
Project structure
app.py — main entry (if used)
*.py — utility scripts
k8s/ — Kubernetes manifests and SQL dumps
Dockerfile — container build
requirements.txt — Python dependencies




