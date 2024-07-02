variable "project_id" {
  description = "The project ID to deploy the GCP resources."
}

variable "region" {
  description = "The region to deploy the GCP resources."
}

variable "db_instance_name" {
  description = "The name of the Cloud SQL instance."
}

variable "db_version" {
  description = "The version of the Cloud SQL database."
}

variable "db_tier" {
  description = "The tier of the Cloud SQL instance."
}

variable "db_name" {
  description = "database name."
}

variable "db_user_name" {
  description = "database user."
}

variable "db_user_password" {
  description = "password of the database user."
}

variable "cloud_run_service_name" {
  description = "name of the Cloud Run service."
}

variable "cloud_run_image" {
  description = "image for the Cloud Run service."
}

variable "lb_ip_name" {
  description = "name of the load balancer IP address."
}

variable "url_map_name" {
  description = "name of the URL map."
}

variable "http_proxy_name" {
  description = "name of the HTTP proxy."
}

variable "forwarding_rule_name" {
  description = "name of the forwarding rule."
}
