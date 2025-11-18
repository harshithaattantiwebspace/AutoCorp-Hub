# AutoCorp Hub

Agentic AI platform for enterprise automation — modular digital workers (agents) to automate HR document requesting, mail/calendar automation, and other business workflows. Built as containerized microservices (FastAPI) with orchestration on Google Kubernetes Engine (GKE).

## Project overview

AutoCorp Hub lets organisations deploy and operate small, focused AI agents that perform business tasks (HR document request, meeting scheduling, mail automation). Agents are orchestrated by a FastAPI backend and controlled by a Streamlit dashboard for HR managers. Core services integrate with Gmail and Google Calendar APIs and use Vertex AI or Hugging Face to extract structured data from natural-language inputs.

Key objectives
- Automate HR Document Requesting services
- Use Gmail + Google Calendar APIs for event-driven workflows.
- Containerize services with Docker and run at scale on GKE.
- Provide a Streamlit dashboard for monitoring and manual control.

## Architecture (high level)

- Streamlit UI: user dashboard for subscribing to agents and triggering workflows.
- FastAPI Orchestrator: routes requests, coordinates microservices and agents.
- Microservices: Mail Automation, Meeting Scheduler, HR Document Request (each a Dockerized FastAPI service).
- Vertex AI or Hugging Face models for NL understanding and extraction.
- Storage: Google Cloud Storage (GCS) for files; Cloud SQL (Postgres) for structured data.
- Infrastructure: GKE for orchestration and scaling; optional GPU nodes for inference.
- Auth: Google OAuth2 for Gmail/Calendar access.

## Components

- `streamlit/` — Streamlit dashboard (UI for HR managers)
- `services/` — FastAPI microservices (mail, scheduler, HR document request, etc.)
- `agents/` — agent templates & orchestration helpers
- `k8s/` — Kubernetes manifests for deployment (configmap, secret, deployment, service)
- `Dockerfile` — example service container build
- `requirements.txt` — Python dependencies
- `tests/` — pytest unit and integration tests

## Quickstart (developer)

Prerequisites:
- Python 3.9+
- pip
- Docker (for building images)
- kubectl & gcloud (for deploying to GKE)
- `gh` (optional) for GitHub operations

Local dev:

1. Create a virtualenv and install deps:
   powershell:
   
   python -m venv .venv
   
   .\.venv\Scripts\Activate.ps1
   
   pip install -r requirements.txt 

2. Run Service locally:

cd services/mail_automation

uvicorn main:app --reload --port 8001

3. Run Streamlit Dashboard:

cd streamlit

streamlit run app.py

4. Run Tests:

python -m pytest tests -q

## Environment and secrets:

Set the following environment variables (use Secrets in CI / GitHub Actions, or Secret Manager in GCP):

 - GOOGLE_APPLICATION_CREDENTIALS: path or content for GCP service account credentials
- GMAIL_OAUTH_CLIENT_ID, GMAIL_OAUTH_CLIENT_SECRET
- GOOGLE_CAL_CLIENT_ID, GOOGLE_CAL_CLIENT_SECRET
- VERTEX_AI_PROJECT (if using Vertex)
- HUGGINGFACE_API_KEY (if using HF)
- DATABASE_URL (postgres://... for Cloud SQL via proxy or private IP)
- GCS_BUCKET (for storing generated documents)

Important: Do not commit secrets or credentials to the repo. Use GitHub Secrets / GCP Secret Manager.

## Docker and Google Kubernetes Engine (GKE) Deployment:

Build a service image:

docker build -t gcr.io/<GCP_PROJECT>/autocorp-mail:latest services/mail_automation

docker push gcr.io/<GCP_PROJECT>/autocorp-mail:latest

Deploy to GKE:

kubectl apply -f k8s/configmap.yaml

kubectl apply -f k8s/secret.yaml  # ensure secrets created from envs / secret manager

kubectl apply -f k8s/deployment.yaml

kubectl apply -f k8s/service.yaml

Scaling and Monitoring: 

Use kubectl scale or HPA (HorizontalPodAutoscaler) for autoscaling.

Use Google Cloud Monitoring, Trace, and Logging for observability.






