# Terraform GCP Project: Cloud SQL, Cloud Run, and Load Balancer

This project uses Terraform to set up a Google Cloud Platform (GCP) environment with a Cloud SQL database, a Cloud Run service, and an HTTP(S) Load Balancer.

## Prerequisites

1. **Terraform**: Make sure you have Terraform installed on your local machine. You can download it from the [Terraform website](https://www.terraform.io/downloads.html).
2. **GCP Project**: Ensure you have a GCP project with billing enabled.
3. **Service Account**: Create a service account with the following roles:
    - Cloud SQL Admin
    - Cloud Run Admin
    - Compute Admin
4. **Google Cloud SDK**: Install and configure the [Google Cloud SDK](https://cloud.google.com/sdk/docs/quickstart).

## Project Structure

```plaintext
my-terraform-project/
├── main.tf
├── variables.tf
├── outputs.tf
└── terraform.tfvars
