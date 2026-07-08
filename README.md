# Terraform Template Guide

This repository provides a template for multi-cloud infrastructure automation using Terraform and GitHub Actions.

## Configuring GitHub Secrets

To allow the GitHub workflow to interact with Terraform Cloud, you must configure the following secret in your GitHub repository:

1. **TF_API_TOKEN**: This is your Terraform Cloud API token.
    - Generate a token in your Terraform Cloud User Settings.
    - In your GitHub repository, go to Settings > Secrets and variables > Actions.
    - Click New repository secret and add TF_API_TOKEN with your token value.

## Terraform Cloud Workspace Setup

Configure the following environment variables in your Terraform Cloud workspace:

1. Navigate to your workspace in Terraform Cloud.
2. Go to the Variables tab.
3. Add the following as Environment Variables (check the "Sensitive" box for secrets):

**For Azure:**
- `ARM_CLIENT_ID`: Your Azure Service Principal Client ID.
- `ARM_CLIENT_SECRET`: Your Azure Service Principal Client Secret.
- `ARM_SUBSCRIPTION_ID`: Your Azure Subscription ID.
- `ARM_TENANT_ID`: Your Azure Tenant ID.

**For GCP:**
- `GOOGLE_CREDENTIALS`: A sensitive environment variable containing the service account key JSON.

## Deployment

The workflow is triggered via workflow_dispatch. You can manually run the "Terraform Multi-Cloud Automation" workflow from the Actions tab, selecting the desired action (plan, apply, or destroy) and the target directory (e.g., azure/).
